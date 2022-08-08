import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frienderr/features/domain/entities/comment.dart';
import 'package:frienderr/features/data/models/user/user_model.dart';

part 'comment_model.g.dart';
part 'comment_model.freezed.dart';

@freezed
class Comment with _$Comment {
  const factory Comment({
    @Default('') final String id,
    required final UserModel user,
    @Default('') final String postId,
    @Default('') final String comment,
    @Default(0) final int dateCreated,
    @Default([]) final List<String> likes,
  }) = _Comment;

  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);
}
