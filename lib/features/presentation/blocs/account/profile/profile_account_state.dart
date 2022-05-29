part of 'profile_account_bloc.dart';

enum ProfileAccountStatus {
  idle,
  error,
  loading,
  loaded,
}

enum ProfileAccountListenableAction { idle }

@freezed
class ProfileAccountState with _$ProfileAccountState {
  const factory ProfileAccountState({
    @Default(null) String? error,
    @Default(null) Account? account,
    @Default(ProfileAccountStatus.idle) ProfileAccountStatus currentState,
    @Default(ProfileAccountListenableAction.idle)
        ProfileAccountListenableAction action,
  }) = _ProfileAccountState;
}
