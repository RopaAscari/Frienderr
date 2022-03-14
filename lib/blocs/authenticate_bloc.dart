import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frienderr/blocs/user_bloc.dart';
import 'package:frienderr/events/user_event.dart';
import 'package:frienderr/models/user/user_model.dart';
import 'package:frienderr/events/authenticate_event.dart';
import 'package:frienderr/navigation/tab-navigation.dart';
import 'package:frienderr/core/constants/constants.dart';
import 'package:frienderr/state/authentication_state.dart';
import 'package:frienderr/repositories/auth_repository.dart';
import 'package:frienderr/screens/register/chooseTheme/chooseTheme.dart';
import 'package:flutter_page_transition/flutter_page_transition.dart'
    as transition;
import 'package:frienderr/screens/register/registerUsername/registerUsername.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthRepository authRepository = new AuthRepository();

  AuthenticationBloc() : super(AuthenticationState()) {
    on<AppStarted>((event, emit) async {
      final bool isAuthenticated = await authRepository.isAuthenticated();

      if (!isAuthenticated) {
        emit(AuthenticationUnauthenticated());
      } else {
        /*   final bool isUsernameSelected =
            await authRepository.isUsernameSelected();

       if (!isUsernameSelected) {
          final String userId = await authRepository.getUserId();
          yield AuthenticationUsername(userId: userId);
          return;
        }*/
        emit(AuthenticationAuthenticated());
      }
    });

    on<LoggedIn>((event, emit) {
      emit(AuthenticationLoading());
      emit(AuthenticationAuthenticated());
    });

    on<LoggedOut>((event, emit) async {
      emit(AuthenticationLoading());
      await authRepository.signOut();
      emit(AuthenticationUnauthenticated());
    });

    on<RegisterUserEvent>((event, emit) async {
      emit(RegisterUserEventLoading());

      final response = await authRepository.createUserAccount(
          email: event.email, password: event.password);

      if (response.hasError) {
        emit(AuthenticationFailure(error: response.error));
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
    });

    on<RegisterUsernameEvent>((event, emit) async {
      emit(RegisterUsernameLoading());

      final response = await authRepository.verfyAndUpdateUsername(
          event.userId, event.username);

      if (!response) {
        emit(AuthenticationFailure(error: 'Username is unavailable'));
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
      emit(RegisterUsernameSuccess());
    });

    on<LoginButtonPressed>((event, emit) async {
      try {
        emit(LoginLoading());
        
        final response = await authRepository.authenticateUser(
          email: event.email,
          password: event.password,
        );

        if (response.hasError) {
          emit(AuthenticationFailure(error: response.error));
          return;
        }

        emit(LoginSuccess());
      } catch (e) {}
    });
  }
}
