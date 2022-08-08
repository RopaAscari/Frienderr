// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$UserStateTearOff {
  const _$UserStateTearOff();

  _UserState call(
      {UserModel user = const UserModel(),
      List<UserDTO> platformUsers = const [],
      UserStatus status = UserStatus.Initial}) {
    return _UserState(
      user: user,
      platformUsers: platformUsers,
      status: status,
    );
  }
}

/// @nodoc
const $UserState = _$UserStateTearOff();

/// @nodoc
mixin _$UserState {
  UserModel get user => throw _privateConstructorUsedError;
  List<UserDTO> get platformUsers => throw _privateConstructorUsedError;
  UserStatus get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserStateCopyWith<UserState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserStateCopyWith<$Res> {
  factory $UserStateCopyWith(UserState value, $Res Function(UserState) then) =
      _$UserStateCopyWithImpl<$Res>;
  $Res call({UserModel user, List<UserDTO> platformUsers, UserStatus status});

  $UserModelCopyWith<$Res> get user;
}

/// @nodoc
class _$UserStateCopyWithImpl<$Res> implements $UserStateCopyWith<$Res> {
  _$UserStateCopyWithImpl(this._value, this._then);

  final UserState _value;
  // ignore: unused_field
  final $Res Function(UserState) _then;

  @override
  $Res call({
    Object? user = freezed,
    Object? platformUsers = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel,
      platformUsers: platformUsers == freezed
          ? _value.platformUsers
          : platformUsers // ignore: cast_nullable_to_non_nullable
              as List<UserDTO>,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as UserStatus,
    ));
  }

  @override
  $UserModelCopyWith<$Res> get user {
    return $UserModelCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc
abstract class _$UserStateCopyWith<$Res> implements $UserStateCopyWith<$Res> {
  factory _$UserStateCopyWith(
          _UserState value, $Res Function(_UserState) then) =
      __$UserStateCopyWithImpl<$Res>;
  @override
  $Res call({UserModel user, List<UserDTO> platformUsers, UserStatus status});

  @override
  $UserModelCopyWith<$Res> get user;
}

/// @nodoc
class __$UserStateCopyWithImpl<$Res> extends _$UserStateCopyWithImpl<$Res>
    implements _$UserStateCopyWith<$Res> {
  __$UserStateCopyWithImpl(_UserState _value, $Res Function(_UserState) _then)
      : super(_value, (v) => _then(v as _UserState));

  @override
  _UserState get _value => super._value as _UserState;

  @override
  $Res call({
    Object? user = freezed,
    Object? platformUsers = freezed,
    Object? status = freezed,
  }) {
    return _then(_UserState(
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel,
      platformUsers: platformUsers == freezed
          ? _value.platformUsers
          : platformUsers // ignore: cast_nullable_to_non_nullable
              as List<UserDTO>,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as UserStatus,
    ));
  }
}

/// @nodoc

class _$_UserState implements _UserState {
  _$_UserState(
      {this.user = const UserModel(),
      this.platformUsers = const [],
      this.status = UserStatus.Initial});

  @JsonKey()
  @override
  final UserModel user;
  @JsonKey()
  @override
  final List<UserDTO> platformUsers;
  @JsonKey()
  @override
  final UserStatus status;

  @override
  String toString() {
    return 'UserState(user: $user, platformUsers: $platformUsers, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserState &&
            const DeepCollectionEquality().equals(other.user, user) &&
            const DeepCollectionEquality()
                .equals(other.platformUsers, platformUsers) &&
            const DeepCollectionEquality().equals(other.status, status));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(user),
      const DeepCollectionEquality().hash(platformUsers),
      const DeepCollectionEquality().hash(status));

  @JsonKey(ignore: true)
  @override
  _$UserStateCopyWith<_UserState> get copyWith =>
      __$UserStateCopyWithImpl<_UserState>(this, _$identity);
}

abstract class _UserState implements UserState {
  factory _UserState(
      {UserModel user,
      List<UserDTO> platformUsers,
      UserStatus status}) = _$_UserState;

  @override
  UserModel get user;
  @override
  List<UserDTO> get platformUsers;
  @override
  UserStatus get status;
  @override
  @JsonKey(ignore: true)
  _$UserStateCopyWith<_UserState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$UserEventTearOff {
  const _$UserEventTearOff();

  _SetUser setUser(UserModel user) {
    return _SetUser(
      user,
    );
  }

  _FetchAppUsers getPlatformUsers() {
    return const _FetchAppUsers();
  }
}

/// @nodoc
const $UserEvent = _$UserEventTearOff();

/// @nodoc
mixin _$UserEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UserModel user) setUser,
    required TResult Function() getPlatformUsers,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(UserModel user)? setUser,
    TResult Function()? getPlatformUsers,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserModel user)? setUser,
    TResult Function()? getPlatformUsers,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SetUser value) setUser,
    required TResult Function(_FetchAppUsers value) getPlatformUsers,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SetUser value)? setUser,
    TResult Function(_FetchAppUsers value)? getPlatformUsers,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SetUser value)? setUser,
    TResult Function(_FetchAppUsers value)? getPlatformUsers,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserEventCopyWith<$Res> {
  factory $UserEventCopyWith(UserEvent value, $Res Function(UserEvent) then) =
      _$UserEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$UserEventCopyWithImpl<$Res> implements $UserEventCopyWith<$Res> {
  _$UserEventCopyWithImpl(this._value, this._then);

  final UserEvent _value;
  // ignore: unused_field
  final $Res Function(UserEvent) _then;
}

/// @nodoc
abstract class _$SetUserCopyWith<$Res> {
  factory _$SetUserCopyWith(_SetUser value, $Res Function(_SetUser) then) =
      __$SetUserCopyWithImpl<$Res>;
  $Res call({UserModel user});

  $UserModelCopyWith<$Res> get user;
}

/// @nodoc
class __$SetUserCopyWithImpl<$Res> extends _$UserEventCopyWithImpl<$Res>
    implements _$SetUserCopyWith<$Res> {
  __$SetUserCopyWithImpl(_SetUser _value, $Res Function(_SetUser) _then)
      : super(_value, (v) => _then(v as _SetUser));

  @override
  _SetUser get _value => super._value as _SetUser;

  @override
  $Res call({
    Object? user = freezed,
  }) {
    return _then(_SetUser(
      user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel,
    ));
  }

  @override
  $UserModelCopyWith<$Res> get user {
    return $UserModelCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc

class _$_SetUser implements _SetUser {
  const _$_SetUser(this.user);

  @override
  final UserModel user;

  @override
  String toString() {
    return 'UserEvent.setUser(user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SetUser &&
            const DeepCollectionEquality().equals(other.user, user));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(user));

  @JsonKey(ignore: true)
  @override
  _$SetUserCopyWith<_SetUser> get copyWith =>
      __$SetUserCopyWithImpl<_SetUser>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UserModel user) setUser,
    required TResult Function() getPlatformUsers,
  }) {
    return setUser(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(UserModel user)? setUser,
    TResult Function()? getPlatformUsers,
  }) {
    return setUser?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserModel user)? setUser,
    TResult Function()? getPlatformUsers,
    required TResult orElse(),
  }) {
    if (setUser != null) {
      return setUser(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SetUser value) setUser,
    required TResult Function(_FetchAppUsers value) getPlatformUsers,
  }) {
    return setUser(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SetUser value)? setUser,
    TResult Function(_FetchAppUsers value)? getPlatformUsers,
  }) {
    return setUser?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SetUser value)? setUser,
    TResult Function(_FetchAppUsers value)? getPlatformUsers,
    required TResult orElse(),
  }) {
    if (setUser != null) {
      return setUser(this);
    }
    return orElse();
  }
}

