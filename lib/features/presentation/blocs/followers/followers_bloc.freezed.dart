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

  _FollowUser followUser({required String uid, required String fid}) {
    return _FollowUser(
      uid: uid,
      fid: fid,
    );
  }

  _UnFollowUser unfollowUser({required String uid, required String fid}) {
    return _UnFollowUser(
      uid: uid,
      fid: fid,
    );
  }

  _Reset reset() {
    return const _Reset();
  }
}

/// @nodoc
const $FollowersEvent = _$FollowersEventTearOff();

/// @nodoc
mixin _$FollowersEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) getFolllowers,
    required TResult Function(String uid, String fid) followUser,
    required TResult Function(String uid, String fid) unfollowUser,
    required TResult Function() reset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String userId)? getFolllowers,
    TResult Function(String uid, String fid)? followUser,
    TResult Function(String uid, String fid)? unfollowUser,
    TResult Function()? reset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? getFolllowers,
    TResult Function(String uid, String fid)? followUser,
    TResult Function(String uid, String fid)? unfollowUser,
    TResult Function()? reset,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetFollowers value) getFolllowers,
    required TResult Function(_FollowUser value) followUser,
    required TResult Function(_UnFollowUser value) unfollowUser,
    required TResult Function(_Reset value) reset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetFollowers value)? getFolllowers,
    TResult Function(_FollowUser value)? followUser,
    TResult Function(_UnFollowUser value)? unfollowUser,
    TResult Function(_Reset value)? reset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetFollowers value)? getFolllowers,
    TResult Function(_FollowUser value)? followUser,
    TResult Function(_UnFollowUser value)? unfollowUser,
    TResult Function(_Reset value)? reset,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FollowersEventCopyWith<$Res> {
  factory $FollowersEventCopyWith(
          FollowersEvent value, $Res Function(FollowersEvent) then) =
      _$FollowersEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$FollowersEventCopyWithImpl<$Res>
    implements $FollowersEventCopyWith<$Res> {
  _$FollowersEventCopyWithImpl(this._value, this._then);

  final FollowersEvent _value;
  // ignore: unused_field
  final $Res Function(FollowersEvent) _then;
}

/// @nodoc
abstract class _$GetFollowersCopyWith<$Res> {
  factory _$GetFollowersCopyWith(
          _GetFollowers value, $Res Function(_GetFollowers) then) =
      __$GetFollowersCopyWithImpl<$Res>;
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
    required TResult Function(String uid, String fid) followUser,
    required TResult Function(String uid, String fid) unfollowUser,
    required TResult Function() reset,
  }) {
    return getFolllowers(userId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String userId)? getFolllowers,
    TResult Function(String uid, String fid)? followUser,
    TResult Function(String uid, String fid)? unfollowUser,
    TResult Function()? reset,
  }) {
    return getFolllowers?.call(userId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? getFolllowers,
    TResult Function(String uid, String fid)? followUser,
    TResult Function(String uid, String fid)? unfollowUser,
    TResult Function()? reset,
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
    required TResult Function(_FollowUser value) followUser,
    required TResult Function(_UnFollowUser value) unfollowUser,
    required TResult Function(_Reset value) reset,
  }) {
    return getFolllowers(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetFollowers value)? getFolllowers,
    TResult Function(_FollowUser value)? followUser,
    TResult Function(_UnFollowUser value)? unfollowUser,
    TResult Function(_Reset value)? reset,
  }) {
    return getFolllowers?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetFollowers value)? getFolllowers,
    TResult Function(_FollowUser value)? followUser,
    TResult Function(_UnFollowUser value)? unfollowUser,
    TResult Function(_Reset value)? reset,
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

  String get userId;
  @JsonKey(ignore: true)
  _$GetFollowersCopyWith<_GetFollowers> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$FollowUserCopyWith<$Res> {
  factory _$FollowUserCopyWith(
          _FollowUser value, $Res Function(_FollowUser) then) =
      __$FollowUserCopyWithImpl<$Res>;
  $Res call({String uid, String fid});
}

