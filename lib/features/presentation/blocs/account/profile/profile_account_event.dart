part of 'profile_account_bloc.dart';

@freezed
class ProfileAccountEvent with _$ProfileAccountEvent {
  const factory ProfileAccountEvent.getUserAccount({required String uid}) =
      _GetProfileAccount;
  const factory ProfileAccountEvent.getProfileAccount({required String uid}) =
      _ProfileAccountEvent;
}
