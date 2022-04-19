// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'following_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$FollowingEventTearOff {
  const _$FollowingEventTearOff();

  _GetFollowing getFolllowing({required String userId}) {
    return _GetFollowing(
      userId: userId,
    );
  }
}

/// @nodoc
const $FollowingEvent = _$FollowingEventTearOff();

/// @nodoc
mixin _$FollowingEvent {
  String get userId => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) getFolllowing,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String userId)? getFolllowing,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? getFolllowing,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetFollowing value) getFolllowing,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetFollowing value)? getFolllowing,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetFollowing value)? getFolllowing,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FollowingEventCopyWith<FollowingEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FollowingEventCopyWith<$Res> {
  factory $FollowingEventCopyWith(
          FollowingEvent value, $Res Function(FollowingEvent) then) =
      _$FollowingEventCopyWithImpl<$Res>;
  $Res call({String userId});
}

/// @nodoc
class _$FollowingEventCopyWithImpl<$Res>
    implements $FollowingEventCopyWith<$Res> {
  _$FollowingEventCopyWithImpl(this._value, this._then);

  final FollowingEvent _value;
  // ignore: unused_field
  final $Res Function(FollowingEvent) _then;

  @override
  $Res call({
    Object? userId = freezed,
  }) {
    return _then(_value.copyWith(
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$GetFollowingCopyWith<$Res>
    implements $FollowingEventCopyWith<$Res> {
  factory _$GetFollowingCopyWith(
          _GetFollowing value, $Res Function(_GetFollowing) then) =
      __$GetFollowingCopyWithImpl<$Res>;
  @override
  $Res call({String userId});
}

/// @nodoc
class __$GetFollowingCopyWithImpl<$Res>
    extends _$FollowingEventCopyWithImpl<$Res>
    implements _$GetFollowingCopyWith<$Res> {
  __$GetFollowingCopyWithImpl(
      _GetFollowing _value, $Res Function(_GetFollowing) _then)
      : super(_value, (v) => _then(v as _GetFollowing));

  @override
  _GetFollowing get _value => super._value as _GetFollowing;

  @override
  $Res call({
    Object? userId = freezed,
  }) {
    return _then(_GetFollowing(
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_GetFollowing implements _GetFollowing {
  const _$_GetFollowing({required this.userId});

  @override
  final String userId;

  @override
  String toString() {
    return 'FollowingEvent.getFolllowing(userId: $userId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GetFollowing &&
            const DeepCollectionEquality().equals(other.userId, userId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(userId));

  @JsonKey(ignore: true)
  @override
  _$GetFollowingCopyWith<_GetFollowing> get copyWith =>
      __$GetFollowingCopyWithImpl<_GetFollowing>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) getFolllowing,
  }) {
    return getFolllowing(userId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String userId)? getFolllowing,
  }) {
    return getFolllowing?.call(userId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? getFolllowing,
    required TResult orElse(),
  }) {
    if (getFolllowing != null) {
      return getFolllowing(userId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetFollowing value) getFolllowing,
  }) {
    return getFolllowing(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetFollowing value)? getFolllowing,
  }) {
    return getFolllowing?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetFollowing value)? getFolllowing,
    required TResult orElse(),
  }) {
    if (getFolllowing != null) {
      return getFolllowing(this);
    }
    return orElse();
  }
}

abstract class _GetFollowing implements FollowingEvent {
  const factory _GetFollowing({required String userId}) = _$_GetFollowing;

  @override
  String get userId;
  @override
  @JsonKey(ignore: true)
  _$GetFollowingCopyWith<_GetFollowing> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$FollowingStateTearOff {
  const _$FollowingStateTearOff();

  _FollowingState call(
      {String error = '',
      required List<UserEntity> following,
      FollowingStatus currentState = FollowingStatus.Initial}) {
    return _FollowingState(
      error: error,
      following: following,
      currentState: currentState,
    );
  }
}

/// @nodoc
const $FollowingState = _$FollowingStateTearOff();

/// @nodoc
mixin _$FollowingState {
  String get error => throw _privateConstructorUsedError;
  List<UserEntity> get following => throw _privateConstructorUsedError;
  FollowingStatus get currentState => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FollowingStateCopyWith<FollowingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FollowingStateCopyWith<$Res> {
  factory $FollowingStateCopyWith(
          FollowingState value, $Res Function(FollowingState) then) =
      _$FollowingStateCopyWithImpl<$Res>;
  $Res call(
      {String error, List<UserEntity> following, FollowingStatus currentState});
}

/// @nodoc
class _$FollowingStateCopyWithImpl<$Res>
    implements $FollowingStateCopyWith<$Res> {
  _$FollowingStateCopyWithImpl(this._value, this._then);

  final FollowingState _value;
  // ignore: unused_field
  final $Res Function(FollowingState) _then;

  @override
  $Res call({
    Object? error = freezed,
    Object? following = freezed,
    Object? currentState = freezed,
  }) {
    return _then(_value.copyWith(
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
      following: following == freezed
          ? _value.following
          : following // ignore: cast_nullable_to_non_nullable
              as List<UserEntity>,
      currentState: currentState == freezed
          ? _value.currentState
          : currentState // ignore: cast_nullable_to_non_nullable
              as FollowingStatus,
    ));
  }
}

/// @nodoc
abstract class _$FollowingStateCopyWith<$Res>
    implements $FollowingStateCopyWith<$Res> {
  factory _$FollowingStateCopyWith(
          _FollowingState value, $Res Function(_FollowingState) then) =
      __$FollowingStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {String error, List<UserEntity> following, FollowingStatus currentState});
}

/// @nodoc
class __$FollowingStateCopyWithImpl<$Res>
    extends _$FollowingStateCopyWithImpl<$Res>
    implements _$FollowingStateCopyWith<$Res> {
  __$FollowingStateCopyWithImpl(
      _FollowingState _value, $Res Function(_FollowingState) _then)
      : super(_value, (v) => _then(v as _FollowingState));

  @override
  _FollowingState get _value => super._value as _FollowingState;

  @override
  $Res call({
    Object? error = freezed,
    Object? following = freezed,
    Object? currentState = freezed,
  }) {
    return _then(_FollowingState(
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
      following: following == freezed
          ? _value.following
          : following // ignore: cast_nullable_to_non_nullable
              as List<UserEntity>,
      currentState: currentState == freezed
          ? _value.currentState
          : currentState // ignore: cast_nullable_to_non_nullable
              as FollowingStatus,
    ));
  }
}

/// @nodoc

class _$_FollowingState implements _FollowingState {
  const _$_FollowingState(
      {this.error = '',
      required this.following,
      this.currentState = FollowingStatus.Initial});

  @JsonKey()
  @override
  final String error;
  @override
  final List<UserEntity> following;
  @JsonKey()
  @override
  final FollowingStatus currentState;

  @override
  String toString() {
    return 'FollowingState(error: $error, following: $following, currentState: $currentState)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FollowingState &&
            const DeepCollectionEquality().equals(other.error, error) &&
            const DeepCollectionEquality().equals(other.following, following) &&
            const DeepCollectionEquality()
                .equals(other.currentState, currentState));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(error),
      const DeepCollectionEquality().hash(following),
      const DeepCollectionEquality().hash(currentState));

  @JsonKey(ignore: true)
  @override
  _$FollowingStateCopyWith<_FollowingState> get copyWith =>
      __$FollowingStateCopyWithImpl<_FollowingState>(this, _$identity);
}

abstract class _FollowingState implements FollowingState {
  const factory _FollowingState(
      {String error,
      required List<UserEntity> following,
      FollowingStatus currentState}) = _$_FollowingState;

  @override
  String get error;
  @override
  List<UserEntity> get following;
  @override
  FollowingStatus get currentState;
  @override
  @JsonKey(ignore: true)
  _$FollowingStateCopyWith<_FollowingState> get copyWith =>
      throw _privateConstructorUsedError;
}
