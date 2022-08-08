import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:frienderr/core/failure/failure.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:frienderr/core/constants/constants.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frienderr/features/domain/entities/chat.dart';
import 'package:frienderr/features/data/models/chat/chat_model.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:frienderr/features/domain/usecases/chat/get_chats_usecase.dart';
import 'package:frienderr/features/domain/usecases/chat/delete_chat_usecase.dart';
import 'package:frienderr/features/domain/usecases/chat/stop_typing_usecase.dart';
import 'package:frienderr/features/domain/usecases/chat/start_typing_usecase.dart';
import 'package:frienderr/features/presentation/extensions/paging_controller.dart';
import 'package:frienderr/features/domain/usecases/chat/get_chat_scream_usecase.dart';
import 'package:frienderr/features/domain/usecases/chat/instantiate_chat_usecase.dart';
import 'package:frienderr/features/domain/usecases/chat/get_paginated_chats_usecase.dart';

part 'chat_event.dart';
part 'chat_state.dart';
part 'chat_bloc.freezed.dart';

@injectable
class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final GetChatsUseCase _getChatsUsecase;
  final StopTypingUseCase _stopTypingUseCase;
  final DeleteChatUseCase _deleteChatsUsecase;
  final StartTypingUseCase _startTypingUseCase;
  final GetChatScreamUsecase _getChatStreamUseCase;
  final InstantiateChatUseCase _instantiateChatUsecase;
  final GetPaginatedChatsUseCase _getPaginatedChatsUsecase;

  ChatBloc(
      this._getChatsUsecase,
      this._stopTypingUseCase,
      this._startTypingUseCase,
      this._deleteChatsUsecase,
      this._getChatStreamUseCase,
      this._instantiateChatUsecase,
      this._getPaginatedChatsUsecase)
      : super(ChatState(
          reachedMaximumThreshold: false,
          paginationController:
              PagingController(firstPageKey: 0, invisibleItemsThreshold: 1),
        )) {
    on<_GetChats>(_getChats);
    on<_DeleteChat>(_deleteChat);
    on<_StopTyping>(_stopTyping);
    on<_StartTyping>(_startTyping);
    on<_GetPaginatedChats>(_getPaginatedChats);
    on<_InstantiateChat>(_instantiateChat);
  }

  Stream<QuerySnapshot<Map<String, dynamic>>>? get chatStream {
    final either = _getChatStreamUseCase(GetChatStreamParams());
    return either.fold((l) => null, (r) => r);
  }

  Future<void> _instantiateChat(
      _InstantiateChat event, Emitter<ChatState> emit) async {
    emit(state.copyWith(action: ChatListenableAction.idle));

    final Either<Failure, bool> either =
        await _instantiateChatUsecase(InstantiateChatParams(chat: event.chat));

    return either.fold((error) {
      emit(state.copyWith(action: ChatListenableAction.instantiationSuccess));
    }, (chats) {
      emit(state.copyWith(action: ChatListenableAction.instantiationSuccess));
    });
  }

  Future<void> _startTyping(_StartTyping event, Emitter<ChatState> emit) async {
    emit(state.copyWith(action: ChatListenableAction.idle));
    final Either<Failure, bool> either = await _startTypingUseCase(
        StartTypingParams(chatId: event.chatId, uid: event.uid));

    return either.fold((error) {
      emit(state.copyWith(action: ChatListenableAction.startTypingFailure));
    }, (chats) {
      emit(state.copyWith(action: ChatListenableAction.startTypingSucess));
    });
  }

  Future<void> _stopTyping(_StopTyping event, Emitter<ChatState> emit) async {
    emit(state.copyWith(action: ChatListenableAction.idle));
    final Either<Failure, bool> either = await _stopTypingUseCase(
        StopTypingParams(chatId: event.chatId, uid: event.uid));

    return either.fold((error) {
      emit(state.copyWith(action: ChatListenableAction.stopTypingFailure));
    }, (chats) {
      emit(state.copyWith(action: ChatListenableAction.stopTypingSucess));
    });
  }

  Future<void> _getChats(_GetChats event, Emitter<ChatState> emit) async {
    emit(state.copyWith(action: ChatListenableAction.idle));
    final Either<Failure, List<ChatModel>> _either =
        await _getChatsUsecase(GetChatParams(uid: event.id));

    return _either.fold((error) {
      state.paginationController.error = error.message;
    }, (List<ChatModel> chats) {
      if (chats.length < Constants.pageSize) {
        if (state.paginationController.itemList != null &&
            state.paginationController.itemList!.isNotEmpty) {
          state.paginationController.reset();
        }

        state.paginationController.appendLastPage(chats);
        emit(state.copyWith(reachedMaximumThreshold: true));
      } else {
        int nextPageKey = state.paginationController.nextPageKey ?? 0;
        nextPageKey++;

        state.paginationController.appendPage(chats, nextPageKey);
      }
    });
  }

  Future<void> _getPaginatedChats(
      _GetPaginatedChats event, Emitter<ChatState> emit) async {
    emit(state.copyWith(action: ChatListenableAction.idle));
    final previousChat = state.paginationController
        .itemList![state.paginationController.itemList!.length - 1];

    final Either<Failure, List<ChatModel>> _either =
        await _getPaginatedChatsUsecase(
            GetPaginatedChatParams(uid: event.id, previousChat: previousChat));

    return _either.fold((error) {
      state.paginationController.error = error.message;
    }, (List<ChatModel> chats) {
      if (state.paginationController.itemList != null &&
          state.paginationController.itemList!.isNotEmpty) {
        state.paginationController.reset();
      }

      if (chats.length < Constants.pageSize) {
        state.paginationController.appendLastPage(chats);
        emit(state.copyWith(reachedMaximumThreshold: true));
      } else {
        int nextPageKey = state.paginationController.nextPageKey ?? 0;
        nextPageKey++;

        state.paginationController.appendPage(chats, nextPageKey);
      }
    });
  }

  Future<void> _deleteChat(_DeleteChat event, Emitter<ChatState> emit) async {
    emit(state.copyWith(action: ChatListenableAction.idle));
    final either = await _deleteChatsUsecase(DeleteChatParams(uid: event.uid));
    return either.fold((error) {
      emit(state.copyWith(action: ChatListenableAction.deleteFailure));
    }, (chats) {
      emit(state.copyWith(action: ChatListenableAction.deleteSuccess));
    });
  }
}
