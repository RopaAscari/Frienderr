// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'quick_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$QuickEventTearOff {
  const _$QuickEventTearOff();

  _QuicksInitialized initialize() {
    return const _QuicksInitialized();
  }

  _PlaySnapAtIndex playSnapAtIndex({required int index}) {
    return _PlaySnapAtIndex(
      index: index,
    );
  }

  _QuicksChange onSnapChange({required int index}) {
    return _QuicksChange(
      index: index,
    );
  }
}

/// @nodoc
const $QuickEvent = _$QuickEventTearOff();

/// @nodoc
mixin _$QuickEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(int index) playSnapAtIndex,
    required TResult Function(int index) onSnapChange,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(int index)? playSnapAtIndex,
    TResult Function(int index)? onSnapChange,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(int index)? playSnapAtIndex,
    TResult Function(int index)? onSnapChange,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_QuicksInitialized value) initialize,
    required TResult Function(_PlaySnapAtIndex value) playSnapAtIndex,
    required TResult Function(_QuicksChange value) onSnapChange,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_QuicksInitialized value)? initialize,
    TResult Function(_PlaySnapAtIndex value)? playSnapAtIndex,
    TResult Function(_QuicksChange value)? onSnapChange,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_QuicksInitialized value)? initialize,
    TResult Function(_PlaySnapAtIndex value)? playSnapAtIndex,
    TResult Function(_QuicksChange value)? onSnapChange,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuickEventCopyWith<$Res> {
  factory $QuickEventCopyWith(
          QuickEvent value, $Res Function(QuickEvent) then) =
      _$QuickEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$QuickEventCopyWithImpl<$Res> implements $QuickEventCopyWith<$Res> {
  _$QuickEventCopyWithImpl(this._value, this._then);

  final QuickEvent _value;
  // ignore: unused_field
  final $Res Function(QuickEvent) _then;
}

/// @nodoc
abstract class _$QuicksInitializedCopyWith<$Res> {
  factory _$QuicksInitializedCopyWith(
          _QuicksInitialized value, $Res Function(_QuicksInitialized) then) =
      __$QuicksInitializedCopyWithImpl<$Res>;
}

/// @nodoc
class __$QuicksInitializedCopyWithImpl<$Res>
    extends _$QuickEventCopyWithImpl<$Res>
    implements _$QuicksInitializedCopyWith<$Res> {
  __$QuicksInitializedCopyWithImpl(
      _QuicksInitialized _value, $Res Function(_QuicksInitialized) _then)
      : super(_value, (v) => _then(v as _QuicksInitialized));

  @override
  _QuicksInitialized get _value => super._value as _QuicksInitialized;
}

/// @nodoc

class _$_QuicksInitialized implements _QuicksInitialized {
  const _$_QuicksInitialized();

  @override
  String toString() {
    return 'QuickEvent.initialize()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _QuicksInitialized);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(int index) playSnapAtIndex,
    required TResult Function(int index) onSnapChange,
  }) {
    return initialize();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(int index)? playSnapAtIndex,
    TResult Function(int index)? onSnapChange,
  }) {
    return initialize?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(int index)? playSnapAtIndex,
    TResult Function(int index)? onSnapChange,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_QuicksInitialized value) initialize,
    required TResult Function(_PlaySnapAtIndex value) playSnapAtIndex,
    required TResult Function(_QuicksChange value) onSnapChange,
  }) {
    return initialize(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_QuicksInitialized value)? initialize,
    TResult Function(_PlaySnapAtIndex value)? playSnapAtIndex,
    TResult Function(_QuicksChange value)? onSnapChange,
  }) {
    return initialize?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_QuicksInitialized value)? initialize,
    TResult Function(_PlaySnapAtIndex value)? playSnapAtIndex,
    TResult Function(_QuicksChange value)? onSnapChange,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(this);
    }
    return orElse();
  }
}

abstract class _QuicksInitialized implements QuickEvent {
  const factory _QuicksInitialized() = _$_QuicksInitialized;
}

