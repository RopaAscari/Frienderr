// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserModel _$$_UserModelFromJson(Map<String, dynamic> json) => _$_UserModel(
      status: json['status'] as String?,
      deviceToken: json['deviceToken'] as String?,
      id: json['id'] as String? ?? '',
      presence: json['presence'] as bool? ?? true,
      email: json['email'] as String? ?? '',
      chats: json['chats'] as List<dynamic>? ?? const [],
      username: json['username'] as String? ?? '',
      following: json['following'] as List<dynamic>? ?? const [],
      followers: json['followers'] as List<dynamic>? ?? const [],
      location: json['location'] == null
          ? null
          : UserLocationModel.fromJson(
              json['location'] as Map<String, dynamic>),
      profilePic: json['profilePic'] as String? ?? defaultProfilePic,
      coverPhoto: json['coverPhoto'] as String? ?? defaultCoverPhoto,
    );

Map<String, dynamic> _$$_UserModelToJson(_$_UserModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'deviceToken': instance.deviceToken,
      'id': instance.id,
      'presence': instance.presence,
      'email': instance.email,
      'chats': instance.chats,
      'username': instance.username,
      'following': instance.following,
      'followers': instance.followers,
      'location': instance.location,
      'profilePic': instance.profilePic,
      'coverPhoto': instance.coverPhoto,
    };
