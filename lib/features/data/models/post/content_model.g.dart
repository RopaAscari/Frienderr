// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ContentModel _$$_ContentModelFromJson(Map<String, dynamic> json) =>
    _$_ContentModel(
      type: json['type'] as String? ?? '',
      media: json['media'] as String? ?? '',
      metadata: json['metadata'] == null
          ? const PostMetadataModel()
          : PostMetadataModel.fromJson(
              json['metadata'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ContentModelToJson(_$_ContentModel instance) =>
    <String, dynamic>{
      'type': instance.type,
      'media': instance.media,
      'metadata': instance.metadata,
    };
