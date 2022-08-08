part of 'post_bloc.dart';

enum PostStatus { idle, loading, loaded, error }

enum PostListenableAction {
  idle,
  liked,
  deleted,
  success,
  created,
  unliked,
  failure,
  likeFailure,
  saveSuccess,
  saveFailure,
  shareSuccess,
  shareFailure,
  unsaveSuccess,
  unsaveFailure,
  rehydratedPostSuccess,
  rehydratedPostFailure
}

@freezed
class PostState with _$PostState {
  const factory PostState({
    @Default(null) final Post? rehydratedPost,
    @Default(false) final bool reachedMaximumThreshold,
    required final PagingController<int, Post> paginationController,
    @Default(PostListenableAction.idle) PostListenableAction action,
  }) = _PostState;
}
