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

enum ProfileAccountListenableAction { idle }

@freezed
class ProfileAccountState with _$ProfileAccountState {
  const factory ProfileAccountState({
    required UserEntity user,
    @Default(null) String? error,
    @Default([]) List<String> following,
    @Default([]) List<String> followers,
    @Default([]) List<PostEntity> posts,
    @Default([]) List<QuickEntity> snaps,
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
