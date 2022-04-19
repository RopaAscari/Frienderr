// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'story_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$StoryStateTearOff {
  const _$StoryStateTearOff();

  _StoryState call(
      {String error = '',
      List<StoryEntity> quicks = const [],
      StoryStatus status = StoryStatus.Initial}) {
    return _StoryState(
      error: error,
      quicks: quicks,
      status: status,
    );
  }
}

/// @nodoc
const $StoryState = _$StoryStateTearOff();

/// @nodoc
mixin _$StoryState {
  String get error => throw _privateConstructorUsedError;
  List<StoryEntity> get quicks => throw _privateConstructorUsedError;
  StoryStatus get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StoryStateCopyWith<StoryState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoryStateCopyWith<$Res> {
  factory $StoryStateCopyWith(
          StoryState value, $Res Function(StoryState) then) =
      _$StoryStateCopyWithImpl<$Res>;
  $Res call({String error, List<StoryEntity> quicks, StoryStatus status});
}

/// @nodoc
class _$StoryStateCopyWithImpl<$Res> implements $StoryStateCopyWith<$Res> {
  _$StoryStateCopyWithImpl(this._value, this._then);

  final StoryState _value;
  // ignore: unused_field
  final $Res Function(StoryState) _then;

  @override
  $Res call({
    Object? error = freezed,
    Object? quicks = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
      quicks: quicks == freezed
          ? _value.quicks
          : quicks // ignore: cast_nullable_to_non_nullable
              as List<StoryEntity>,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StoryStatus,
    ));
  }
}

/// @nodoc
abstract class _$StoryStateCopyWith<$Res> implements $StoryStateCopyWith<$Res> {
  factory _$StoryStateCopyWith(
          _StoryState value, $Res Function(_StoryState) then) =
      __$StoryStateCopyWithImpl<$Res>;
  @override
  $Res call({String error, List<StoryEntity> quicks, StoryStatus status});
}

/// @nodoc
class __$StoryStateCopyWithImpl<$Res> extends _$StoryStateCopyWithImpl<$Res>
    implements _$StoryStateCopyWith<$Res> {
  __$StoryStateCopyWithImpl(
      _StoryState _value, $Res Function(_StoryState) _then)
      : super(_value, (v) => _then(v as _StoryState));

  @override
  _StoryState get _value => super._value as _StoryState;

  @override
  $Res call({
    Object? error = freezed,
    Object? quicks = freezed,
    Object? status = freezed,
  }) {
    return _then(_StoryState(
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
      quicks: quicks == freezed
          ? _value.quicks
          : quicks // ignore: cast_nullable_to_non_nullable
              as List<StoryEntity>,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StoryStatus,
    ));
  }
}

/// @nodoc

class _$_StoryState implements _StoryState {
  _$_StoryState(
      {this.error = '',
      this.quicks = const [],
      this.status = StoryStatus.Initial});

  @JsonKey()
  @override
  final String error;
  @JsonKey()
  @override
  final List<StoryEntity> quicks;
  @JsonKey()
  @override
  final StoryStatus status;

  @override
  String toString() {
    return 'StoryState(error: $error, quicks: $quicks, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _StoryState &&
            const DeepCollectionEquality().equals(other.error, error) &&
            const DeepCollectionEquality().equals(other.quicks, quicks) &&
            const DeepCollectionEquality().equals(other.status, status));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(error),
      const DeepCollectionEquality().hash(quicks),
      const DeepCollectionEquality().hash(status));

  @JsonKey(ignore: true)
  @override
  _$StoryStateCopyWith<_StoryState> get copyWith =>
      __$StoryStateCopyWithImpl<_StoryState>(this, _$identity);
}

abstract class _StoryState implements StoryState {
  factory _StoryState(
      {String error,
      List<StoryEntity> quicks,
      StoryStatus status}) = _$_StoryState;

  @override
  String get error;
  @override
  List<StoryEntity> get quicks;
  @override
  StoryStatus get status;
  @override
  @JsonKey(ignore: true)
  _$StoryStateCopyWith<_StoryState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$StoryEventTearOff {
  const _$StoryEventTearOff();

  _LoadStories loadStories() {
    return const _LoadStories();
  }
}

/// @nodoc
const $StoryEvent = _$StoryEventTearOff();

/// @nodoc
mixin _$StoryEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadStories,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loadStories,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadStories,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadStories value) loadStories,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_LoadStories value)? loadStories,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadStories value)? loadStories,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoryEventCopyWith<$Res> {
  factory $StoryEventCopyWith(
          StoryEvent value, $Res Function(StoryEvent) then) =
      _$StoryEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$StoryEventCopyWithImpl<$Res> implements $StoryEventCopyWith<$Res> {
  _$StoryEventCopyWithImpl(this._value, this._then);

  final StoryEvent _value;
  // ignore: unused_field
  final $Res Function(StoryEvent) _then;
}

/// @nodoc
abstract class _$LoadStoriesCopyWith<$Res> {
  factory _$LoadStoriesCopyWith(
          _LoadStories value, $Res Function(_LoadStories) then) =
      __$LoadStoriesCopyWithImpl<$Res>;
}

/// @nodoc
class __$LoadStoriesCopyWithImpl<$Res> extends _$StoryEventCopyWithImpl<$Res>
    implements _$LoadStoriesCopyWith<$Res> {
  __$LoadStoriesCopyWithImpl(
      _LoadStories _value, $Res Function(_LoadStories) _then)
      : super(_value, (v) => _then(v as _LoadStories));

  @override
  _LoadStories get _value => super._value as _LoadStories;
}

/// @nodoc

class _$_LoadStories implements _LoadStories {
  const _$_LoadStories();

  @override
  String toString() {
    return 'StoryEvent.loadStories()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _LoadStories);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadStories,
  }) {
    return loadStories();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loadStories,
  }) {
    return loadStories?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadStories,
    required TResult orElse(),
  }) {
    if (loadStories != null) {
      return loadStories();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadStories value) loadStories,
  }) {
    return loadStories(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_LoadStories value)? loadStories,
  }) {
    return loadStories?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadStories value)? loadStories,
    required TResult orElse(),
  }) {
    if (loadStories != null) {
      return loadStories(this);
    }
    return orElse();
  }
}

abstract class _LoadStories implements StoryEvent {
  const factory _LoadStories() = _$_LoadStories;
}
