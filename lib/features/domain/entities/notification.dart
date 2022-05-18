import 'dart:convert';

import 'package:frienderr/features/domain/entities/user.dart';

class NotificationEntity {
  final String id;
  final int type;
  final int mediaType;
  final int dateCreated;
  final UserEntity user;
  final String recipientId;
  final PartialPostEntity post;
  final NotificationMetadataEntity metadata;
  NotificationEntity({
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

  factory NotificationEntity.fromJson(Map<String, dynamic> map) {
    return NotificationEntity(
      id: map['id'] ?? '',
      type: map['type'] ?? '',
      mediaType: map['mediaType'] ?? '',
      user: UserEntity.fromJson(map['user']),
      recipientId: map['recipientId'] ?? '',
      post: PartialPostEntity.fromJson(map['post']),
      dateCreated: map['dateCreated']?.toInt() ?? 0,
      metadata: NotificationMetadataEntity.fromJson(map['metadata']),
    );
  }
}

class PartialPostEntity {
  final String id;
  final String display;
  PartialPostEntity({
    required this.id,
    required this.display,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'display': display,
    };
  }

  factory PartialPostEntity.fromJson(Map<String, dynamic> map) {
    return PartialPostEntity(
      id: map['id'] ?? '',
      display: map['display'] ?? '',
    );
  }
}

class NotificationMetadataEntity {
  final String? comment;
  NotificationMetadataEntity({
    this.comment,
  });

  Map<String, dynamic> toJson() {
    return {
      'comment': comment,
    };
  }

  factory NotificationMetadataEntity.fromJson(Map<String, dynamic> map) {
    return NotificationMetadataEntity(
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
