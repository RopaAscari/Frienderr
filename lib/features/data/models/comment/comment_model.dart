import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frienderr/features/domain/entities/comment.dart';

part 'comment_model.g.dart';
part 'comment_model.freezed.dart';

@freezed
class CommentModel with _$CommentModel implements CommentEntity {
  const factory CommentModel({
    @Default('') final String id,
    @Default('') final String userId,
    @Default('') final String comment,
    @Default('') final String username,
    @Default(0) final int dateCreated,
    @Default('') final String profilePic,
  }) = _CommentModel;

  factory CommentModel.fromJson(Map<String, dynamic> json) =>
      _$CommentModelFromJson(json);
}
