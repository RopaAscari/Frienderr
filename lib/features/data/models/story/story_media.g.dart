// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'story_media.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_StoryMedia _$$_StoryMediaFromJson(Map<String, dynamic> json) =>
    _$_StoryMedia(
      url: json['url'] as String? ?? '',
      type: json['type'] as String? ?? '',
      metadata:
          StoryMetadataModel.fromJson(json['metadata'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_StoryMediaToJson(_$_StoryMedia instance) =>
    <String, dynamic>{
      'url': instance.url,
      'type': instance.type,
      'metadata': instance.metadata,
    };
