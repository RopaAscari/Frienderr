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
  const factory ProfileAccountEvent.getReactions({required String uid}) =
      _GetReactions;
  const factory ProfileAccountEvent.getFollowingList({required String uid}) =
      _GetFollowingList;

  const factory ProfileAccountEvent.getFollowingStatus({required String uid}) =
      _GetFollowingStatus;

  const factory ProfileAccountEvent.updateProfilePhoto(
      {required File file,
      required String uid,
      required UserBloc userBloc}) = _UpdateProfilePhoto;
  const factory ProfileAccountEvent.updateCoverPhoto(
      {required File file,
      required String uid,
      required UserBloc userBloc}) = _UpdateCoverPhoto;
  const factory ProfileAccountEvent.updateProfile(
      {required String uid,
      required UserBloc userBloc,
      required UpdateProfile profile}) = _UpdateProfile;
}
