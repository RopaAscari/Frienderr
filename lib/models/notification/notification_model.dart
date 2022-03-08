import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

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

  Map<String, dynamic> toMap() {
    return {
      'type': type,
      'senderId': senderId,
      'recipient': recipient,
      'dateCreated': dateCreated,
      'senderUsername': senderUsername,
      'senderProfilePic': senderProfilePic,
    };
  }

  factory FollowNotificationModel.fromMap(Map<String, dynamic> map) {
    return FollowNotificationModel(
      type: map['type'],
      senderId: map['senderId'],
      recipient: map['recipient'],
      dateCreated: map['dateCreated'],
      senderUsername: map['senderUsername'],
      senderProfilePic: map['senderProfilePic'],
    );
  }

  String toJson() => json.encode(toMap());

  factory FollowNotificationModel.fromJson(String source) =>
      FollowNotificationModel.fromMap(json.decode(source));
}

class LikeNotificationModel {
  final String type;
  final String senderId;
  final String recipient;
  final String postId;
  final String mediaType;
  final String postThumbnail;
  final int dateCreated;
  final String senderUsername;
  final String senderProfilePic;

  LikeNotificationModel(
      {required this.type,
      required this.recipient,
      required this.senderId,
      required this.postId,
      required this.mediaType,
      required this.postThumbnail,
      required this.senderProfilePic,
      required this.senderUsername,
      required this.dateCreated});

  Map<String, dynamic> toMap() {
    return {
      'type': type,
      'senderId': senderId,
      'recipient': recipient,
      'postId': postId,
      'mediaType': mediaType,
      'postThumbnail': postThumbnail,
      'dateCreated': dateCreated,
      'senderUsername': senderUsername,
      'senderProfilePic': senderProfilePic,
    };
  }

  factory LikeNotificationModel.fromMap(Map<String, dynamic> map) {
    return LikeNotificationModel(
      type: map['type'],
      senderId: map['senderId'],
      recipient: map['recipient'],
      postId: map['postId'],
      mediaType: map['mediaType'],
      postThumbnail: map['postThumbnail'],
      dateCreated: map['dateCreated'],
      senderUsername: map['senderUsername'],
      senderProfilePic: map['senderProfilePic'],
    );
  }

  String toJson() => json.encode(toMap());

  factory LikeNotificationModel.fromJson(String source) =>
      LikeNotificationModel.fromMap(json.decode(source));
}

@JsonSerializable()
class CommentNotificationModel {
  final String type;
  final String senderId;
  final String postId;
  final String comment;
  final String mediaType;
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
      required this.mediaType,
      required this.postId,
      required this.postThumbnail,
      required this.senderProfilePic,
      required this.senderUsername,
      required this.dateCreated});

  Map<String, dynamic> toMap() {
    return {
      'type': type,
      'senderId': senderId,
      'postId': postId,
      'comment': comment,
      'mediaType': mediaType,
      'postThumbnail': postThumbnail,
      'recipient': recipient,
      'dateCreated': dateCreated,
      'senderUsername': senderUsername,
      'senderProfilePic': senderProfilePic,
    };
  }

  factory CommentNotificationModel.fromMap(Map<String, dynamic> map) {
    return CommentNotificationModel(
      type: map['type'],
      senderId: map['senderId'],
      postId: map['postId'],
      comment: map['comment'],
      mediaType: map['mediaType'],
      postThumbnail: map['postThumbnail'],
      recipient: map['recipient'],
      dateCreated: map['dateCreated'],
      senderUsername: map['senderUsername'],
      senderProfilePic: map['senderProfilePic'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CommentNotificationModel.fromJson(String source) =>
      CommentNotificationModel.fromMap(json.decode(source));
}


/*@JsonSerializable()
class NotificationParticipant {
 

  NotificationParticipant(
      {required this.id, required this.username, required this.profilePic});

       factory NotificationParticipant.fromJson(Map<String, dynamic> json) =>
      _$NotificationParticipantFromJson(json);
  Map<String, dynamic> toJson() => _$NotificationParticipantToJson(this);
}*/
