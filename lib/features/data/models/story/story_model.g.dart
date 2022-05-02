// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'story_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_StoryModel _$$_StoryModelFromJson(Map<String, dynamic> json) =>
    _$_StoryModel(
      id: json['id'] as String? ?? '',
      dateUpdated: json['dateUpdated'] as int? ?? 0,
      content: (json['content'] as List<dynamic>?)
              ?.map((e) => StoryContent.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      user: json['user'] == null
          ? const UserModel(id: '')
          : UserModel.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_StoryModelToJson(_$_StoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'dateUpdated': instance.dateUpdated,
      'content': instance.content,
      'user': instance.user,
    };
