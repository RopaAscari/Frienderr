// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'animation_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AnimationEventTearOff {
  const _$AnimationEventTearOff();

  _InitializeController initializeController(
      {required AnimationController controller}) {
    return _InitializeController(
      controller: controller,
    );
  }

  _TriggerLikeAnimation triggerLikeAnimation({required double value}) {
    return _TriggerLikeAnimation(
      value: value,
    );
  }

  _ResetLikeAnimation resetLikeAnimation({required double value}) {
    return _ResetLikeAnimation(
      value: value,
    );
  }
}

/// @nodoc
const $AnimationEvent = _$AnimationEventTearOff();

/// @nodoc
mixin _$AnimationEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AnimationController controller)
        initializeController,
    required TResult Function(double value) triggerLikeAnimation,
    required TResult Function(double value) resetLikeAnimation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(AnimationController controller)? initializeController,
    TResult Function(double value)? triggerLikeAnimation,
    TResult Function(double value)? resetLikeAnimation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AnimationController controller)? initializeController,
    TResult Function(double value)? triggerLikeAnimation,
    TResult Function(double value)? resetLikeAnimation,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitializeController value) initializeController,
    required TResult Function(_TriggerLikeAnimation value) triggerLikeAnimation,
    required TResult Function(_ResetLikeAnimation value) resetLikeAnimation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_InitializeController value)? initializeController,
    TResult Function(_TriggerLikeAnimation value)? triggerLikeAnimation,
    TResult Function(_ResetLikeAnimation value)? resetLikeAnimation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitializeController value)? initializeController,
    TResult Function(_TriggerLikeAnimation value)? triggerLikeAnimation,
    TResult Function(_ResetLikeAnimation value)? resetLikeAnimation,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnimationEventCopyWith<$Res> {
  factory $AnimationEventCopyWith(
          AnimationEvent value, $Res Function(AnimationEvent) then) =
      _$AnimationEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$AnimationEventCopyWithImpl<$Res>
    implements $AnimationEventCopyWith<$Res> {
  _$AnimationEventCopyWithImpl(this._value, this._then);

  final AnimationEvent _value;
  // ignore: unused_field
  final $Res Function(AnimationEvent) _then;
}

/// @nodoc
abstract class _$InitializeControllerCopyWith<$Res> {
  factory _$InitializeControllerCopyWith(_InitializeController value,
          $Res Function(_InitializeController) then) =
      __$InitializeControllerCopyWithImpl<$Res>;
  $Res call({AnimationController controller});
}

/// @nodoc
class __$InitializeControllerCopyWithImpl<$Res>
    extends _$AnimationEventCopyWithImpl<$Res>
    implements _$InitializeControllerCopyWith<$Res> {
  __$InitializeControllerCopyWithImpl(
      _InitializeController _value, $Res Function(_InitializeController) _then)
      : super(_value, (v) => _then(v as _InitializeController));

  @override
  _InitializeController get _value => super._value as _InitializeController;

  @override
  $Res call({
    Object? controller = freezed,
  }) {
    return _then(_InitializeController(
      controller: controller == freezed
          ? _value.controller
          : controller // ignore: cast_nullable_to_non_nullable
              as AnimationController,
    ));
  }
}

/// @nodoc

class _$_InitializeController implements _InitializeController {
  const _$_InitializeController({required this.controller});

  @override
  final AnimationController controller;

  @override
  String toString() {
    return 'AnimationEvent.initializeController(controller: $controller)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _InitializeController &&
            const DeepCollectionEquality()
                .equals(other.controller, controller));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(controller));

  @JsonKey(ignore: true)
  @override
  _$InitializeControllerCopyWith<_InitializeController> get copyWith =>
      __$InitializeControllerCopyWithImpl<_InitializeController>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AnimationController controller)
        initializeController,
    required TResult Function(double value) triggerLikeAnimation,
    required TResult Function(double value) resetLikeAnimation,
  }) {
    return initializeController(controller);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(AnimationController controller)? initializeController,
    TResult Function(double value)? triggerLikeAnimation,
    TResult Function(double value)? resetLikeAnimation,
  }) {
    return initializeController?.call(controller);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AnimationController controller)? initializeController,
    TResult Function(double value)? triggerLikeAnimation,
    TResult Function(double value)? resetLikeAnimation,
    required TResult orElse(),
  }) {
    if (initializeController != null) {
      return initializeController(controller);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitializeController value) initializeController,
    required TResult Function(_TriggerLikeAnimation value) triggerLikeAnimation,
    required TResult Function(_ResetLikeAnimation value) resetLikeAnimation,
  }) {
    return initializeController(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_InitializeController value)? initializeController,
    TResult Function(_TriggerLikeAnimation value)? triggerLikeAnimation,
    TResult Function(_ResetLikeAnimation value)? resetLikeAnimation,
  }) {
    return initializeController?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitializeController value)? initializeController,
    TResult Function(_TriggerLikeAnimation value)? triggerLikeAnimation,
    TResult Function(_ResetLikeAnimation value)? resetLikeAnimation,
    required TResult orElse(),
  }) {
    if (initializeController != null) {
      return initializeController(this);
    }
    return orElse();
  }
}

