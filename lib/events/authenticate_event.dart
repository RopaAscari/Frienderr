import 'package:meta/meta.dart';
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

abstract class AuthenticationEvent {
  AuthenticationEvent([List props = const []]) : super();
}

class AppStarted extends AuthenticationEvent {
  @override
  String toString() => 'AppStarted';
}

class LoggedIn extends AuthenticationEvent {
  final String token;

  LoggedIn({required this.token}) : super([token]);

  @override
  String toString() => 'LoggedIn { token: $token }';
}

class LoggedOut extends AuthenticationEvent {
  @override
  String toString() => 'LoggedOut';
}

class LoginButtonPressed extends AuthenticationEvent {
  final BuildContext context;
  final String email;
  final String password;

  LoginButtonPressed({
    required this.context,
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [email, password];

  @override
  String toString() =>
      'LoginButtonPressed { username: $email, password: $password }';
}

class RegisterUsernameEvent extends AuthenticationEvent {
  final String userId;
  final String username;
  final BuildContext context;

  RegisterUsernameEvent({
    required this.userId,
    required this.context,
    required this.username,
  });

  @override
  List<Object?> get props => [userId, username, context];

  @override
  String toString() =>
      'Register Username Button Pressed { username: $username }';
}

class RegisterUserEvent extends AuthenticationEvent {
  final String email;
  final String password;
  final BuildContext context;

  RegisterUserEvent({
    required this.context,
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [password];

  @override
  String toString() =>
      'Register Password Button Pressed { password: $password }';
}
