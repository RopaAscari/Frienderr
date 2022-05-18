// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quick_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_QuickModel _$$_QuickModelFromJson(Map<String, dynamic> json) =>
    _$_QuickModel(
      id: json['id'] as String? ?? '',
      url: json['url'] as String? ?? '',
      audio: json['audio'] as String? ?? '',
      user: json['user'] ?? const {},
      dateCreated: json['dateCreated'] as int? ?? 0,
      caption: json['caption'] as String? ?? '',
      commentCount: json['commentCount'] as int? ?? 0,
      thumbnail: json['thumbnail'] as String? ?? '',
      likes:
          (json['likes'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
      shares: (json['shares'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_QuickModelToJson(_$_QuickModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'audio': instance.audio,
      'user': instance.user,
      'dateCreated': instance.dateCreated,
      'caption': instance.caption,
      'commentCount': instance.commentCount,
      'thumbnail': instance.thumbnail,
      'likes': instance.likes,
      'shares': instance.shares,
    };
