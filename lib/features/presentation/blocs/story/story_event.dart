part of 'story_bloc.dart';

@freezed
class StoryEvent with _$StoryEvent {
  const factory StoryEvent.createStory({required List<GalleryAsset> assets}) =
      _CreateStory;
  const factory StoryEvent.updateStory(
      {required String userId,
      required List<GalleryAsset> assets}) = _UpdateStory;

  const factory StoryEvent.deleteStory(
      {required bool isLast,
      required String userId,
      required List<StoryContent>? content}) = _DeleteStory;
  const factory StoryEvent.fetchStories({required String userId}) =
      _FetchStories;

  const factory StoryEvent.resetState() = _ResetState;

  const factory StoryEvent.fetchStoryViewers(
      {required String userId, required String contentId}) = _FetchStoryViewers;
  const factory StoryEvent.fetchPaginatedStoryViewers(
      {required String userId,
      required String contentId}) = _FetchPaginatedStoryViewers;
  const factory StoryEvent.fetchPaginatedStories({required String userId}) =
      _FetchPaginatedStories;
  const factory StoryEvent.viewStory(
      {required String userId,
      required String storyId,
      required String contentId,
      required List<StoryContent> stories}) = _ViewStory;
}
