// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'timeline_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$TimelineEventTearOff {
  const _$TimelineEventTearOff();

  _FetchTimelinePosts fetchTimelinePosts() {
    return const _FetchTimelinePosts();
  }
}

/// @nodoc
const $TimelineEvent = _$TimelineEventTearOff();

/// @nodoc
mixin _$TimelineEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchTimelinePosts,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? fetchTimelinePosts,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchTimelinePosts,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchTimelinePosts value) fetchTimelinePosts,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_FetchTimelinePosts value)? fetchTimelinePosts,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchTimelinePosts value)? fetchTimelinePosts,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimelineEventCopyWith<$Res> {
  factory $TimelineEventCopyWith(
          TimelineEvent value, $Res Function(TimelineEvent) then) =
      _$TimelineEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$TimelineEventCopyWithImpl<$Res>
    implements $TimelineEventCopyWith<$Res> {
  _$TimelineEventCopyWithImpl(this._value, this._then);

  final TimelineEvent _value;
  // ignore: unused_field
  final $Res Function(TimelineEvent) _then;
}

/// @nodoc
abstract class _$FetchTimelinePostsCopyWith<$Res> {
  factory _$FetchTimelinePostsCopyWith(
          _FetchTimelinePosts value, $Res Function(_FetchTimelinePosts) then) =
      __$FetchTimelinePostsCopyWithImpl<$Res>;
}

/// @nodoc
class __$FetchTimelinePostsCopyWithImpl<$Res>
    extends _$TimelineEventCopyWithImpl<$Res>
    implements _$FetchTimelinePostsCopyWith<$Res> {
  __$FetchTimelinePostsCopyWithImpl(
      _FetchTimelinePosts _value, $Res Function(_FetchTimelinePosts) _then)
      : super(_value, (v) => _then(v as _FetchTimelinePosts));

  @override
  _FetchTimelinePosts get _value => super._value as _FetchTimelinePosts;
}

/// @nodoc

class _$_FetchTimelinePosts implements _FetchTimelinePosts {
  const _$_FetchTimelinePosts();

  @override
  String toString() {
    return 'TimelineEvent.fetchTimelinePosts()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _FetchTimelinePosts);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchTimelinePosts,
  }) {
    return fetchTimelinePosts();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? fetchTimelinePosts,
  }) {
    return fetchTimelinePosts?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchTimelinePosts,
    required TResult orElse(),
  }) {
    if (fetchTimelinePosts != null) {
      return fetchTimelinePosts();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchTimelinePosts value) fetchTimelinePosts,
  }) {
    return fetchTimelinePosts(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_FetchTimelinePosts value)? fetchTimelinePosts,
  }) {
    return fetchTimelinePosts?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchTimelinePosts value)? fetchTimelinePosts,
    required TResult orElse(),
  }) {
    if (fetchTimelinePosts != null) {
      return fetchTimelinePosts(this);
    }
    return orElse();
  }
}

abstract class _FetchTimelinePosts implements TimelineEvent {
  const factory _FetchTimelinePosts() = _$_FetchTimelinePosts;
}

/// @nodoc
class _$TimelineStateTearOff {
  const _$TimelineStateTearOff();

  _TimelineState call(
      {String error = '',
      List<Post> timelinePosts = const [],
      TimelineStatus status = TimelineStatus.Idle}) {
    return _TimelineState(
      error: error,
      timelinePosts: timelinePosts,
      status: status,
    );
  }
}

/// @nodoc
const $TimelineState = _$TimelineStateTearOff();

/// @nodoc
mixin _$TimelineState {
  String get error => throw _privateConstructorUsedError;
  List<Post> get timelinePosts => throw _privateConstructorUsedError;
  TimelineStatus get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TimelineStateCopyWith<TimelineState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimelineStateCopyWith<$Res> {
  factory $TimelineStateCopyWith(
          TimelineState value, $Res Function(TimelineState) then) =
      _$TimelineStateCopyWithImpl<$Res>;
  $Res call({String error, List<Post> timelinePosts, TimelineStatus status});
}

/// @nodoc
class _$TimelineStateCopyWithImpl<$Res>
    implements $TimelineStateCopyWith<$Res> {
  _$TimelineStateCopyWithImpl(this._value, this._then);

  final TimelineState _value;
  // ignore: unused_field
  final $Res Function(TimelineState) _then;

  @override
  $Res call({
    Object? error = freezed,
    Object? timelinePosts = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
      timelinePosts: timelinePosts == freezed
          ? _value.timelinePosts
          : timelinePosts // ignore: cast_nullable_to_non_nullable
              as List<Post>,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as TimelineStatus,
    ));
  }
}

/// @nodoc
abstract class _$TimelineStateCopyWith<$Res>
    implements $TimelineStateCopyWith<$Res> {
  factory _$TimelineStateCopyWith(
          _TimelineState value, $Res Function(_TimelineState) then) =
      __$TimelineStateCopyWithImpl<$Res>;
  @override
  $Res call({String error, List<Post> timelinePosts, TimelineStatus status});
}

/// @nodoc
class __$TimelineStateCopyWithImpl<$Res>
    extends _$TimelineStateCopyWithImpl<$Res>
    implements _$TimelineStateCopyWith<$Res> {
  __$TimelineStateCopyWithImpl(
      _TimelineState _value, $Res Function(_TimelineState) _then)
      : super(_value, (v) => _then(v as _TimelineState));

  @override
  _TimelineState get _value => super._value as _TimelineState;

  @override
  $Res call({
    Object? error = freezed,
    Object? timelinePosts = freezed,
    Object? status = freezed,
  }) {
    return _then(_TimelineState(
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
      timelinePosts: timelinePosts == freezed
          ? _value.timelinePosts
          : timelinePosts // ignore: cast_nullable_to_non_nullable
              as List<Post>,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as TimelineStatus,
    ));
  }
}

/// @nodoc

class _$_TimelineState implements _TimelineState {
  _$_TimelineState(
      {this.error = '',
      this.timelinePosts = const [],
      this.status = TimelineStatus.Idle});

  @JsonKey()
  @override
  final String error;
  @JsonKey()
  @override
  final List<Post> timelinePosts;
  @JsonKey()
  @override
  final TimelineStatus status;

  @override
  String toString() {
    return 'TimelineState(error: $error, timelinePosts: $timelinePosts, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TimelineState &&
            const DeepCollectionEquality().equals(other.error, error) &&
            const DeepCollectionEquality()
                .equals(other.timelinePosts, timelinePosts) &&
            const DeepCollectionEquality().equals(other.status, status));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(error),
      const DeepCollectionEquality().hash(timelinePosts),
      const DeepCollectionEquality().hash(status));

  @JsonKey(ignore: true)
  @override
  _$TimelineStateCopyWith<_TimelineState> get copyWith =>
      __$TimelineStateCopyWithImpl<_TimelineState>(this, _$identity);
}

abstract class _TimelineState implements TimelineState {
  factory _TimelineState(
      {String error,
      List<Post> timelinePosts,
      TimelineStatus status}) = _$_TimelineState;

  @override
  String get error;
  @override
  List<Post> get timelinePosts;
  @override
  TimelineStatus get status;
  @override
  @JsonKey(ignore: true)
  _$TimelineStateCopyWith<_TimelineState> get copyWith =>
      throw _privateConstructorUsedError;
}
