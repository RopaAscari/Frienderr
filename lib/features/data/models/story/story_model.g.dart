// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'story_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Story _$$_StoryFromJson(Map<String, dynamic> json) => _$_Story(
      id: json['id'] as String? ?? '',
      dateUpdated: json['dateUpdated'] as int? ?? 0,
      isPersitent: json['isPersitent'] as bool? ?? false,
      content: (json['content'] as List<dynamic>?)
              ?.map((e) => StoryContent.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      user: json['user'] == null
          ? const UserModel(id: '')
          : UserModel.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_StoryToJson(_$_Story instance) => <String, dynamic>{
      'id': instance.id,
      'dateUpdated': instance.dateUpdated,
      'isPersitent': instance.isPersitent,
      'content': instance.content,
      'user': instance.user,
    };
