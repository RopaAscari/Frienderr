// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PostModel _$$_PostModelFromJson(Map<String, dynamic> json) => _$_PostModel(
      id: json['id'] as String? ?? '',
      shares: json['shares'] as int? ?? 0,
      user: json['user'] ?? const {},
      userLikes: json['userLikes'] as List<dynamic>? ?? const [],
      caption: json['caption'] as String? ?? '',
      dateCreated: json['dateCreated'] as int? ?? 0,
      commentCount: json['commentCount'] as int? ?? 0,
      likes: json['likes'] as int? ?? 0,
      content: (json['content'] as List<dynamic>?)
              ?.map((e) => ContentModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_PostModelToJson(_$_PostModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'shares': instance.shares,
      'user': instance.user,
      'userLikes': instance.userLikes,
      'caption': instance.caption,
      'dateCreated': instance.dateCreated,
      'commentCount': instance.commentCount,
      'likes': instance.likes,
      'content': instance.content,
    };
