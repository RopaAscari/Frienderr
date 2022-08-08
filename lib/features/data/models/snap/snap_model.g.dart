// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'snap_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Snap _$$_SnapFromJson(Map<String, dynamic> json) => _$_Snap(
      saves: json['saves'] as int? ?? 0,
      likes: json['likes'] as int? ?? 0,
      shares: json['shares'] as int? ?? 0,
      id: json['id'] as String? ?? '',
      url: json['url'] as String? ?? '',
      user: UserModel.fromJson(json['user'] as Map<String, dynamic>),
      comments: json['comments'] as int? ?? 0,
      audio: json['audio'] as String? ?? '',
      dateCreated: json['dateCreated'] as int? ?? 0,
      caption: json['caption'] as String? ?? '',
      isLiked: json['isLiked'] as bool? ?? false,
      thumbnail: json['thumbnail'] as String? ?? '',
    );

Map<String, dynamic> _$$_SnapToJson(_$_Snap instance) => <String, dynamic>{
      'saves': instance.saves,
      'likes': instance.likes,
      'shares': instance.shares,
      'id': instance.id,
      'url': instance.url,
      'user': instance.user,
      'comments': instance.comments,
      'audio': instance.audio,
      'dateCreated': instance.dateCreated,
      'caption': instance.caption,
      'isLiked': instance.isLiked,
      'thumbnail': instance.thumbnail,
    };
