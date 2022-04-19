part of 'comment_bloc.dart';

@freezed
class CommentEvent with _$CommentEvent {
  const factory CommentEvent.getComments({required String postId}) =
      _GetComments;
  const factory CommentEvent.postComment(
      {required CommentEntity comment, required String postId}) = _PostComment;
}
