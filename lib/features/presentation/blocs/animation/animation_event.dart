part of 'animation_bloc.dart';

@freezed
class AnimationEvent with _$AnimationEvent {
  const factory AnimationEvent.initializeController(
      {required AnimationController controller}) = _InitializeController;
  const factory AnimationEvent.triggerLikeAnimation({required double value}) =
      _TriggerLikeAnimation;
  const factory AnimationEvent.resetLikeAnimation({required double value}) =
      _ResetLikeAnimation;
}
