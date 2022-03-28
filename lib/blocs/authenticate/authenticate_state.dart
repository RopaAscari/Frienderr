part of 'authenticate_bloc.dart';

enum AuthenticationStatus {
  Initial,
  Authenticated,
  UnAuthenticated,
  UnAuthenticationLoading,
  /* CREATE ACCOUNT STATES*/
  CreateAccountLoading,
  CreateAccountSuccess,
  CreateAccountFaliure,
  /* LOGIN STATES*/
  AuthenticationLoading,
  AuthenticationSuccess,
  AuthenticationFailure,
  /* RECOVER ACCOUNT STATES */
  RecoverAccountLoading,
  RecoverAccountSuccess,
  RecoverAccountFailure,
  /* REGIISTER USERNAME STATES */
  RegisterUsernameLoading,
  RegisterUsernameSuccess,
  RegisterUsernameFailure,
}

@freezed
class AuthenticationState with _$AuthenticationState {
  const factory AuthenticationState({
    UserModel? user,
    @Default('') String error,
    @Default(AuthenticationStatus.Initial) AuthenticationStatus currentState,
  }) = _AuthenticationState;
}