/// @nodoc
class __$FollowUserCopyWithImpl<$Res> extends _$FollowersEventCopyWithImpl<$Res>
    implements _$FollowUserCopyWith<$Res> {
  __$FollowUserCopyWithImpl(
      _FollowUser _value, $Res Function(_FollowUser) _then)
      : super(_value, (v) => _then(v as _FollowUser));

  @override
  _FollowUser get _value => super._value as _FollowUser;

  @override
  $Res call({
    Object? uid = freezed,
    Object? fid = freezed,
  }) {
    return _then(_FollowUser(
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      fid: fid == freezed
          ? _value.fid
          : fid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_FollowUser implements _FollowUser {
  const _$_FollowUser({required this.uid, required this.fid});

  @override
  final String uid;
  @override
  final String fid;

  @override
  String toString() {
    return 'FollowersEvent.followUser(uid: $uid, fid: $fid)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FollowUser &&
            const DeepCollectionEquality().equals(other.uid, uid) &&
            const DeepCollectionEquality().equals(other.fid, fid));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(uid),
      const DeepCollectionEquality().hash(fid));

  @JsonKey(ignore: true)
  @override
  _$FollowUserCopyWith<_FollowUser> get copyWith =>
      __$FollowUserCopyWithImpl<_FollowUser>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) getFolllowers,
    required TResult Function(String uid, String fid) followUser,
    required TResult Function(String uid, String fid) unfollowUser,
    required TResult Function() reset,
  }) {
    return followUser(uid, fid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String userId)? getFolllowers,
    TResult Function(String uid, String fid)? followUser,
    TResult Function(String uid, String fid)? unfollowUser,
    TResult Function()? reset,
  }) {
    return followUser?.call(uid, fid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? getFolllowers,
    TResult Function(String uid, String fid)? followUser,
    TResult Function(String uid, String fid)? unfollowUser,
    TResult Function()? reset,
    required TResult orElse(),
  }) {
    if (followUser != null) {
      return followUser(uid, fid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetFollowers value) getFolllowers,
    required TResult Function(_FollowUser value) followUser,
    required TResult Function(_UnFollowUser value) unfollowUser,
    required TResult Function(_Reset value) reset,
  }) {
    return followUser(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetFollowers value)? getFolllowers,
    TResult Function(_FollowUser value)? followUser,
    TResult Function(_UnFollowUser value)? unfollowUser,
    TResult Function(_Reset value)? reset,
  }) {
    return followUser?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetFollowers value)? getFolllowers,
    TResult Function(_FollowUser value)? followUser,
    TResult Function(_UnFollowUser value)? unfollowUser,
    TResult Function(_Reset value)? reset,
    required TResult orElse(),
  }) {
    if (followUser != null) {
      return followUser(this);
    }
    return orElse();
  }
}

abstract class _FollowUser implements FollowersEvent {
  const factory _FollowUser({required String uid, required String fid}) =
      _$_FollowUser;

