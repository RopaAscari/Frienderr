import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frienderr/features/domain/entities/story.dart';
import 'package:frienderr/features/data/models/story/story_media.dart';

part 'story_content.g.dart';
part 'story_content.freezed.dart';

@freezed
class StoryContent with _$StoryContent {
  const factory StoryContent({
    @Default(0) final int views,
    @Default('') final String id,
    @Default(0) final int reactions,
    required final StoryMedia media,
    @Default(0) final int dateCreated,
    @Default(false) final bool isViewed,
  }) = _StoryContent;

  factory StoryContent.fromJson(Map<String, dynamic> json) =>
      _$StoryContentFromJson(json);
}
