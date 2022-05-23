part of 'account_bloc.dart';

enum AccountStatus {
  idle,
  error,
  loading,
  loaded,
}

enum AccountListendableAction { idle }

@freezed
class AccountState with _$AccountState {
  const factory AccountState({
    @Default(null) String? error,
    @Default(null) Account? userAccount,
    @Default(null) Account? profileAccount,
    @Default(AccountStatus.idle) AccountStatus currentState,
    @Default(AccountListendableAction.idle) AccountListendableAction action,
  }) = _AccountState;
}
