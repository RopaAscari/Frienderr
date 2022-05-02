part of 'comment_bloc.dart';

enum CommentListenableAction {
  idle,
  created,
}

enum CommentStatus {
  idle,
  loaded,
  loading,
  faliure,
}

@freezed
class CommentState with _$CommentState {
  const factory CommentState(
      {@Default('')
          String error,
      required List<CommentEntity> comments,
      @Default(CommentStatus.idle)
          CommentStatus currentState,
      @Default(CommentListenableAction.idle)
          CommentListenableAction action}) = _CommentState;
}
