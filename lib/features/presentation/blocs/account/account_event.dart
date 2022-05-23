part of 'account_bloc.dart';

@freezed
class AccountEvent with _$AccountEvent {
  const factory AccountEvent.getUserAccount({required String uid}) =
      _GetUserAccount;
  const factory AccountEvent.getProfileAccount({required String uid}) =
      _GetProfileAccount;
}
