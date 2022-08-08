part of 'comment_bloc.dart';

enum CommentListenableAction {
  idle,
  created,
  deleted,
  deleteFailed,
  creationFailed,
}

enum CommentStatus {
  idle,
  loaded,
  loading,
  faliure,
}

@freezed
class CommentState with _$CommentState {
  const factory CommentState({
    @Default(false) final bool reachedMaximumThreshold,
    required final PagingController<int, Comment> paginationController,
    @Default(CommentListenableAction.idle) CommentListenableAction action,
  }) = _CommentState;
}
