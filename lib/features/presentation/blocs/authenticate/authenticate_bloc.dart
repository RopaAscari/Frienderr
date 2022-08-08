import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:frienderr/core/injection/injection.dart';
import 'package:frienderr/features/domain/entities/bloc_group.dart';
import 'package:frienderr/features/presentation/blocs/post/post_bloc.dart';
import 'package:frienderr/features/presentation/blocs/user/user_bloc.dart';
import 'package:frienderr/features/presentation/navigation/app_router.dart';
import 'package:injectable/injectable.dart';
import 'package:frienderr/core/failure/failure.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frienderr/features/data/models/auth/auth_model.dart';
import 'package:frienderr/features/data/models/user/user_model.dart';
import 'package:frienderr/features/domain/usecases/auth/sign_out_usecase.dart';
import 'package:frienderr/features/domain/usecases/auth/get_user_id_usecase.dart';
import 'package:frienderr/features/domain/usecases/auth/authenticate_usecase.dart';
import 'package:frienderr/features/domain/usecases/auth/google_sign_in_usecase.dart';
import 'package:frienderr/features/domain/usecases/auth/google_sign_up_usecase.dart';
import 'package:frienderr/features/domain/usecases/auth/create_account_usecase.dart';
import 'package:frienderr/features/domain/usecases/auth/twitter_sign_in_usecase.dart';
import 'package:frienderr/features/domain/usecases/auth/twitter_sign_up_usecase.dart';
import 'package:frienderr/features/domain/usecases/auth/facebook_sign_in_usecase.dart';
import 'package:frienderr/features/domain/usecases/auth/facebook_sign_up_usecase.dart';
import 'package:frienderr/features/domain/usecases/auth/verify_and_update_username.dart';
import 'package:frienderr/features/domain/usecases/auth/verify_authentication_usecase.dart';
import 'package:frienderr/features/domain/usecases/auth/verify_username_existence_usecase.dart';

import 'package:frienderr/features/presentation/blocs/user/user_bloc.dart';
import 'package:frienderr/features/presentation/blocs/chat/chat_bloc.dart';
import 'package:frienderr/features/presentation/blocs/post/post_bloc.dart';
import 'package:frienderr/features/presentation/blocs/snap/snap_bloc.dart';
import 'package:frienderr/features/presentation/blocs/story/story_bloc.dart';
import 'package:frienderr/features/presentation/blocs/theme/theme_bloc.dart';
import 'package:frienderr/features/presentation/blocs/camera/camera_bloc.dart';
import 'package:frienderr/features/presentation/blocs/messaging/messaging_bloc.dart';
import 'package:frienderr/features/presentation/blocs/animation/animation_bloc.dart';
import 'package:frienderr/features/presentation/blocs/followers/followers_bloc.dart';
import 'package:frienderr/features/presentation/blocs/notification/notification_bloc.dart';
import 'package:frienderr/features/presentation/blocs/account/user/user_account_bloc.dart';
import 'package:frienderr/features/presentation/blocs/authenticate/authenticate_bloc.dart';
import 'package:frienderr/features/presentation/blocs/account/profile/profile_account_bloc.dart';

part 'authenticate_event.dart';
part 'authenticate_state.dart';
part 'authenticate_bloc.freezed.dart';

