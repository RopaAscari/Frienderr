// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserModel _$$_UserModelFromJson(Map<String, dynamic> json) => _$_UserModel(
      status: json['status'] as String?,
      presence: json['presence'] as bool?,
      chats: json['chats'] as List<dynamic>?,
      id: json['id'] as String? ?? '',
      stories: json['stories'] as List<dynamic>?,
      isLocationEnabled: json['isLocationEnabled'] as bool?,
      following: json['following'] as List<dynamic>?,
      followers: json['followers'] as List<dynamic>?,
      username: json['username'] as String? ?? '',
      profilePic: json['profilePic'] as String? ?? defaultProfilePic,
      coverPhoto: json['coverPhoto'] as String? ?? defaultCoverPhoto,
      bitmapImage: json['bitmapImage'] as String? ?? defaultBitmapImage,
      location: json['location'] as Map<String, dynamic>? ?? defautLocation,
    );

Map<String, dynamic> _$$_UserModelToJson(_$_UserModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'presence': instance.presence,
      'chats': instance.chats,
      'id': instance.id,
      'stories': instance.stories,
      'isLocationEnabled': instance.isLocationEnabled,
      'following': instance.following,
      'followers': instance.followers,
      'username': instance.username,
      'profilePic': instance.profilePic,
      'coverPhoto': instance.coverPhoto,
      'bitmapImage': instance.bitmapImage,
      'location': instance.location,
    };
