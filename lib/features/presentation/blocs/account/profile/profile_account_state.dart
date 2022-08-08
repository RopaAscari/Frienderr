part of 'profile_account_bloc.dart';

enum ProfileAccountUserStatus {
  idle,
  error,
  loaded,
  loading,
}

enum ProfileAccountFollowingStatus { idle, error, loaded, loading }

enum ProfileAccountFollowersStatus {
  idle,
  error,
  loaded,
  loading,
}

enum ProfileAccountPostStatus {
  idle,
  error,
  loaded,
  loading,
}

enum ProfileAccountSnapStatus {
  idle,
  error,
  loaded,
  loading,
}

enum ProfileAccountListenableAction {
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
class ProfileAccountState with _$ProfileAccountState {
  const factory ProfileAccountState({
    required UserModel user,
    @Default(0) int following,
    @Default(0) int followers,
    @Default(0) int reactions,
    @Default(null) String? error,
    @Default([]) List<Post> posts,
    @Default([]) List<Snap> snaps,
    @Default(false) bool isFollowing,
    @Default([]) List<UserModel> followersList,
    @Default(ProfileAccountPostStatus.idle) ProfileAccountPostStatus postState,
    @Default(ProfileAccountSnapStatus.idle) ProfileAccountSnapStatus snapState,
    @Default(ProfileAccountUserStatus.idle) ProfileAccountUserStatus userState,
    @Default(ProfileAccountFollowersStatus.idle)
        ProfileAccountFollowersStatus followerState,
    @Default(ProfileAccountFollowingStatus.idle)
        ProfileAccountFollowingStatus followingState,
    @Default(ProfileAccountListenableAction.idle)
        ProfileAccountListenableAction action,
  }) = _ProfileAccountState;
}
