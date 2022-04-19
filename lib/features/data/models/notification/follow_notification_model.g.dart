// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'follow_notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FollowNotificationModel _$$_FollowNotificationModelFromJson(
        Map<String, dynamic> json) =>
    _$_FollowNotificationModel(
      type: json['type'] as String? ?? '',
      dateCreated: json['dateCreated'] as int? ?? 0,
      senderId: json['senderId'] as String? ?? '',
      recipient: json['recipient'] as String? ?? '',
      senderUsername: json['senderUsername'] as String? ?? '',
      senderProfilePic: json['senderProfilePic'] as String? ?? '',
    );

Map<String, dynamic> _$$_FollowNotificationModelToJson(
        _$_FollowNotificationModel instance) =>
    <String, dynamic>{
      'type': instance.type,
      'dateCreated': instance.dateCreated,
      'senderId': instance.senderId,
      'recipient': instance.recipient,
      'senderUsername': instance.senderUsername,
      'senderProfilePic': instance.senderProfilePic,
    };
