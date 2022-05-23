// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'account_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AccountStateTearOff {
  const _$AccountStateTearOff();

  _AccountState call(
      {String? error = null,
      Account? userAccount = null,
      Account? profileAccount = null,
      AccountStatus currentState = AccountStatus.idle,
      AccountListendableAction action = AccountListendableAction.idle}) {
    return _AccountState(
      error: error,
      userAccount: userAccount,
      profileAccount: profileAccount,
      currentState: currentState,
      action: action,
    );
  }
}

/// @nodoc
const $AccountState = _$AccountStateTearOff();

/// @nodoc
mixin _$AccountState {
  String? get error => throw _privateConstructorUsedError;
  Account? get userAccount => throw _privateConstructorUsedError;
  Account? get profileAccount => throw _privateConstructorUsedError;
  AccountStatus get currentState => throw _privateConstructorUsedError;
  AccountListendableAction get action => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AccountStateCopyWith<AccountState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountStateCopyWith<$Res> {
  factory $AccountStateCopyWith(
          AccountState value, $Res Function(AccountState) then) =
      _$AccountStateCopyWithImpl<$Res>;
  $Res call(
      {String? error,
      Account? userAccount,
      Account? profileAccount,
      AccountStatus currentState,
      AccountListendableAction action});
}

/// @nodoc
class _$AccountStateCopyWithImpl<$Res> implements $AccountStateCopyWith<$Res> {
  _$AccountStateCopyWithImpl(this._value, this._then);

  final AccountState _value;
  // ignore: unused_field
  final $Res Function(AccountState) _then;

  @override
  $Res call({
    Object? error = freezed,
    Object? userAccount = freezed,
    Object? profileAccount = freezed,
    Object? currentState = freezed,
    Object? action = freezed,
  }) {
    return _then(_value.copyWith(
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      userAccount: userAccount == freezed
          ? _value.userAccount
          : userAccount // ignore: cast_nullable_to_non_nullable
              as Account?,
      profileAccount: profileAccount == freezed
          ? _value.profileAccount
          : profileAccount // ignore: cast_nullable_to_non_nullable
              as Account?,
      currentState: currentState == freezed
          ? _value.currentState
          : currentState // ignore: cast_nullable_to_non_nullable
              as AccountStatus,
      action: action == freezed
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as AccountListendableAction,
    ));
  }
}

/// @nodoc
abstract class _$AccountStateCopyWith<$Res>
    implements $AccountStateCopyWith<$Res> {
  factory _$AccountStateCopyWith(
          _AccountState value, $Res Function(_AccountState) then) =
      __$AccountStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? error,
      Account? userAccount,
      Account? profileAccount,
      AccountStatus currentState,
      AccountListendableAction action});
}

/// @nodoc
class __$AccountStateCopyWithImpl<$Res> extends _$AccountStateCopyWithImpl<$Res>
    implements _$AccountStateCopyWith<$Res> {
  __$AccountStateCopyWithImpl(
      _AccountState _value, $Res Function(_AccountState) _then)
      : super(_value, (v) => _then(v as _AccountState));

  @override
  _AccountState get _value => super._value as _AccountState;

  @override
  $Res call({
    Object? error = freezed,
    Object? userAccount = freezed,
    Object? profileAccount = freezed,
    Object? currentState = freezed,
    Object? action = freezed,
  }) {
    return _then(_AccountState(
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      userAccount: userAccount == freezed
          ? _value.userAccount
          : userAccount // ignore: cast_nullable_to_non_nullable
              as Account?,
      profileAccount: profileAccount == freezed
          ? _value.profileAccount
          : profileAccount // ignore: cast_nullable_to_non_nullable
              as Account?,
      currentState: currentState == freezed
          ? _value.currentState
          : currentState // ignore: cast_nullable_to_non_nullable
              as AccountStatus,
      action: action == freezed
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as AccountListendableAction,
    ));
  }
}

/// @nodoc

