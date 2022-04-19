import 'package:freezed_annotation/freezed_annotation.dart';

part 'messaging.g.dart';
part 'messaging.freezed.dart';

@freezed
class MessagingMetaData with _$MessagingMetaData {
  const factory MessagingMetaData({
    @Default('') String chatId,
    @Default({}) dynamic chatRecipient,
    @Default({}) dynamic chatUser,
  }) = _MessagingMetaData;

  factory MessagingMetaData.fromJson(Map<String, dynamic> json) =>
      _$MessagingMetaDataFromJson(json);
}
