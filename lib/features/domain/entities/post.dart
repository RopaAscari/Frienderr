import 'package:frienderr/core/enums/enums.dart';
import 'package:frienderr/features/domain/entities/user.dart';
import 'package:frienderr/features/data/models/post/post_model.dart';

class PostDTO {
  String id;
  int saves;
  int shares;
  UserDTO user;
  int comments;
  bool? isSaved;
  int reactions;
  String caption;
  int dateCreated;
  TimelinePostType type;
  List<ContentDTO> content;
  PostReactionDTO? userReaction;
  List<PostReactionDTO> latestReactions;
  PostDTO({
    this.isSaved,
    this.userReaction,
    required this.id,
    required this.user,
    required this.saves,
    required this.type,
    required this.shares,
    required this.caption,
    required this.content,
    required this.comments,
    required this.reactions,
    required this.dateCreated,
    required this.latestReactions,
  });

  PostDTO copyWith({
    String? id,
    int? saves,
    int? shares,
    UserDTO? user,
    int? comments,
    int? reactions,
    String? caption,
    int? dateCreated,
    List<ContentDTO>? content,
    PostReactionDTO? userReaction,
    List<PostReactionDTO>? latestReactions,
  }) {
    return PostDTO(
      type: type,
      id: id ?? this.id,
      user: user ?? this.user,
      saves: saves ?? this.saves,
      isSaved: isSaved ?? isSaved,
      shares: shares ?? this.shares,
      content: content ?? this.content,
      caption: caption ?? this.caption,
      comments: comments ?? this.comments,
      reactions: reactions ?? this.reactions,
      dateCreated: dateCreated ?? this.dateCreated,
      userReaction: userReaction ?? this.userReaction,
      latestReactions: latestReactions ?? this.latestReactions,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'saves': saves,
      'shares': shares,
      'caption': caption,
      'isSaved': isSaved,
      'user': user.toJson(),
      'comments': comments,
      'reactions': reactions,
      'dateCreated': dateCreated,
      'type': serializeEnumType(type),
      'userReaction': userReaction?.toJson(),
      'content': content.map((x) => x.toJson()).toList(),
      'latestReactions': latestReactions.map((x) => x.toJson()).toList(),
    };
  }

  factory PostDTO.fromJson(Map<String, dynamic> map) {
    return PostDTO(
      id: map['id'] ?? '',
      caption: map['caption'] ?? '',
      type: parseEnumType(map['type']),
      saves: map['saves']?.toInt() ?? 0,
      userReaction: map['userReaction'] != null
          ? PostReactionDTO.fromJson(map['userReaction'])
          : null,
      shares: map['shares']?.toInt() ?? 0,
      user: UserDTO.fromJson(map['user']),
      comments: map['comments']?.toInt() ?? 0,
      reactions: map['reactions']?.toInt() ?? 0,
      dateCreated: map['dateCreated']?.toInt() ?? 0,
      content: List<ContentDTO>.from(
          map['content']?.map((x) => ContentDTO.fromJson(x))),
      latestReactions: map['latestReactions'].isNotEmpty
          ? map['latestReactions']
              .map((x) => PostReactionDTO.fromJson(x))
              .cast<PostReactionDTO>()
              .toList()
          : [].cast<PostReactionDTO>(),
    );
  }
}

class PostReactionDTO {
  final String uid;
  final String postId;
  final String reaction;
  PostReactionDTO({
    required this.uid,
    required this.postId,
    required this.reaction,
  });

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'postId': postId,
      'reaction': reaction,
    };
  }

  factory PostReactionDTO.fromJson(Map<String, dynamic> map) {
    return PostReactionDTO(
      uid: map['uid'] ?? '',
      postId: map['postId'] ?? '',
      reaction: map['reaction'] ?? '',
    );
  }
}

class ContentDTO {
  final String type;
  final String media;
  final PostMetadataDTO metadata;
  ContentDTO({
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

  factory ContentDTO.fromJson(Map<String, dynamic> map) {
    return ContentDTO(
      type: map['type'] ?? '',
      media: map['media'] ?? '',
      metadata: PostMetadataDTO.fromJson(map['metadata']),
    );
  }
}

class PostMetadataDTO {
  final String? thumbnail;
  PostMetadataDTO({
    this.thumbnail,
  });

  Map<String, dynamic> toJson() {
    return {
      'thumbnail': thumbnail,
    };
  }

  factory PostMetadataDTO.fromJson(Map<String, dynamic> map) {
    return PostMetadataDTO(
      thumbnail: map['thumbnail'] ?? '',
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

class Timeline {
  bool userCaughtUp;
  List<Post> posts;
  Timeline({
    required this.posts,
    required this.userCaughtUp,
  });
}

TimelinePostType parseEnumType(String type) {
  switch (type) {
    case 'post':
      return TimelinePostType.post;

    case 'status':
      return TimelinePostType.status;
    default:
      throw Error();
  }
}

String serializeEnumType(TimelinePostType type) {
  switch (type) {
    case TimelinePostType.post:
      return TimelinePostType.post.name;

    case TimelinePostType.status:
      return TimelinePostType.status.name;

    default:
      throw Error();
  }
}
