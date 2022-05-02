// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'story_content.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_StoryContent _$$_StoryContentFromJson(Map<String, dynamic> json) =>
    _$_StoryContent(
      id: json['id'] as String? ?? '',
      media: StoryMedia.fromJson(json['media'] as Map<String, dynamic>),
      dateCreated: json['dateCreated'] as int? ?? 0,
      views:
          (json['views'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
      likes:
          (json['likes'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
    );

Map<String, dynamic> _$$_StoryContentToJson(_$_StoryContent instance) =>
    <String, dynamic>{
      'id': instance.id,
      'media': instance.media,
      'dateCreated': instance.dateCreated,
      'views': instance.views,
      'likes': instance.likes,
    };
