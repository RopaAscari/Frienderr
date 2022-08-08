// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'story_content.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_StoryContent _$$_StoryContentFromJson(Map<String, dynamic> json) =>
    _$_StoryContent(
      views: json['views'] as int? ?? 0,
      id: json['id'] as String? ?? '',
      reactions: json['reactions'] as int? ?? 0,
      media: StoryMedia.fromJson(json['media'] as Map<String, dynamic>),
      dateCreated: json['dateCreated'] as int? ?? 0,
      isViewed: json['isViewed'] as bool? ?? false,
    );

Map<String, dynamic> _$$_StoryContentToJson(_$_StoryContent instance) =>
    <String, dynamic>{
      'views': instance.views,
      'id': instance.id,
      'reactions': instance.reactions,
      'media': instance.media,
      'dateCreated': instance.dateCreated,
      'isViewed': instance.isViewed,
    };
