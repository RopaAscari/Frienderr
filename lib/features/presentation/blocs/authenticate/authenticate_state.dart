part of 'authenticate_bloc.dart';

enum AuthenticationStatus {
  initial,
  authenticated,
  unAuthenticated,
  unAuthenticationLoading,
  /* CREATE ACCOUNT STATES*/
  createAccountLoading,
  createAccountSuccess,
  createAccountFaliure,
  /* LOGIN STATES*/
  authenticationLoading,
  authenticationSuccess,
  authenticationFailure,
  /* RECOVER ACCOUNT STATES */
  recoverAccountLoading,
  recoverAccountSuccess,
  recoverAccountFailure,
  /* REGIISTER USERNAME STATES */
  registerUsernameLoading,
  registerUsernameSuccess,
  registerUsernameFailure,
}

@freezed
class AuthenticationState with _$AuthenticationState {
  const factory AuthenticationState({
    UserModel? user,
    @Default('') String error,
    @Default(AuthenticationStatus.initial) AuthenticationStatus currentState,
  }) = _AuthenticationState;
}
