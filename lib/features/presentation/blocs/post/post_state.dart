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
  likeFailure
}

@freezed
class PostState with _$PostState {
  const factory PostState({
    @Default('') String error,
    required TimelineResponse timelinePosts,
    @Default(PostStatus.idle) PostStatus currentState,
    @Default(PostListenableAction.idle) PostListenableAction action,
  }) = _PostState;
}
