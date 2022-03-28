import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:frienderr/models/auth/auth.dart';
import 'package:frienderr/models/user/user_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frienderr/repositories/auth_repository.dart';

part 'authenticate_event.dart';
part 'authenticate_state.dart';
part 'authenticate_bloc.freezed.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthRepository authRepository = new AuthRepository();

  AuthenticationBloc() : super(AuthenticationState()) {
    on<_LogOut>(_logOut);
    on<_Authenticate>(_authenticate);
    on<_CreateAccount>(_createAccount);
    on<_AppInitialized>(_appInitialized);
    on<_RecoverAccount>(_recoverAccount);
    on<_RegisterUsername>(_registerUsername);
  }

  Future<void> _appInitialized(
      _AppInitialized event, Emitter<AuthenticationState> emit) async {
    final bool isAuthenticated = await authRepository.isAuthenticated();

    if (!isAuthenticated) {
      emit(state.copyWith(
        currentState: AuthenticationStatus.UnAuthenticated,
      ));
      return;
    }

    emit(state.copyWith(
      currentState: AuthenticationStatus.Authenticated,
    ));
  }

  Future<void> _logOut(_LogOut event, Emitter<AuthenticationState> emit) async {
    emit(state.copyWith(
        currentState: AuthenticationStatus.UnAuthenticationLoading));
    await authRepository.signOut(
        onComplete: () => emit(state.copyWith(
              currentState: AuthenticationStatus.Authenticated,
            )),
        onFailure: () => null);
  }

  Future<void> _authenticate(
      _Authenticate event, Emitter<AuthenticationState> emit) async {
    try {
      emit(state.copyWith(
        currentState: AuthenticationStatus.AuthenticationLoading,
      ));

      final response = await authRepository.authenticateUser(
        email: event.email,
        password: event.password,
      );

      if (response.hasError) {
        emit(state.copyWith(
          error: response.error,
          currentState: AuthenticationStatus.AuthenticationFailure,
        ));
        return;
      }

      emit(state.copyWith(
        user: response.user,
        currentState: AuthenticationStatus.AuthenticationSuccess,
      ));
    } catch (e) {}
  }

  Future<void> _createAccount(
      _CreateAccount event, Emitter<AuthenticationState> emit) async {
    emit(state.copyWith(
      currentState: AuthenticationStatus.CreateAccountLoading,
    ));

    final AuthResponse response = await authRepository.createUserAccount(
        email: event.email, password: event.password);

    if (response.hasError) {
      emit(state.copyWith(
        error: response.error,
        currentState: AuthenticationStatus.CreateAccountFaliure,
      ));
      return;
    }

    emit(state.copyWith(
      user: response.user,
      currentState: AuthenticationStatus.CreateAccountSuccess,
    ));
  }

  Future<void> _registerUsername(
      _RegisterUsername event, Emitter<AuthenticationState> emit) async {
    emit(state.copyWith(
      currentState: AuthenticationStatus.RegisterUsernameLoading,
    ));

    final response = await authRepository.verfyAndUpdateUsername(
        event.userId, event.username);

    if (!response) {
      emit(state.copyWith(
        error: 'Username is unavailable',
        currentState: AuthenticationStatus.AuthenticationFailure,
      ));

      return;
    }

    final UserModel user = UserModel(
      id: event.userId,
      username: event.username,
    );

    emit(state.copyWith(
      user: user,
      currentState: AuthenticationStatus.RegisterUsernameSuccess,
    ));
  }

  Future<void> _recoverAccount(
      _RecoverAccount event, Emitter<AuthenticationState> emit) async {
    try {
      emit(state.copyWith(
          currentState: AuthenticationStatus.RecoverAccountLoading));

      final response = await authRepository.recoverPassword(email: event.email);

      if (response.hasError) {
        emit(state.copyWith(
          error: response.error,
          currentState: AuthenticationStatus.RecoverAccountFailure,
        ));
        return;
      }

      emit(state.copyWith(
          currentState: AuthenticationStatus.RecoverAccountSuccess));
    } catch (e) {
      emit(state.copyWith(
          error: e.toString(),
          currentState: AuthenticationStatus.RecoverAccountFailure));
    }
  }
}
