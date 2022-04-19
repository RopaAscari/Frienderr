// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'followers_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$FollowersEventTearOff {
  const _$FollowersEventTearOff();

  _GetFollowers getFolllowers({required String userId}) {
    return _GetFollowers(
      userId: userId,
    );
  }
}

/// @nodoc
const $FollowersEvent = _$FollowersEventTearOff();

/// @nodoc
mixin _$FollowersEvent {
  String get userId => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) getFolllowers,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String userId)? getFolllowers,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? getFolllowers,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetFollowers value) getFolllowers,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetFollowers value)? getFolllowers,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetFollowers value)? getFolllowers,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FollowersEventCopyWith<FollowersEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FollowersEventCopyWith<$Res> {
  factory $FollowersEventCopyWith(
          FollowersEvent value, $Res Function(FollowersEvent) then) =
      _$FollowersEventCopyWithImpl<$Res>;
  $Res call({String userId});
}

/// @nodoc
class _$FollowersEventCopyWithImpl<$Res>
    implements $FollowersEventCopyWith<$Res> {
  _$FollowersEventCopyWithImpl(this._value, this._then);

  final FollowersEvent _value;
  // ignore: unused_field
  final $Res Function(FollowersEvent) _then;

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
abstract class _$GetFollowersCopyWith<$Res>
    implements $FollowersEventCopyWith<$Res> {
  factory _$GetFollowersCopyWith(
          _GetFollowers value, $Res Function(_GetFollowers) then) =
      __$GetFollowersCopyWithImpl<$Res>;
  @override
  $Res call({String userId});
}

/// @nodoc
class __$GetFollowersCopyWithImpl<$Res>
    extends _$FollowersEventCopyWithImpl<$Res>
    implements _$GetFollowersCopyWith<$Res> {
  __$GetFollowersCopyWithImpl(
      _GetFollowers _value, $Res Function(_GetFollowers) _then)
      : super(_value, (v) => _then(v as _GetFollowers));

  @override
  _GetFollowers get _value => super._value as _GetFollowers;

  @override
  $Res call({
    Object? userId = freezed,
  }) {
    return _then(_GetFollowers(
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_GetFollowers implements _GetFollowers {
  const _$_GetFollowers({required this.userId});

  @override
  final String userId;

  @override
  String toString() {
    return 'FollowersEvent.getFolllowers(userId: $userId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GetFollowers &&
            const DeepCollectionEquality().equals(other.userId, userId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(userId));

  @JsonKey(ignore: true)
  @override
  _$GetFollowersCopyWith<_GetFollowers> get copyWith =>
      __$GetFollowersCopyWithImpl<_GetFollowers>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) getFolllowers,
  }) {
    return getFolllowers(userId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String userId)? getFolllowers,
  }) {
    return getFolllowers?.call(userId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? getFolllowers,
    required TResult orElse(),
  }) {
    if (getFolllowers != null) {
      return getFolllowers(userId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetFollowers value) getFolllowers,
  }) {
    return getFolllowers(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetFollowers value)? getFolllowers,
  }) {
    return getFolllowers?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetFollowers value)? getFolllowers,
    required TResult orElse(),
  }) {
    if (getFolllowers != null) {
      return getFolllowers(this);
    }
    return orElse();
  }
}

abstract class _GetFollowers implements FollowersEvent {
  const factory _GetFollowers({required String userId}) = _$_GetFollowers;

