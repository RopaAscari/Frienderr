part of 'authenticate_bloc.dart';

@freezed
class AuthenticationEvent with _$AuthenticationEvent {
  const factory AuthenticationEvent.logOut() = _LogOut;
  const factory AuthenticationEvent.initialize() = _AppInitialized;
  const factory AuthenticationEvent.recoverAccount({required String email}) =
      _RecoverAccount;
  const factory AuthenticationEvent.onAuthenticate(
      {required String email, required String password}) = _Authenticate;
  const factory AuthenticationEvent.createAccount(
      {required String email, required String password}) = _CreateAccount;
  const factory AuthenticationEvent.registerUsername(
      {required String userId, required String username}) = _RegisterUsername;
}
