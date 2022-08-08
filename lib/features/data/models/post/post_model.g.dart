// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Post _$$_PostFromJson(Map<String, dynamic> json) => _$_Post(
      id: json['id'] as String? ?? '',
      saves: json['saves'] as int? ?? 0,
      shares: json['shares'] as int? ?? 0,
      comments: json['comments'] as int? ?? 0,
      reactions: json['reactions'] as int? ?? 0,
      caption: json['caption'] as String? ?? '',
      dateCreated: json['dateCreated'] as int? ?? 0,
      isSaved: json['isSaved'] as bool? ?? false,
      type: $enumDecode(_$TimelinePostTypeEnumMap, json['type']),
      content: (json['content'] as List<dynamic>?)
              ?.map((e) => Content.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      userReaction: json['userReaction'] == null
          ? null
          : PostReaction.fromJson(json['userReaction'] as Map<String, dynamic>),
      user: json['user'] == null
          ? const UserModel(id: '')
          : UserModel.fromJson(json['user'] as Map<String, dynamic>),
      latestReactions: (json['latestReactions'] as List<dynamic>?)
              ?.map((e) => PostReaction.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_PostToJson(_$_Post instance) => <String, dynamic>{
      'id': instance.id,
      'saves': instance.saves,
      'shares': instance.shares,
      'comments': instance.comments,
      'reactions': instance.reactions,
      'caption': instance.caption,
      'dateCreated': instance.dateCreated,
      'isSaved': instance.isSaved,
      'type': _$TimelinePostTypeEnumMap[instance.type],
      'content': instance.content,
      'userReaction': instance.userReaction,
      'user': instance.user,
      'latestReactions': instance.latestReactions,
    };

const _$TimelinePostTypeEnumMap = {
  TimelinePostType.status: 'status',
  TimelinePostType.post: 'post',
};