/// @nodoc
abstract class _$PlaySnapAtIndexCopyWith<$Res> {
  factory _$PlaySnapAtIndexCopyWith(
          _PlaySnapAtIndex value, $Res Function(_PlaySnapAtIndex) then) =
      __$PlaySnapAtIndexCopyWithImpl<$Res>;
  $Res call({int index});
}

/// @nodoc
class __$PlaySnapAtIndexCopyWithImpl<$Res>
    extends _$QuickEventCopyWithImpl<$Res>
    implements _$PlaySnapAtIndexCopyWith<$Res> {
  __$PlaySnapAtIndexCopyWithImpl(
      _PlaySnapAtIndex _value, $Res Function(_PlaySnapAtIndex) _then)
      : super(_value, (v) => _then(v as _PlaySnapAtIndex));

  @override
  _PlaySnapAtIndex get _value => super._value as _PlaySnapAtIndex;

  @override
  $Res call({
    Object? index = freezed,
  }) {
    return _then(_PlaySnapAtIndex(
      index: index == freezed
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_PlaySnapAtIndex implements _PlaySnapAtIndex {
  const _$_PlaySnapAtIndex({required this.index});

  @override
  final int index;

  @override
  String toString() {
    return 'QuickEvent.playSnapAtIndex(index: $index)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PlaySnapAtIndex &&
            const DeepCollectionEquality().equals(other.index, index));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(index));

  @JsonKey(ignore: true)
  @override
  _$PlaySnapAtIndexCopyWith<_PlaySnapAtIndex> get copyWith =>
      __$PlaySnapAtIndexCopyWithImpl<_PlaySnapAtIndex>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(int index) playSnapAtIndex,
    required TResult Function(int index) onSnapChange,
  }) {
    return playSnapAtIndex(index);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(int index)? playSnapAtIndex,
    TResult Function(int index)? onSnapChange,
  }) {
    return playSnapAtIndex?.call(index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(int index)? playSnapAtIndex,
    TResult Function(int index)? onSnapChange,
    required TResult orElse(),
  }) {
    if (playSnapAtIndex != null) {
      return playSnapAtIndex(index);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_QuicksInitialized value) initialize,
    required TResult Function(_PlaySnapAtIndex value) playSnapAtIndex,
    required TResult Function(_QuicksChange value) onSnapChange,
  }) {
    return playSnapAtIndex(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_QuicksInitialized value)? initialize,
    TResult Function(_PlaySnapAtIndex value)? playSnapAtIndex,
    TResult Function(_QuicksChange value)? onSnapChange,
  }) {
    return playSnapAtIndex?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_QuicksInitialized value)? initialize,
    TResult Function(_PlaySnapAtIndex value)? playSnapAtIndex,
    TResult Function(_QuicksChange value)? onSnapChange,
    required TResult orElse(),
  }) {
    if (playSnapAtIndex != null) {
      return playSnapAtIndex(this);
    }
    return orElse();
  }
}

abstract class _PlaySnapAtIndex implements QuickEvent {
  const factory _PlaySnapAtIndex({required int index}) = _$_PlaySnapAtIndex;

