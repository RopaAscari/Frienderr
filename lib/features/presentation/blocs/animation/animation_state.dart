part of 'animation_bloc.dart';

enum AnimationStatus { Idle }

@freezed
class AnimationState with _$AnimationState {
  const factory AnimationState({
    @Default(0) double value,
    AnimationController? controller,
    @Default(AnimationStatus.Idle) AnimationStatus currentState,
  }) = _AnimationState;
}
