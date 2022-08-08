import 'package:frienderr/core/enums/enums.dart';

import 'post_reaction_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frienderr/features/domain/entities/post.dart';
import 'package:frienderr/features/data/models/user/user_model.dart';
import 'package:frienderr/features/data/models/post/content_model.dart';

part 'post_model.g.dart';
part 'post_model.freezed.dart';

@freezed
class Post with _$Post {
  const factory Post({
    @Default('') final String id,
    @Default(0) final int saves,
    @Default(0) final int shares,
    @Default(0) final int comments,
    @Default(0) final int reactions,
    @Default('') final String caption,
    @Default(0) final int dateCreated,
    @Default(false) final bool? isSaved,
    required final TimelinePostType type,
    @Default([]) final List<Content> content,
    @Default(null) final PostReaction? userReaction,
    @Default(UserModel(id: '')) final UserModel user,
    @Default([]) final List<PostReaction> latestReactions,
  }) = _Post;

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
}
