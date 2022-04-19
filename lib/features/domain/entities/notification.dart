class FollowNotificationEntity {
  final String type;
  final int dateCreated;
  final String senderId;
  final String recipient;
  final String senderUsername;
  final String senderProfilePic;

  const FollowNotificationEntity({
    required this.type,
    required this.dateCreated,
    required this.senderId,
    required this.recipient,
    required this.senderUsername,
    required this.senderProfilePic,
  });
}

class LikeNotificationEntity {
  final String type;
  final String postId;
  final int dateCreated;
  final String senderId;
  final String recipient;
  final String mediaType;
  final String postThumbnail;
  final String senderUsername;
  final String senderProfilePic;

  const LikeNotificationEntity({
    required this.type,
    required this.postId,
    required this.dateCreated,
    required this.senderId,
    required this.recipient,
    required this.mediaType,
    required this.postThumbnail,
    required this.senderUsername,
    required this.senderProfilePic,
  });
}

class CommentNotificationEntity {
  final String type;
  final String postId;
  final String comment;
  final String senderId;
  final int dateCreated;
  final String mediaType;
  final String recipient;
  final String postThumbnail;
  final String senderUsername;
  final String senderProfilePic;

  const CommentNotificationEntity({
    required this.type,
    required this.postId,
    required this.comment,
    required this.senderId,
    required this.dateCreated,
    required this.mediaType,
    required this.recipient,
    required this.postThumbnail,
    required this.senderUsername,
    required this.senderProfilePic,
  });
}
