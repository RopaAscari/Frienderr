import 'package:equatable/equatable.dart';

class AuthenticationState extends Equatable {
  @override
  List<Object> get props => [];
}

class LoginLoading extends AuthenticationState {}

class LoginSuccess extends AuthenticationState {}

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
