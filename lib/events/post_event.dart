import 'package:frienderr/models/user/user_model.dart';
import 'package:meta/meta.dart';
import '../themes/themes.dart';
import 'package:equatable/equatable.dart';

@immutable
abstract class PostEvent extends Equatable {
  // Passing class fields in a list to the Equatable super class
  PostEvent([List props = const []]) : super();
}

class LikePost extends PostEvent {
  final dynamic post;
  final UserModel user;

  LikePost({
    required this.user,
    required this.post,
  }) : super([user, post]);

  @override
  List<Object> get props => [post, user];
}

class UnLikePost extends PostEvent {
  final String postId;
  final String userId;

  UnLikePost({
    required this.userId,
    required this.postId,
  }) : super([postId, userId]);

  @override
  List<Object> get props => [postId, userId];
}

class DeletePost extends PostEvent {
  final String postId;

  DeletePost({
    required this.postId,
  }) : super([postId]);

  @override
  List<Object> get props => [postId];
}
