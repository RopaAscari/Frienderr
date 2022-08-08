part of 'followers_bloc.dart';

enum FollowerStatus {
  intial,
}

enum FollowerListenableAction {
  idle,
  followSuccess,
  followFailure,
  unfollowSuccess,
  unfollowFailure
}

@freezed
class FollowersState with _$FollowersState {
  const factory FollowersState({
    @Default('') String error,
    required List<UserDTO> followers,
    @Default(FollowerStatus.intial) FollowerStatus currentState,
    @Default(FollowerListenableAction.idle) FollowerListenableAction action,
  }) = _FollowersState;
}
