// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NotificationModel _$$_NotificationModelFromJson(Map<String, dynamic> json) =>
    _$_NotificationModel(
      id: json['id'] as String,
      type: json['type'] as int,
      mediaType: json['mediaType'] as int,
      dateCreated: json['dateCreated'] as int,
      user: UserModel.fromJson(json['user'] as Map<String, dynamic>),
      post: PartialPost.fromJson(json['post'] as Map<String, dynamic>),
      recipientId: json['recipientId'] as String,
      metadata: NotificationMetadata.fromJson(
          json['metadata'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_NotificationModelToJson(
        _$_NotificationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'mediaType': instance.mediaType,
      'dateCreated': instance.dateCreated,
      'user': instance.user,
      'post': instance.post,
      'recipientId': instance.recipientId,
      'metadata': instance.metadata,
    };
