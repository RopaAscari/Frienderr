part of 'followers_bloc.dart';

enum FollowerStatus {
  Initial,
  Loaded,
  Loading,
  Faliure,
}

@freezed
class FollowersState with _$FollowersState {
  const factory FollowersState({
    @Default('') String error,
    required List<UserEntity> followers,
    @Default(FollowerStatus.Initial) FollowerStatus currentState,
  }) = _FollowersState;
}