  String get uid;
  String get fid;
  @JsonKey(ignore: true)
  _$FollowUserCopyWith<_FollowUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$UnFollowUserCopyWith<$Res> {
  factory _$UnFollowUserCopyWith(
          _UnFollowUser value, $Res Function(_UnFollowUser) then) =
      __$UnFollowUserCopyWithImpl<$Res>;
  $Res call({String uid, String fid});
}

/// @nodoc
class __$UnFollowUserCopyWithImpl<$Res>
    extends _$FollowersEventCopyWithImpl<$Res>
    implements _$UnFollowUserCopyWith<$Res> {
  __$UnFollowUserCopyWithImpl(
      _UnFollowUser _value, $Res Function(_UnFollowUser) _then)
      : super(_value, (v) => _then(v as _UnFollowUser));

  @override
  _UnFollowUser get _value => super._value as _UnFollowUser;

  @override
  $Res call({
    Object? uid = freezed,
    Object? fid = freezed,
  }) {
    return _then(_UnFollowUser(
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      fid: fid == freezed
          ? _value.fid
          : fid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_UnFollowUser implements _UnFollowUser {
  const _$_UnFollowUser({required this.uid, required this.fid});

  @override
  final String uid;
  @override
  final String fid;

  @override
  String toString() {
    return 'FollowersEvent.unfollowUser(uid: $uid, fid: $fid)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UnFollowUser &&
            const DeepCollectionEquality().equals(other.uid, uid) &&
            const DeepCollectionEquality().equals(other.fid, fid));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(uid),
      const DeepCollectionEquality().hash(fid));

  @JsonKey(ignore: true)
  @override
  _$UnFollowUserCopyWith<_UnFollowUser> get copyWith =>
      __$UnFollowUserCopyWithImpl<_UnFollowUser>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) getFolllowers,
    required TResult Function(String uid, String fid) followUser,
    required TResult Function(String uid, String fid) unfollowUser,
    required TResult Function() reset,
  }) {
    return unfollowUser(uid, fid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String userId)? getFolllowers,
    TResult Function(String uid, String fid)? followUser,
    TResult Function(String uid, String fid)? unfollowUser,
    TResult Function()? reset,
  }) {
    return unfollowUser?.call(uid, fid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? getFolllowers,
    TResult Function(String uid, String fid)? followUser,
    TResult Function(String uid, String fid)? unfollowUser,
    TResult Function()? reset,
    required TResult orElse(),
  }) {
    if (unfollowUser != null) {
      return unfollowUser(uid, fid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetFollowers value) getFolllowers,
    required TResult Function(_FollowUser value) followUser,
    required TResult Function(_UnFollowUser value) unfollowUser,
    required TResult Function(_Reset value) reset,
  }) {
    return unfollowUser(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetFollowers value)? getFolllowers,
    TResult Function(_FollowUser value)? followUser,
    TResult Function(_UnFollowUser value)? unfollowUser,
    TResult Function(_Reset value)? reset,
  }) {
    return unfollowUser?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetFollowers value)? getFolllowers,
    TResult Function(_FollowUser value)? followUser,
    TResult Function(_UnFollowUser value)? unfollowUser,
    TResult Function(_Reset value)? reset,
    required TResult orElse(),
  }) {
    if (unfollowUser != null) {
      return unfollowUser(this);
    }
    return orElse();
  }
}

abstract class _UnFollowUser implements FollowersEvent {
  const factory _UnFollowUser({required String uid, required String fid}) =
      _$_UnFollowUser;

  String get uid;
  String get fid;
  @JsonKey(ignore: true)
  _$UnFollowUserCopyWith<_UnFollowUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$ResetCopyWith<$Res> {
  factory _$ResetCopyWith(_Reset value, $Res Function(_Reset) then) =
      __$ResetCopyWithImpl<$Res>;
}

/// @nodoc
class __$ResetCopyWithImpl<$Res> extends _$FollowersEventCopyWithImpl<$Res>
    implements _$ResetCopyWith<$Res> {
  __$ResetCopyWithImpl(_Reset _value, $Res Function(_Reset) _then)
      : super(_value, (v) => _then(v as _Reset));

  @override
  _Reset get _value => super._value as _Reset;
}

/// @nodoc

class _$_Reset implements _Reset {
  const _$_Reset();

