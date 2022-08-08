part of 'following_bloc.dart';

enum FollowingStatus {
  Initial,
  Loaded,
  Loading,
  Faliure,
}

@freezed
class FollowingState with _$FollowingState {
  const factory FollowingState({
    @Default('') String error,
    required List<UserDTO> following,
    @Default(FollowingStatus.Initial) FollowingStatus currentState,
  }) = _FollowingState;
}
