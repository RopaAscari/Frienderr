class PostEntity {
  final int likes;
  final String id;
  final int shares;
  final dynamic user;
  final List<dynamic> userLikes;
  final String caption;
  final int dateCreated;
  final int commentCount;
  final List<Content> content;
  PostEntity({
    required this.likes,
    required this.id,
    required this.shares,
    required this.user,
    required this.userLikes,
    required this.caption,
    required this.dateCreated,
    required this.commentCount,
    required this.content,
  });
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

class Content {
  final String type;
  final String media;
  final List<dynamic> metadata;
  final String thumbnail;
  Content({
    required this.type,
    required this.media,
    required this.metadata,
    required this.thumbnail,
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
