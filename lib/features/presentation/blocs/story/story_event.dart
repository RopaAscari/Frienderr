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
      required StoryContent story}) = _DeleteStory;
  const factory StoryEvent.loadStories({required String userId}) = _LoadStories;
  const factory StoryEvent.viewStory(
      {required String userId,
      required String storyId,
      required List<StoryContent> stories}) = _ViewStory;
}
