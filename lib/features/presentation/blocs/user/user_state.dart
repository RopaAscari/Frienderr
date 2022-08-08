part of 'user_bloc.dart';

enum UserStatus { Initial, ThemeChanged }

@freezed
class UserState with _$UserState {
  factory UserState({
    @Default(UserModel()) UserModel user,
    @Default([]) List<UserDTO> platformUsers,
    @Default(UserStatus.Initial) UserStatus status,
  }) = _UserState;
}
