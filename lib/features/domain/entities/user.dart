import 'dart:convert';

import 'package:frienderr/core/data/data.dart';

class UserEntity implements PartialUser {
  final String id;
  final String? status;
  final bool? presence;
  final String? username;
  final String? profilePic;
  final String? coverPhoto;
  final String? bitmapImage;
  final List<dynamic>? chats;
  final List<dynamic>? stories;
  final bool? isLocationEnabled;
  final List<dynamic>? following;
  final List<dynamic>? followers;
  final Map<String, dynamic>? location;

  UserEntity({
    required this.id,
    this.status = '',
    this.username = '',
    this.presence = false,
    this.chats = const [],
    this.stories = const [],
    this.followers = const [],
    this.following = const [],
    this.location = defautLocation,
    this.isLocationEnabled = false,
    this.profilePic = defaultProfilePic,
    this.coverPhoto = defaultCoverPhoto,
    this.bitmapImage = defaultBitmapImage,
  }) : super();

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'status': status,
      'presence': presence,
      'username': username,
      'profilePic': profilePic,
      'coverPhoto': coverPhoto,
      'bitmapImage': bitmapImage,
      'chats': chats,
      'stories': stories,
      'isLocationEnabled': isLocationEnabled,
      'following': following,
      'followers': followers,
      'location': location,
    };
  }

  factory UserEntity.fromJson(Map<String, dynamic> map) {
    return UserEntity(
      id: map['id'] ?? '',
      status: map['status'],
      presence: map['presence'],
      username: map['username'],
      profilePic: map['profilePic'],
      coverPhoto: map['coverPhoto'],
      bitmapImage: map['bitmapImage'],
      chats: List<dynamic>.from(map['chats'] ?? []),
      stories: List<dynamic>.from(map['stories'] ?? []),
      isLocationEnabled: map['isLocationEnabled'],
      following: List<dynamic>.from(map['following'] ?? []),
      followers: List<dynamic>.from(map['followers'] ?? []),
      location: Map<String, dynamic>.from(map['location'] ?? {}),
    );
  }
}

class PartialUser {
  final String id;
  PartialUser({required this.id});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
    };
  }

  factory PartialUser.fromJson(Map<String, dynamic> map) {
    return PartialUser(
      id: map['id'] ?? '',
    );
  }
}
