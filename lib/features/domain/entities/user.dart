import 'dart:convert';

import 'package:frienderr/core/data/data.dart';

class UserDTO implements PartialUser {
  @override
  final String id;
  final bool? presence;
  final String? status;

  @override
  final String? email;
  final String? username;
  final String? profilePic;
  final String? coverPhoto;
  final String? deviceToken;
  final List<dynamic>? chats;
  final List<dynamic>? following;
  final List<dynamic>? followers;
  final UserLocationEntity? location;

  UserDTO({
    this.location,
    this.email = '',
    required this.id,
    this.status = '',
    this.username = '',
    this.presence = false,
    this.chats = const [],
    this.deviceToken = ' ',
    this.followers = const [],
    this.following = const [],
    this.profilePic = defaultProfilePic,
    this.coverPhoto = defaultCoverPhoto,
  }) : super();

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'chats': chats,
      'status': status,
      'presence': presence,
      'username': username,
      'location': location,
      'following': following,
      'followers': followers,
      'profilePic': profilePic,
      'coverPhoto': coverPhoto,
      'deviceToken': deviceToken,
    };
  }

  factory UserDTO.fromJson(Map<String, dynamic> map) {
    return UserDTO(
      id: map['id'] ?? '',
      email: map['email'],
      status: map['status'],
      presence: map['presence'],
      username: map['username'],
      profilePic: map['profilePic'],
      coverPhoto: map['coverPhoto'],
      deviceToken: map['deviceToken'],
      chats: List<dynamic>.from(map['chats'] ?? []),
      following: List<dynamic>.from(map['following'] ?? []),
      followers: List<dynamic>.from(map['followers'] ?? []),
      location: UserLocationEntity.fromJson(
          map['location'] ?? {'isLocationEnabled': false}),
    );
  }
}

class PartialUser {
  final String id;
  final String? username;
  PartialUser({required this.id, this.username});

  Map<String, dynamic> toJson() {
    return {'id': id, 'username': username};
  }

  factory PartialUser.fromJson(Map<String, dynamic> map) {
    return PartialUser(id: map['id'] ?? '', username: map['username'] ?? '');
  }
}

class UserLocationEntity {
  final bool? latitude;
  final String? longitude;
  final String? bitmapImage;
  final bool isLocationEnabled;

  UserLocationEntity({
    this.latitude,
    this.longitude,
    this.bitmapImage,
    required this.isLocationEnabled,
  });

  Map<String, dynamic> toJson() {
    return {
      'latitude': latitude,
      'longitude': longitude,
      'bitmapImage': bitmapImage,
      'isLocationEnabled': isLocationEnabled,
    };
  }

  factory UserLocationEntity.fromJson(Map<String, dynamic> map) {
    return UserLocationEntity(
      latitude: map['latitude'],
      longitude: map['longitude'],
      bitmapImage: map['bitmapImage'],
      isLocationEnabled: map['isLocationEnabled'] ?? false,
    );
  }
}
