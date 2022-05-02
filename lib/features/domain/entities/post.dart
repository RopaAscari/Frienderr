import 'dart:convert';

import 'package:frienderr/features/domain/entities/user.dart';

class PostEntity {
  final String id;
  final dynamic user;
  final String caption;
  final int dateCreated;
  final int commentCount;
  final List<String> shares;
  final List<String> likes;
  final List<Content> content;

  PostEntity({
    required this.id,
    required this.user,
    required this.likes,
    required this.shares,
    required this.caption,
    required this.content,
    required this.dateCreated,
    required this.commentCount,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'likes': likes,
      'shares': shares,
      'caption': caption,
      'user': user.toJson(),
      'dateCreated': dateCreated,
      'commentCount': commentCount,
      'content': content.map((x) => x.toJson()).toList(),
    };
  }

  factory PostEntity.fromJson(Map<String, dynamic> map) {
    return PostEntity(
      id: map['id'] ?? '',
      user: map['user'] ?? null,
      caption: map['caption'] ?? '',
      dateCreated: map['dateCreated']?.toInt() ?? 0,
      commentCount: map['commentCount']?.toInt() ?? 0,
      shares: List<String>.from(map['shares']),
      likes: List<String>.from(map['likes']),
      content:
          List<Content>.from(map['content']?.map((x) => Content.fromJson(x))),
    );
  }
}

class Content {
  final String type;
  final String media;
  final PostMetadata metadata;
  Content({
    required this.type,
    required this.media,
    required this.metadata,
  });

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'media': media,
      'metadata': metadata.toJson(),
    };
  }

  factory Content.fromJson(Map<String, dynamic> map) {
    return Content(
      type: map['type'] ?? '',
      media: map['media'] ?? '',
      metadata: map['metadata'] ?? {},
    );
  }
}

class PostMetadata {
  final String? thumbnail;
  PostMetadata({
    this.thumbnail,
  });

  Map<String, dynamic> toJson() {
    return {
      'thumbnail': thumbnail,
    };
  }

  factory PostMetadata.fromJson(Map<String, dynamic> map) {
    return PostMetadata(
      thumbnail: map['thumbnail'],
    );
  }
}

class PostUser {
  final String id;
  final String username;
  final String profilePic;
  PostUser({
    required this.id,
    required this.username,
    required this.profilePic,
  });
}

class TimelineResponse {
  bool userCaughtUp;
  List<PostEntity> posts;
  TimelineResponse({
    required this.userCaughtUp,
    required this.posts,
  });
}
