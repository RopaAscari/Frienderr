// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PostModel _$$_PostModelFromJson(Map<String, dynamic> json) => _$_PostModel(
      id: json['id'] as String? ?? '',
      caption: json['caption'] as String? ?? '',
      dateCreated: json['dateCreated'] as int? ?? 0,
      commentCount: json['commentCount'] as int? ?? 0,
      shares: (json['shares'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      likes:
          (json['likes'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
      content: (json['content'] as List<dynamic>?)
              ?.map((e) => ContentModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      user: json['user'] == null
          ? const UserModel(id: '')
          : UserModel.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_PostModelToJson(_$_PostModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'caption': instance.caption,
      'dateCreated': instance.dateCreated,
      'commentCount': instance.commentCount,
      'shares': instance.shares,
      'likes': instance.likes,
      'content': instance.content,
      'user': instance.user,
    };
