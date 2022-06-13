import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frienderr/features/data/models/user/user_model.dart';
import 'package:frienderr/features/domain/entities/chat.dart';

part 'messaging.g.dart';
part 'messaging.freezed.dart';

@freezed
class MessagingMetaData
    with _$MessagingMetaData
    implements MessagingMetaDataEntity {
  const factory MessagingMetaData({
    @Default('') final String chatId,
    required final UserModel chatUser,
    required final UserModel chatRecipient,
  }) = _MessagingMetaData;

  factory MessagingMetaData.fromJson(Map<String, dynamic> json) =>
      _$MessagingMetaDataFromJson(json);
}
