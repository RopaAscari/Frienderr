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
    @Default(false) final bool reachedMaximumThreshold,
    @Default(ChatListenableAction.idle) ChatListenableAction action,
    required final PagingController<int, ChatModel> paginationController,
  }) = _ChatState;
}
