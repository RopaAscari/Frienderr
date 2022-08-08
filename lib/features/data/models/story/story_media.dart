import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frienderr/features/data/models/story/story_metadata.dart';
import 'package:frienderr/features/domain/entities/story.dart';

part 'story_media.g.dart';
part 'story_media.freezed.dart';

@freezed
class StoryMedia with _$StoryMedia {
  const factory StoryMedia({
    @Default('') final String url,
    @Default('') final String type,
    required final StoryMetadata metadata,
  }) = _StoryMedia;

  factory StoryMedia.fromJson(Map<String, dynamic> json) =>
      _$StoryMediaFromJson(json);
}
