part of 'timeline_bloc.dart';

enum TimelineStatus { Idle, Loading, Loaded, Error }

@freezed
class TimelineState with _$TimelineState {
  factory TimelineState({
    @Default('') String error,
    required TimelineResponse timelinePosts,
    @Default(TimelineStatus.Idle) TimelineStatus status,
  }) = _TimelineState;
}
