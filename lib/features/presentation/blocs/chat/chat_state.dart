part of 'chat_bloc.dart';

enum ChatStatus {
  Initial,
  ChatsLoaded,
  ChatsLoading,
  ChatsFaliure,
}

@freezed
class ChatState with _$ChatState {
  const factory ChatState({
    required List<ChatModel> chats,
    @Default('') String error,
    @Default(ChatStatus.Initial) ChatStatus currentState,
  }) = _ChatState;
}
