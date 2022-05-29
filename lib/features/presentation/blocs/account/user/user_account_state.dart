part of 'user_account_bloc.dart';

enum UserAccountStatus {
  idle,
  error,
  loading,
  loaded,
}

enum UserAccountListenableAction { idle }

@freezed
class UserAccountState with _$UserAccountState {
  const factory UserAccountState({
    @Default(null) String? error,
    @Default(null) Account? account,
    @Default(UserAccountStatus.idle) UserAccountStatus currentState,
    @Default(UserAccountListenableAction.idle)
        UserAccountListenableAction action,
  }) = _UserAccountState;
}
