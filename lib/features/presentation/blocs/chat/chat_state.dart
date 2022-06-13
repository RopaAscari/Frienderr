part of 'chat_bloc.dart';

enum ChatStatus {
  idle,
  loaded,
  loading,
  error,
}

enum ChatListenableAction {
  idle,
  deleteSuccess,
  deleteFailure,
  startTypingFailure,
  startTypingSucess,
  stopTypingFailure,
  stopTypingSucess,
  instantiationSuccess,
  instantiationFailure,
}

@freezed
class ChatState with _$ChatState {
  const factory ChatState({
    @Default(null) String? error,
    required List<ChatEntity> chats,
    @Default(ChatStatus.idle) ChatStatus currentState,
    @Default(ChatListenableAction.idle) ChatListenableAction action,
  }) = _ChatState;
}
