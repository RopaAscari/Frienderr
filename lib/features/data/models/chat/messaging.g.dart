// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'messaging.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MessagingMetaData _$$_MessagingMetaDataFromJson(Map<String, dynamic> json) =>
    _$_MessagingMetaData(
      chatId: json['chatId'] as String? ?? '',
      chatRecipient: json['chatRecipient'] ?? const {},
      chatUser: json['chatUser'] ?? const {},
    );

Map<String, dynamic> _$$_MessagingMetaDataToJson(
        _$_MessagingMetaData instance) =>
    <String, dynamic>{
      'chatId': instance.chatId,
      'chatRecipient': instance.chatRecipient,
      'chatUser': instance.chatUser,
    };
