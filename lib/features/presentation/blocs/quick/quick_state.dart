part of 'quick_bloc.dart';

enum QuickStatus { idle, loading, error, loaded }

enum QuickListenableAction {
  idle,
  like,
  liked,
  updated,
  created,
  deleted,
  viewed,
  unliked,
  likeFailure,
  viewFailure,
  updateFailure,
  deteleFailure,
  unLikeFailure,
  creationFailure,
}

@freezed
class QuickState with _$QuickState {
  factory QuickState({
    @Default(0) int focusedIndex,
    @Default(null) String? error,
    @Default([]) List<QuickEntity> quicks,
    @Default([]) List<VideoPlayerController> controllers,
    @Default(QuickStatus.idle) QuickStatus currentState,
    @Default(QuickListenableAction.idle) QuickListenableAction action,
  }) = _QuickState;
}
