part of 'followers_bloc.dart';

@freezed
class FollowersEvent with _$FollowersEvent {
  const factory FollowersEvent.getFolllowers({required String userId}) =
      _GetFollowers;
  const factory FollowersEvent.followUser(
      {required String uid, required String fid}) = _FollowUser;
  const factory FollowersEvent.unfollowUser(
      {required String uid, required String fid}) = _UnFollowUser;
  const factory FollowersEvent.reset() = _Reset;
}
