// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Content _$$_ContentFromJson(Map<String, dynamic> json) => _$_Content(
      type: json['type'] as String? ?? '',
      media: json['media'] as String? ?? '',
      metadata: json['metadata'] == null
          ? const PostMetadata()
          : PostMetadata.fromJson(json['metadata'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ContentToJson(_$_Content instance) =>
    <String, dynamic>{
      'type': instance.type,
      'media': instance.media,
      'metadata': instance.metadata,
    };
