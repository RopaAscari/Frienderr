part of 'snap_bloc.dart';

enum SnapStatus { idle, loading, error, loaded }

enum SnapListenableAction {
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
class SnapState with _$SnapState {
  factory SnapState({
    @Default(0) int focusedIndex,
    @Default(null) String? error,
    @Default([]) List<Snap> snaps,
    @Default(null) String? paginationError,
    @Default(false) bool isPaginationLoading,
    @Default(SnapStatus.idle) SnapStatus currentState,
    @Default(false) final bool reachedMaximumThreshold,
    @Default([]) List<VideoPlayerController> controllers,
    @Default(SnapListenableAction.idle) SnapListenableAction action,
  }) = _SnapState;
}
