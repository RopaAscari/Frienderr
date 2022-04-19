import 'package:bloc/bloc.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'animation_event.dart';
part 'animation_state.dart';
part 'animation_bloc.freezed.dart';

class AnimationBloc extends Bloc<AnimationEvent, AnimationState> {
//...

  AnimationBloc() : super(AnimationState()) {
    on<_InitializeController>(_initializeController);
    on<_TriggerLikeAnimation>(triggerLikeAnimation);
    on<_ResetLikeAnimation>(_resetLikeAnimation);
  }

  Future<void> _initializeController(
      _InitializeController event, Emitter<AnimationState> emit) async {
    emit(state.copyWith(controller: event.controller));
  }

  Future<void> triggerLikeAnimation(
      _TriggerLikeAnimation event, Emitter<AnimationState> emit) async {
    emit(state.copyWith(value: event.value));
  }

  Future<void> _resetLikeAnimation(
      _ResetLikeAnimation event, Emitter<AnimationState> emit) async {
    print(event.value);
    emit(state.copyWith(value: event.value));
  }
}
