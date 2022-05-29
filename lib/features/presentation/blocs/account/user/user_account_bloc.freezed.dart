// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_account_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$UserAccountStateTearOff {
  const _$UserAccountStateTearOff();

  _UserAccountState call(
      {String? error = null,
      Account? account = null,
      UserAccountStatus currentState = UserAccountStatus.idle,
      UserAccountListenableAction action = UserAccountListenableAction.idle}) {
    return _UserAccountState(
      error: error,
      account: account,
      currentState: currentState,
      action: action,
    );
  }
}

/// @nodoc
const $UserAccountState = _$UserAccountStateTearOff();

/// @nodoc
mixin _$UserAccountState {
  String? get error => throw _privateConstructorUsedError;
  Account? get account => throw _privateConstructorUsedError;
  UserAccountStatus get currentState => throw _privateConstructorUsedError;
  UserAccountListenableAction get action => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserAccountStateCopyWith<UserAccountState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserAccountStateCopyWith<$Res> {
  factory $UserAccountStateCopyWith(
          UserAccountState value, $Res Function(UserAccountState) then) =
      _$UserAccountStateCopyWithImpl<$Res>;
  $Res call(
      {String? error,
      Account? account,
      UserAccountStatus currentState,
      UserAccountListenableAction action});
}

/// @nodoc
class _$UserAccountStateCopyWithImpl<$Res>
    implements $UserAccountStateCopyWith<$Res> {
  _$UserAccountStateCopyWithImpl(this._value, this._then);

  final UserAccountState _value;
  // ignore: unused_field
  final $Res Function(UserAccountState) _then;

  @override
  $Res call({
    Object? error = freezed,
    Object? account = freezed,
    Object? currentState = freezed,
    Object? action = freezed,
  }) {
    return _then(_value.copyWith(
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      account: account == freezed
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as Account?,
      currentState: currentState == freezed
          ? _value.currentState
          : currentState // ignore: cast_nullable_to_non_nullable
              as UserAccountStatus,
      action: action == freezed
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as UserAccountListenableAction,
    ));
  }
}

/// @nodoc
abstract class _$UserAccountStateCopyWith<$Res>
    implements $UserAccountStateCopyWith<$Res> {
  factory _$UserAccountStateCopyWith(
          _UserAccountState value, $Res Function(_UserAccountState) then) =
      __$UserAccountStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? error,
      Account? account,
      UserAccountStatus currentState,
      UserAccountListenableAction action});
}

/// @nodoc
class __$UserAccountStateCopyWithImpl<$Res>
    extends _$UserAccountStateCopyWithImpl<$Res>
    implements _$UserAccountStateCopyWith<$Res> {
  __$UserAccountStateCopyWithImpl(
      _UserAccountState _value, $Res Function(_UserAccountState) _then)
      : super(_value, (v) => _then(v as _UserAccountState));

  @override
  _UserAccountState get _value => super._value as _UserAccountState;

  @override
  $Res call({
    Object? error = freezed,
    Object? account = freezed,
    Object? currentState = freezed,
    Object? action = freezed,
  }) {
    return _then(_UserAccountState(
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      account: account == freezed
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as Account?,
      currentState: currentState == freezed
          ? _value.currentState
          : currentState // ignore: cast_nullable_to_non_nullable
              as UserAccountStatus,
      action: action == freezed
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as UserAccountListenableAction,
    ));
  }
}

/// @nodoc

class _$_UserAccountState implements _UserAccountState {
  const _$_UserAccountState(
      {this.error = null,
      this.account = null,
      this.currentState = UserAccountStatus.idle,
      this.action = UserAccountListenableAction.idle});

  @JsonKey()
  @override
  final String? error;
  @JsonKey()
  @override
  final Account? account;
  @JsonKey()
  @override
  final UserAccountStatus currentState;
  @JsonKey()
  @override
  final UserAccountListenableAction action;

  @override
  String toString() {
    return 'UserAccountState(error: $error, account: $account, currentState: $currentState, action: $action)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserAccountState &&
            const DeepCollectionEquality().equals(other.error, error) &&
            const DeepCollectionEquality().equals(other.account, account) &&
            const DeepCollectionEquality()
                .equals(other.currentState, currentState) &&
            const DeepCollectionEquality().equals(other.action, action));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(error),
      const DeepCollectionEquality().hash(account),
      const DeepCollectionEquality().hash(currentState),
      const DeepCollectionEquality().hash(action));

  @JsonKey(ignore: true)
  @override
  _$UserAccountStateCopyWith<_UserAccountState> get copyWith =>
      __$UserAccountStateCopyWithImpl<_UserAccountState>(this, _$identity);
}

