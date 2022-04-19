part of 'user_bloc.dart';

@freezed
class UserEvent with _$UserEvent {
  const factory UserEvent.setUser(UserModel user) = _SetUser;
  const factory UserEvent.getPlatformUsers() = _FetchAppUsers;
}
