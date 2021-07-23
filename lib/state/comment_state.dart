import 'package:equatable/equatable.dart';
import 'package:frienderr/models/comment/comment_model.dart';

class CommentState extends Equatable {
  @override
  List<Object> get props => [];
}

class CommentsLoaded extends CommentState {
  final List<CommentModel> comments;

  CommentsLoaded({required this.comments});
  @override
  List<Object> get props => [comments];
}

class CommentsLoading extends CommentState {}

class CommentsEmpty extends CommentState {
  final String message;

  CommentsEmpty({required this.message});

  @override
  List<Object> get props => [message];
}

class CommentsError extends CommentState {
  final String error;

  CommentsError({required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'LoginFailure { error: $error }';
}
