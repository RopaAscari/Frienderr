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
  const factory UserAccountEvent.getReactions({required String uid}) =
      _GetReactions;
  const factory UserAccountEvent.getFollowingList({required String uid}) =
      _GetFollowingList;

  const factory UserAccountEvent.getFollowingStatus({required String uid}) =
      _GetFollowingStatus;
  const factory UserAccountEvent.updateProfilePhoto(
      {required File file,
      required String uid,
      required UserBloc userBloc}) = _UpdateProfilePhoto;
  const factory UserAccountEvent.updateCoverPhoto(
      {required File file,
      required String uid,
      required UserBloc userBloc}) = _UpdateCoverPhoto;
  const factory UserAccountEvent.updateProfile(
      {required String uid,
      required UserBloc userBloc,
      required UpdateProfile profile}) = _UpdateProfile;
}
