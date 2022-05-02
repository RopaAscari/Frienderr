part of 'story_bloc.dart';

enum StoryListenableAction {
  idle,
  updated,
  created,
  updateFailure,
  creationFailure
}
enum StoryStatus { idle, loaded, loading, error }

@freezed
class StoryState with _$StoryState {
  factory StoryState({
    @Default('') String error,
    required StoryResponse stories,
    @Default(StoryStatus.idle) StoryStatus status,
    @Default(StoryListenableAction.idle) StoryListenableAction action,
  }) = _StoryState;
}
