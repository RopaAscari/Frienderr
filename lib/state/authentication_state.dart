import 'package:equatable/equatable.dart';
import 'package:frienderr/models/user/user_model.dart';

class AuthenticationState extends Equatable {
  @override
  List<Object> get props => [];
}

class AuthenticationSuccess extends AuthenticationState {
  final UserModel user;

  AuthenticationSuccess({required this.user});
  @override
  List<Object> get props => [];
}

class AuthenticationLoading extends AuthenticationState {}

class AuthenticationUsername extends AuthenticationState {
  final String userId;

  AuthenticationUsername({required this.userId});
  @override
  List<Object> get props => [userId];
}

class RegisterUsernameSuccess extends AuthenticationState {}

class RegisterUsernameLoading extends AuthenticationState {}

class RegisterUserEventLoading extends AuthenticationState {}

class RegisterUserSuccess extends AuthenticationState {
  final UserModel user;

  RegisterUserSuccess({required this.user});
  @override
  List<Object> get props => [];
}

class RegisterUserFailure extends AuthenticationState {
  final String error;

  RegisterUserFailure({required this.error});
  @override
  List<Object> get props => [error];
}

class AuthenticationUninitialized extends AuthenticationState {}

class AuthenticationAuthenticated extends AuthenticationState {}

class AuthenticationUnauthenticated extends AuthenticationState {}

class AuthenticationFailure extends AuthenticationState {
  final String error;

  AuthenticationFailure({required this.error});
  @override
  List<Object> get props => [error];

  @override
  String toString() => 'Register Password Faliure : { error: $error }';
}
