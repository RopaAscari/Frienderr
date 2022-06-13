part of 'messaging_bloc.dart';

enum MessagingStatus {
  idle,
  error,
  loaded,
  loading,
}

enum MessageListenableAction {
  idle,
  seenMessageSuccess,
  seenMessageFailure,
  sendMessageSuccess,
  sendMessageFailure,
  deleteMessageSuccess,
  deleteMessageFailure,
}

@freezed
class MessageState with _$MessageState {
  const factory MessageState({
    @Default(null) String? error,
    //required List<ChatEntity> chats,
    //@Default(ChatStatus.idle) ChatStatus currentState,
    @Default(MessageListenableAction.idle) MessageListenableAction action,
  }) = _MessageState;
}