abstract class _SetUser implements UserEvent {
  const factory _SetUser(UserModel user) = _$_SetUser;

  UserModel get user;
  @JsonKey(ignore: true)
  _$SetUserCopyWith<_SetUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$FetchAppUsersCopyWith<$Res> {
  factory _$FetchAppUsersCopyWith(
          _FetchAppUsers value, $Res Function(_FetchAppUsers) then) =
      __$FetchAppUsersCopyWithImpl<$Res>;
}

/// @nodoc
class __$FetchAppUsersCopyWithImpl<$Res> extends _$UserEventCopyWithImpl<$Res>
    implements _$FetchAppUsersCopyWith<$Res> {
  __$FetchAppUsersCopyWithImpl(
      _FetchAppUsers _value, $Res Function(_FetchAppUsers) _then)
      : super(_value, (v) => _then(v as _FetchAppUsers));

  @override
  _FetchAppUsers get _value => super._value as _FetchAppUsers;
}

/// @nodoc

class _$_FetchAppUsers implements _FetchAppUsers {
  const _$_FetchAppUsers();

  @override
  String toString() {
    return 'UserEvent.getPlatformUsers()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _FetchAppUsers);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UserModel user) setUser,
    required TResult Function() getPlatformUsers,
  }) {
    return getPlatformUsers();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(UserModel user)? setUser,
    TResult Function()? getPlatformUsers,
  }) {
    return getPlatformUsers?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserModel user)? setUser,
    TResult Function()? getPlatformUsers,
    required TResult orElse(),
  }) {
    if (getPlatformUsers != null) {
      return getPlatformUsers();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SetUser value) setUser,
    required TResult Function(_FetchAppUsers value) getPlatformUsers,
  }) {
    return getPlatformUsers(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SetUser value)? setUser,
    TResult Function(_FetchAppUsers value)? getPlatformUsers,
  }) {
    return getPlatformUsers?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SetUser value)? setUser,
    TResult Function(_FetchAppUsers value)? getPlatformUsers,
    required TResult orElse(),
  }) {
    if (getPlatformUsers != null) {
      return getPlatformUsers(this);
    }
    return orElse();
  }
}

abstract class _FetchAppUsers implements UserEvent {
  const factory _FetchAppUsers() = _$_FetchAppUsers;
}
