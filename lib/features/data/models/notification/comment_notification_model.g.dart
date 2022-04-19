// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CommentNotificationModel _$$_CommentNotificationModelFromJson(
        Map<String, dynamic> json) =>
    _$_CommentNotificationModel(
      type: json['type'] as String? ?? '',
      postId: json['postId'] as String? ?? '',
      comment: json['comment'] as String? ?? '',
      senderId: json['senderId'] as String? ?? '',
      dateCreated: json['dateCreated'] as int? ?? 0,
      mediaType: json['mediaType'] as String? ?? '',
      recipient: json['recipient'] as String? ?? '',
      postThumbnail: json['postThumbnail'] as String? ?? '',
      senderUsername: json['senderUsername'] as String? ?? '',
      senderProfilePic: json['senderProfilePic'] as String? ?? '',
    );

Map<String, dynamic> _$$_CommentNotificationModelToJson(
        _$_CommentNotificationModel instance) =>
    <String, dynamic>{
      'type': instance.type,
      'postId': instance.postId,
      'comment': instance.comment,
      'senderId': instance.senderId,
      'dateCreated': instance.dateCreated,
      'mediaType': instance.mediaType,
      'recipient': instance.recipient,
      'postThumbnail': instance.postThumbnail,
      'senderUsername': instance.senderUsername,
      'senderProfilePic': instance.senderProfilePic,
    };
