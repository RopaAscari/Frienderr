part of 'story_bloc.dart';

@freezed
class StoryEvent with _$StoryEvent {
  const factory StoryEvent.loadStories({required String userId}) = _LoadStories;
  const factory StoryEvent.createStory({required List<GalleryAsset> assets}) =
      _CreateStory;
  const factory StoryEvent.updateStory({required List<GalleryAsset> assets}) =
      _UpdateStory;
}