class _$_AccountState implements _AccountState {
  const _$_AccountState(
      {this.error = null,
      this.userAccount = null,
      this.profileAccount = null,
      this.currentState = AccountStatus.idle,
      this.action = AccountListendableAction.idle});

  @JsonKey()
  @override
  final String? error;
  @JsonKey()
  @override
  final Account? userAccount;
  @JsonKey()
  @override
  final Account? profileAccount;
  @JsonKey()
  @override
  final AccountStatus currentState;
  @JsonKey()
  @override
  final AccountListendableAction action;

  @override
  String toString() {
    return 'AccountState(error: $error, userAccount: $userAccount, profileAccount: $profileAccount, currentState: $currentState, action: $action)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AccountState &&
            const DeepCollectionEquality().equals(other.error, error) &&
            const DeepCollectionEquality()
                .equals(other.userAccount, userAccount) &&
            const DeepCollectionEquality()
                .equals(other.profileAccount, profileAccount) &&
            const DeepCollectionEquality()
                .equals(other.currentState, currentState) &&
            const DeepCollectionEquality().equals(other.action, action));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(error),
      const DeepCollectionEquality().hash(userAccount),
      const DeepCollectionEquality().hash(profileAccount),
      const DeepCollectionEquality().hash(currentState),
      const DeepCollectionEquality().hash(action));

  @JsonKey(ignore: true)
  @override
  _$AccountStateCopyWith<_AccountState> get copyWith =>
      __$AccountStateCopyWithImpl<_AccountState>(this, _$identity);
}

abstract class _AccountState implements AccountState {
  const factory _AccountState(
      {String? error,
      Account? userAccount,
      Account? profileAccount,
      AccountStatus currentState,
      AccountListendableAction action}) = _$_AccountState;

  @override
  String? get error;
  @override
  Account? get userAccount;
  @override
  Account? get profileAccount;
  @override
  AccountStatus get currentState;
  @override
  AccountListendableAction get action;
  @override
  @JsonKey(ignore: true)
  _$AccountStateCopyWith<_AccountState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$AccountEventTearOff {
  const _$AccountEventTearOff();

  _GetUserAccount getUserAccount({required String uid}) {
    return _GetUserAccount(
      uid: uid,
    );
  }

  _GetProfileAccount getProfileAccount({required String uid}) {
    return _GetProfileAccount(
      uid: uid,
    );
  }
}

/// @nodoc
const $AccountEvent = _$AccountEventTearOff();

/// @nodoc
mixin _$AccountEvent {
  String get uid => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String uid) getUserAccount,
    required TResult Function(String uid) getProfileAccount,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String uid)? getUserAccount,
    TResult Function(String uid)? getProfileAccount,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String uid)? getUserAccount,
    TResult Function(String uid)? getProfileAccount,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetUserAccount value) getUserAccount,
    required TResult Function(_GetProfileAccount value) getProfileAccount,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetUserAccount value)? getUserAccount,
    TResult Function(_GetProfileAccount value)? getProfileAccount,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetUserAccount value)? getUserAccount,
    TResult Function(_GetProfileAccount value)? getProfileAccount,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AccountEventCopyWith<AccountEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountEventCopyWith<$Res> {
  factory $AccountEventCopyWith(
          AccountEvent value, $Res Function(AccountEvent) then) =
      _$AccountEventCopyWithImpl<$Res>;
  $Res call({String uid});
}

/// @nodoc
class _$AccountEventCopyWithImpl<$Res> implements $AccountEventCopyWith<$Res> {
  _$AccountEventCopyWithImpl(this._value, this._then);

