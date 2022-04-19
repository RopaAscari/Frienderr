class CommentEntity {
  final String id;
  final String userId;
  final String comment;
  final String username;
  final int dateCreated;
  final String profilePic;

  CommentEntity(
      {required this.id,
      required this.userId,
      required this.comment,
      required this.username,
      required this.dateCreated,
      required this.profilePic});
}
