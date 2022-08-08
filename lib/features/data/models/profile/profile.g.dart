// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Profile _$$_ProfileFromJson(Map<String, dynamic> json) => _$_Profile(
      user: UserModel.fromJson(json['user'] as Map<String, dynamic>),
      following: json['following'] as int? ?? 0,
      followers: json['followers'] as int? ?? 0,
      reactions: json['reactions'] as int? ?? 0,
      posts: (json['posts'] as List<dynamic>?)
              ?.map((e) => Post.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      snaps: (json['snaps'] as List<dynamic>?)
              ?.map((e) => Snap.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      isFollowing: json['isFollowing'] as bool? ?? false,
      followersList: (json['followersList'] as List<dynamic>?)
              ?.map((e) => UserModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_ProfileToJson(_$_Profile instance) =>
    <String, dynamic>{
      'user': instance.user,
      'following': instance.following,
      'followers': instance.followers,
      'reactions': instance.reactions,
      'posts': instance.posts,
      'snaps': instance.snaps,
      'isFollowing': instance.isFollowing,
      'followersList': instance.followersList,
    };
