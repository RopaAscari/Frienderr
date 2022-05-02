import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frienderr/features/domain/entities/story.dart';
import 'package:frienderr/features/data/models/story/story_media.dart';

part 'story_content.g.dart';
part 'story_content.freezed.dart';

@freezed
class StoryContent with _$StoryContent implements StoryContentEntity {
  const factory StoryContent({
    @Default('') final String id,
    required final StoryMedia media,
    @Default(0) final int dateCreated,
    @Default([]) final List<String> views,
    @Default([]) final List<String> likes,
  }) = _StoryContent;

  factory StoryContent.fromJson(Map<String, dynamic> json) =>
      _$StoryContentFromJson(json);
}
