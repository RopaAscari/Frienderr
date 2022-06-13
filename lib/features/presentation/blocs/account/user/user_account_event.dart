part of 'user_account_bloc.dart';

@freezed
class UserAccountEvent with _$UserAccountEvent {
  const factory UserAccountEvent.getUser({required String uid}) = _GetUser;
  const factory UserAccountEvent.getFollowers({required String uid}) =
      _GetFollowers;
  const factory UserAccountEvent.getFollowing({required String uid}) =
      _GetFollowing;
  const factory UserAccountEvent.getPosts({required String uid}) = _GetPosts;
  const factory UserAccountEvent.getSnaps({required String uid}) = _GetSnaps;
}
