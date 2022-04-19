import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:frienderr/core/failure/failure.dart';
import 'package:frienderr/features/data/models/auth/auth_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frienderr/features/domain/entities/user.dart';
import 'package:frienderr/features/data/models/user/user_model.dart';
import 'package:frienderr/features/domain/usecases/auth/sign_out_usecase.dart';
import 'package:frienderr/features/domain/usecases/auth/authenticate_usecase.dart';
import 'package:frienderr/features/domain/usecases/auth/create_account_usecase.dart';
import 'package:frienderr/features/domain/usecases/auth/get_user_id_usecase.dart';
import 'package:frienderr/features/domain/usecases/auth/verify_and_update_username.dart';
import 'package:frienderr/features/domain/usecases/auth/verify_authentication_usecase.dart';
import 'package:frienderr/features/domain/usecases/auth/verify_username_existence_usecase.dart';

part 'authenticate_event.dart';
part 'authenticate_state.dart';
part 'authenticate_bloc.freezed.dart';

@injectable
class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final SignOutUseCase _signOutUseCase;
  final GetUserIdUseCase _getUserIdUsecase;
  final CreateAccountUseCase _createAccountUsecase;
  final AuthenticateUseCase _authenticateUserUsecase;
  final RecoverPasswordUseCase _recoverPasswordUsecase;
  final VerifyAuthenticationUseCase _verifyAutheticationUsecase;
  final VerifyAndUpdateUsernameUseCase _verifyAndUpdateUsernameUsecase;

  AuthenticationBloc(
    this._signOutUseCase,
    this._getUserIdUsecase,
    this._createAccountUsecase,
    this._recoverPasswordUsecase,
    this._authenticateUserUsecase,
    this._verifyAutheticationUsecase,
    this._verifyAndUpdateUsernameUsecase,
  ) : super(AuthenticationState()) {
    on<_LogOut>(_logOut);
    on<_Authenticate>(_authenticate);
    on<_CreateAccount>(_createAccount);
    on<_AppInitialized>(_appInitialized);
    on<_RecoverAccount>(_recoverAccount);
    on<_RegisterUsername>(_registerUsername);
  }

  Future<void> _appInitialized(
      _AppInitialized event, Emitter<AuthenticationState> emit) async {
    final either =
        await _verifyAutheticationUsecase(VerifyAuthenticationParams());

    return either.fold((error) => null, (isAuthenticated) {
      if (!isAuthenticated) {
        emit(state.copyWith(
          currentState: AuthenticationStatus.UnAuthenticated,
        ));
      } else {
        emit(state.copyWith(
          currentState: AuthenticationStatus.Authenticated,
        ));
      }
    });
  }

  Future<void> _logOut(_LogOut event, Emitter<AuthenticationState> emit) async {
    emit(state.copyWith(
        currentState: AuthenticationStatus.UnAuthenticationLoading));

    final either = _signOutUseCase(SignOutParams(
        onComplete: () => emit(state.copyWith(
              currentState: AuthenticationStatus.Authenticated,
            )),
        onFailure: () => null));
  }

  Future<void> _authenticate(
      _Authenticate event, Emitter<AuthenticationState> emit) async {
    emit(state.copyWith(
      currentState: AuthenticationStatus.AuthenticationLoading,
    ));

    final Either<Failure, AuthResponse> _either =
        await _authenticateUserUsecase(AuthenticateParams(
      email: event.email,
      password: event.password,
    ));

    return _either.fold((Failure error) {
      emit(state.copyWith(
        error: error.message,
        currentState: AuthenticationStatus.AuthenticationFailure,
      ));
    }, (AuthResponse response) {
      emit(state.copyWith(
        user: response.user,
        currentState: AuthenticationStatus.AuthenticationSuccess,
      ));
    });
  }

  Future<void> _createAccount(
      _CreateAccount event, Emitter<AuthenticationState> emit) async {
    emit(state.copyWith(
      currentState: AuthenticationStatus.CreateAccountLoading,
    ));

    final Either<Failure, AuthResponse> _either = await _createAccountUsecase(
        CreateAccountParams(email: event.email, password: event.password));

    return _either.fold((Failure error) {
      emit(state.copyWith(
        error: error.message,
        currentState: AuthenticationStatus.CreateAccountFaliure,
      ));
    }, (AuthResponse response) {
      emit(state.copyWith(
        user: response.user,
        currentState: AuthenticationStatus.CreateAccountSuccess,
      ));
    });
  }

  Future<void> _registerUsername(
      _RegisterUsername event, Emitter<AuthenticationState> emit) async {
    emit(state.copyWith(
      currentState: AuthenticationStatus.RegisterUsernameLoading,
    ));

    final Either<Failure, bool> _either = await _verifyAndUpdateUsernameUsecase(
        VerifyUsernameUseCaseParams(event.userId, event.username));

    return _either.fold((Failure error) {
      print(error.message);
      emit(state.copyWith(
        error: error.message,
        currentState: AuthenticationStatus.RegisterUsernameFailure,
      ));
    }, (bool isAvaliable) {
      if (isAvaliable) {
        final UserModel? user = UserModel(
          id: event.userId,
          username: event.username,
        );

        emit(state.copyWith(
          user: user,
          currentState: AuthenticationStatus.RegisterUsernameSuccess,
        ));
      }
    });
  }

  Future<void> _recoverAccount(
      _RecoverAccount event, Emitter<AuthenticationState> emit) async {
    emit(state.copyWith(
        currentState: AuthenticationStatus.RecoverAccountLoading));

    final Either<Failure, AuthResponse> _either =
        await _recoverPasswordUsecase(RecoverPasswordParams(event.email));

    return _either.fold((Failure error) {
      emit(state.copyWith(
        error: error.message,
        currentState: AuthenticationStatus.RecoverAccountFailure,
      ));
    }, (AuthResponse response) {
      emit(state.copyWith(
          currentState: AuthenticationStatus.RecoverAccountSuccess));
    });
  }
}
