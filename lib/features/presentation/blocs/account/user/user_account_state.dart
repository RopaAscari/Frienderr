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

enum UserAccountListenableAction {
  idle,
  coverPhotoUpdated,
  profileUpdateError,
  profilePhotoUpdated,
  profileUpdateLoading,
  profileUpdateSuccess,
  coverPhotoUpdateFailed,
  profilePhotoUpdateFailed,
}

@freezed
class UserAccountState with _$UserAccountState {
  const factory UserAccountState({
    required UserModel user,
    @Default(0) int following,
    @Default(0) int followers,
    @Default(0) int reactions,
    @Default(null) String? error,
    @Default([]) List<Post> posts,
    @Default([]) List<Snap> snaps,
    @Default([]) List<UserModel> followersList,
    @Default(AccountPostStatus.idle) AccountPostStatus postState,
    @Default(AccountSnapStatus.idle) AccountSnapStatus snapState,
    @Default(AccountUserStatus.idle) AccountUserStatus userState,
    @Default(AccountFollowersStatus.idle) AccountFollowersStatus followerState,
    @Default(AccountFollowingStatus.idle) AccountFollowingStatus followingState,
    @Default(UserAccountListenableAction.idle)
        UserAccountListenableAction action,
  }) = _UserAccountState;
}