  final AccountEvent _value;
  // ignore: unused_field
  final $Res Function(AccountEvent) _then;

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
    implements $AccountEventCopyWith<$Res> {
  factory _$GetUserAccountCopyWith(
          _GetUserAccount value, $Res Function(_GetUserAccount) then) =
      __$GetUserAccountCopyWithImpl<$Res>;
  @override
  $Res call({String uid});
}

/// @nodoc
class __$GetUserAccountCopyWithImpl<$Res>
    extends _$AccountEventCopyWithImpl<$Res>
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
    return 'AccountEvent.getUserAccount(uid: $uid)';
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
    required TResult Function(String uid) getProfileAccount,
  }) {
    return getUserAccount(uid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String uid)? getUserAccount,
    TResult Function(String uid)? getProfileAccount,
  }) {
    return getUserAccount?.call(uid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String uid)? getUserAccount,
    TResult Function(String uid)? getProfileAccount,
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
    required TResult Function(_GetProfileAccount value) getProfileAccount,
  }) {
    return getUserAccount(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetUserAccount value)? getUserAccount,
    TResult Function(_GetProfileAccount value)? getProfileAccount,
  }) {
    return getUserAccount?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetUserAccount value)? getUserAccount,
    TResult Function(_GetProfileAccount value)? getProfileAccount,
    required TResult orElse(),
  }) {
    if (getUserAccount != null) {
      return getUserAccount(this);
    }
    return orElse();
  }
}

abstract class _GetUserAccount implements AccountEvent {
  const factory _GetUserAccount({required String uid}) = _$_GetUserAccount;

  @override
  String get uid;
  @override
  @JsonKey(ignore: true)
  _$GetUserAccountCopyWith<_GetUserAccount> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$GetProfileAccountCopyWith<$Res>
    implements $AccountEventCopyWith<$Res> {
  factory _$GetProfileAccountCopyWith(
          _GetProfileAccount value, $Res Function(_GetProfileAccount) then) =
      __$GetProfileAccountCopyWithImpl<$Res>;
  @override
  $Res call({String uid});
}

/// @nodoc
class __$GetProfileAccountCopyWithImpl<$Res>
    extends _$AccountEventCopyWithImpl<$Res>
    implements _$GetProfileAccountCopyWith<$Res> {
  __$GetProfileAccountCopyWithImpl(
      _GetProfileAccount _value, $Res Function(_GetProfileAccount) _then)
      : super(_value, (v) => _then(v as _GetProfileAccount));

  @override
  _GetProfileAccount get _value => super._value as _GetProfileAccount;

  @override
  $Res call({
    Object? uid = freezed,
  }) {
    return _then(_GetProfileAccount(
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_GetProfileAccount implements _GetProfileAccount {
  const _$_GetProfileAccount({required this.uid});

  @override
  final String uid;

  @override
  String toString() {
    return 'AccountEvent.getProfileAccount(uid: $uid)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GetProfileAccount &&
            const DeepCollectionEquality().equals(other.uid, uid));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(uid));

  @JsonKey(ignore: true)
  @override
  _$GetProfileAccountCopyWith<_GetProfileAccount> get copyWith =>
      __$GetProfileAccountCopyWithImpl<_GetProfileAccount>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String uid) getUserAccount,
    required TResult Function(String uid) getProfileAccount,
  }) {
    return getProfileAccount(uid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String uid)? getUserAccount,
    TResult Function(String uid)? getProfileAccount,
  }) {
    return getProfileAccount?.call(uid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String uid)? getUserAccount,
    TResult Function(String uid)? getProfileAccount,
    required TResult orElse(),
  }) {
    if (getProfileAccount != null) {
      return getProfileAccount(uid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetUserAccount value) getUserAccount,
    required TResult Function(_GetProfileAccount value) getProfileAccount,
  }) {
    return getProfileAccount(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetUserAccount value)? getUserAccount,
    TResult Function(_GetProfileAccount value)? getProfileAccount,
  }) {
    return getProfileAccount?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetUserAccount value)? getUserAccount,
    TResult Function(_GetProfileAccount value)? getProfileAccount,
    required TResult orElse(),
  }) {
    if (getProfileAccount != null) {
      return getProfileAccount(this);
    }
    return orElse();
  }
}

abstract class _GetProfileAccount implements AccountEvent {
  const factory _GetProfileAccount({required String uid}) =
      _$_GetProfileAccount;

  @override
  String get uid;
  @override
  @JsonKey(ignore: true)
  _$GetProfileAccountCopyWith<_GetProfileAccount> get copyWith =>
      throw _privateConstructorUsedError;
}
