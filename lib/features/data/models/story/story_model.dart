import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frienderr/features/domain/entities/story.dart';
import 'package:frienderr/features/data/models/user/user_model.dart';
import 'package:frienderr/features/data/models/story/story_content.dart';

part 'story_model.g.dart';
part 'story_model.freezed.dart';

@freezed
class Story with _$Story {
  const factory Story(
      {@Default('') final String id,
      @Default(0) final int dateUpdated,
      @Default(false) final bool? isPersitent,
      @Default([]) final List<StoryContent> content,
      @Default(UserModel(id: '')) final UserModel user}) = _Story;

  factory Story.fromJson(Map<String, dynamic> json) => _$StoryFromJson(json);
}
