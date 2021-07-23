import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
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

  UserModel(
      {required this.id,
      required this.status,
      required this.chats,
      required this.stories,
      required this.location,
      required this.presence,
      required this.followers,
      required this.username,
      required this.following,
      required this.profilePic,
      required this.coverPhoto,
      required this.bitmapImage,
      required this.isLocationEnabled})
      : super();

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
