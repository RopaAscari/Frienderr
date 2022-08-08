// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Comment _$$_CommentFromJson(Map<String, dynamic> json) => _$_Comment(
      id: json['id'] as String? ?? '',
      user: UserModel.fromJson(json['user'] as Map<String, dynamic>),
      postId: json['postId'] as String? ?? '',
      comment: json['comment'] as String? ?? '',
      dateCreated: json['dateCreated'] as int? ?? 0,
      likes:
          (json['likes'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
    );

Map<String, dynamic> _$$_CommentToJson(_$_Comment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'postId': instance.postId,
      'comment': instance.comment,
      'dateCreated': instance.dateCreated,
      'likes': instance.likes,
    };
