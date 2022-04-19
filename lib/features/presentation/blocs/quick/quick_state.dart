part of 'quick_bloc.dart';

enum QuickStatus { Initial }

@freezed
class QuickState with _$QuickState {
  factory QuickState({
    @Default(0) int focusedIndex,
    @Default([]) List<QuickEntity> quicks,
    @Default([]) List<VideoPlayerController> controllers,
    @Default(QuickStatus.Initial) QuickStatus currentState,
  }) = _QuickState;
}