@injectable
class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final SignOutUseCase _signOutUseCase;
  final GetUserIdUseCase _getUserIdUsecase;
  final GoogleSignUpUseCase _googleSignUpUseCase;
  final GoogleSignInUseCase _googleSignInUseCase;
  final CreateAccountUseCase _createAccountUsecase;
  final TwitterSignUpUseCase _twitterSignUpUseCase;
  final TwitterSignInUseCase _twitterSignInUseCase;
  final FacebookSignUpUseCase _facebookSignUpUseCase;
  final FacebookSignInUseCase _facebookSignInUseCase;
  final AuthenticateUseCase _authenticateUserUsecase;
  final RecoverPasswordUseCase _recoverPasswordUsecase;
  final VerifyAuthenticationUseCase _verifyAutheticationUsecase;
  final VerifyAndUpdateUsernameUseCase _verifyAndUpdateUsernameUsecase;

  AuthenticationBloc(
    this._signOutUseCase,
    this._getUserIdUsecase,
    this._googleSignInUseCase,
    this._googleSignUpUseCase,
    this._createAccountUsecase,
    this._twitterSignInUseCase,
    this._twitterSignUpUseCase,
    this._facebookSignInUseCase,
    this._facebookSignUpUseCase,
    this._recoverPasswordUsecase,
    this._authenticateUserUsecase,
    this._verifyAutheticationUsecase,
    this._verifyAndUpdateUsernameUsecase,
  ) : super(const AuthenticationState()) {
    on<_LogOut>(_logOut);

    on<_Authenticate>(_authenticate);
    on<_CreateAccount>(_createAccount);
    on<_GoogleSignIn>(_googleSignIn);
    on<_GoogleSignUp>(_googleSignUp);
    on<_TwitterSignIn>(_twitterSignIn);
    on<_TwitterSignUp>(_twitterSignUp);
    on<_FacebookSignIn>(_facebookSignIn);
    on<_FacebookSignUp>(_facebookSignUp);
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
          currentState: AuthenticationStatus.unAuthenticated,
        ));
      } else {
        emit(state.copyWith(
          currentState: AuthenticationStatus.authenticated,
        ));
      }
    });
  }

  Future<void> _logOut(_LogOut event, Emitter<AuthenticationState> emit) async {
    emit(state.copyWith(
        currentState: AuthenticationStatus.unAuthenticationLoading));

    final _either = await _signOutUseCase(SignOutParams());

    final BlocGroup _blocGroup = BlocGroup(
      userBloc: getService<UserBloc>(),
      postBloc: getService<PostBloc>(),
      chatBloc: getService<ChatBloc>(),
      snapBloc: getService<SnapBloc>(),
      themeBloc: getService<ThemeBloc>(),
      storyBloc: getService<StoryBloc>(),
      cameraBloc: getService<CameraBloc>(),
      messageBloc: getService<MessageBloc>(),
      followersBloc: getService<FollowersBloc>(),
      userAccountBloc: getService<UserAccountBloc>(),
      notificationBloc: getService<NotificationBloc>(),
      profileAccountBloc: getService<ProfileAccountBloc>(),
      authenticationBloc: getService<AuthenticationBloc>(),
    );

    getService<AppRouter>().pushAndPopUntil(LoginRoute(blocGroup: _blocGroup),
        predicate: (r) => false);

    /*return _either.fold((Failure error) {
      emit(state.copyWith(
        error: error.message,
        currentState: AuthenticationStatus.authenticationFailure,
      ));

     
    }, (response) {
      if (!response) {
        getService<AppRouter>().context.showToast(
            content:
                const Text("Unable to logout", style: TextStyle(fontSize: 13)));
        return;
      }
      emit(state.copyWith(
        user: null,
        currentState: AuthenticationStatus.unAuthenticated,
      ));
      // getService<AppRouter>().push(LoginRoute(blocGroup: blocGroup));
    });*/
  }

  Future<void> _googleSignIn(
      _GoogleSignIn event, Emitter<AuthenticationState> emit) async {
    emit(state.copyWith(
      currentState: AuthenticationStatus.authenticationLoading,
    ));

    final Either<Failure, AuthResponse> _either =
        await _googleSignInUseCase(GoogleSignInParams());

    return _either.fold((Failure error) {
      emit(state.copyWith(
        error: error.message,
        currentState: AuthenticationStatus.authenticationFailure,
      ));
    }, (AuthResponse response) {
      emit(state.copyWith(
        user: response.user,
        currentState: AuthenticationStatus.authenticationSuccess,
      ));
    });
  }

  Future<void> _googleSignUp(
      _GoogleSignUp event, Emitter<AuthenticationState> emit) async {
    emit(state.copyWith(
      currentState: AuthenticationStatus.authenticationLoading,
    ));

    final Either<Failure, AuthResponse> _either =
        await _googleSignUpUseCase(GoogleSignUpParams());

    return _either.fold((Failure error) {
      emit(state.copyWith(
        error: error.message,
        currentState: AuthenticationStatus.createAccountFaliure,
      ));
    }, (AuthResponse response) {
      emit(state.copyWith(
        user: response.user,
        currentState: AuthenticationStatus.createAccountSuccess,
      ));
    });
  }

  Future<void> _facebookSignIn(
      _FacebookSignIn event, Emitter<AuthenticationState> emit) async {
    emit(state.copyWith(
      currentState: AuthenticationStatus.authenticationLoading,
    ));

    final Either<Failure, AuthResponse> _either =
        await _facebookSignInUseCase(FacebookSignInParams());

    return _either.fold((Failure error) {
      emit(state.copyWith(
        error: error.message,
        currentState: AuthenticationStatus.authenticationFailure,
      ));
    }, (AuthResponse response) {
      emit(state.copyWith(
        user: response.user,
        currentState: AuthenticationStatus.authenticationSuccess,
      ));
    });
  }

  Future<void> _facebookSignUp(
      _FacebookSignUp event, Emitter<AuthenticationState> emit) async {
    emit(state.copyWith(
      currentState: AuthenticationStatus.authenticationLoading,
    ));

    final Either<Failure, AuthResponse> _either =
        await _facebookSignUpUseCase(FacebookSignUpParams());

    return _either.fold((Failure error) {
      emit(state.copyWith(
        error: error.message,
        currentState: AuthenticationStatus.createAccountFaliure,
      ));
    }, (AuthResponse response) {
      emit(state.copyWith(
        user: response.user,
        currentState: AuthenticationStatus.createAccountSuccess,
      ));
    });
  }

  Future<void> _twitterSignUp(
      _TwitterSignUp event, Emitter<AuthenticationState> emit) async {
    emit(state.copyWith(
      currentState: AuthenticationStatus.authenticationLoading,
    ));

    final Either<Failure, AuthResponse> _either =
        await _twitterSignUpUseCase(TwitterSignUpParams());

    return _either.fold((Failure error) {
      emit(state.copyWith(
        error: error.message,
        currentState: AuthenticationStatus.createAccountFaliure,
      ));
    }, (AuthResponse response) {
      emit(state.copyWith(
        user: response.user,
        currentState: AuthenticationStatus.createAccountSuccess,
      ));
    });
  }

  Future<void> _twitterSignIn(
      _TwitterSignIn event, Emitter<AuthenticationState> emit) async {
    emit(state.copyWith(
      currentState: AuthenticationStatus.authenticationLoading,
    ));

    final Either<Failure, AuthResponse> _either =
        await _twitterSignInUseCase(TwitterSignInParams());

    return _either.fold((Failure error) {
      emit(state.copyWith(
        error: error.message,
        currentState: AuthenticationStatus.authenticationFailure,
      ));
    }, (AuthResponse response) {
      emit(state.copyWith(
        user: response.user,
        currentState: AuthenticationStatus.authenticationSuccess,
      ));
    });
  }

  Future<void> _authenticate(
      _Authenticate event, Emitter<AuthenticationState> emit) async {
    emit(state.copyWith(
      currentState: AuthenticationStatus.authenticationLoading,
    ));

    final Either<Failure, AuthResponse> _either =
        await _authenticateUserUsecase(AuthenticateParams(
      email: event.email,
      password: event.password,
    ));

    return _either.fold((Failure error) {
      emit(state.copyWith(
        error: error.message,
        currentState: AuthenticationStatus.authenticationFailure,
      ));
    }, (AuthResponse response) {
      emit(state.copyWith(
        user: response.user,
        currentState: AuthenticationStatus.authenticationSuccess,
      ));
    });
  }

  Future<void> _createAccount(
      _CreateAccount event, Emitter<AuthenticationState> emit) async {
    emit(state.copyWith(
      currentState: AuthenticationStatus.createAccountLoading,
    ));

    final Either<Failure, AuthResponse> _either = await _createAccountUsecase(
        CreateAccountParams(email: event.email, password: event.password));

    return _either.fold((Failure error) {
      emit(state.copyWith(
        error: error.message,
        currentState: AuthenticationStatus.createAccountFaliure,
      ));
    }, (AuthResponse response) {
      emit(state.copyWith(
        user: response.user,
        currentState: AuthenticationStatus.createAccountSuccess,
      ));
    });
  }

  Future<void> _registerUsername(
      _RegisterUsername event, Emitter<AuthenticationState> emit) async {
    emit(state.copyWith(
      currentState: AuthenticationStatus.registerUsernameLoading,
    ));

    final Either<Failure, bool> _either = await _verifyAndUpdateUsernameUsecase(
        VerifyUsernameUseCaseParams(event.userId, event.username));

    return _either.fold((Failure error) {
      emit(state.copyWith(
        error: error.message,
        currentState: AuthenticationStatus.registerUsernameFailure,
      ));
    }, (bool isAvaliable) {
      if (isAvaliable) {
        final UserModel? user = UserModel(
          id: event.userId,
          username: event.username,
        );

        emit(state.copyWith(
          user: user,
          currentState: AuthenticationStatus.registerUsernameSuccess,
        ));
      }
    });
  }

  Future<void> _recoverAccount(
      _RecoverAccount event, Emitter<AuthenticationState> emit) async {
    emit(state.copyWith(
        currentState: AuthenticationStatus.recoverAccountLoading));

    final Either<Failure, AuthResponse> _either =
        await _recoverPasswordUsecase(RecoverPasswordParams(event.email));

    return _either.fold((Failure error) {
      emit(state.copyWith(
        error: error.message,
        currentState: AuthenticationStatus.recoverAccountFailure,
      ));
    }, (AuthResponse response) {
      emit(state.copyWith(
          currentState: AuthenticationStatus.recoverAccountSuccess));
    });
  }
}