  int get index;
  @JsonKey(ignore: true)
  _$PlaySnapAtIndexCopyWith<_PlaySnapAtIndex> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$QuicksChangeCopyWith<$Res> {
  factory _$QuicksChangeCopyWith(
          _QuicksChange value, $Res Function(_QuicksChange) then) =
      __$QuicksChangeCopyWithImpl<$Res>;
  $Res call({int index});
}

/// @nodoc
class __$QuicksChangeCopyWithImpl<$Res> extends _$QuickEventCopyWithImpl<$Res>
    implements _$QuicksChangeCopyWith<$Res> {
  __$QuicksChangeCopyWithImpl(
      _QuicksChange _value, $Res Function(_QuicksChange) _then)
      : super(_value, (v) => _then(v as _QuicksChange));

  @override
  _QuicksChange get _value => super._value as _QuicksChange;

  @override
  $Res call({
    Object? index = freezed,
  }) {
    return _then(_QuicksChange(
      index: index == freezed
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_QuicksChange implements _QuicksChange {
  const _$_QuicksChange({required this.index});

  @override
  final int index;

  @override
  String toString() {
    return 'QuickEvent.onSnapChange(index: $index)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _QuicksChange &&
            const DeepCollectionEquality().equals(other.index, index));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(index));

  @JsonKey(ignore: true)
  @override
  _$QuicksChangeCopyWith<_QuicksChange> get copyWith =>
      __$QuicksChangeCopyWithImpl<_QuicksChange>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(int index) playSnapAtIndex,
    required TResult Function(int index) onSnapChange,
  }) {
    return onSnapChange(index);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(int index)? playSnapAtIndex,
    TResult Function(int index)? onSnapChange,
  }) {
    return onSnapChange?.call(index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(int index)? playSnapAtIndex,
    TResult Function(int index)? onSnapChange,
    required TResult orElse(),
  }) {
    if (onSnapChange != null) {
      return onSnapChange(index);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_QuicksInitialized value) initialize,
    required TResult Function(_PlaySnapAtIndex value) playSnapAtIndex,
    required TResult Function(_QuicksChange value) onSnapChange,
  }) {
    return onSnapChange(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_QuicksInitialized value)? initialize,
    TResult Function(_PlaySnapAtIndex value)? playSnapAtIndex,
    TResult Function(_QuicksChange value)? onSnapChange,
  }) {
    return onSnapChange?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_QuicksInitialized value)? initialize,
    TResult Function(_PlaySnapAtIndex value)? playSnapAtIndex,
    TResult Function(_QuicksChange value)? onSnapChange,
    required TResult orElse(),
  }) {
    if (onSnapChange != null) {
      return onSnapChange(this);
    }
    return orElse();
  }
}

abstract class _QuicksChange implements QuickEvent {
  const factory _QuicksChange({required int index}) = _$_QuicksChange;