  @override
  String get userId;
  @override
  @JsonKey(ignore: true)
  _$GetFollowersCopyWith<_GetFollowers> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$FollowersStateTearOff {
  const _$FollowersStateTearOff();

  _FollowersState call(
      {String error = '',
      required List<UserEntity> followers,
      FollowerStatus currentState = FollowerStatus.Initial}) {
    return _FollowersState(
      error: error,
      followers: followers,
      currentState: currentState,
    );
  }
}

/// @nodoc
const $FollowersState = _$FollowersStateTearOff();

/// @nodoc
mixin _$FollowersState {
  String get error => throw _privateConstructorUsedError;
  List<UserEntity> get followers => throw _privateConstructorUsedError;
  FollowerStatus get currentState => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FollowersStateCopyWith<FollowersState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FollowersStateCopyWith<$Res> {
  factory $FollowersStateCopyWith(
          FollowersState value, $Res Function(FollowersState) then) =
      _$FollowersStateCopyWithImpl<$Res>;
  $Res call(
      {String error, List<UserEntity> followers, FollowerStatus currentState});
}

/// @nodoc
class _$FollowersStateCopyWithImpl<$Res>
    implements $FollowersStateCopyWith<$Res> {
  _$FollowersStateCopyWithImpl(this._value, this._then);

  final FollowersState _value;
  // ignore: unused_field
  final $Res Function(FollowersState) _then;

  @override
  $Res call({
    Object? error = freezed,
    Object? followers = freezed,
    Object? currentState = freezed,
  }) {
    return _then(_value.copyWith(
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
      followers: followers == freezed
          ? _value.followers
          : followers // ignore: cast_nullable_to_non_nullable
              as List<UserEntity>,
      currentState: currentState == freezed
          ? _value.currentState
          : currentState // ignore: cast_nullable_to_non_nullable
              as FollowerStatus,
    ));
  }
}

/// @nodoc
abstract class _$FollowersStateCopyWith<$Res>
    implements $FollowersStateCopyWith<$Res> {
  factory _$FollowersStateCopyWith(
          _FollowersState value, $Res Function(_FollowersState) then) =
      __$FollowersStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {String error, List<UserEntity> followers, FollowerStatus currentState});
}

/// @nodoc
class __$FollowersStateCopyWithImpl<$Res>
    extends _$FollowersStateCopyWithImpl<$Res>
    implements _$FollowersStateCopyWith<$Res> {
  __$FollowersStateCopyWithImpl(
      _FollowersState _value, $Res Function(_FollowersState) _then)
      : super(_value, (v) => _then(v as _FollowersState));

  @override
  _FollowersState get _value => super._value as _FollowersState;

  @override
  $Res call({
    Object? error = freezed,
    Object? followers = freezed,
    Object? currentState = freezed,
  }) {
    return _then(_FollowersState(
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
      followers: followers == freezed
          ? _value.followers
          : followers // ignore: cast_nullable_to_non_nullable
              as List<UserEntity>,
      currentState: currentState == freezed
          ? _value.currentState
          : currentState // ignore: cast_nullable_to_non_nullable
              as FollowerStatus,
    ));
  }
}

/// @nodoc

class _$_FollowersState implements _FollowersState {
  const _$_FollowersState(
      {this.error = '',
      required this.followers,
      this.currentState = FollowerStatus.Initial});

  @JsonKey()
  @override
  final String error;
  @override
  final List<UserEntity> followers;
  @JsonKey()
  @override
  final FollowerStatus currentState;

  @override
  String toString() {
    return 'FollowersState(error: $error, followers: $followers, currentState: $currentState)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FollowersState &&
            const DeepCollectionEquality().equals(other.error, error) &&
            const DeepCollectionEquality().equals(other.followers, followers) &&
            const DeepCollectionEquality()
                .equals(other.currentState, currentState));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(error),
      const DeepCollectionEquality().hash(followers),
      const DeepCollectionEquality().hash(currentState));

  @JsonKey(ignore: true)
  @override
  _$FollowersStateCopyWith<_FollowersState> get copyWith =>
      __$FollowersStateCopyWithImpl<_FollowersState>(this, _$identity);
}

abstract class _FollowersState implements FollowersState {
  const factory _FollowersState(
      {String error,
      required List<UserEntity> followers,
      FollowerStatus currentState}) = _$_FollowersState;

  @override
  String get error;
  @override
  List<UserEntity> get followers;
  @override
  FollowerStatus get currentState;
  @override
  @JsonKey(ignore: true)
  _$FollowersStateCopyWith<_FollowersState> get copyWith =>
      throw _privateConstructorUsedError;
}
