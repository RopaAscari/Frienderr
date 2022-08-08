import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frienderr/features/data/models/story/story_media.dart';
import 'package:frienderr/features/domain/entities/story.dart';

part 'story_metadata.g.dart';
part 'story_metadata.freezed.dart';

@freezed
class StoryMetadata with _$StoryMetadata {
  const factory StoryMetadata({
    @Default(0) final int duration,
    @Default(null) final String? thumbnail,
  }) = _StoryMetadata;

  factory StoryMetadata.fromJson(Map<String, dynamic> json) =>
      _$StoryMetadataFromJson(json);
}
