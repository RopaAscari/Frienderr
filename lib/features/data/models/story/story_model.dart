import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frienderr/features/domain/entities/story.dart';
import 'package:frienderr/features/data/models/user/user_model.dart';
import 'package:frienderr/features/data/models/story/story_content.dart';

part 'story_model.g.dart';
part 'story_model.freezed.dart';

@freezed
class StoryModel with _$StoryModel implements StoryEntity {
  const factory StoryModel(
      {@Default('') final String id,
      @Default(0) final int dateUpdated,
      @Default([]) final List<StoryContent> content,
      @Default(UserModel(id: '')) final UserModel user}) = _StoryModel;

  factory StoryModel.fromJson(Map<String, dynamic> json) =>
      _$StoryModelFromJson(json);
}
