// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'profile_account_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ProfileAccountStateTearOff {
  const _$ProfileAccountStateTearOff();

  _ProfileAccountState call(
      {String? error = null,
      Account? account = null,
      ProfileAccountStatus currentState = ProfileAccountStatus.idle,
      ProfileAccountListenableAction action =
          ProfileAccountListenableAction.idle}) {
    return _ProfileAccountState(
      error: error,
      account: account,
      currentState: currentState,
      action: action,
    );
  }
}

/// @nodoc
const $ProfileAccountState = _$ProfileAccountStateTearOff();

/// @nodoc
mixin _$ProfileAccountState {
  String? get error => throw _privateConstructorUsedError;
  Account? get account => throw _privateConstructorUsedError;
  ProfileAccountStatus get currentState => throw _privateConstructorUsedError;
  ProfileAccountListenableAction get action =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProfileAccountStateCopyWith<ProfileAccountState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileAccountStateCopyWith<$Res> {
  factory $ProfileAccountStateCopyWith(
          ProfileAccountState value, $Res Function(ProfileAccountState) then) =
      _$ProfileAccountStateCopyWithImpl<$Res>;
  $Res call(
      {String? error,
      Account? account,
      ProfileAccountStatus currentState,
      ProfileAccountListenableAction action});
}

/// @nodoc
class _$ProfileAccountStateCopyWithImpl<$Res>
    implements $ProfileAccountStateCopyWith<$Res> {
  _$ProfileAccountStateCopyWithImpl(this._value, this._then);

  final ProfileAccountState _value;
  // ignore: unused_field
  final $Res Function(ProfileAccountState) _then;

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
              as ProfileAccountStatus,
      action: action == freezed
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as ProfileAccountListenableAction,
    ));
  }
}

/// @nodoc
abstract class _$ProfileAccountStateCopyWith<$Res>
    implements $ProfileAccountStateCopyWith<$Res> {
  factory _$ProfileAccountStateCopyWith(_ProfileAccountState value,
          $Res Function(_ProfileAccountState) then) =
      __$ProfileAccountStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? error,
      Account? account,
      ProfileAccountStatus currentState,
      ProfileAccountListenableAction action});
}

/// @nodoc
class __$ProfileAccountStateCopyWithImpl<$Res>
    extends _$ProfileAccountStateCopyWithImpl<$Res>
    implements _$ProfileAccountStateCopyWith<$Res> {
  __$ProfileAccountStateCopyWithImpl(
      _ProfileAccountState _value, $Res Function(_ProfileAccountState) _then)
      : super(_value, (v) => _then(v as _ProfileAccountState));

  @override
  _ProfileAccountState get _value => super._value as _ProfileAccountState;

  @override
  $Res call({
    Object? error = freezed,
    Object? account = freezed,
    Object? currentState = freezed,
    Object? action = freezed,
  }) {
    return _then(_ProfileAccountState(
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
              as ProfileAccountStatus,
      action: action == freezed
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as ProfileAccountListenableAction,
    ));
  }
}

/// @nodoc

class _$_ProfileAccountState implements _ProfileAccountState {
  const _$_ProfileAccountState(
      {this.error = null,
      this.account = null,
      this.currentState = ProfileAccountStatus.idle,
      this.action = ProfileAccountListenableAction.idle});

  @JsonKey()
  @override
  final String? error;
  @JsonKey()
  @override
  final Account? account;
  @JsonKey()
  @override
  final ProfileAccountStatus currentState;
  @JsonKey()
  @override
  final ProfileAccountListenableAction action;

  @override
  String toString() {
    return 'ProfileAccountState(error: $error, account: $account, currentState: $currentState, action: $action)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProfileAccountState &&
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
  _$ProfileAccountStateCopyWith<_ProfileAccountState> get copyWith =>
      __$ProfileAccountStateCopyWithImpl<_ProfileAccountState>(
          this, _$identity);
}

abstract class _ProfileAccountState implements ProfileAccountState {
  const factory _ProfileAccountState(
      {String? error,
      Account? account,
      ProfileAccountStatus currentState,
      ProfileAccountListenableAction action}) = _$_ProfileAccountState;

