part of 'following_bloc.dart';

@freezed
class FollowingEvent with _$FollowingEvent {
  const factory FollowingEvent.getFolllowing({required String userId}) =
      _GetFollowing;
}
