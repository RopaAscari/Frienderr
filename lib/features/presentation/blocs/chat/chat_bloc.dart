import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:frienderr/features/domain/usecases/chat/start_typing_usecase.dart';
import 'package:frienderr/features/domain/usecases/chat/stop_typing_usecase.dart';

import 'package:injectable/injectable.dart';
import 'package:frienderr/core/failure/failure.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frienderr/features/domain/entities/chat.dart';
import 'package:frienderr/features/data/models/chat/chat_model.dart';
import 'package:frienderr/features/domain/usecases/chat/get_chats_usecase.dart';
import 'package:frienderr/features/domain/usecases/chat/delete_chat_usecase.dart';
import 'package:frienderr/features/domain/usecases/chat/get_chat_scream_usecase.dart';
import 'package:frienderr/features/domain/usecases/chat/instantiate_chat_usecase.dart';
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

  ChatBloc(
    this._getChatsUsecase,
    this._stopTypingUseCase,
    this._startTypingUseCase,
    this._deleteChatsUsecase,
    this._getChatStreamUseCase,
    this._instantiateChatUsecase,
  ) : super(const ChatState(chats: [])) {
    on<_GetChats>(_getChats);
    on<_DeleteChat>(_deleteChat);
    on<_StopTyping>(_stopTyping);
    on<_StartTyping>(_startTyping);
    on<_InstantiateChat>(_instantiateChat);
  }

  Stream<QuerySnapshot<Map<String, dynamic>>>? get chatStream {
    final either = _getChatStreamUseCase(GetChatStreamParams());
    return either.fold((l) => null, (r) => r);
  }

  Future<void> _instantiateChat(
      _InstantiateChat event, Emitter<ChatState> emit) async {
    final Either<Failure, bool> either =
        await _instantiateChatUsecase(InstantiateChatParams(chat: event.chat));

    return either.fold((error) {
      emit(state.copyWith(
          error: error.message,
          action: ChatListenableAction.instantiationSuccess));
    }, (chats) {
      emit(state.copyWith(action: ChatListenableAction.instantiationSuccess));
    });
  }

  Future<void> _startTyping(_StartTyping event, Emitter<ChatState> emit) async {
    final Either<Failure, bool> either = await _startTypingUseCase(
        StartTypingParams(chatId: event.chatId, uid: event.uid));

    return either.fold((error) {
      emit(state.copyWith(
          error: error.message,
          action: ChatListenableAction.startTypingFailure));
    }, (chats) {
      emit(state.copyWith(action: ChatListenableAction.startTypingSucess));
    });
  }

  Future<void> _stopTyping(_StopTyping event, Emitter<ChatState> emit) async {
    final Either<Failure, bool> either = await _stopTypingUseCase(
        StopTypingParams(chatId: event.chatId, uid: event.uid));

    return either.fold((error) {
      emit(state.copyWith(
          error: error.message,
          action: ChatListenableAction.stopTypingFailure));
    }, (chats) {
      emit(state.copyWith(action: ChatListenableAction.stopTypingSucess));
    });
  }

  Future<void> _getChats(_GetChats event, Emitter<ChatState> emit) async {
    emit(state.copyWith(currentState: ChatStatus.loading));

    final Either<Failure, List<ChatEntity>> either =
        await _getChatsUsecase(GetChatParams(uid: event.id));

    return either.fold((error) {
      emit(
          state.copyWith(error: error.message, currentState: ChatStatus.error));
    }, (chats) {
      emit(state.copyWith(chats: chats, currentState: ChatStatus.loaded));
    });
  }

  Future<void> _deleteChat(_DeleteChat event, Emitter<ChatState> emit) async {
    final either = await _deleteChatsUsecase(DeleteChatParams(uid: event.uid));
    return either.fold((error) {
      emit(state.copyWith(
          error: error.message, action: ChatListenableAction.deleteFailure));
    }, (chats) {
      emit(state.copyWith(action: ChatListenableAction.deleteSuccess));
    });
  }
}
