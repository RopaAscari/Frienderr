// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'like_notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LikeNotificationModel _$$_LikeNotificationModelFromJson(
        Map<String, dynamic> json) =>
    _$_LikeNotificationModel(
      type: json['type'] as String? ?? '',
      postId: json['postId'] as String? ?? '',
      dateCreated: json['dateCreated'] as int? ?? 0,
      senderId: json['senderId'] as String? ?? '',
      recipient: json['recipient'] as String? ?? '',
      mediaType: json['mediaType'] as String? ?? '',
      postThumbnail: json['postThumbnail'] as String? ?? '',
      senderUsername: json['senderUsername'] as String? ?? '',
      senderProfilePic: json['senderProfilePic'] as String? ?? '',
    );

Map<String, dynamic> _$$_LikeNotificationModelToJson(
        _$_LikeNotificationModel instance) =>
    <String, dynamic>{
      'type': instance.type,
      'postId': instance.postId,
      'dateCreated': instance.dateCreated,
      'senderId': instance.senderId,
      'recipient': instance.recipient,
      'mediaType': instance.mediaType,
      'postThumbnail': instance.postThumbnail,
      'senderUsername': instance.senderUsername,
      'senderProfilePic': instance.senderProfilePic,
    };
