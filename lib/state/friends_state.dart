import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:frienderr/models/user/user_model.dart';

class FriendsState {
  FriendsState();

  List<Object> get props => [];
}

class FriendsLoaded extends FriendsState {
  final List<UserModel> followers;
  final List<UserModel> following;

  FriendsLoaded({required this.followers, required this.following}) : super();

  @override
  List<Object> get props => [followers, following];
}

class FriendsError extends FriendsState {
  final String error;

  FriendsError({required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'LoginFailure { error: $error }';
}
