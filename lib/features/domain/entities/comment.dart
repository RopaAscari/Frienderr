import 'dart:convert';

import 'package:frienderr/features/domain/entities/user.dart';

class CommentEntity {
  final String id;
  final dynamic user;
  final String postId;
  final String comment;
  final int dateCreated;
  final List<String> likes;

  CommentEntity(
      {required this.id,
      required this.user,
      required this.likes,
      required this.postId,
      required this.comment,
      required this.dateCreated});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'likes': likes,
      'postId': postId,
      'comment': comment,
      'user': user.toJson(),
      'dateCreated': dateCreated,
    };
  }

  factory CommentEntity.fromJson(Map<String, dynamic> map) {
    return CommentEntity(
      id: map['id'] ?? '',
      postId: map['postId'] ?? '',
      comment: map['comment'] ?? '',
      user: UserEntity.fromJson(map['user']),
      likes: List<String>.from(map['likes']),
      dateCreated: map['dateCreated']?.toInt() ?? 0,
    );
  }
}
