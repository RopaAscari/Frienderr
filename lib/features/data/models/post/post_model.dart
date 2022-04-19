import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frienderr/features/data/models/post/content_model.dart';
import 'package:frienderr/features/domain/entities/post.dart';

part 'post_model.g.dart';
part 'post_model.freezed.dart';

@freezed
class PostModel with _$PostModel implements PostEntity {
  const factory PostModel({
    @Default('') final String id,
    @Default(0) final int shares,
    @Default({}) final dynamic user,
    @Default([]) final List<dynamic> userLikes,
    @Default('') final String caption,
    @Default(0) final int dateCreated,
    @Default(0) final int commentCount,
    @Default(0) final int likes,
    @Default([]) final List<ContentModel> content,
  }) = _PostModel;

  factory PostModel.fromJson(Map<String, dynamic> json) =>
      _$PostModelFromJson(json);
}
