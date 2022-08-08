import 'dart:convert';

import 'package:frienderr/features/domain/entities/user.dart';

class CommentDTO {
  String id;
  UserDTO user;
  String postId;
  String comment;
  int dateCreated;
  List<String> likes;

  CommentDTO(
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

  factory CommentDTO.fromJson(Map<String, dynamic> map) {
    return CommentDTO(
      id: map['id'] ?? '',
      postId: map['postId'] ?? '',
      comment: map['comment'] ?? '',
      user: UserDTO.fromJson(map['user']),
      likes: List<String>.from(map['likes']),
      dateCreated: map['dateCreated']?.toInt() ?? 0,
    );
  }
}