abstract class _InitializeController implements AnimationEvent {
  const factory _InitializeController(
      {required AnimationController controller}) = _$_InitializeController;

  AnimationController get controller;
  @JsonKey(ignore: true)
  _$InitializeControllerCopyWith<_InitializeController> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$TriggerLikeAnimationCopyWith<$Res> {
  factory _$TriggerLikeAnimationCopyWith(_TriggerLikeAnimation value,
          $Res Function(_TriggerLikeAnimation) then) =
      __$TriggerLikeAnimationCopyWithImpl<$Res>;
  $Res call({double value});
}

/// @nodoc
class __$TriggerLikeAnimationCopyWithImpl<$Res>
    extends _$AnimationEventCopyWithImpl<$Res>
    implements _$TriggerLikeAnimationCopyWith<$Res> {
  __$TriggerLikeAnimationCopyWithImpl(
      _TriggerLikeAnimation _value, $Res Function(_TriggerLikeAnimation) _then)
      : super(_value, (v) => _then(v as _TriggerLikeAnimation));

  @override
  _TriggerLikeAnimation get _value => super._value as _TriggerLikeAnimation;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_TriggerLikeAnimation(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$_TriggerLikeAnimation implements _TriggerLikeAnimation {
  const _$_TriggerLikeAnimation({required this.value});

  @override
  final double value;

  @override
  String toString() {
    return 'AnimationEvent.triggerLikeAnimation(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TriggerLikeAnimation &&
            const DeepCollectionEquality().equals(other.value, value));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(value));

  @JsonKey(ignore: true)
  @override
  _$TriggerLikeAnimationCopyWith<_TriggerLikeAnimation> get copyWith =>
      __$TriggerLikeAnimationCopyWithImpl<_TriggerLikeAnimation>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AnimationController controller)
        initializeController,
    required TResult Function(double value) triggerLikeAnimation,
    required TResult Function(double value) resetLikeAnimation,
  }) {
    return triggerLikeAnimation(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(AnimationController controller)? initializeController,
    TResult Function(double value)? triggerLikeAnimation,
    TResult Function(double value)? resetLikeAnimation,
  }) {
    return triggerLikeAnimation?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AnimationController controller)? initializeController,
    TResult Function(double value)? triggerLikeAnimation,
    TResult Function(double value)? resetLikeAnimation,
    required TResult orElse(),
  }) {
    if (triggerLikeAnimation != null) {
      return triggerLikeAnimation(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitializeController value) initializeController,
    required TResult Function(_TriggerLikeAnimation value) triggerLikeAnimation,
    required TResult Function(_ResetLikeAnimation value) resetLikeAnimation,
  }) {
    return triggerLikeAnimation(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_InitializeController value)? initializeController,
    TResult Function(_TriggerLikeAnimation value)? triggerLikeAnimation,
    TResult Function(_ResetLikeAnimation value)? resetLikeAnimation,
  }) {
    return triggerLikeAnimation?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitializeController value)? initializeController,
    TResult Function(_TriggerLikeAnimation value)? triggerLikeAnimation,
    TResult Function(_ResetLikeAnimation value)? resetLikeAnimation,
    required TResult orElse(),
  }) {
    if (triggerLikeAnimation != null) {
      return triggerLikeAnimation(this);
    }
    return orElse();
  }
}

