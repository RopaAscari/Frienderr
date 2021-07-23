import 'package:frienderr/models/comment/comment_model.dart';
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

@immutable
abstract class CommentEvent extends Equatable {}

class FetchComments extends CommentEvent {
  final String postId;
  FetchComments({required this.postId});

  @override
  List<Object?> get props => [postId];
}

class PostComment extends CommentEvent {
  final CommentModel comment;
  final String postId;
  PostComment({required this.comment, required this.postId});

  @override
  List<Object?> get props => [comment, postId];
}
