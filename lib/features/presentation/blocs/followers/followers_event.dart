part of 'followers_bloc.dart';

@freezed
class FollowersEvent with _$FollowersEvent {
  const factory FollowersEvent.getFolllowers({required String userId}) =
      _GetFollowers;
}
