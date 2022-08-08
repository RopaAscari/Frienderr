import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frienderr/features/domain/entities/post.dart';

part 'post_reaction_model.g.dart';
part 'post_reaction_model.freezed.dart';

@freezed
class PostReaction with _$PostReaction {
  const factory PostReaction({
    final String? uid,
    final String? postId,
    final String? reaction,
  }) = _PostReaction;

  factory PostReaction.fromJson(Map<String, dynamic> json) =>
      _$PostReactionFromJson(json);
}
