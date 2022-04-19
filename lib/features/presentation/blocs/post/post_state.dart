part of 'post_bloc.dart';

enum PostStatus {
  Initial,
  Failure,
  LikePost,
  UnlikePost,
  DeletePosts,
}

@freezed
class PostState with _$PostState {
  const factory PostState({
    @Default('') String error,
    @Default(PostStatus.Initial) PostStatus currentState,
  }) = _PostState;
}