abstract class _TriggerLikeAnimation implements AnimationEvent {
  const factory _TriggerLikeAnimation({required double value}) =
      _$_TriggerLikeAnimation;

  double get value;
  @JsonKey(ignore: true)
  _$TriggerLikeAnimationCopyWith<_TriggerLikeAnimation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$ResetLikeAnimationCopyWith<$Res> {
  factory _$ResetLikeAnimationCopyWith(
          _ResetLikeAnimation value, $Res Function(_ResetLikeAnimation) then) =
      __$ResetLikeAnimationCopyWithImpl<$Res>;
  $Res call({double value});
}

/// @nodoc
class __$ResetLikeAnimationCopyWithImpl<$Res>
    extends _$AnimationEventCopyWithImpl<$Res>
    implements _$ResetLikeAnimationCopyWith<$Res> {
  __$ResetLikeAnimationCopyWithImpl(
      _ResetLikeAnimation _value, $Res Function(_ResetLikeAnimation) _then)
      : super(_value, (v) => _then(v as _ResetLikeAnimation));

  @override
  _ResetLikeAnimation get _value => super._value as _ResetLikeAnimation;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_ResetLikeAnimation(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$_ResetLikeAnimation implements _ResetLikeAnimation {
  const _$_ResetLikeAnimation({required this.value});

  @override
  final double value;

  @override
  String toString() {
    return 'AnimationEvent.resetLikeAnimation(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ResetLikeAnimation &&
            const DeepCollectionEquality().equals(other.value, value));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(value));

  @JsonKey(ignore: true)
  @override
  _$ResetLikeAnimationCopyWith<_ResetLikeAnimation> get copyWith =>
      __$ResetLikeAnimationCopyWithImpl<_ResetLikeAnimation>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AnimationController controller)
        initializeController,
    required TResult Function(double value) triggerLikeAnimation,
    required TResult Function(double value) resetLikeAnimation,
  }) {
    return resetLikeAnimation(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(AnimationController controller)? initializeController,
    TResult Function(double value)? triggerLikeAnimation,
    TResult Function(double value)? resetLikeAnimation,
  }) {
    return resetLikeAnimation?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AnimationController controller)? initializeController,
    TResult Function(double value)? triggerLikeAnimation,
    TResult Function(double value)? resetLikeAnimation,
    required TResult orElse(),
  }) {
    if (resetLikeAnimation != null) {
      return resetLikeAnimation(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitializeController value) initializeController,
    required TResult Function(_TriggerLikeAnimation value) triggerLikeAnimation,
    required TResult Function(_ResetLikeAnimation value) resetLikeAnimation,
  }) {
    return resetLikeAnimation(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_InitializeController value)? initializeController,
    TResult Function(_TriggerLikeAnimation value)? triggerLikeAnimation,
    TResult Function(_ResetLikeAnimation value)? resetLikeAnimation,
  }) {
    return resetLikeAnimation?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitializeController value)? initializeController,
    TResult Function(_TriggerLikeAnimation value)? triggerLikeAnimation,
    TResult Function(_ResetLikeAnimation value)? resetLikeAnimation,
    required TResult orElse(),
  }) {
    if (resetLikeAnimation != null) {
      return resetLikeAnimation(this);
    }
    return orElse();
  }
}

abstract class _ResetLikeAnimation implements AnimationEvent {
  const factory _ResetLikeAnimation({required double value}) =
      _$_ResetLikeAnimation;

