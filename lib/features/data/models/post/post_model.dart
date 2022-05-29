import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frienderr/features/data/models/post/content_model.dart';
import 'package:frienderr/features/data/models/user/user_model.dart';
import 'package:frienderr/features/domain/entities/post.dart';

part 'post_model.g.dart';
part 'post_model.freezed.dart';

@freezed
class PostModel with _$PostModel {
  const factory PostModel({
    @Default('') final String id,
    @Default('') final String caption,
    @Default(0) final int dateCreated,
    @Default(0) final int commentCount,
    @Default([]) final List<String> shares,
    @Default([]) final List<String> likes,
    @Default([]) final List<ContentModel> content,
    @Default(UserModel(id: '')) final UserModel user,
  }) = _PostModel;

  factory PostModel.fromJson(Map<String, dynamic> json) =>
      _$PostModelFromJson(json);
}
