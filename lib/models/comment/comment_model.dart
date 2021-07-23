class CommentModel {
  final String id;
  final String userId;
  final String comment;
  final String username;
  final int dateCreated;
  final String profilePic;

  CommentModel({
    required this.id,
    required this.userId,
    required this.comment,
    required this.username,
    required this.profilePic,
    required this.dateCreated,
  });
}