abstract class _UserAccountState implements UserAccountState {
  const factory _UserAccountState(
      {String? error,
      Account? account,
      UserAccountStatus currentState,
      UserAccountListenableAction action}) = _$_UserAccountState;

  @override
  String? get error;
  @override
  Account? get account;
  @override
  UserAccountStatus get currentState;
  @override
  UserAccountListenableAction get action;
  @override
  @JsonKey(ignore: true)
  _$UserAccountStateCopyWith<_UserAccountState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$UserAccountEventTearOff {
  const _$UserAccountEventTearOff();

  _GetUserAccount getUserAccount({required String uid}) {
    return _GetUserAccount(
      uid: uid,
    );
  }
}

/// @nodoc
const $UserAccountEvent = _$UserAccountEventTearOff();

/// @nodoc
mixin _$UserAccountEvent {
  String get uid => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String uid) getUserAccount,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String uid)? getUserAccount,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String uid)? getUserAccount,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetUserAccount value) getUserAccount,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetUserAccount value)? getUserAccount,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetUserAccount value)? getUserAccount,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserAccountEventCopyWith<UserAccountEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserAccountEventCopyWith<$Res> {
  factory $UserAccountEventCopyWith(
          UserAccountEvent value, $Res Function(UserAccountEvent) then) =
      _$UserAccountEventCopyWithImpl<$Res>;
  $Res call({String uid});
}

/// @nodoc
class _$UserAccountEventCopyWithImpl<$Res>
    implements $UserAccountEventCopyWith<$Res> {
  _$UserAccountEventCopyWithImpl(this._value, this._then);

  final UserAccountEvent _value;
  // ignore: unused_field
  final $Res Function(UserAccountEvent) _then;

  @override
  $Res call({
    Object? uid = freezed,
  }) {
    return _then(_value.copyWith(
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$GetUserAccountCopyWith<$Res>
    implements $UserAccountEventCopyWith<$Res> {
  factory _$GetUserAccountCopyWith(
          _GetUserAccount value, $Res Function(_GetUserAccount) then) =
      __$GetUserAccountCopyWithImpl<$Res>;
  @override
  $Res call({String uid});
}

/// @nodoc
class __$GetUserAccountCopyWithImpl<$Res>
    extends _$UserAccountEventCopyWithImpl<$Res>
    implements _$GetUserAccountCopyWith<$Res> {
  __$GetUserAccountCopyWithImpl(
      _GetUserAccount _value, $Res Function(_GetUserAccount) _then)
      : super(_value, (v) => _then(v as _GetUserAccount));

  @override
  _GetUserAccount get _value => super._value as _GetUserAccount;

  @override
  $Res call({
    Object? uid = freezed,
  }) {
    return _then(_GetUserAccount(
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_GetUserAccount implements _GetUserAccount {
  const _$_GetUserAccount({required this.uid});

  @override
  final String uid;

  @override
  String toString() {
    return 'UserAccountEvent.getUserAccount(uid: $uid)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GetUserAccount &&
            const DeepCollectionEquality().equals(other.uid, uid));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(uid));

  @JsonKey(ignore: true)
  @override
  _$GetUserAccountCopyWith<_GetUserAccount> get copyWith =>
      __$GetUserAccountCopyWithImpl<_GetUserAccount>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String uid) getUserAccount,
  }) {
    return getUserAccount(uid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String uid)? getUserAccount,
  }) {
    return getUserAccount?.call(uid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String uid)? getUserAccount,
    required TResult orElse(),
  }) {
    if (getUserAccount != null) {
      return getUserAccount(uid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetUserAccount value) getUserAccount,
  }) {
    return getUserAccount(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetUserAccount value)? getUserAccount,
  }) {
    return getUserAccount?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetUserAccount value)? getUserAccount,
    required TResult orElse(),
  }) {
    if (getUserAccount != null) {
      return getUserAccount(this);
    }
    return orElse();
  }
}

abstract class _GetUserAccount implements UserAccountEvent {
  const factory _GetUserAccount({required String uid}) = _$_GetUserAccount;

  @override
  String get uid;
  @override
  @JsonKey(ignore: true)
  _$GetUserAccountCopyWith<_GetUserAccount> get copyWith =>
      throw _privateConstructorUsedError;
}
