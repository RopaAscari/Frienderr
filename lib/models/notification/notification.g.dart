// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FollowNotificationModel _$FollowNotificationModelFromJson(
    Map<String, dynamic> json) {
  return FollowNotificationModel(
    dateCreated: json['dateCreated'] as int,
    recipient: json['recipient'] as String,
    senderId: json['senderId'] as String,
    senderUsername: json['senderUsername'] as String,
    senderProfilePic: json['senderProfilePic'] as String,
    type: json['type'] as String,
  );
}

Map<String, dynamic> _$FollowNotificationModelToJson(
        FollowNotificationModel instance) =>
    <String, dynamic>{
      'dateCreated': instance.dateCreated,
      'recipient': instance.recipient,
      'senderProfilePic': instance.senderProfilePic,
      'senderId': instance.senderId,
      'senderUsername': instance.senderUsername,
      'type': instance.type,
    };

LikeNotificationModel _$LikeNotificationModelFromJson(
    Map<String, dynamic> json) {
  return LikeNotificationModel(
    postId: json['postId'] as String,
    postThumbnail: json['postThumbnail'] as String,
    dateCreated: json['dateCreated'] as int,
    recipient: json['recipient'] as String,
    senderId: json['senderId'] as String,
    senderUsername: json['senderUsername'] as String,
    senderProfilePic: json['senderProfilePic'] as String,
    type: json['type'] as String,
  );
}

Map<String, dynamic> _$LikeNotificationModelToJson(
        LikeNotificationModel instance) =>
    <String, dynamic>{
      'postId': instance.postId,
      'postThumbnail': instance.postThumbnail,
      'dateCreated': instance.dateCreated,
      'recipient': instance.recipient,
      'senderProfilePic': instance.senderProfilePic,
      'senderId': instance.senderId,
      'senderUsername': instance.senderUsername,
      'type': instance.type,
    };

CommentNotificationModel _$CommentNotificationModelFromJson(
    Map<String, dynamic> json) {
  return CommentNotificationModel(
    comment: json['comment'] as String,
    dateCreated: json['dateCreated'] as int,
    postId: json['postId'] as String,
    postThumbnail: json['postThumbnail'] as String,
    recipient: json['recipient'] as String,
    senderId: json['senderId'] as String,
    senderUsername: json['senderUsername'] as String,
    senderProfilePic: json['senderProfilePic'] as String,
    type: json['type'] as String,
  );
}

Map<String, dynamic> _$CommentNotificationModelToJson(
        CommentNotificationModel instance) =>
    <String, dynamic>{
      'comment': instance.comment,
      'postId': instance.postId,
      'postThumbnail': instance.postThumbnail,
      'dateCreated': instance.dateCreated,
      'recipient': instance.recipient,
      'senderProfilePic': instance.senderProfilePic,
      'senderId': instance.senderId,
      'senderUsername': instance.senderUsername,
      'type': instance.type,
    };
