import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:frienderr/models/user/user_model.dart';

class FollowerState {
  FollowerState();

  List<Object> get props => [];
}

class FollowerLoaded extends FollowerState {
  final List<UserModel> followers;

  FollowerLoaded({required this.followers}) : super();

  @override
  List<Object> get props => [followers];
}

class FollowersLoading extends FollowerState {
  FollowersLoading() : super();

  @override
  List<Object> get props => [];
}

class FollowersEmpty extends FollowerState {
  final String message;
  FollowersEmpty({required this.message}) : super();

  @override
  List<Object> get props => [message];
}

class FollowersError extends FollowerState {
  final String error;

  FollowersError({required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'LoginFailure { error: $error }';
}
