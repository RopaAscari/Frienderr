part of 'comment_bloc.dart';

enum CommentStatus {
  Initial,
  Loaded,
  Loading,
  Faliure,
}

@freezed
class CommentState with _$CommentState {
  const factory CommentState({
    @Default('') String error,
    required List<CommentEntity> comments,
    @Default(CommentStatus.Initial) CommentStatus currentState,
  }) = _CommentState;
}