  @override
  String? get error;
  @override
  Account? get account;
  @override
  ProfileAccountStatus get currentState;
  @override
  ProfileAccountListenableAction get action;
  @override
  @JsonKey(ignore: true)
  _$ProfileAccountStateCopyWith<_ProfileAccountState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$ProfileAccountEventTearOff {
  const _$ProfileAccountEventTearOff();

  _GetProfileAccount getUserAccount({required String uid}) {
    return _GetProfileAccount(
      uid: uid,
    );
  }

  _ProfileAccountEvent getProfileAccount({required String uid}) {
    return _ProfileAccountEvent(
      uid: uid,
    );
  }
}

/// @nodoc
const $ProfileAccountEvent = _$ProfileAccountEventTearOff();

/// @nodoc
mixin _$ProfileAccountEvent {
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
    required TResult Function(_GetProfileAccount value) getUserAccount,
    required TResult Function(_ProfileAccountEvent value) getProfileAccount,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetProfileAccount value)? getUserAccount,
    TResult Function(_ProfileAccountEvent value)? getProfileAccount,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetProfileAccount value)? getUserAccount,
    TResult Function(_ProfileAccountEvent value)? getProfileAccount,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProfileAccountEventCopyWith<ProfileAccountEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileAccountEventCopyWith<$Res> {
  factory $ProfileAccountEventCopyWith(
          ProfileAccountEvent value, $Res Function(ProfileAccountEvent) then) =
      _$ProfileAccountEventCopyWithImpl<$Res>;
  $Res call({String uid});
}

/// @nodoc
class _$ProfileAccountEventCopyWithImpl<$Res>
    implements $ProfileAccountEventCopyWith<$Res> {
  _$ProfileAccountEventCopyWithImpl(this._value, this._then);

  final ProfileAccountEvent _value;
  // ignore: unused_field
  final $Res Function(ProfileAccountEvent) _then;

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
abstract class _$GetProfileAccountCopyWith<$Res>
    implements $ProfileAccountEventCopyWith<$Res> {
  factory _$GetProfileAccountCopyWith(
          _GetProfileAccount value, $Res Function(_GetProfileAccount) then) =
      __$GetProfileAccountCopyWithImpl<$Res>;
  @override
  $Res call({String uid});
}

/// @nodoc
class __$GetProfileAccountCopyWithImpl<$Res>
    extends _$ProfileAccountEventCopyWithImpl<$Res>
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
    return 'ProfileAccountEvent.getUserAccount(uid: $uid)';
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
    required TResult Function(_GetProfileAccount value) getUserAccount,
    required TResult Function(_ProfileAccountEvent value) getProfileAccount,
  }) {
    return getUserAccount(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetProfileAccount value)? getUserAccount,
    TResult Function(_ProfileAccountEvent value)? getProfileAccount,
  }) {
    return getUserAccount?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetProfileAccount value)? getUserAccount,
    TResult Function(_ProfileAccountEvent value)? getProfileAccount,
    required TResult orElse(),
  }) {
    if (getUserAccount != null) {
      return getUserAccount(this);
    }
    return orElse();
  }
}

abstract class _GetProfileAccount implements ProfileAccountEvent {
  const factory _GetProfileAccount({required String uid}) =
      _$_GetProfileAccount;

  @override
  String get uid;
  @override
  @JsonKey(ignore: true)
  _$GetProfileAccountCopyWith<_GetProfileAccount> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$ProfileAccountEventCopyWith<$Res>
    implements $ProfileAccountEventCopyWith<$Res> {
  factory _$ProfileAccountEventCopyWith(_ProfileAccountEvent value,
          $Res Function(_ProfileAccountEvent) then) =
      __$ProfileAccountEventCopyWithImpl<$Res>;
  @override
  $Res call({String uid});
}

/// @nodoc
class __$ProfileAccountEventCopyWithImpl<$Res>
    extends _$ProfileAccountEventCopyWithImpl<$Res>
    implements _$ProfileAccountEventCopyWith<$Res> {
  __$ProfileAccountEventCopyWithImpl(
      _ProfileAccountEvent _value, $Res Function(_ProfileAccountEvent) _then)
      : super(_value, (v) => _then(v as _ProfileAccountEvent));

  @override
  _ProfileAccountEvent get _value => super._value as _ProfileAccountEvent;

  @override
  $Res call({
    Object? uid = freezed,
  }) {
    return _then(_ProfileAccountEvent(
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ProfileAccountEvent implements _ProfileAccountEvent {
  const _$_ProfileAccountEvent({required this.uid});

  @override
  final String uid;

  @override
  String toString() {
    return 'ProfileAccountEvent.getProfileAccount(uid: $uid)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProfileAccountEvent &&
            const DeepCollectionEquality().equals(other.uid, uid));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(uid));

  @JsonKey(ignore: true)
  @override
  _$ProfileAccountEventCopyWith<_ProfileAccountEvent> get copyWith =>
      __$ProfileAccountEventCopyWithImpl<_ProfileAccountEvent>(
          this, _$identity);

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
    required TResult Function(_GetProfileAccount value) getUserAccount,
    required TResult Function(_ProfileAccountEvent value) getProfileAccount,
  }) {
    return getProfileAccount(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetProfileAccount value)? getUserAccount,
    TResult Function(_ProfileAccountEvent value)? getProfileAccount,
  }) {
    return getProfileAccount?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetProfileAccount value)? getUserAccount,
    TResult Function(_ProfileAccountEvent value)? getProfileAccount,
    required TResult orElse(),
  }) {
    if (getProfileAccount != null) {
      return getProfileAccount(this);
    }
    return orElse();
  }
}

abstract class _ProfileAccountEvent implements ProfileAccountEvent {
  const factory _ProfileAccountEvent({required String uid}) =
      _$_ProfileAccountEvent;

  @override
  String get uid;
  @override
  @JsonKey(ignore: true)
  _$ProfileAccountEventCopyWith<_ProfileAccountEvent> get copyWith =>
      throw _privateConstructorUsedError;
}
