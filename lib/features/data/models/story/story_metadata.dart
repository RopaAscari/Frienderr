import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frienderr/features/data/models/story/story_media.dart';
import 'package:frienderr/features/domain/entities/story.dart';

part 'story_metadata.g.dart';
part 'story_metadata.freezed.dart';

@freezed
class StoryMetadataModel with _$StoryMetadataModel implements StoryMetadata {
  const factory StoryMetadataModel({
    @Default(0) final int duration,
    @Default(null) final String? thumbnail,
  }) = _StoryMetadataModel;

  factory StoryMetadataModel.fromJson(Map<String, dynamic> json) =>
      _$StoryMetadataModelFromJson(json);
}
