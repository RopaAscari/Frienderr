import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frienderr/features/domain/entities/comment.dart';

part 'comment_model.g.dart';
part 'comment_model.freezed.dart';

@freezed
class CommentModel with _$CommentModel implements CommentEntity {
  const factory CommentModel({
    @Default('') final String id,
    @Default('') final String postId,
    @Default({}) final dynamic user,
    @Default('') final String comment,
    @Default(0) final int dateCreated,
    @Default([]) final List<String> likes,
  }) = _CommentModel;

  factory CommentModel.fromJson(Map<String, dynamic> json) =>
      _$CommentModelFromJson(json);
}
