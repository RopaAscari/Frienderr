import 'dart:convert';

const defautLocation = {'latitude': 0, 'longitude': 0};
const String defaultProfilePic =
    "https://firebasestorage.googleapis.com/v0/b/frienderr-5aa07.appspot.com/o/noProfile.png?alt=media&token=c624904c-76c7-4c48-b2ed-0aff29c18f99";

const String defaultCoverPhoto =
    "https://firebasestorage.googleapis.com/v0/b/frienderr-5aa07.appspot.com/o/nocontentyet.jpg?alt=media&token=918579b8-55f5-42ed-8c35-5d9e8cb4bbc2";
const String defaultBitmapImage =
    'https://firebasestorage.googleapis.com/v0/b/frienderr-5aa07.appspot.com/o/defaultBitmap.png?alt=media&token=d868f738-255e-49a4-af14-00af3ee136f7';

class UserModel {
  final String id;
  final String status;
  final bool presence;
  final String username;
  final String profilePic;
  final String coverPhoto;
  final String bitmapImage;
  final List<dynamic> chats;
  final List<dynamic> stories;
  final bool isLocationEnabled;
  final List<dynamic> following;
  final List<dynamic> followers;
  final Map<String, dynamic> location;

  UserModel({
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

  Map<String, dynamic> toMap() {
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

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] ?? '',
      status: map['status'] ?? '',
      presence: map['presence'] ?? false,
      username: map['username'] ?? '',
      profilePic: map['profilePic'] ?? '',
      coverPhoto: map['coverPhoto'] ?? '',
      bitmapImage: map['bitmapImage'] ?? '',
      chats: List<dynamic>.from(map['chats']),
      stories: List<dynamic>.from(map['stories']),
      isLocationEnabled: map['isLocationEnabled'] ?? false,
      following: List<dynamic>.from(map['following']),
      followers: List<dynamic>.from(map['followers']),
      location: Map<String, dynamic>.from(map['location']),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  UserModel copyWith({
    String? id,
    String? status,
    bool? presence,
    String? username,
    String? profilePic,
    String? coverPhoto,
    String? bitmapImage,
    List<dynamic>? chats,
    List<dynamic>? stories,
    bool? isLocationEnabled,
    List<dynamic>? following,
    List<dynamic>? followers,
    Map<String, dynamic>? location,
  }) {
    return UserModel(
      id: id ?? this.id,
      status: status ?? this.status,
      presence: presence ?? this.presence,
      username: username ?? this.username,
      profilePic: profilePic ?? this.profilePic,
      coverPhoto: coverPhoto ?? this.coverPhoto,
      bitmapImage: bitmapImage ?? this.bitmapImage,
      chats: chats ?? this.chats,
      stories: stories ?? this.stories,
      isLocationEnabled: isLocationEnabled ?? this.isLocationEnabled,
      following: following ?? this.following,
      followers: followers ?? this.followers,
      location: location ?? this.location,
    );
  }
}
