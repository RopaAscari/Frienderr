part of 'comment_bloc.dart';

@freezed
class CommentEvent with _$CommentEvent {
  const factory CommentEvent.getComments(
      {required String postId, required CommentType type}) = _GetComments;

  const factory CommentEvent.getPaginatedComments(
      {required String postId,
      required CommentType type}) = _GetPaginatedComments;

  const factory CommentEvent.deleteComment(
      {required String id,
      required String postId,
      required CommentType type}) = _DeleteComment;

  const factory CommentEvent.postComment({
    required CommentType type,
    required CommentDTO comment,
    required NotificationDTO? notification,
  }) = _PostComment;

  const factory CommentEvent.likeComment({required String postId}) =
      _LikeComment;
}
