// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CommentModel _$$_CommentModelFromJson(Map<String, dynamic> json) =>
    _$_CommentModel(
      id: json['id'] as String? ?? '',
      userId: json['userId'] as String? ?? '',
      comment: json['comment'] as String? ?? '',
      username: json['username'] as String? ?? '',
      dateCreated: json['dateCreated'] as int? ?? 0,
      profilePic: json['profilePic'] as String? ?? '',
    );

Map<String, dynamic> _$$_CommentModelToJson(_$_CommentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'comment': instance.comment,
      'username': instance.username,
      'dateCreated': instance.dateCreated,
      'profilePic': instance.profilePic,
    };
