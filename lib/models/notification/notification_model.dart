import 'package:json_annotation/json_annotation.dart';

part 'notification.g.dart';

@JsonSerializable()
class FollowNotificationModel {
  final String type;
  final String senderId;
  final String recipient;
  final int dateCreated;
  final String senderUsername;
  final String senderProfilePic;

  FollowNotificationModel(
      {required this.type,
      required this.recipient,
      required this.senderId,
      required this.senderProfilePic,
      required this.senderUsername,
      required this.dateCreated});

  factory FollowNotificationModel.fromJson(Map<String, dynamic> json) =>
      _$FollowNotificationModelFromJson(json);
  Map<String, dynamic> toJson() => _$FollowNotificationModelToJson(this);
}

@JsonSerializable()
class LikeNotificationModel {
  final String type;
  final String senderId;
  final String recipient;
  final String postId;
  final String postThumbnail;
  final int dateCreated;
  final String senderUsername;
  final String senderProfilePic;

  LikeNotificationModel(
      {required this.type,
      required this.recipient,
      required this.senderId,
      required this.postId,
      required this.postThumbnail,
      required this.senderProfilePic,
      required this.senderUsername,
      required this.dateCreated});

  factory LikeNotificationModel.fromJson(Map<String, dynamic> json) =>
      _$LikeNotificationModelFromJson(json);
  Map<String, dynamic> toJson() => _$LikeNotificationModelToJson(this);
}

@JsonSerializable()
class CommentNotificationModel {
  final String type;
  final String senderId;
  final String postId;
  final String comment;
  final String postThumbnail;
  final String recipient;
  final int dateCreated;
  final String senderUsername;
  final String senderProfilePic;

  CommentNotificationModel(
      {required this.type,
      required this.comment,
      required this.recipient,
      required this.senderId,
      required this.postId,
      required this.postThumbnail,
      required this.senderProfilePic,
      required this.senderUsername,
      required this.dateCreated});

  factory CommentNotificationModel.fromJson(Map<String, dynamic> json) =>
      _$CommentNotificationModelFromJson(json);
  Map<String, dynamic> toJson() => _$CommentNotificationModelToJson(this);
}


/*@JsonSerializable()
class NotificationParticipant {
 

  NotificationParticipant(
      {required this.id, required this.username, required this.profilePic});

       factory NotificationParticipant.fromJson(Map<String, dynamic> json) =>
      _$NotificationParticipantFromJson(json);
  Map<String, dynamic> toJson() => _$NotificationParticipantToJson(this);
}*/
