import 'dart:convert';

import 'package:frienderr/features/domain/entities/user.dart';

class NotificationDTO {
  String id;
  int type;
  int mediaType;
  int dateCreated;
  UserDTO user;
  String recipientId;
  PartialPostDTO post;
  NotificationMetadataDTO metadata;
  NotificationDTO({
    required this.id,
    required this.type,
    required this.user,
    required this.post,
    required this.metadata,
    required this.mediaType,
    required this.dateCreated,
    required this.recipientId,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type,
      'user': user.toJson(),
      'post': post.toJson(),
      'mediaType': mediaType,
      'dateCreated': dateCreated,
      'recipientId': recipientId,
      'metadata': metadata.toJson(),
    };
  }

  factory NotificationDTO.fromJson(Map<String, dynamic> map) {
    return NotificationDTO(
      id: map['id'] ?? '',
      type: map['type'] ?? '',
      mediaType: map['mediaType'] ?? '',
      user: UserDTO.fromJson(map['user']),
      recipientId: map['recipientId'] ?? '',
      post: PartialPostDTO.fromJson(map['post']),
      dateCreated: map['dateCreated']?.toInt() ?? 0,
      metadata: NotificationMetadataDTO.fromJson(map['metadata']),
    );
  }
}

class PartialPostDTO {
  final String id;
  final String display;
  PartialPostDTO({
    required this.id,
    required this.display,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'display': display,
    };
  }

  factory PartialPostDTO.fromJson(Map<String, dynamic> map) {
    return PartialPostDTO(
      id: map['id'] ?? '',
      display: map['display'] ?? '',
    );
  }
}

class NotificationMetadataDTO {
  final String? comment;
  NotificationMetadataDTO({
    this.comment,
  });

  Map<String, dynamic> toJson() {
    return {
      'comment': comment,
    };
  }

  factory NotificationMetadataDTO.fromJson(Map<String, dynamic> map) {
    return NotificationMetadataDTO(
      comment: map['comment'],
    );
  }
}

class PushNotificationEntity {
  final int type;
  final String senderId;
  final String recipientId;
  final String senderUsername;
  PushNotificationEntity({
    required this.type,
    required this.senderId,
    required this.recipientId,
    required this.senderUsername,
  });

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'senderId': senderId,
      'recipientId': recipientId,
      'senderUsername': senderUsername,
    };
  }

  factory PushNotificationEntity.fromJson(Map<String, dynamic> map) {
    return PushNotificationEntity(
      type: map['type'] ?? 0,
      senderId: map['senderId'] ?? '',
      recipientId: map['recipientId'] ?? '',
      senderUsername: map['senderUsername'] ?? '',
    );
  }
}
