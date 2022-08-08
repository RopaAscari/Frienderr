part of 'chat_bloc.dart';

@freezed
class ChatEvent with _$ChatEvent {
  const factory ChatEvent.instantiateChat({required ChatDTO chat}) =
      _InstantiateChat;
  const factory ChatEvent.getChats({required String id}) = _GetChats;
  const factory ChatEvent.getPaginatedChats({required String id}) =
      _GetPaginatedChats;
  const factory ChatEvent.deleteChat({required String uid}) = _DeleteChat;
  const factory ChatEvent.startTyping(
      {required String uid, required String chatId}) = _StartTyping;
  const factory ChatEvent.stopTyping(
      {required String uid, required String chatId}) = _StopTyping;
}
