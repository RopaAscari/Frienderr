import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frienderr/blocs/user_bloc.dart';
import 'package:frienderr/core/constants/constants.dart';
import 'package:frienderr/events/user_event.dart';
import 'package:frienderr/events/authenticate_event.dart';
import 'package:frienderr/models/user/user_model.dart';
import 'package:frienderr/navigation/tab-navigation.dart';
import 'package:frienderr/state/authentication_state.dart';
import 'package:frienderr/repositories/auth_repository.dart';
import 'package:frienderr/screens/register/chooseTheme/chooseTheme.dart';
import 'package:frienderr/screens/register/registerUsername/registerUsername.dart';
import 'package:flutter_page_transition/flutter_page_transition.dart'
    as transition;

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthRepository authRepository = new AuthRepository();

  AuthenticationBloc() : super(AuthenticationState());

  @override
  Stream<AuthenticationState> mapEventToState(
      AuthenticationEvent event) async* {
    if (event is AppStarted) {
      final bool isAuthenticated = await authRepository.isAuthenticated();

      if (!isAuthenticated) {
        yield AuthenticationUnauthenticated();
      } else {
        /*   final bool isUsernameSelected =
            await authRepository.isUsernameSelected();

       if (!isUsernameSelected) {
          final String userId = await authRepository.getUserId();
          yield AuthenticationUsername(userId: userId);
          return;
        }*/
        yield AuthenticationAuthenticated();
      }
    }

    if (event is LoggedIn) {
      yield AuthenticationLoading();
      yield AuthenticationAuthenticated();
    }

    if (event is LoggedOut) {
      yield AuthenticationLoading();
      await authRepository.signOut();
      yield AuthenticationUnauthenticated();
    }

    if (event is RegisterUserEvent) {
      yield RegisterUserEventLoading();

      final response = await authRepository.createUserAccount(
          email: event.email, password: event.password);

      if (response.hasError) {
        yield AuthenticationFailure(error: response.error);
        return;
      }

      BlocProvider.of<UserBloc>(event.context, listen: false)
          .add(SetUser(user: response.user));

      Navigator.pushAndRemoveUntil(
        event.context,
        transition.PageTransition(
            child: RegisterUsername(userId: response.user.id),
            type: transition.PageTransitionType.slideInLeft),
        (Route<dynamic> route) => false,
      );
    }

    if (event is LoginButtonPressed) {
      yield LoginLoading();

      //Timer(Duration(seconds: 5), () async* {
      try {
        final response = await authRepository.authenticateUser(
          email: event.email,
          password: event.password,
        );

        if (response.hasError) {
          yield AuthenticationFailure(error: response.error);
          return;
        }

        BlocProvider.of<UserBloc>(event.context, listen: false)
            .add(SetUser(user: response.user));

        Navigator.pushAndRemoveUntil(
          event.context,
          transition.PageTransition(
              child: MainTab(),
              type: transition.PageTransitionType.slideInLeft),
          (Route<dynamic> route) => false,
        );

        yield LoginSuccess();
      } catch (e) {}
      // });
    }

    if (event is RegisterUsernameEvent) {
      yield RegisterUsernameLoading();

      final response = await authRepository.verfyAndUpdateUsername(
          event.userId, event.username);

      if (!response) {
        yield AuthenticationFailure(error: 'Username is unavailable');
        return;
      }

      BlocProvider.of<UserBloc>(event.context, listen: false).add(SetUser(
          user: UserModel(
        id: event.userId,
        chats: [],
        status: '',
        stories: [],
        username: event.username,
        following: [],
        followers: [],
        presence: true,
        isLocationEnabled: false,
        location: {'latitude': 0, 'longitude': 0},
        profilePic: '${Constants.defaultProfilePic}',
        coverPhoto: '${Constants.defaultCoverPhoto}',
        bitmapImage: '${Constants.defaultBitmapImage}',
      )));

      Navigator.push(
          event.context,
          transition.PageTransition(
              child: ChooseTheme(),
              type: transition.PageTransitionType.slideInLeft));
      yield RegisterUsernameSuccess();
    }
  }
}
