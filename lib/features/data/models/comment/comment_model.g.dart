// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CommentModel _$$_CommentModelFromJson(Map<String, dynamic> json) =>
    _$_CommentModel(
      id: json['id'] as String? ?? '',
      postId: json['postId'] as String? ?? '',
      user: json['user'] ?? const {},
      comment: json['comment'] as String? ?? '',
      dateCreated: json['dateCreated'] as int? ?? 0,
      likes:
          (json['likes'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
    );

Map<String, dynamic> _$$_CommentModelToJson(_$_CommentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'postId': instance.postId,
      'user': instance.user,
      'comment': instance.comment,
      'dateCreated': instance.dateCreated,
      'likes': instance.likes,
    };
