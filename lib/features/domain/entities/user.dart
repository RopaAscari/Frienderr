import 'package:frienderr/core/data/data.dart';

class UserEntity {
  final String id;
  final String? status;
  final bool? presence;
  final String username;
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
    this.presence = false,
    this.chats = const [],
    this.stories = const [],
    required this.username,
    this.followers = const [],
    this.following = const [],
    this.location = defautLocation,
    this.isLocationEnabled = false,
    this.profilePic = defaultProfilePic,
    this.coverPhoto = defaultCoverPhoto,
    this.bitmapImage = defaultBitmapImage,
  }) : super();
}
