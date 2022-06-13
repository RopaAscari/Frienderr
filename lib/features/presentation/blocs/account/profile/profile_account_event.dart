part of 'profile_account_bloc.dart';

@freezed
class ProfileAccountEvent with _$ProfileAccountEvent {
  const factory ProfileAccountEvent.getUser({required String uid}) = _GetUser;
  const factory ProfileAccountEvent.getFollowers({required String uid}) =
      _GetFollowers;
  const factory ProfileAccountEvent.getFollowing({required String uid}) =
      _GetFollowing;
  const factory ProfileAccountEvent.getPosts({required String uid}) = _GetPosts;
  const factory ProfileAccountEvent.getSnaps({required String uid}) = _GetSnaps;
}
