part of 'story_bloc.dart';

enum StoryListenableAction {
  idle,
  updated,
  created,
  deleted,
  viewed,
  viewFailure,
  updateFailure,
  deteleFailure,
  creationFailure,
}

enum StoryStatus { idle, loaded, loading, error }

@freezed
class StoryState with _$StoryState {
  factory StoryState({
    required final UserStory userStory,
    @Default(0) final int previousStoryViewerTimestamp,
    @Default(false) final bool reachedMaximumThreshold,
    @Default(false) final bool storyViewsReachedMaximumThreshold,
    required final PagingController<int, Story> paginationController,
    required final PagingController<int, UserModel>
        storyViewsPaginationController,
    @Default(StoryListenableAction.idle) StoryListenableAction action,
  }) = _StoryState;
}
