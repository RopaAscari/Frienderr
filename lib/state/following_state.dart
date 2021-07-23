import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:frienderr/models/user/user_model.dart';

class FollowingState {
  FollowingState();

  List<Object> get props => [];
}

class FollowingLoaded extends FollowingState {
  final List<UserModel> following;

  FollowingLoaded({required this.following}) : super();

  @override
  List<Object> get props => [following];
}

class FollowingLoading extends FollowingState {
  FollowingLoading() : super();

  @override
  List<Object> get props => [];
}

class FollowingEmpty extends FollowingState {
  final String message;
  FollowingEmpty({required this.message}) : super();

  @override
  List<Object> get props => [message];
}

class FollowingError extends FollowingState {
  final String error;

  FollowingError({required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'LoginFailure { error: $error }';
}