  int get index;
  @JsonKey(ignore: true)
  _$QuicksChangeCopyWith<_QuicksChange> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$QuickStateTearOff {
  const _$QuickStateTearOff();

  _QuickState call(
      {int focusedIndex = 0,
      List<Quicks> quicks = const [],
      List<VideoPlayerController> controllers = const [],
      QuickStatus currentState = QuickStatus.Initial}) {
    return _QuickState(
      focusedIndex: focusedIndex,
      quicks: quicks,
      controllers: controllers,
      currentState: currentState,
    );
  }
}

/// @nodoc
const $QuickState = _$QuickStateTearOff();

/// @nodoc
mixin _$QuickState {
  int get focusedIndex => throw _privateConstructorUsedError;
  List<Quicks> get quicks => throw _privateConstructorUsedError;
  List<VideoPlayerController> get controllers =>
      throw _privateConstructorUsedError;
  QuickStatus get currentState => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $QuickStateCopyWith<QuickState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuickStateCopyWith<$Res> {
  factory $QuickStateCopyWith(
          QuickState value, $Res Function(QuickState) then) =
      _$QuickStateCopyWithImpl<$Res>;
  $Res call(
      {int focusedIndex,
      List<Quicks> quicks,
      List<VideoPlayerController> controllers,
      QuickStatus currentState});
}

/// @nodoc
class _$QuickStateCopyWithImpl<$Res> implements $QuickStateCopyWith<$Res> {
  _$QuickStateCopyWithImpl(this._value, this._then);

  final QuickState _value;
  // ignore: unused_field
  final $Res Function(QuickState) _then;

  @override
  $Res call({
    Object? focusedIndex = freezed,
    Object? quicks = freezed,
    Object? controllers = freezed,
    Object? currentState = freezed,
  }) {
    return _then(_value.copyWith(
      focusedIndex: focusedIndex == freezed
          ? _value.focusedIndex
          : focusedIndex // ignore: cast_nullable_to_non_nullable
              as int,
      quicks: quicks == freezed
          ? _value.quicks
          : quicks // ignore: cast_nullable_to_non_nullable
              as List<Quicks>,
      controllers: controllers == freezed
          ? _value.controllers
          : controllers // ignore: cast_nullable_to_non_nullable
              as List<VideoPlayerController>,
      currentState: currentState == freezed
          ? _value.currentState
          : currentState // ignore: cast_nullable_to_non_nullable
              as QuickStatus,
    ));
  }
}

/// @nodoc
abstract class _$QuickStateCopyWith<$Res> implements $QuickStateCopyWith<$Res> {
  factory _$QuickStateCopyWith(
          _QuickState value, $Res Function(_QuickState) then) =
      __$QuickStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {int focusedIndex,
      List<Quicks> quicks,
      List<VideoPlayerController> controllers,
      QuickStatus currentState});
}

/// @nodoc
class __$QuickStateCopyWithImpl<$Res> extends _$QuickStateCopyWithImpl<$Res>
    implements _$QuickStateCopyWith<$Res> {
  __$QuickStateCopyWithImpl(
      _QuickState _value, $Res Function(_QuickState) _then)
      : super(_value, (v) => _then(v as _QuickState));

  @override
  _QuickState get _value => super._value as _QuickState;

  @override
  $Res call({
    Object? focusedIndex = freezed,
    Object? quicks = freezed,
    Object? controllers = freezed,
    Object? currentState = freezed,
  }) {
    return _then(_QuickState(
      focusedIndex: focusedIndex == freezed
          ? _value.focusedIndex
          : focusedIndex // ignore: cast_nullable_to_non_nullable
              as int,
      quicks: quicks == freezed
          ? _value.quicks
          : quicks // ignore: cast_nullable_to_non_nullable
              as List<Quicks>,
      controllers: controllers == freezed
          ? _value.controllers
          : controllers // ignore: cast_nullable_to_non_nullable
              as List<VideoPlayerController>,
      currentState: currentState == freezed
          ? _value.currentState
          : currentState // ignore: cast_nullable_to_non_nullable
              as QuickStatus,
    ));
  }
}

/// @nodoc

class _$_QuickState implements _QuickState {
  _$_QuickState(
      {this.focusedIndex = 0,
      this.quicks = const [],
      this.controllers = const [],
      this.currentState = QuickStatus.Initial});

  @JsonKey()
  @override
  final int focusedIndex;
  @JsonKey()
  @override
  final List<Quicks> quicks;
  @JsonKey()
  @override
  final List<VideoPlayerController> controllers;
  @JsonKey()
  @override
  final QuickStatus currentState;

  @override
  String toString() {
    return 'QuickState(focusedIndex: $focusedIndex, quicks: $quicks, controllers: $controllers, currentState: $currentState)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _QuickState &&
            const DeepCollectionEquality()
                .equals(other.focusedIndex, focusedIndex) &&
            const DeepCollectionEquality().equals(other.quicks, quicks) &&
            const DeepCollectionEquality()
                .equals(other.controllers, controllers) &&
            const DeepCollectionEquality()
                .equals(other.currentState, currentState));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(focusedIndex),
      const DeepCollectionEquality().hash(quicks),
      const DeepCollectionEquality().hash(controllers),
      const DeepCollectionEquality().hash(currentState));

  @JsonKey(ignore: true)
  @override
  _$QuickStateCopyWith<_QuickState> get copyWith =>
      __$QuickStateCopyWithImpl<_QuickState>(this, _$identity);
}

abstract class _QuickState implements QuickState {
  factory _QuickState(
      {int focusedIndex,
      List<Quicks> quicks,
      List<VideoPlayerController> controllers,
      QuickStatus currentState}) = _$_QuickState;

  @override
  int get focusedIndex;
  @override
  List<Quicks> get quicks;
  @override
  List<VideoPlayerController> get controllers;
  @override
  QuickStatus get currentState;
  @override
  @JsonKey(ignore: true)
  _$QuickStateCopyWith<_QuickState> get copyWith =>
      throw _privateConstructorUsedError;
}