  @override
  String toString() {
    return 'FollowersEvent.reset()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Reset);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) getFolllowers,
    required TResult Function(String uid, String fid) followUser,
    required TResult Function(String uid, String fid) unfollowUser,
    required TResult Function() reset,
  }) {
    return reset();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String userId)? getFolllowers,
    TResult Function(String uid, String fid)? followUser,
    TResult Function(String uid, String fid)? unfollowUser,
    TResult Function()? reset,
  }) {
    return reset?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? getFolllowers,
    TResult Function(String uid, String fid)? followUser,
    TResult Function(String uid, String fid)? unfollowUser,
    TResult Function()? reset,
    required TResult orElse(),
  }) {
    if (reset != null) {
      return reset();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetFollowers value) getFolllowers,
    required TResult Function(_FollowUser value) followUser,
    required TResult Function(_UnFollowUser value) unfollowUser,
    required TResult Function(_Reset value) reset,
  }) {
    return reset(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetFollowers value)? getFolllowers,
    TResult Function(_FollowUser value)? followUser,
    TResult Function(_UnFollowUser value)? unfollowUser,
    TResult Function(_Reset value)? reset,
  }) {
    return reset?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetFollowers value)? getFolllowers,
    TResult Function(_FollowUser value)? followUser,
    TResult Function(_UnFollowUser value)? unfollowUser,
    TResult Function(_Reset value)? reset,
    required TResult orElse(),
  }) {
    if (reset != null) {
      return reset(this);
    }
    return orElse();
  }
}

abstract class _Reset implements FollowersEvent {
  const factory _Reset() = _$_Reset;
}

/// @nodoc
class _$FollowersStateTearOff {
  const _$FollowersStateTearOff();

  _FollowersState call(
      {String error = '',
      required List<UserEntity> followers,
      FollowerStatus currentState = FollowerStatus.intial,
      FollowerListenableAction action = FollowerListenableAction.idle}) {
    return _FollowersState(
      error: error,
      followers: followers,
      currentState: currentState,
      action: action,
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
  FollowerListenableAction get action => throw _privateConstructorUsedError;

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
      {String error,
      List<UserEntity> followers,
      FollowerStatus currentState,
      FollowerListenableAction action});
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
    Object? action = freezed,
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
      action: action == freezed
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as FollowerListenableAction,
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
      {String error,
      List<UserEntity> followers,
      FollowerStatus currentState,
      FollowerListenableAction action});
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
    Object? action = freezed,
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
      action: action == freezed
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as FollowerListenableAction,
    ));
  }
}

/// @nodoc

class _$_FollowersState implements _FollowersState {
  const _$_FollowersState(
      {this.error = '',
      required this.followers,
      this.currentState = FollowerStatus.intial,
      this.action = FollowerListenableAction.idle});

  @JsonKey()
  @override
  final String error;
  @override
  final List<UserEntity> followers;
  @JsonKey()
  @override
  final FollowerStatus currentState;
  @JsonKey()
  @override
  final FollowerListenableAction action;

  @override
  String toString() {
    return 'FollowersState(error: $error, followers: $followers, currentState: $currentState, action: $action)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FollowersState &&
            const DeepCollectionEquality().equals(other.error, error) &&
            const DeepCollectionEquality().equals(other.followers, followers) &&
            const DeepCollectionEquality()
                .equals(other.currentState, currentState) &&
            const DeepCollectionEquality().equals(other.action, action));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(error),
      const DeepCollectionEquality().hash(followers),
      const DeepCollectionEquality().hash(currentState),
      const DeepCollectionEquality().hash(action));

  @JsonKey(ignore: true)
  @override
  _$FollowersStateCopyWith<_FollowersState> get copyWith =>
      __$FollowersStateCopyWithImpl<_FollowersState>(this, _$identity);
}

abstract class _FollowersState implements FollowersState {
  const factory _FollowersState(
      {String error,
      required List<UserEntity> followers,
      FollowerStatus currentState,
      FollowerListenableAction action}) = _$_FollowersState;

  @override
  String get error;
  @override
  List<UserEntity> get followers;
  @override
  FollowerStatus get currentState;
  @override
  FollowerListenableAction get action;
  @override
  @JsonKey(ignore: true)
  _$FollowersStateCopyWith<_FollowersState> get copyWith =>
      throw _privateConstructorUsedError;
}