  double get value;
  @JsonKey(ignore: true)
  _$ResetLikeAnimationCopyWith<_ResetLikeAnimation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$AnimationStateTearOff {
  const _$AnimationStateTearOff();

  _AnimationState call(
      {double value = 0,
      AnimationController? controller,
      AnimationStatus currentState = AnimationStatus.Idle}) {
    return _AnimationState(
      value: value,
      controller: controller,
      currentState: currentState,
    );
  }
}

/// @nodoc
const $AnimationState = _$AnimationStateTearOff();

/// @nodoc
mixin _$AnimationState {
  double get value => throw _privateConstructorUsedError;
  AnimationController? get controller => throw _privateConstructorUsedError;
  AnimationStatus get currentState => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AnimationStateCopyWith<AnimationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnimationStateCopyWith<$Res> {
  factory $AnimationStateCopyWith(
          AnimationState value, $Res Function(AnimationState) then) =
      _$AnimationStateCopyWithImpl<$Res>;
  $Res call(
      {double value,
      AnimationController? controller,
      AnimationStatus currentState});
}

/// @nodoc
class _$AnimationStateCopyWithImpl<$Res>
    implements $AnimationStateCopyWith<$Res> {
  _$AnimationStateCopyWithImpl(this._value, this._then);

  final AnimationState _value;
  // ignore: unused_field
  final $Res Function(AnimationState) _then;

  @override
  $Res call({
    Object? value = freezed,
    Object? controller = freezed,
    Object? currentState = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
      controller: controller == freezed
          ? _value.controller
          : controller // ignore: cast_nullable_to_non_nullable
              as AnimationController?,
      currentState: currentState == freezed
          ? _value.currentState
          : currentState // ignore: cast_nullable_to_non_nullable
              as AnimationStatus,
    ));
  }
}

/// @nodoc
abstract class _$AnimationStateCopyWith<$Res>
    implements $AnimationStateCopyWith<$Res> {
  factory _$AnimationStateCopyWith(
          _AnimationState value, $Res Function(_AnimationState) then) =
      __$AnimationStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {double value,
      AnimationController? controller,
      AnimationStatus currentState});
}

/// @nodoc
class __$AnimationStateCopyWithImpl<$Res>
    extends _$AnimationStateCopyWithImpl<$Res>
    implements _$AnimationStateCopyWith<$Res> {
  __$AnimationStateCopyWithImpl(
      _AnimationState _value, $Res Function(_AnimationState) _then)
      : super(_value, (v) => _then(v as _AnimationState));

  @override
  _AnimationState get _value => super._value as _AnimationState;

  @override
  $Res call({
    Object? value = freezed,
    Object? controller = freezed,
    Object? currentState = freezed,
  }) {
    return _then(_AnimationState(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
      controller: controller == freezed
          ? _value.controller
          : controller // ignore: cast_nullable_to_non_nullable
              as AnimationController?,
      currentState: currentState == freezed
          ? _value.currentState
          : currentState // ignore: cast_nullable_to_non_nullable
              as AnimationStatus,
    ));
  }
}

/// @nodoc

class _$_AnimationState implements _AnimationState {
  const _$_AnimationState(
      {this.value = 0,
      this.controller,
      this.currentState = AnimationStatus.Idle});

  @JsonKey()
  @override
  final double value;
  @override
  final AnimationController? controller;
  @JsonKey()
  @override
  final AnimationStatus currentState;

  @override
  String toString() {
    return 'AnimationState(value: $value, controller: $controller, currentState: $currentState)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AnimationState &&
            const DeepCollectionEquality().equals(other.value, value) &&
            const DeepCollectionEquality()
                .equals(other.controller, controller) &&
            const DeepCollectionEquality()
                .equals(other.currentState, currentState));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(value),
      const DeepCollectionEquality().hash(controller),
      const DeepCollectionEquality().hash(currentState));

  @JsonKey(ignore: true)
  @override
  _$AnimationStateCopyWith<_AnimationState> get copyWith =>
      __$AnimationStateCopyWithImpl<_AnimationState>(this, _$identity);
}

abstract class _AnimationState implements AnimationState {
  const factory _AnimationState(
      {double value,
      AnimationController? controller,
      AnimationStatus currentState}) = _$_AnimationState;

  @override
  double get value;
  @override
  AnimationController? get controller;
  @override
  AnimationStatus get currentState;
  @override
  @JsonKey(ignore: true)
  _$AnimationStateCopyWith<_AnimationState> get copyWith =>
      throw _privateConstructorUsedError;
}
