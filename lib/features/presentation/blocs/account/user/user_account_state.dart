part of 'user_account_bloc.dart';

enum AccountUserStatus {
  idle,
  error,
  loaded,
  loading,
}

enum AccountFollowingStatus { idle, error, loaded, loading }

enum AccountFollowersStatus {
  idle,
  error,
  loaded,
  loading,
}

enum AccountPostStatus {
  idle,
  error,
  loaded,
  loading,
}

enum AccountSnapStatus {
  idle,
  error,
  loaded,
  loading,
}

enum UserAccountListenableAction { idle }

@freezed
class UserAccountState with _$UserAccountState {
  const factory UserAccountState({
    required UserEntity user,
    @Default(null) String? error,
    @Default([]) List<String> following,
    @Default([]) List<String> followers,
    @Default([]) List<PostEntity> posts,
    @Default([]) List<QuickEntity> snaps,
    @Default(AccountPostStatus.idle) AccountPostStatus postState,
    @Default(AccountSnapStatus.idle) AccountSnapStatus snapState,
    @Default(AccountUserStatus.idle) AccountUserStatus userState,
    @Default(AccountFollowersStatus.idle) AccountFollowersStatus followerState,
    @Default(AccountFollowingStatus.idle) AccountFollowingStatus followingState,
    @Default(UserAccountListenableAction.idle)
        UserAccountListenableAction action,
  }) = _UserAccountState;
}
