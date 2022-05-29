part of 'user_account_bloc.dart';

@freezed
class UserAccountEvent with _$UserAccountEvent {
  const factory UserAccountEvent.getUserAccount({required String uid}) =
      _GetUserAccount;
}
