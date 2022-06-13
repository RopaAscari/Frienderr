// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'messaging.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MessagingMetaData _$$_MessagingMetaDataFromJson(Map<String, dynamic> json) =>
    _$_MessagingMetaData(
      chatId: json['chatId'] as String? ?? '',
      chatUser: UserModel.fromJson(json['chatUser'] as Map<String, dynamic>),
      chatRecipient:
          UserModel.fromJson(json['chatRecipient'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_MessagingMetaDataToJson(
        _$_MessagingMetaData instance) =>
    <String, dynamic>{
      'chatId': instance.chatId,
      'chatUser': instance.chatUser,
      'chatRecipient': instance.chatRecipient,
    };
