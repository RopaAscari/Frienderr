part of 'story_bloc.dart';

enum StoryStatus { Initial, StoriesLoaded, StoriesLoading, StoriesError }

@freezed
class StoryState with _$StoryState {
  factory StoryState({
    @Default('') String error,
    @Default([]) List<Story> quicks,
    @Default(StoryStatus.Initial) StoryStatus status,
  }) = _StoryState;
}
