import 'dart:io';
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:frienderr/core/failure/failure.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frienderr/features/domain/entities/message.dart';
import 'package:frienderr/features/domain/usecases/message/update_last_message.dart';
import 'package:frienderr/features/domain/usecases/message/seen_message_usecase.dart';
import 'package:frienderr/features/domain/usecases/message/send_message_usecase.dart';
import 'package:frienderr/features/domain/usecases/message/delete_message_usecase.dart';
import 'package:frienderr/features/domain/usecases/message/send_audio_message_usecase.dart';
import 'package:frienderr/features/domain/usecases/message/get_message_stream_usecase.dart';
import 'package:frienderr/features/domain/usecases/message/send_multimedia_message_usecase.dart';

part 'messaging_event.dart';
part 'messaging_state.dart';
part 'messaging_bloc.freezed.dart';

@injectable
class MessageBloc extends Bloc<MessageEvent, MessageState> {
  final SendMessageUseCase _sendMessageUseCase;
  final SeenMessageUseCase _seenMessageUseCase;
  final DeleteMessageUseCase _deleteMessageUseCase;
  final GetMessageStreamUsecase _getMessageStreamUsecase;
  final SendAudioMessageUseCase _sendAudioMessageUseCase;
  final UpdatePreviousMessageUseCase _updatePreviousMessageUseCase;
  final SendMultimediaMessageUseCase _sendMultiMediaMessageUseCase;

  MessageBloc(
    this._sendMessageUseCase,
    this._seenMessageUseCase,
    this._deleteMessageUseCase,
    this._sendAudioMessageUseCase,
    this._getMessageStreamUsecase,
    this._updatePreviousMessageUseCase,
    this._sendMultiMediaMessageUseCase,
  ) : super(const MessageState()) {
    on<_SendMessage>(_sendMessage);
    on<_SeenMessage>(_seenMessage);
    on<_DeleteMessage>(_deleteMessage);
    on<_SendAudioMessage>(_sendAudioMessage);
    on<_UpdatePreviousMessage>(_updatePreviousMessage);
    on<_SendMultiMediaMessages>(_sendMultimediaMessages);
  }

  /* Stream<QuerySnapshot<Map<String, dynamic>>> get messageStream {
    final either = _getMessageStreamUsecase(GetMessageStreamParams());
    return either.fold(
        (l) => defaultStream(const Duration(seconds: 5), 10), (r) => r);
  }*/

  Future<void> _sendMessage(
      _SendMessage event, Emitter<MessageState> emit) async {
    final Either<Failure, bool> either = await _sendMessageUseCase(
        SendMessageParams(
            pid: event.pid, chatId: event.chatId, message: event.message));

    return either.fold((error) {
      emit(state.copyWith(
          error: error.message,
          action: MessageListenableAction.sendMessageFailure));
    }, (chats) {
      print('success');
      emit(state.copyWith(action: MessageListenableAction.sendMessageSuccess));
    });
  }

  Future<void> _sendMultimediaMessages(
      _SendMultiMediaMessages event, Emitter<MessageState> emit) async {
    final Either<Failure, bool> either = await _sendMultiMediaMessageUseCase(
        SendMultimediaMessageParams(
            pid: event.pid, chatId: event.chatId, messages: event.messages));

    return either.fold((error) {
      emit(state.copyWith(
          error: error.message,
          action: MessageListenableAction.sendMessageFailure));
    }, (chats) {
      emit(state.copyWith(action: MessageListenableAction.sendMessageSuccess));
    });
  }

  Future<void> _sendAudioMessage(
      _SendAudioMessage event, Emitter<MessageState> emit) async {
    final Either<Failure, bool> either =
        await _sendAudioMessageUseCase(SendAudioMessageParams(
      pid: event.pid,
      file: event.file,
      chatId: event.chatId,
      message: event.message,
    ));

    return either.fold((error) {
      emit(state.copyWith(
          error: error.message,
          action: MessageListenableAction.sendMessageFailure));
    }, (chats) {
      emit(state.copyWith(action: MessageListenableAction.sendMessageSuccess));
    });
  }

  Future<void> _seenMessage(
      _SeenMessage event, Emitter<MessageState> emit) async {
    final Either<Failure, bool> either = await _seenMessageUseCase(
        SeenMessageParams(chatId: event.chatId, messageId: event.messageId));

    return either.fold((error) {
      emit(state.copyWith(
          error: error.message,
          action: MessageListenableAction.seenMessageFailure));
    }, (chats) {
      emit(state.copyWith(action: MessageListenableAction.seenMessageSuccess));
    });
  }

  Future<void> _updatePreviousMessage(
      _UpdatePreviousMessage event, Emitter<MessageState> emit) async {
    final Either<Failure, bool> either = await _updatePreviousMessageUseCase(
        UpdatePreviousMessageParams(
            chatId: event.chatId, previousId: event.previousId));

    return either.fold((error) {
      emit(state.copyWith(
          error: error.message,
          action: MessageListenableAction.seenMessageFailure));
    }, (chats) {
      emit(state.copyWith(action: MessageListenableAction.seenMessageSuccess));
    });
  }

  Future<void> _deleteMessage(
      _DeleteMessage event, Emitter<MessageState> emit) async {
    final Either<Failure, bool> either = await _deleteMessageUseCase(
        DeleteMessageParams(chatId: event.chatId, messageId: event.messageId));

    return either.fold((error) {
      emit(state.copyWith(
          error: error.message,
          action: MessageListenableAction.deleteMessageFailure));
    }, (chats) {
      emit(
          state.copyWith(action: MessageListenableAction.deleteMessageSuccess));
    });
  }
}
