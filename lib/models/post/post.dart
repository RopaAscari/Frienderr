import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  String id;
  int likes;
  int shares;
  PostUser user;
  String caption;
  int dateCreated;
  int commentCount;
  List<Content> content;
  List<String> userLikes;
  Post({
    required this.id,
    required this.likes,
    required this.shares,
    required this.caption,
    required this.user,
    required this.dateCreated,
    required this.commentCount,
    required this.content,
    required this.userLikes,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'likes': likes,
      'shares': shares,
      'caption': caption,
      'dateCreated': dateCreated,
      'commentCount': commentCount,
      'content': content.map((x) => x.toMap()).toList(),
      'userLikes': userLikes,
    };
  }

  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      id: map['id'] ?? '',
      user: PostUser.fromMap(map['user']),
      likes: map['likes']?.toInt() ?? 0,
      shares: map['shares']?.toInt() ?? 0,
      caption: map['caption'] ?? '',
      dateCreated: map['dateCreated']?.toInt() ?? 0,
      commentCount: map['commentCount'] ?? 0,
      content:
          List<Content>.from(map['content']?.map((x) => Content.fromMap(x))),
      userLikes: List<String>.from(map['userLikes']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Post.fromJson(String source) => Post.fromMap(json.decode(source));
}

class PostUser {
  String id;
  String profilePic;
  String username;
  PostUser({
    required this.id,
    required this.profilePic,
    required this.username,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'profilePic': profilePic,
      'username': username,
    };
  }

  factory PostUser.fromMap(Map<String, dynamic> map) {
    return PostUser(
      id: map['id'] ?? '',
      profilePic: map['profilePic'] ?? '',
      username: map['username'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory PostUser.fromJson(String source) =>
      PostUser.fromMap(json.decode(source));
}

class Content {
  String type;
  String media;
  String thumbnail;
  List<dynamic> metadata;
  Content({
    required this.type,
    required this.media,
    required this.thumbnail,
    required this.metadata,
  });

  Map<String, dynamic> toMap() {
    return {
      'type': type,
      'media': media,
      'thumbnail': thumbnail,
      'metadata': metadata,
    };
  }

  factory Content.fromMap(Map<String, dynamic> map) {
    return Content(
      type: map['type'] ?? '',
      media: map['media'] ?? '',
      thumbnail: map['thumbnail'] ?? '',
      metadata: List<dynamic>.from(map['metadata']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Content.fromJson(String source) =>
      Content.fromMap(json.decode(source));
}

List<Post> postsFromList(List<QueryDocumentSnapshot<Object?>> timelinePosts) =>
    timelinePosts
        .map((posts) => Post.fromMap(posts.data() as Map<String, dynamic>))
        .toList();
