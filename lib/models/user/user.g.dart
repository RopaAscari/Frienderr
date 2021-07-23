// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserFromJson(Map<String, dynamic> json) {
  return UserModel(
    chats: json['chats'],
    id: json['id'] as String,
    status: json['status'] as String,
    following: json['following'],
    followers: json['followers'],
    bitmapImage: json['bitmapImage'],
    presence: json['presence'] as bool,
    stories: json['stories'] as dynamic,
    username: json['username'] as String,
    profilePic: json['profilePic'] as String,
    coverPhoto: json['coverPhoto'] as String,
    location: json['location'] as Map<String, dynamic>,
    isLocationEnabled: json['isLocationEnabled'] as bool,
  );
}

Map<String, dynamic> _$UserToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'chats': instance.chats,
      'status': instance.status,
      'stories': instance.stories,
      'username': instance.username,
      'presence': instance.presence,
      'location': instance.location,
      'followers': instance.followers,
      'following': instance.following,
      'profilePic': instance.profilePic,
      'coverPhoto': instance.coverPhoto,
      'bitmapImage': instance.bitmapImage,
      'isLocationEnabled': instance.isLocationEnabled,
    };
