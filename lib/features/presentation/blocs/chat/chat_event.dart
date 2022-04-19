part of 'chat_bloc.dart';

@freezed
class ChatEvent with _$ChatEvent {
  const factory ChatEvent.getChats({required String id}) = _GetChats;
  const factory ChatEvent.updateChat({required String chats}) = _UpdateChat;
  const factory ChatEvent.openChat({
    required dynamic chats,
    required dynamic index,
    required dynamic context,
    required dynamic metaData,
  }) = _OpenChat;
}
