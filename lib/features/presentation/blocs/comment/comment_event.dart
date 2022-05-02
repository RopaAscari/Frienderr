part of 'comment_bloc.dart';

@freezed
class CommentEvent with _$CommentEvent {
  const factory CommentEvent.getComments({required String postId}) =
      _GetComments;

  const factory CommentEvent.getPaginatedComments({required String postId}) =
      _GetPaginatedComments;

  const factory CommentEvent.postComment(
      {required CommentEntity comment, required String postId}) = _PostComment;

  const factory CommentEvent.likeComemnt(
      {required CommentEntity comment, required String postId}) = _LikeComment;
}
