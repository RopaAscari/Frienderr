part of 'messaging_bloc.dart';

@freezed
class MessageEvent with _$MessageEvent {
  const factory MessageEvent.sendMultimediaMessages(
      {required String pid,
      required String chatId,
      required List<MultimediaMessage> messages}) = _SendMultiMediaMessages;

  const factory MessageEvent.sendAudioMessage({
    required File file,
    required String pid,
    required String chatId,
    required ChatMessage message,
  }) = _SendAudioMessage;

  const factory MessageEvent.sendMessage({
    required String pid,
    required String chatId,
    required ChatMessage message,
  }) = _SendMessage;

  const factory MessageEvent.seenMessage({
    required String chatId,
    required String messageId,
  }) = _SeenMessage;

  const factory MessageEvent.updatePreviousMessage({
    required String chatId,
    required String previousId,
  }) = _UpdatePreviousMessage;

  const factory MessageEvent.deleteMessage(
      {required String chatId, required String messageId}) = _DeleteMessage;
}
