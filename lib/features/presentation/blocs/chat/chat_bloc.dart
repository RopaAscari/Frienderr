import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:frienderr/core/failure/failure.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frienderr/features/data/models/chat/chat_model.dart';
import 'package:frienderr/features/domain/usecases/chat/get_chats_usecase.dart';

part 'chat_event.dart';
part 'chat_state.dart';
part 'chat_bloc.freezed.dart';

@injectable
class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final GetChatsUsecase _getChatsUsecase;

  ChatBloc(this._getChatsUsecase) : super(ChatState(chats: [])) {
    on<_GetChats>(_getChats);
    // on<_OpenChat>(_openChat);
    // on<_UpdateChat>(_updateChat);
  }

  Future<void> _getChats(_GetChats event, Emitter<ChatState> emit) async {
    emit(state.copyWith(currentState: ChatStatus.ChatsLoading));

    final Either<Failure, List<ChatModel>> either =
        await _getChatsUsecase(GetChatParams(id: event.id));

    return either.fold((error) {
      emit(state.copyWith(
          error: error.message, currentState: ChatStatus.ChatsFaliure));
    }, (chats) {
      emit(state.copyWith(chats: chats, currentState: ChatStatus.ChatsLoaded));
    });
  }

  /*Future<void> _updateChat(_UpdateChat event, Emitter<ChatState> emit) async {
    try {
      final List<ChatModel> chats = event.chats;
      //print('CHATS ${chats[0].latestMessage.message}');
      emit(ChatsLoaded(chats: chats));
    } catch (e) {
      emit(ChatError(error: 'Something went wrong'));
    }
  }*/

}
