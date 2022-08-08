// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'authenticate_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AuthenticationEventTearOff {
  const _$AuthenticationEventTearOff();

  _LogOut logOut() {
    return const _LogOut();
  }

  _AppInitialized initialize() {
    return const _AppInitialized();
  }

  _GoogleSignIn googleSignIn() {
    return const _GoogleSignIn();
  }

  _GoogleSignUp googleSignUp() {
    return const _GoogleSignUp();
  }

  _TwitterSignIn twitterSignIn() {
    return const _TwitterSignIn();
  }

  _TwitterSignUp twitterSignUp() {
    return const _TwitterSignUp();
  }

  _FacebookSignIn facebookSignIn() {
    return const _FacebookSignIn();
  }

  _FacebookSignUp facebookSignUp() {
    return const _FacebookSignUp();
  }

  _RecoverAccount recoverAccount({required String email}) {
    return _RecoverAccount(
      email: email,
    );
  }

  _Authenticate onAuthenticate(
      {required String email, required String password}) {
    return _Authenticate(
      email: email,
      password: password,
    );
  }

  _CreateAccount createAccount(
      {required String email, required String password}) {
    return _CreateAccount(
      email: email,
      password: password,
    );
  }

  _RegisterUsername registerUsername(
      {required String userId, required String username}) {
    return _RegisterUsername(
      userId: userId,
      username: username,
    );
  }
}

/// @nodoc
const $AuthenticationEvent = _$AuthenticationEventTearOff();

/// @nodoc
mixin _$AuthenticationEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() logOut,
    required TResult Function() initialize,
    required TResult Function() googleSignIn,
    required TResult Function() googleSignUp,
    required TResult Function() twitterSignIn,
    required TResult Function() twitterSignUp,
    required TResult Function() facebookSignIn,
    required TResult Function() facebookSignUp,
    required TResult Function(String email) recoverAccount,
    required TResult Function(String email, String password) onAuthenticate,
    required TResult Function(String email, String password) createAccount,
    required TResult Function(String userId, String username) registerUsername,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? logOut,
    TResult Function()? initialize,
    TResult Function()? googleSignIn,
    TResult Function()? googleSignUp,
    TResult Function()? twitterSignIn,
    TResult Function()? twitterSignUp,
    TResult Function()? facebookSignIn,
    TResult Function()? facebookSignUp,
    TResult Function(String email)? recoverAccount,
    TResult Function(String email, String password)? onAuthenticate,
    TResult Function(String email, String password)? createAccount,
    TResult Function(String userId, String username)? registerUsername,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? logOut,
    TResult Function()? initialize,
    TResult Function()? googleSignIn,
    TResult Function()? googleSignUp,
    TResult Function()? twitterSignIn,
    TResult Function()? twitterSignUp,
    TResult Function()? facebookSignIn,
    TResult Function()? facebookSignUp,
    TResult Function(String email)? recoverAccount,
    TResult Function(String email, String password)? onAuthenticate,
    TResult Function(String email, String password)? createAccount,
    TResult Function(String userId, String username)? registerUsername,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LogOut value) logOut,
    required TResult Function(_AppInitialized value) initialize,
    required TResult Function(_GoogleSignIn value) googleSignIn,
    required TResult Function(_GoogleSignUp value) googleSignUp,
    required TResult Function(_TwitterSignIn value) twitterSignIn,
    required TResult Function(_TwitterSignUp value) twitterSignUp,
    required TResult Function(_FacebookSignIn value) facebookSignIn,
    required TResult Function(_FacebookSignUp value) facebookSignUp,
    required TResult Function(_RecoverAccount value) recoverAccount,
    required TResult Function(_Authenticate value) onAuthenticate,
    required TResult Function(_CreateAccount value) createAccount,
    required TResult Function(_RegisterUsername value) registerUsername,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_LogOut value)? logOut,
    TResult Function(_AppInitialized value)? initialize,
    TResult Function(_GoogleSignIn value)? googleSignIn,
    TResult Function(_GoogleSignUp value)? googleSignUp,
    TResult Function(_TwitterSignIn value)? twitterSignIn,
    TResult Function(_TwitterSignUp value)? twitterSignUp,
    TResult Function(_FacebookSignIn value)? facebookSignIn,
    TResult Function(_FacebookSignUp value)? facebookSignUp,
    TResult Function(_RecoverAccount value)? recoverAccount,
    TResult Function(_Authenticate value)? onAuthenticate,
    TResult Function(_CreateAccount value)? createAccount,
    TResult Function(_RegisterUsername value)? registerUsername,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LogOut value)? logOut,
    TResult Function(_AppInitialized value)? initialize,
    TResult Function(_GoogleSignIn value)? googleSignIn,
    TResult Function(_GoogleSignUp value)? googleSignUp,
    TResult Function(_TwitterSignIn value)? twitterSignIn,
    TResult Function(_TwitterSignUp value)? twitterSignUp,
    TResult Function(_FacebookSignIn value)? facebookSignIn,
    TResult Function(_FacebookSignUp value)? facebookSignUp,
    TResult Function(_RecoverAccount value)? recoverAccount,
    TResult Function(_Authenticate value)? onAuthenticate,
    TResult Function(_CreateAccount value)? createAccount,
    TResult Function(_RegisterUsername value)? registerUsername,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthenticationEventCopyWith<$Res> {
  factory $AuthenticationEventCopyWith(
          AuthenticationEvent value, $Res Function(AuthenticationEvent) then) =
      _$AuthenticationEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthenticationEventCopyWithImpl<$Res>
    implements $AuthenticationEventCopyWith<$Res> {
  _$AuthenticationEventCopyWithImpl(this._value, this._then);

  final AuthenticationEvent _value;
  // ignore: unused_field
  final $Res Function(AuthenticationEvent) _then;
}

/// @nodoc
abstract class _$LogOutCopyWith<$Res> {
  factory _$LogOutCopyWith(_LogOut value, $Res Function(_LogOut) then) =
      __$LogOutCopyWithImpl<$Res>;
}

/// @nodoc
class __$LogOutCopyWithImpl<$Res>
    extends _$AuthenticationEventCopyWithImpl<$Res>
    implements _$LogOutCopyWith<$Res> {
  __$LogOutCopyWithImpl(_LogOut _value, $Res Function(_LogOut) _then)
      : super(_value, (v) => _then(v as _LogOut));

  @override
  _LogOut get _value => super._value as _LogOut;
}

/// @nodoc

class _$_LogOut implements _LogOut {
  const _$_LogOut();

  @override
  String toString() {
    return 'AuthenticationEvent.logOut()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _LogOut);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() logOut,
    required TResult Function() initialize,
    required TResult Function() googleSignIn,
    required TResult Function() googleSignUp,
    required TResult Function() twitterSignIn,
    required TResult Function() twitterSignUp,
    required TResult Function() facebookSignIn,
    required TResult Function() facebookSignUp,
    required TResult Function(String email) recoverAccount,
    required TResult Function(String email, String password) onAuthenticate,
    required TResult Function(String email, String password) createAccount,
    required TResult Function(String userId, String username) registerUsername,
  }) {
    return logOut();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? logOut,
    TResult Function()? initialize,
    TResult Function()? googleSignIn,
    TResult Function()? googleSignUp,
    TResult Function()? twitterSignIn,
    TResult Function()? twitterSignUp,
    TResult Function()? facebookSignIn,
    TResult Function()? facebookSignUp,
    TResult Function(String email)? recoverAccount,
    TResult Function(String email, String password)? onAuthenticate,
    TResult Function(String email, String password)? createAccount,
    TResult Function(String userId, String username)? registerUsername,
  }) {
    return logOut?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? logOut,
    TResult Function()? initialize,
    TResult Function()? googleSignIn,
    TResult Function()? googleSignUp,
    TResult Function()? twitterSignIn,
    TResult Function()? twitterSignUp,
    TResult Function()? facebookSignIn,
    TResult Function()? facebookSignUp,
    TResult Function(String email)? recoverAccount,
    TResult Function(String email, String password)? onAuthenticate,
    TResult Function(String email, String password)? createAccount,
    TResult Function(String userId, String username)? registerUsername,
    required TResult orElse(),
  }) {
    if (logOut != null) {
      return logOut();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LogOut value) logOut,
    required TResult Function(_AppInitialized value) initialize,
    required TResult Function(_GoogleSignIn value) googleSignIn,
    required TResult Function(_GoogleSignUp value) googleSignUp,
    required TResult Function(_TwitterSignIn value) twitterSignIn,
    required TResult Function(_TwitterSignUp value) twitterSignUp,
    required TResult Function(_FacebookSignIn value) facebookSignIn,
    required TResult Function(_FacebookSignUp value) facebookSignUp,
    required TResult Function(_RecoverAccount value) recoverAccount,
    required TResult Function(_Authenticate value) onAuthenticate,
    required TResult Function(_CreateAccount value) createAccount,
    required TResult Function(_RegisterUsername value) registerUsername,
  }) {
    return logOut(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_LogOut value)? logOut,
    TResult Function(_AppInitialized value)? initialize,
    TResult Function(_GoogleSignIn value)? googleSignIn,
    TResult Function(_GoogleSignUp value)? googleSignUp,
    TResult Function(_TwitterSignIn value)? twitterSignIn,
    TResult Function(_TwitterSignUp value)? twitterSignUp,
    TResult Function(_FacebookSignIn value)? facebookSignIn,
    TResult Function(_FacebookSignUp value)? facebookSignUp,
    TResult Function(_RecoverAccount value)? recoverAccount,
    TResult Function(_Authenticate value)? onAuthenticate,
    TResult Function(_CreateAccount value)? createAccount,
    TResult Function(_RegisterUsername value)? registerUsername,
  }) {
    return logOut?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LogOut value)? logOut,
    TResult Function(_AppInitialized value)? initialize,
    TResult Function(_GoogleSignIn value)? googleSignIn,
    TResult Function(_GoogleSignUp value)? googleSignUp,
    TResult Function(_TwitterSignIn value)? twitterSignIn,
    TResult Function(_TwitterSignUp value)? twitterSignUp,
    TResult Function(_FacebookSignIn value)? facebookSignIn,
    TResult Function(_FacebookSignUp value)? facebookSignUp,
    TResult Function(_RecoverAccount value)? recoverAccount,
    TResult Function(_Authenticate value)? onAuthenticate,
    TResult Function(_CreateAccount value)? createAccount,
    TResult Function(_RegisterUsername value)? registerUsername,
    required TResult orElse(),
  }) {
    if (logOut != null) {
      return logOut(this);
    }
    return orElse();
  }
}

abstract class _LogOut implements AuthenticationEvent {
  const factory _LogOut() = _$_LogOut;
}

/// @nodoc
abstract class _$AppInitializedCopyWith<$Res> {
  factory _$AppInitializedCopyWith(
          _AppInitialized value, $Res Function(_AppInitialized) then) =
      __$AppInitializedCopyWithImpl<$Res>;
}

/// @nodoc
class __$AppInitializedCopyWithImpl<$Res>
    extends _$AuthenticationEventCopyWithImpl<$Res>
    implements _$AppInitializedCopyWith<$Res> {
  __$AppInitializedCopyWithImpl(
      _AppInitialized _value, $Res Function(_AppInitialized) _then)
      : super(_value, (v) => _then(v as _AppInitialized));

  @override
  _AppInitialized get _value => super._value as _AppInitialized;
}

/// @nodoc

class _$_AppInitialized implements _AppInitialized {
  const _$_AppInitialized();

  @override
  String toString() {
    return 'AuthenticationEvent.initialize()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _AppInitialized);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() logOut,
    required TResult Function() initialize,
    required TResult Function() googleSignIn,
    required TResult Function() googleSignUp,
    required TResult Function() twitterSignIn,
    required TResult Function() twitterSignUp,
    required TResult Function() facebookSignIn,
    required TResult Function() facebookSignUp,
    required TResult Function(String email) recoverAccount,
    required TResult Function(String email, String password) onAuthenticate,
    required TResult Function(String email, String password) createAccount,
    required TResult Function(String userId, String username) registerUsername,
  }) {
    return initialize();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? logOut,
    TResult Function()? initialize,
    TResult Function()? googleSignIn,
    TResult Function()? googleSignUp,
    TResult Function()? twitterSignIn,
    TResult Function()? twitterSignUp,
    TResult Function()? facebookSignIn,
    TResult Function()? facebookSignUp,
    TResult Function(String email)? recoverAccount,
    TResult Function(String email, String password)? onAuthenticate,
    TResult Function(String email, String password)? createAccount,
    TResult Function(String userId, String username)? registerUsername,
  }) {
    return initialize?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? logOut,
    TResult Function()? initialize,
    TResult Function()? googleSignIn,
    TResult Function()? googleSignUp,
    TResult Function()? twitterSignIn,
    TResult Function()? twitterSignUp,
    TResult Function()? facebookSignIn,
    TResult Function()? facebookSignUp,
    TResult Function(String email)? recoverAccount,
    TResult Function(String email, String password)? onAuthenticate,
    TResult Function(String email, String password)? createAccount,
    TResult Function(String userId, String username)? registerUsername,
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
    required TResult Function(_LogOut value) logOut,
    required TResult Function(_AppInitialized value) initialize,
    required TResult Function(_GoogleSignIn value) googleSignIn,
    required TResult Function(_GoogleSignUp value) googleSignUp,
    required TResult Function(_TwitterSignIn value) twitterSignIn,
    required TResult Function(_TwitterSignUp value) twitterSignUp,
    required TResult Function(_FacebookSignIn value) facebookSignIn,
    required TResult Function(_FacebookSignUp value) facebookSignUp,
    required TResult Function(_RecoverAccount value) recoverAccount,
    required TResult Function(_Authenticate value) onAuthenticate,
    required TResult Function(_CreateAccount value) createAccount,
    required TResult Function(_RegisterUsername value) registerUsername,
  }) {
    return initialize(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_LogOut value)? logOut,
    TResult Function(_AppInitialized value)? initialize,
    TResult Function(_GoogleSignIn value)? googleSignIn,
    TResult Function(_GoogleSignUp value)? googleSignUp,
    TResult Function(_TwitterSignIn value)? twitterSignIn,
    TResult Function(_TwitterSignUp value)? twitterSignUp,
    TResult Function(_FacebookSignIn value)? facebookSignIn,
    TResult Function(_FacebookSignUp value)? facebookSignUp,
    TResult Function(_RecoverAccount value)? recoverAccount,
    TResult Function(_Authenticate value)? onAuthenticate,
    TResult Function(_CreateAccount value)? createAccount,
    TResult Function(_RegisterUsername value)? registerUsername,
  }) {
    return initialize?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LogOut value)? logOut,
    TResult Function(_AppInitialized value)? initialize,
    TResult Function(_GoogleSignIn value)? googleSignIn,
    TResult Function(_GoogleSignUp value)? googleSignUp,
    TResult Function(_TwitterSignIn value)? twitterSignIn,
    TResult Function(_TwitterSignUp value)? twitterSignUp,
    TResult Function(_FacebookSignIn value)? facebookSignIn,
    TResult Function(_FacebookSignUp value)? facebookSignUp,
    TResult Function(_RecoverAccount value)? recoverAccount,
    TResult Function(_Authenticate value)? onAuthenticate,
    TResult Function(_CreateAccount value)? createAccount,
    TResult Function(_RegisterUsername value)? registerUsername,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(this);
    }
    return orElse();
  }
}

abstract class _AppInitialized implements AuthenticationEvent {
  const factory _AppInitialized() = _$_AppInitialized;
}

/// @nodoc
abstract class _$GoogleSignInCopyWith<$Res> {
  factory _$GoogleSignInCopyWith(
          _GoogleSignIn value, $Res Function(_GoogleSignIn) then) =
      __$GoogleSignInCopyWithImpl<$Res>;
}

/// @nodoc
class __$GoogleSignInCopyWithImpl<$Res>
    extends _$AuthenticationEventCopyWithImpl<$Res>
    implements _$GoogleSignInCopyWith<$Res> {
  __$GoogleSignInCopyWithImpl(
      _GoogleSignIn _value, $Res Function(_GoogleSignIn) _then)
      : super(_value, (v) => _then(v as _GoogleSignIn));

  @override
  _GoogleSignIn get _value => super._value as _GoogleSignIn;
}

/// @nodoc

class _$_GoogleSignIn implements _GoogleSignIn {
  const _$_GoogleSignIn();

  @override
  String toString() {
    return 'AuthenticationEvent.googleSignIn()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _GoogleSignIn);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() logOut,
    required TResult Function() initialize,
    required TResult Function() googleSignIn,
    required TResult Function() googleSignUp,
    required TResult Function() twitterSignIn,
    required TResult Function() twitterSignUp,
    required TResult Function() facebookSignIn,
    required TResult Function() facebookSignUp,
    required TResult Function(String email) recoverAccount,
    required TResult Function(String email, String password) onAuthenticate,
    required TResult Function(String email, String password) createAccount,
    required TResult Function(String userId, String username) registerUsername,
  }) {
    return googleSignIn();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? logOut,
    TResult Function()? initialize,
    TResult Function()? googleSignIn,
    TResult Function()? googleSignUp,
    TResult Function()? twitterSignIn,
    TResult Function()? twitterSignUp,
    TResult Function()? facebookSignIn,
    TResult Function()? facebookSignUp,
    TResult Function(String email)? recoverAccount,
    TResult Function(String email, String password)? onAuthenticate,
    TResult Function(String email, String password)? createAccount,
    TResult Function(String userId, String username)? registerUsername,
  }) {
    return googleSignIn?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? logOut,
    TResult Function()? initialize,
    TResult Function()? googleSignIn,
    TResult Function()? googleSignUp,
    TResult Function()? twitterSignIn,
    TResult Function()? twitterSignUp,
    TResult Function()? facebookSignIn,
    TResult Function()? facebookSignUp,
    TResult Function(String email)? recoverAccount,
    TResult Function(String email, String password)? onAuthenticate,
    TResult Function(String email, String password)? createAccount,
    TResult Function(String userId, String username)? registerUsername,
    required TResult orElse(),
  }) {
    if (googleSignIn != null) {
      return googleSignIn();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LogOut value) logOut,
    required TResult Function(_AppInitialized value) initialize,
    required TResult Function(_GoogleSignIn value) googleSignIn,
    required TResult Function(_GoogleSignUp value) googleSignUp,
    required TResult Function(_TwitterSignIn value) twitterSignIn,
    required TResult Function(_TwitterSignUp value) twitterSignUp,
    required TResult Function(_FacebookSignIn value) facebookSignIn,
    required TResult Function(_FacebookSignUp value) facebookSignUp,
    required TResult Function(_RecoverAccount value) recoverAccount,
    required TResult Function(_Authenticate value) onAuthenticate,
    required TResult Function(_CreateAccount value) createAccount,
    required TResult Function(_RegisterUsername value) registerUsername,
  }) {
    return googleSignIn(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_LogOut value)? logOut,
    TResult Function(_AppInitialized value)? initialize,
    TResult Function(_GoogleSignIn value)? googleSignIn,
    TResult Function(_GoogleSignUp value)? googleSignUp,
    TResult Function(_TwitterSignIn value)? twitterSignIn,
    TResult Function(_TwitterSignUp value)? twitterSignUp,
    TResult Function(_FacebookSignIn value)? facebookSignIn,
    TResult Function(_FacebookSignUp value)? facebookSignUp,
    TResult Function(_RecoverAccount value)? recoverAccount,
    TResult Function(_Authenticate value)? onAuthenticate,
    TResult Function(_CreateAccount value)? createAccount,
    TResult Function(_RegisterUsername value)? registerUsername,
  }) {
    return googleSignIn?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LogOut value)? logOut,
    TResult Function(_AppInitialized value)? initialize,
    TResult Function(_GoogleSignIn value)? googleSignIn,
    TResult Function(_GoogleSignUp value)? googleSignUp,
    TResult Function(_TwitterSignIn value)? twitterSignIn,
    TResult Function(_TwitterSignUp value)? twitterSignUp,
    TResult Function(_FacebookSignIn value)? facebookSignIn,
    TResult Function(_FacebookSignUp value)? facebookSignUp,
    TResult Function(_RecoverAccount value)? recoverAccount,
    TResult Function(_Authenticate value)? onAuthenticate,
    TResult Function(_CreateAccount value)? createAccount,
    TResult Function(_RegisterUsername value)? registerUsername,
    required TResult orElse(),
  }) {
    if (googleSignIn != null) {
      return googleSignIn(this);
    }
    return orElse();
  }
}

abstract class _GoogleSignIn implements AuthenticationEvent {
  const factory _GoogleSignIn() = _$_GoogleSignIn;
}

/// @nodoc
abstract class _$GoogleSignUpCopyWith<$Res> {
  factory _$GoogleSignUpCopyWith(
          _GoogleSignUp value, $Res Function(_GoogleSignUp) then) =
      __$GoogleSignUpCopyWithImpl<$Res>;
}

/// @nodoc
class __$GoogleSignUpCopyWithImpl<$Res>
    extends _$AuthenticationEventCopyWithImpl<$Res>
    implements _$GoogleSignUpCopyWith<$Res> {
  __$GoogleSignUpCopyWithImpl(
      _GoogleSignUp _value, $Res Function(_GoogleSignUp) _then)
      : super(_value, (v) => _then(v as _GoogleSignUp));

  @override
  _GoogleSignUp get _value => super._value as _GoogleSignUp;
}

/// @nodoc

class _$_GoogleSignUp implements _GoogleSignUp {
  const _$_GoogleSignUp();

  @override
  String toString() {
    return 'AuthenticationEvent.googleSignUp()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _GoogleSignUp);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() logOut,
    required TResult Function() initialize,
    required TResult Function() googleSignIn,
    required TResult Function() googleSignUp,
    required TResult Function() twitterSignIn,
    required TResult Function() twitterSignUp,
    required TResult Function() facebookSignIn,
    required TResult Function() facebookSignUp,
    required TResult Function(String email) recoverAccount,
    required TResult Function(String email, String password) onAuthenticate,
    required TResult Function(String email, String password) createAccount,
    required TResult Function(String userId, String username) registerUsername,
  }) {
    return googleSignUp();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? logOut,
    TResult Function()? initialize,
    TResult Function()? googleSignIn,
    TResult Function()? googleSignUp,
    TResult Function()? twitterSignIn,
    TResult Function()? twitterSignUp,
    TResult Function()? facebookSignIn,
    TResult Function()? facebookSignUp,
    TResult Function(String email)? recoverAccount,
    TResult Function(String email, String password)? onAuthenticate,
    TResult Function(String email, String password)? createAccount,
    TResult Function(String userId, String username)? registerUsername,
  }) {
    return googleSignUp?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? logOut,
    TResult Function()? initialize,
    TResult Function()? googleSignIn,
    TResult Function()? googleSignUp,
    TResult Function()? twitterSignIn,
    TResult Function()? twitterSignUp,
    TResult Function()? facebookSignIn,
    TResult Function()? facebookSignUp,
    TResult Function(String email)? recoverAccount,
    TResult Function(String email, String password)? onAuthenticate,
    TResult Function(String email, String password)? createAccount,
    TResult Function(String userId, String username)? registerUsername,
    required TResult orElse(),
  }) {
    if (googleSignUp != null) {
      return googleSignUp();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LogOut value) logOut,
    required TResult Function(_AppInitialized value) initialize,
    required TResult Function(_GoogleSignIn value) googleSignIn,
    required TResult Function(_GoogleSignUp value) googleSignUp,
    required TResult Function(_TwitterSignIn value) twitterSignIn,
    required TResult Function(_TwitterSignUp value) twitterSignUp,
    required TResult Function(_FacebookSignIn value) facebookSignIn,
    required TResult Function(_FacebookSignUp value) facebookSignUp,
    required TResult Function(_RecoverAccount value) recoverAccount,
    required TResult Function(_Authenticate value) onAuthenticate,
    required TResult Function(_CreateAccount value) createAccount,
    required TResult Function(_RegisterUsername value) registerUsername,
  }) {
    return googleSignUp(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_LogOut value)? logOut,
    TResult Function(_AppInitialized value)? initialize,
    TResult Function(_GoogleSignIn value)? googleSignIn,
    TResult Function(_GoogleSignUp value)? googleSignUp,
    TResult Function(_TwitterSignIn value)? twitterSignIn,
    TResult Function(_TwitterSignUp value)? twitterSignUp,
    TResult Function(_FacebookSignIn value)? facebookSignIn,
    TResult Function(_FacebookSignUp value)? facebookSignUp,
    TResult Function(_RecoverAccount value)? recoverAccount,
    TResult Function(_Authenticate value)? onAuthenticate,
    TResult Function(_CreateAccount value)? createAccount,
    TResult Function(_RegisterUsername value)? registerUsername,
  }) {
    return googleSignUp?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LogOut value)? logOut,
    TResult Function(_AppInitialized value)? initialize,
    TResult Function(_GoogleSignIn value)? googleSignIn,
    TResult Function(_GoogleSignUp value)? googleSignUp,
    TResult Function(_TwitterSignIn value)? twitterSignIn,
    TResult Function(_TwitterSignUp value)? twitterSignUp,
    TResult Function(_FacebookSignIn value)? facebookSignIn,
    TResult Function(_FacebookSignUp value)? facebookSignUp,
    TResult Function(_RecoverAccount value)? recoverAccount,
    TResult Function(_Authenticate value)? onAuthenticate,
    TResult Function(_CreateAccount value)? createAccount,
    TResult Function(_RegisterUsername value)? registerUsername,
    required TResult orElse(),
  }) {
    if (googleSignUp != null) {
      return googleSignUp(this);
    }
    return orElse();
  }
}

abstract class _GoogleSignUp implements AuthenticationEvent {
  const factory _GoogleSignUp() = _$_GoogleSignUp;
}

/// @nodoc
abstract class _$TwitterSignInCopyWith<$Res> {
  factory _$TwitterSignInCopyWith(
          _TwitterSignIn value, $Res Function(_TwitterSignIn) then) =
      __$TwitterSignInCopyWithImpl<$Res>;
}

/// @nodoc
class __$TwitterSignInCopyWithImpl<$Res>
    extends _$AuthenticationEventCopyWithImpl<$Res>
    implements _$TwitterSignInCopyWith<$Res> {
  __$TwitterSignInCopyWithImpl(
      _TwitterSignIn _value, $Res Function(_TwitterSignIn) _then)
      : super(_value, (v) => _then(v as _TwitterSignIn));

  @override
  _TwitterSignIn get _value => super._value as _TwitterSignIn;
}

/// @nodoc

class _$_TwitterSignIn implements _TwitterSignIn {
  const _$_TwitterSignIn();

  @override
  String toString() {
    return 'AuthenticationEvent.twitterSignIn()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _TwitterSignIn);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() logOut,
    required TResult Function() initialize,
    required TResult Function() googleSignIn,
    required TResult Function() googleSignUp,
    required TResult Function() twitterSignIn,
    required TResult Function() twitterSignUp,
    required TResult Function() facebookSignIn,
    required TResult Function() facebookSignUp,
    required TResult Function(String email) recoverAccount,
    required TResult Function(String email, String password) onAuthenticate,
    required TResult Function(String email, String password) createAccount,
    required TResult Function(String userId, String username) registerUsername,
  }) {
    return twitterSignIn();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? logOut,
    TResult Function()? initialize,
    TResult Function()? googleSignIn,
    TResult Function()? googleSignUp,
    TResult Function()? twitterSignIn,
    TResult Function()? twitterSignUp,
    TResult Function()? facebookSignIn,
    TResult Function()? facebookSignUp,
    TResult Function(String email)? recoverAccount,
    TResult Function(String email, String password)? onAuthenticate,
    TResult Function(String email, String password)? createAccount,
    TResult Function(String userId, String username)? registerUsername,
  }) {
    return twitterSignIn?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? logOut,
    TResult Function()? initialize,
    TResult Function()? googleSignIn,
    TResult Function()? googleSignUp,
    TResult Function()? twitterSignIn,
    TResult Function()? twitterSignUp,
    TResult Function()? facebookSignIn,
    TResult Function()? facebookSignUp,
    TResult Function(String email)? recoverAccount,
    TResult Function(String email, String password)? onAuthenticate,
    TResult Function(String email, String password)? createAccount,
    TResult Function(String userId, String username)? registerUsername,
    required TResult orElse(),
  }) {
    if (twitterSignIn != null) {
      return twitterSignIn();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LogOut value) logOut,
    required TResult Function(_AppInitialized value) initialize,
    required TResult Function(_GoogleSignIn value) googleSignIn,
    required TResult Function(_GoogleSignUp value) googleSignUp,
    required TResult Function(_TwitterSignIn value) twitterSignIn,
    required TResult Function(_TwitterSignUp value) twitterSignUp,
    required TResult Function(_FacebookSignIn value) facebookSignIn,
    required TResult Function(_FacebookSignUp value) facebookSignUp,
    required TResult Function(_RecoverAccount value) recoverAccount,
    required TResult Function(_Authenticate value) onAuthenticate,
    required TResult Function(_CreateAccount value) createAccount,
    required TResult Function(_RegisterUsername value) registerUsername,
  }) {
    return twitterSignIn(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_LogOut value)? logOut,
    TResult Function(_AppInitialized value)? initialize,
    TResult Function(_GoogleSignIn value)? googleSignIn,
    TResult Function(_GoogleSignUp value)? googleSignUp,
    TResult Function(_TwitterSignIn value)? twitterSignIn,
    TResult Function(_TwitterSignUp value)? twitterSignUp,
    TResult Function(_FacebookSignIn value)? facebookSignIn,
    TResult Function(_FacebookSignUp value)? facebookSignUp,
    TResult Function(_RecoverAccount value)? recoverAccount,
    TResult Function(_Authenticate value)? onAuthenticate,
    TResult Function(_CreateAccount value)? createAccount,
    TResult Function(_RegisterUsername value)? registerUsername,
  }) {
    return twitterSignIn?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LogOut value)? logOut,
    TResult Function(_AppInitialized value)? initialize,
    TResult Function(_GoogleSignIn value)? googleSignIn,
    TResult Function(_GoogleSignUp value)? googleSignUp,
    TResult Function(_TwitterSignIn value)? twitterSignIn,
    TResult Function(_TwitterSignUp value)? twitterSignUp,
    TResult Function(_FacebookSignIn value)? facebookSignIn,
    TResult Function(_FacebookSignUp value)? facebookSignUp,
    TResult Function(_RecoverAccount value)? recoverAccount,
    TResult Function(_Authenticate value)? onAuthenticate,
    TResult Function(_CreateAccount value)? createAccount,
    TResult Function(_RegisterUsername value)? registerUsername,
    required TResult orElse(),
  }) {
    if (twitterSignIn != null) {
      return twitterSignIn(this);
    }
    return orElse();
  }
}

abstract class _TwitterSignIn implements AuthenticationEvent {
  const factory _TwitterSignIn() = _$_TwitterSignIn;
}

/// @nodoc
abstract class _$TwitterSignUpCopyWith<$Res> {
  factory _$TwitterSignUpCopyWith(
          _TwitterSignUp value, $Res Function(_TwitterSignUp) then) =
      __$TwitterSignUpCopyWithImpl<$Res>;
}

/// @nodoc
class __$TwitterSignUpCopyWithImpl<$Res>
    extends _$AuthenticationEventCopyWithImpl<$Res>
    implements _$TwitterSignUpCopyWith<$Res> {
  __$TwitterSignUpCopyWithImpl(
      _TwitterSignUp _value, $Res Function(_TwitterSignUp) _then)
      : super(_value, (v) => _then(v as _TwitterSignUp));

  @override
  _TwitterSignUp get _value => super._value as _TwitterSignUp;
}

/// @nodoc

class _$_TwitterSignUp implements _TwitterSignUp {
  const _$_TwitterSignUp();

  @override
  String toString() {
    return 'AuthenticationEvent.twitterSignUp()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _TwitterSignUp);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() logOut,
    required TResult Function() initialize,
    required TResult Function() googleSignIn,
    required TResult Function() googleSignUp,
    required TResult Function() twitterSignIn,
    required TResult Function() twitterSignUp,
    required TResult Function() facebookSignIn,
    required TResult Function() facebookSignUp,
    required TResult Function(String email) recoverAccount,
    required TResult Function(String email, String password) onAuthenticate,
    required TResult Function(String email, String password) createAccount,
    required TResult Function(String userId, String username) registerUsername,
  }) {
    return twitterSignUp();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? logOut,
    TResult Function()? initialize,
    TResult Function()? googleSignIn,
    TResult Function()? googleSignUp,
    TResult Function()? twitterSignIn,
    TResult Function()? twitterSignUp,
    TResult Function()? facebookSignIn,
    TResult Function()? facebookSignUp,
    TResult Function(String email)? recoverAccount,
    TResult Function(String email, String password)? onAuthenticate,
    TResult Function(String email, String password)? createAccount,
    TResult Function(String userId, String username)? registerUsername,
  }) {
    return twitterSignUp?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? logOut,
    TResult Function()? initialize,
    TResult Function()? googleSignIn,
    TResult Function()? googleSignUp,
    TResult Function()? twitterSignIn,
    TResult Function()? twitterSignUp,
    TResult Function()? facebookSignIn,
    TResult Function()? facebookSignUp,
    TResult Function(String email)? recoverAccount,
    TResult Function(String email, String password)? onAuthenticate,
    TResult Function(String email, String password)? createAccount,
    TResult Function(String userId, String username)? registerUsername,
    required TResult orElse(),
  }) {
    if (twitterSignUp != null) {
      return twitterSignUp();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LogOut value) logOut,
    required TResult Function(_AppInitialized value) initialize,
    required TResult Function(_GoogleSignIn value) googleSignIn,
    required TResult Function(_GoogleSignUp value) googleSignUp,
    required TResult Function(_TwitterSignIn value) twitterSignIn,
    required TResult Function(_TwitterSignUp value) twitterSignUp,
    required TResult Function(_FacebookSignIn value) facebookSignIn,
    required TResult Function(_FacebookSignUp value) facebookSignUp,
    required TResult Function(_RecoverAccount value) recoverAccount,
    required TResult Function(_Authenticate value) onAuthenticate,
    required TResult Function(_CreateAccount value) createAccount,
    required TResult Function(_RegisterUsername value) registerUsername,
  }) {
    return twitterSignUp(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_LogOut value)? logOut,
    TResult Function(_AppInitialized value)? initialize,
    TResult Function(_GoogleSignIn value)? googleSignIn,
    TResult Function(_GoogleSignUp value)? googleSignUp,
    TResult Function(_TwitterSignIn value)? twitterSignIn,
    TResult Function(_TwitterSignUp value)? twitterSignUp,
    TResult Function(_FacebookSignIn value)? facebookSignIn,
    TResult Function(_FacebookSignUp value)? facebookSignUp,
    TResult Function(_RecoverAccount value)? recoverAccount,
    TResult Function(_Authenticate value)? onAuthenticate,
    TResult Function(_CreateAccount value)? createAccount,
    TResult Function(_RegisterUsername value)? registerUsername,
  }) {
    return twitterSignUp?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LogOut value)? logOut,
    TResult Function(_AppInitialized value)? initialize,
    TResult Function(_GoogleSignIn value)? googleSignIn,
    TResult Function(_GoogleSignUp value)? googleSignUp,
    TResult Function(_TwitterSignIn value)? twitterSignIn,
    TResult Function(_TwitterSignUp value)? twitterSignUp,
    TResult Function(_FacebookSignIn value)? facebookSignIn,
    TResult Function(_FacebookSignUp value)? facebookSignUp,
    TResult Function(_RecoverAccount value)? recoverAccount,
    TResult Function(_Authenticate value)? onAuthenticate,
    TResult Function(_CreateAccount value)? createAccount,
    TResult Function(_RegisterUsername value)? registerUsername,
    required TResult orElse(),
  }) {
    if (twitterSignUp != null) {
      return twitterSignUp(this);
    }
    return orElse();
  }
}

abstract class _TwitterSignUp implements AuthenticationEvent {
  const factory _TwitterSignUp() = _$_TwitterSignUp;
}

/// @nodoc
abstract class _$FacebookSignInCopyWith<$Res> {
  factory _$FacebookSignInCopyWith(
          _FacebookSignIn value, $Res Function(_FacebookSignIn) then) =
      __$FacebookSignInCopyWithImpl<$Res>;
}

/// @nodoc
class __$FacebookSignInCopyWithImpl<$Res>
    extends _$AuthenticationEventCopyWithImpl<$Res>
    implements _$FacebookSignInCopyWith<$Res> {
  __$FacebookSignInCopyWithImpl(
      _FacebookSignIn _value, $Res Function(_FacebookSignIn) _then)
      : super(_value, (v) => _then(v as _FacebookSignIn));

  @override
  _FacebookSignIn get _value => super._value as _FacebookSignIn;
}

/// @nodoc

class _$_FacebookSignIn implements _FacebookSignIn {
  const _$_FacebookSignIn();

  @override
  String toString() {
    return 'AuthenticationEvent.facebookSignIn()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _FacebookSignIn);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() logOut,
    required TResult Function() initialize,
    required TResult Function() googleSignIn,
    required TResult Function() googleSignUp,
    required TResult Function() twitterSignIn,
    required TResult Function() twitterSignUp,
    required TResult Function() facebookSignIn,
    required TResult Function() facebookSignUp,
    required TResult Function(String email) recoverAccount,
    required TResult Function(String email, String password) onAuthenticate,
    required TResult Function(String email, String password) createAccount,
    required TResult Function(String userId, String username) registerUsername,
  }) {
    return facebookSignIn();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? logOut,
    TResult Function()? initialize,
    TResult Function()? googleSignIn,
    TResult Function()? googleSignUp,
    TResult Function()? twitterSignIn,
    TResult Function()? twitterSignUp,
    TResult Function()? facebookSignIn,
    TResult Function()? facebookSignUp,
    TResult Function(String email)? recoverAccount,
    TResult Function(String email, String password)? onAuthenticate,
    TResult Function(String email, String password)? createAccount,
    TResult Function(String userId, String username)? registerUsername,
  }) {
    return facebookSignIn?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? logOut,
    TResult Function()? initialize,
    TResult Function()? googleSignIn,
    TResult Function()? googleSignUp,
    TResult Function()? twitterSignIn,
    TResult Function()? twitterSignUp,
    TResult Function()? facebookSignIn,
    TResult Function()? facebookSignUp,
    TResult Function(String email)? recoverAccount,
    TResult Function(String email, String password)? onAuthenticate,
    TResult Function(String email, String password)? createAccount,
    TResult Function(String userId, String username)? registerUsername,
    required TResult orElse(),
  }) {
    if (facebookSignIn != null) {
      return facebookSignIn();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LogOut value) logOut,
    required TResult Function(_AppInitialized value) initialize,
    required TResult Function(_GoogleSignIn value) googleSignIn,
    required TResult Function(_GoogleSignUp value) googleSignUp,
    required TResult Function(_TwitterSignIn value) twitterSignIn,
    required TResult Function(_TwitterSignUp value) twitterSignUp,
    required TResult Function(_FacebookSignIn value) facebookSignIn,
    required TResult Function(_FacebookSignUp value) facebookSignUp,
    required TResult Function(_RecoverAccount value) recoverAccount,
    required TResult Function(_Authenticate value) onAuthenticate,
    required TResult Function(_CreateAccount value) createAccount,
    required TResult Function(_RegisterUsername value) registerUsername,
  }) {
    return facebookSignIn(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_LogOut value)? logOut,
    TResult Function(_AppInitialized value)? initialize,
    TResult Function(_GoogleSignIn value)? googleSignIn,
    TResult Function(_GoogleSignUp value)? googleSignUp,
    TResult Function(_TwitterSignIn value)? twitterSignIn,
    TResult Function(_TwitterSignUp value)? twitterSignUp,
    TResult Function(_FacebookSignIn value)? facebookSignIn,
    TResult Function(_FacebookSignUp value)? facebookSignUp,
    TResult Function(_RecoverAccount value)? recoverAccount,
    TResult Function(_Authenticate value)? onAuthenticate,
    TResult Function(_CreateAccount value)? createAccount,
    TResult Function(_RegisterUsername value)? registerUsername,
  }) {
    return facebookSignIn?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LogOut value)? logOut,
    TResult Function(_AppInitialized value)? initialize,
    TResult Function(_GoogleSignIn value)? googleSignIn,
    TResult Function(_GoogleSignUp value)? googleSignUp,
    TResult Function(_TwitterSignIn value)? twitterSignIn,
    TResult Function(_TwitterSignUp value)? twitterSignUp,
    TResult Function(_FacebookSignIn value)? facebookSignIn,
    TResult Function(_FacebookSignUp value)? facebookSignUp,
    TResult Function(_RecoverAccount value)? recoverAccount,
    TResult Function(_Authenticate value)? onAuthenticate,
    TResult Function(_CreateAccount value)? createAccount,
    TResult Function(_RegisterUsername value)? registerUsername,
    required TResult orElse(),
  }) {
    if (facebookSignIn != null) {
      return facebookSignIn(this);
    }
    return orElse();
  }
}

abstract class _FacebookSignIn implements AuthenticationEvent {
  const factory _FacebookSignIn() = _$_FacebookSignIn;
}

/// @nodoc
abstract class _$FacebookSignUpCopyWith<$Res> {
  factory _$FacebookSignUpCopyWith(
          _FacebookSignUp value, $Res Function(_FacebookSignUp) then) =
      __$FacebookSignUpCopyWithImpl<$Res>;
}

/// @nodoc
class __$FacebookSignUpCopyWithImpl<$Res>
    extends _$AuthenticationEventCopyWithImpl<$Res>
    implements _$FacebookSignUpCopyWith<$Res> {
  __$FacebookSignUpCopyWithImpl(
      _FacebookSignUp _value, $Res Function(_FacebookSignUp) _then)
      : super(_value, (v) => _then(v as _FacebookSignUp));

  @override
  _FacebookSignUp get _value => super._value as _FacebookSignUp;
}

/// @nodoc

class _$_FacebookSignUp implements _FacebookSignUp {
  const _$_FacebookSignUp();

  @override
  String toString() {
    return 'AuthenticationEvent.facebookSignUp()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _FacebookSignUp);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() logOut,
    required TResult Function() initialize,
    required TResult Function() googleSignIn,
    required TResult Function() googleSignUp,
    required TResult Function() twitterSignIn,
    required TResult Function() twitterSignUp,
    required TResult Function() facebookSignIn,
    required TResult Function() facebookSignUp,
    required TResult Function(String email) recoverAccount,
    required TResult Function(String email, String password) onAuthenticate,
    required TResult Function(String email, String password) createAccount,
    required TResult Function(String userId, String username) registerUsername,
  }) {
    return facebookSignUp();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? logOut,
    TResult Function()? initialize,
    TResult Function()? googleSignIn,
    TResult Function()? googleSignUp,
    TResult Function()? twitterSignIn,
    TResult Function()? twitterSignUp,
    TResult Function()? facebookSignIn,
    TResult Function()? facebookSignUp,
    TResult Function(String email)? recoverAccount,
    TResult Function(String email, String password)? onAuthenticate,
    TResult Function(String email, String password)? createAccount,
    TResult Function(String userId, String username)? registerUsername,
  }) {
    return facebookSignUp?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? logOut,
    TResult Function()? initialize,
    TResult Function()? googleSignIn,
    TResult Function()? googleSignUp,
    TResult Function()? twitterSignIn,
    TResult Function()? twitterSignUp,
    TResult Function()? facebookSignIn,
    TResult Function()? facebookSignUp,
    TResult Function(String email)? recoverAccount,
    TResult Function(String email, String password)? onAuthenticate,
    TResult Function(String email, String password)? createAccount,
    TResult Function(String userId, String username)? registerUsername,
    required TResult orElse(),
  }) {
    if (facebookSignUp != null) {
      return facebookSignUp();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LogOut value) logOut,
    required TResult Function(_AppInitialized value) initialize,
    required TResult Function(_GoogleSignIn value) googleSignIn,
    required TResult Function(_GoogleSignUp value) googleSignUp,
    required TResult Function(_TwitterSignIn value) twitterSignIn,
    required TResult Function(_TwitterSignUp value) twitterSignUp,
    required TResult Function(_FacebookSignIn value) facebookSignIn,
    required TResult Function(_FacebookSignUp value) facebookSignUp,
    required TResult Function(_RecoverAccount value) recoverAccount,
    required TResult Function(_Authenticate value) onAuthenticate,
    required TResult Function(_CreateAccount value) createAccount,
    required TResult Function(_RegisterUsername value) registerUsername,
  }) {
    return facebookSignUp(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_LogOut value)? logOut,
    TResult Function(_AppInitialized value)? initialize,
    TResult Function(_GoogleSignIn value)? googleSignIn,
    TResult Function(_GoogleSignUp value)? googleSignUp,
    TResult Function(_TwitterSignIn value)? twitterSignIn,
    TResult Function(_TwitterSignUp value)? twitterSignUp,
    TResult Function(_FacebookSignIn value)? facebookSignIn,
    TResult Function(_FacebookSignUp value)? facebookSignUp,
    TResult Function(_RecoverAccount value)? recoverAccount,
    TResult Function(_Authenticate value)? onAuthenticate,
    TResult Function(_CreateAccount value)? createAccount,
    TResult Function(_RegisterUsername value)? registerUsername,
  }) {
    return facebookSignUp?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LogOut value)? logOut,
    TResult Function(_AppInitialized value)? initialize,
    TResult Function(_GoogleSignIn value)? googleSignIn,
    TResult Function(_GoogleSignUp value)? googleSignUp,
    TResult Function(_TwitterSignIn value)? twitterSignIn,
    TResult Function(_TwitterSignUp value)? twitterSignUp,
    TResult Function(_FacebookSignIn value)? facebookSignIn,
    TResult Function(_FacebookSignUp value)? facebookSignUp,
    TResult Function(_RecoverAccount value)? recoverAccount,
    TResult Function(_Authenticate value)? onAuthenticate,
    TResult Function(_CreateAccount value)? createAccount,
    TResult Function(_RegisterUsername value)? registerUsername,
    required TResult orElse(),
  }) {
    if (facebookSignUp != null) {
      return facebookSignUp(this);
    }
    return orElse();
  }
}

abstract class _FacebookSignUp implements AuthenticationEvent {
  const factory _FacebookSignUp() = _$_FacebookSignUp;
}

/// @nodoc
abstract class _$RecoverAccountCopyWith<$Res> {
  factory _$RecoverAccountCopyWith(
          _RecoverAccount value, $Res Function(_RecoverAccount) then) =
      __$RecoverAccountCopyWithImpl<$Res>;
  $Res call({String email});
}

/// @nodoc
class __$RecoverAccountCopyWithImpl<$Res>
    extends _$AuthenticationEventCopyWithImpl<$Res>
    implements _$RecoverAccountCopyWith<$Res> {
  __$RecoverAccountCopyWithImpl(
      _RecoverAccount _value, $Res Function(_RecoverAccount) _then)
      : super(_value, (v) => _then(v as _RecoverAccount));

  @override
  _RecoverAccount get _value => super._value as _RecoverAccount;

  @override
  $Res call({
    Object? email = freezed,
  }) {
    return _then(_RecoverAccount(
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_RecoverAccount implements _RecoverAccount {
  const _$_RecoverAccount({required this.email});

  @override
  final String email;

  @override
  String toString() {
    return 'AuthenticationEvent.recoverAccount(email: $email)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RecoverAccount &&
            const DeepCollectionEquality().equals(other.email, email));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(email));

  @JsonKey(ignore: true)
  @override
  _$RecoverAccountCopyWith<_RecoverAccount> get copyWith =>
      __$RecoverAccountCopyWithImpl<_RecoverAccount>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() logOut,
    required TResult Function() initialize,
    required TResult Function() googleSignIn,
    required TResult Function() googleSignUp,
    required TResult Function() twitterSignIn,
    required TResult Function() twitterSignUp,
    required TResult Function() facebookSignIn,
    required TResult Function() facebookSignUp,
    required TResult Function(String email) recoverAccount,
    required TResult Function(String email, String password) onAuthenticate,
    required TResult Function(String email, String password) createAccount,
    required TResult Function(String userId, String username) registerUsername,
  }) {
    return recoverAccount(email);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? logOut,
    TResult Function()? initialize,
    TResult Function()? googleSignIn,
    TResult Function()? googleSignUp,
    TResult Function()? twitterSignIn,
    TResult Function()? twitterSignUp,
    TResult Function()? facebookSignIn,
    TResult Function()? facebookSignUp,
    TResult Function(String email)? recoverAccount,
    TResult Function(String email, String password)? onAuthenticate,
    TResult Function(String email, String password)? createAccount,
    TResult Function(String userId, String username)? registerUsername,
  }) {
    return recoverAccount?.call(email);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? logOut,
    TResult Function()? initialize,
    TResult Function()? googleSignIn,
    TResult Function()? googleSignUp,
    TResult Function()? twitterSignIn,
    TResult Function()? twitterSignUp,
    TResult Function()? facebookSignIn,
    TResult Function()? facebookSignUp,
    TResult Function(String email)? recoverAccount,
    TResult Function(String email, String password)? onAuthenticate,
    TResult Function(String email, String password)? createAccount,
    TResult Function(String userId, String username)? registerUsername,
    required TResult orElse(),
  }) {
    if (recoverAccount != null) {
      return recoverAccount(email);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LogOut value) logOut,
    required TResult Function(_AppInitialized value) initialize,
    required TResult Function(_GoogleSignIn value) googleSignIn,
    required TResult Function(_GoogleSignUp value) googleSignUp,
    required TResult Function(_TwitterSignIn value) twitterSignIn,
    required TResult Function(_TwitterSignUp value) twitterSignUp,
    required TResult Function(_FacebookSignIn value) facebookSignIn,
    required TResult Function(_FacebookSignUp value) facebookSignUp,
    required TResult Function(_RecoverAccount value) recoverAccount,
    required TResult Function(_Authenticate value) onAuthenticate,
    required TResult Function(_CreateAccount value) createAccount,
    required TResult Function(_RegisterUsername value) registerUsername,
  }) {
    return recoverAccount(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_LogOut value)? logOut,
    TResult Function(_AppInitialized value)? initialize,
    TResult Function(_GoogleSignIn value)? googleSignIn,
    TResult Function(_GoogleSignUp value)? googleSignUp,
    TResult Function(_TwitterSignIn value)? twitterSignIn,
    TResult Function(_TwitterSignUp value)? twitterSignUp,
    TResult Function(_FacebookSignIn value)? facebookSignIn,
    TResult Function(_FacebookSignUp value)? facebookSignUp,
    TResult Function(_RecoverAccount value)? recoverAccount,
    TResult Function(_Authenticate value)? onAuthenticate,
    TResult Function(_CreateAccount value)? createAccount,
    TResult Function(_RegisterUsername value)? registerUsername,
  }) {
    return recoverAccount?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LogOut value)? logOut,
    TResult Function(_AppInitialized value)? initialize,
    TResult Function(_GoogleSignIn value)? googleSignIn,
    TResult Function(_GoogleSignUp value)? googleSignUp,
    TResult Function(_TwitterSignIn value)? twitterSignIn,
    TResult Function(_TwitterSignUp value)? twitterSignUp,
    TResult Function(_FacebookSignIn value)? facebookSignIn,
    TResult Function(_FacebookSignUp value)? facebookSignUp,
    TResult Function(_RecoverAccount value)? recoverAccount,
    TResult Function(_Authenticate value)? onAuthenticate,
    TResult Function(_CreateAccount value)? createAccount,
    TResult Function(_RegisterUsername value)? registerUsername,
    required TResult orElse(),
  }) {
    if (recoverAccount != null) {
      return recoverAccount(this);
    }
    return orElse();
  }
}

abstract class _RecoverAccount implements AuthenticationEvent {
  const factory _RecoverAccount({required String email}) = _$_RecoverAccount;

  String get email;
  @JsonKey(ignore: true)
  _$RecoverAccountCopyWith<_RecoverAccount> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$AuthenticateCopyWith<$Res> {
  factory _$AuthenticateCopyWith(
          _Authenticate value, $Res Function(_Authenticate) then) =
      __$AuthenticateCopyWithImpl<$Res>;
  $Res call({String email, String password});
}

/// @nodoc
class __$AuthenticateCopyWithImpl<$Res>
    extends _$AuthenticationEventCopyWithImpl<$Res>
    implements _$AuthenticateCopyWith<$Res> {
  __$AuthenticateCopyWithImpl(
      _Authenticate _value, $Res Function(_Authenticate) _then)
      : super(_value, (v) => _then(v as _Authenticate));

  @override
  _Authenticate get _value => super._value as _Authenticate;

  @override
  $Res call({
    Object? email = freezed,
    Object? password = freezed,
  }) {
    return _then(_Authenticate(
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Authenticate implements _Authenticate {
  const _$_Authenticate({required this.email, required this.password});

  @override
  final String email;
  @override
  final String password;

  @override
  String toString() {
    return 'AuthenticationEvent.onAuthenticate(email: $email, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Authenticate &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.password, password));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(password));

  @JsonKey(ignore: true)
  @override
  _$AuthenticateCopyWith<_Authenticate> get copyWith =>
      __$AuthenticateCopyWithImpl<_Authenticate>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() logOut,
    required TResult Function() initialize,
    required TResult Function() googleSignIn,
    required TResult Function() googleSignUp,
    required TResult Function() twitterSignIn,
    required TResult Function() twitterSignUp,
    required TResult Function() facebookSignIn,
    required TResult Function() facebookSignUp,
    required TResult Function(String email) recoverAccount,
    required TResult Function(String email, String password) onAuthenticate,
    required TResult Function(String email, String password) createAccount,
    required TResult Function(String userId, String username) registerUsername,
  }) {
    return onAuthenticate(email, password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? logOut,
    TResult Function()? initialize,
    TResult Function()? googleSignIn,
    TResult Function()? googleSignUp,
    TResult Function()? twitterSignIn,
    TResult Function()? twitterSignUp,
    TResult Function()? facebookSignIn,
    TResult Function()? facebookSignUp,
    TResult Function(String email)? recoverAccount,
    TResult Function(String email, String password)? onAuthenticate,
    TResult Function(String email, String password)? createAccount,
    TResult Function(String userId, String username)? registerUsername,
  }) {
    return onAuthenticate?.call(email, password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? logOut,
    TResult Function()? initialize,
    TResult Function()? googleSignIn,
    TResult Function()? googleSignUp,
    TResult Function()? twitterSignIn,
    TResult Function()? twitterSignUp,
    TResult Function()? facebookSignIn,
    TResult Function()? facebookSignUp,
    TResult Function(String email)? recoverAccount,
    TResult Function(String email, String password)? onAuthenticate,
    TResult Function(String email, String password)? createAccount,
    TResult Function(String userId, String username)? registerUsername,
    required TResult orElse(),
  }) {
    if (onAuthenticate != null) {
      return onAuthenticate(email, password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LogOut value) logOut,
    required TResult Function(_AppInitialized value) initialize,
    required TResult Function(_GoogleSignIn value) googleSignIn,
    required TResult Function(_GoogleSignUp value) googleSignUp,
    required TResult Function(_TwitterSignIn value) twitterSignIn,
    required TResult Function(_TwitterSignUp value) twitterSignUp,
    required TResult Function(_FacebookSignIn value) facebookSignIn,
    required TResult Function(_FacebookSignUp value) facebookSignUp,
    required TResult Function(_RecoverAccount value) recoverAccount,
    required TResult Function(_Authenticate value) onAuthenticate,
    required TResult Function(_CreateAccount value) createAccount,
    required TResult Function(_RegisterUsername value) registerUsername,
  }) {
    return onAuthenticate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_LogOut value)? logOut,
    TResult Function(_AppInitialized value)? initialize,
    TResult Function(_GoogleSignIn value)? googleSignIn,
    TResult Function(_GoogleSignUp value)? googleSignUp,
    TResult Function(_TwitterSignIn value)? twitterSignIn,
    TResult Function(_TwitterSignUp value)? twitterSignUp,
    TResult Function(_FacebookSignIn value)? facebookSignIn,
    TResult Function(_FacebookSignUp value)? facebookSignUp,
    TResult Function(_RecoverAccount value)? recoverAccount,
    TResult Function(_Authenticate value)? onAuthenticate,
    TResult Function(_CreateAccount value)? createAccount,
    TResult Function(_RegisterUsername value)? registerUsername,
  }) {
    return onAuthenticate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LogOut value)? logOut,
    TResult Function(_AppInitialized value)? initialize,
    TResult Function(_GoogleSignIn value)? googleSignIn,
    TResult Function(_GoogleSignUp value)? googleSignUp,
    TResult Function(_TwitterSignIn value)? twitterSignIn,
    TResult Function(_TwitterSignUp value)? twitterSignUp,
    TResult Function(_FacebookSignIn value)? facebookSignIn,
    TResult Function(_FacebookSignUp value)? facebookSignUp,
    TResult Function(_RecoverAccount value)? recoverAccount,
    TResult Function(_Authenticate value)? onAuthenticate,
    TResult Function(_CreateAccount value)? createAccount,
    TResult Function(_RegisterUsername value)? registerUsername,
    required TResult orElse(),
  }) {
    if (onAuthenticate != null) {
      return onAuthenticate(this);
    }
    return orElse();
  }
}

abstract class _Authenticate implements AuthenticationEvent {
  const factory _Authenticate(
      {required String email, required String password}) = _$_Authenticate;

  String get email;
  String get password;
  @JsonKey(ignore: true)
  _$AuthenticateCopyWith<_Authenticate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$CreateAccountCopyWith<$Res> {
  factory _$CreateAccountCopyWith(
          _CreateAccount value, $Res Function(_CreateAccount) then) =
      __$CreateAccountCopyWithImpl<$Res>;
  $Res call({String email, String password});
}

/// @nodoc
class __$CreateAccountCopyWithImpl<$Res>
    extends _$AuthenticationEventCopyWithImpl<$Res>
    implements _$CreateAccountCopyWith<$Res> {
  __$CreateAccountCopyWithImpl(
      _CreateAccount _value, $Res Function(_CreateAccount) _then)
      : super(_value, (v) => _then(v as _CreateAccount));

  @override
  _CreateAccount get _value => super._value as _CreateAccount;

  @override
  $Res call({
    Object? email = freezed,
    Object? password = freezed,
  }) {
    return _then(_CreateAccount(
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_CreateAccount implements _CreateAccount {
  const _$_CreateAccount({required this.email, required this.password});

  @override
  final String email;
  @override
  final String password;

  @override
  String toString() {
    return 'AuthenticationEvent.createAccount(email: $email, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CreateAccount &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.password, password));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(password));

  @JsonKey(ignore: true)
  @override
  _$CreateAccountCopyWith<_CreateAccount> get copyWith =>
      __$CreateAccountCopyWithImpl<_CreateAccount>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() logOut,
    required TResult Function() initialize,
    required TResult Function() googleSignIn,
    required TResult Function() googleSignUp,
    required TResult Function() twitterSignIn,
    required TResult Function() twitterSignUp,
    required TResult Function() facebookSignIn,
    required TResult Function() facebookSignUp,
    required TResult Function(String email) recoverAccount,
    required TResult Function(String email, String password) onAuthenticate,
    required TResult Function(String email, String password) createAccount,
    required TResult Function(String userId, String username) registerUsername,
  }) {
    return createAccount(email, password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? logOut,
    TResult Function()? initialize,
    TResult Function()? googleSignIn,
    TResult Function()? googleSignUp,
    TResult Function()? twitterSignIn,
    TResult Function()? twitterSignUp,
    TResult Function()? facebookSignIn,
    TResult Function()? facebookSignUp,
    TResult Function(String email)? recoverAccount,
    TResult Function(String email, String password)? onAuthenticate,
    TResult Function(String email, String password)? createAccount,
    TResult Function(String userId, String username)? registerUsername,
  }) {
    return createAccount?.call(email, password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? logOut,
    TResult Function()? initialize,
    TResult Function()? googleSignIn,
    TResult Function()? googleSignUp,
    TResult Function()? twitterSignIn,
    TResult Function()? twitterSignUp,
    TResult Function()? facebookSignIn,
    TResult Function()? facebookSignUp,
    TResult Function(String email)? recoverAccount,
    TResult Function(String email, String password)? onAuthenticate,
    TResult Function(String email, String password)? createAccount,
    TResult Function(String userId, String username)? registerUsername,
    required TResult orElse(),
  }) {
    if (createAccount != null) {
      return createAccount(email, password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LogOut value) logOut,
    required TResult Function(_AppInitialized value) initialize,
    required TResult Function(_GoogleSignIn value) googleSignIn,
    required TResult Function(_GoogleSignUp value) googleSignUp,
    required TResult Function(_TwitterSignIn value) twitterSignIn,
    required TResult Function(_TwitterSignUp value) twitterSignUp,
    required TResult Function(_FacebookSignIn value) facebookSignIn,
    required TResult Function(_FacebookSignUp value) facebookSignUp,
    required TResult Function(_RecoverAccount value) recoverAccount,
    required TResult Function(_Authenticate value) onAuthenticate,
    required TResult Function(_CreateAccount value) createAccount,
    required TResult Function(_RegisterUsername value) registerUsername,
  }) {
    return createAccount(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_LogOut value)? logOut,
    TResult Function(_AppInitialized value)? initialize,
    TResult Function(_GoogleSignIn value)? googleSignIn,
    TResult Function(_GoogleSignUp value)? googleSignUp,
    TResult Function(_TwitterSignIn value)? twitterSignIn,
    TResult Function(_TwitterSignUp value)? twitterSignUp,
    TResult Function(_FacebookSignIn value)? facebookSignIn,
    TResult Function(_FacebookSignUp value)? facebookSignUp,
    TResult Function(_RecoverAccount value)? recoverAccount,
    TResult Function(_Authenticate value)? onAuthenticate,
    TResult Function(_CreateAccount value)? createAccount,
    TResult Function(_RegisterUsername value)? registerUsername,
  }) {
    return createAccount?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LogOut value)? logOut,
    TResult Function(_AppInitialized value)? initialize,
    TResult Function(_GoogleSignIn value)? googleSignIn,
    TResult Function(_GoogleSignUp value)? googleSignUp,
    TResult Function(_TwitterSignIn value)? twitterSignIn,
    TResult Function(_TwitterSignUp value)? twitterSignUp,
    TResult Function(_FacebookSignIn value)? facebookSignIn,
    TResult Function(_FacebookSignUp value)? facebookSignUp,
    TResult Function(_RecoverAccount value)? recoverAccount,
    TResult Function(_Authenticate value)? onAuthenticate,
    TResult Function(_CreateAccount value)? createAccount,
    TResult Function(_RegisterUsername value)? registerUsername,
    required TResult orElse(),
  }) {
    if (createAccount != null) {
      return createAccount(this);
    }
    return orElse();
  }
}

abstract class _CreateAccount implements AuthenticationEvent {
  const factory _CreateAccount(
      {required String email, required String password}) = _$_CreateAccount;

  String get email;
  String get password;
  @JsonKey(ignore: true)
  _$CreateAccountCopyWith<_CreateAccount> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$RegisterUsernameCopyWith<$Res> {
  factory _$RegisterUsernameCopyWith(
          _RegisterUsername value, $Res Function(_RegisterUsername) then) =
      __$RegisterUsernameCopyWithImpl<$Res>;
  $Res call({String userId, String username});
}

/// @nodoc
class __$RegisterUsernameCopyWithImpl<$Res>
    extends _$AuthenticationEventCopyWithImpl<$Res>
    implements _$RegisterUsernameCopyWith<$Res> {
  __$RegisterUsernameCopyWithImpl(
      _RegisterUsername _value, $Res Function(_RegisterUsername) _then)
      : super(_value, (v) => _then(v as _RegisterUsername));

  @override
  _RegisterUsername get _value => super._value as _RegisterUsername;

  @override
  $Res call({
    Object? userId = freezed,
    Object? username = freezed,
  }) {
    return _then(_RegisterUsername(
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_RegisterUsername implements _RegisterUsername {
  const _$_RegisterUsername({required this.userId, required this.username});

  @override
  final String userId;
  @override
  final String username;

  @override
  String toString() {
    return 'AuthenticationEvent.registerUsername(userId: $userId, username: $username)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RegisterUsername &&
            const DeepCollectionEquality().equals(other.userId, userId) &&
            const DeepCollectionEquality().equals(other.username, username));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(userId),
      const DeepCollectionEquality().hash(username));

  @JsonKey(ignore: true)
  @override
  _$RegisterUsernameCopyWith<_RegisterUsername> get copyWith =>
      __$RegisterUsernameCopyWithImpl<_RegisterUsername>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() logOut,
    required TResult Function() initialize,
    required TResult Function() googleSignIn,
    required TResult Function() googleSignUp,
    required TResult Function() twitterSignIn,
    required TResult Function() twitterSignUp,
    required TResult Function() facebookSignIn,
    required TResult Function() facebookSignUp,
    required TResult Function(String email) recoverAccount,
    required TResult Function(String email, String password) onAuthenticate,
    required TResult Function(String email, String password) createAccount,
    required TResult Function(String userId, String username) registerUsername,
  }) {
    return registerUsername(userId, username);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? logOut,
    TResult Function()? initialize,
    TResult Function()? googleSignIn,
    TResult Function()? googleSignUp,
    TResult Function()? twitterSignIn,
    TResult Function()? twitterSignUp,
    TResult Function()? facebookSignIn,
    TResult Function()? facebookSignUp,
    TResult Function(String email)? recoverAccount,
    TResult Function(String email, String password)? onAuthenticate,
    TResult Function(String email, String password)? createAccount,
    TResult Function(String userId, String username)? registerUsername,
  }) {
    return registerUsername?.call(userId, username);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? logOut,
    TResult Function()? initialize,
    TResult Function()? googleSignIn,
    TResult Function()? googleSignUp,
    TResult Function()? twitterSignIn,
    TResult Function()? twitterSignUp,
    TResult Function()? facebookSignIn,
    TResult Function()? facebookSignUp,
    TResult Function(String email)? recoverAccount,
    TResult Function(String email, String password)? onAuthenticate,
    TResult Function(String email, String password)? createAccount,
    TResult Function(String userId, String username)? registerUsername,
    required TResult orElse(),
  }) {
    if (registerUsername != null) {
      return registerUsername(userId, username);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LogOut value) logOut,
    required TResult Function(_AppInitialized value) initialize,
    required TResult Function(_GoogleSignIn value) googleSignIn,
    required TResult Function(_GoogleSignUp value) googleSignUp,
    required TResult Function(_TwitterSignIn value) twitterSignIn,
    required TResult Function(_TwitterSignUp value) twitterSignUp,
    required TResult Function(_FacebookSignIn value) facebookSignIn,
    required TResult Function(_FacebookSignUp value) facebookSignUp,
    required TResult Function(_RecoverAccount value) recoverAccount,
    required TResult Function(_Authenticate value) onAuthenticate,
    required TResult Function(_CreateAccount value) createAccount,
    required TResult Function(_RegisterUsername value) registerUsername,
  }) {
    return registerUsername(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_LogOut value)? logOut,
    TResult Function(_AppInitialized value)? initialize,
    TResult Function(_GoogleSignIn value)? googleSignIn,
    TResult Function(_GoogleSignUp value)? googleSignUp,
    TResult Function(_TwitterSignIn value)? twitterSignIn,
    TResult Function(_TwitterSignUp value)? twitterSignUp,
    TResult Function(_FacebookSignIn value)? facebookSignIn,
    TResult Function(_FacebookSignUp value)? facebookSignUp,
    TResult Function(_RecoverAccount value)? recoverAccount,
    TResult Function(_Authenticate value)? onAuthenticate,
    TResult Function(_CreateAccount value)? createAccount,
    TResult Function(_RegisterUsername value)? registerUsername,
  }) {
    return registerUsername?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LogOut value)? logOut,
    TResult Function(_AppInitialized value)? initialize,
    TResult Function(_GoogleSignIn value)? googleSignIn,
    TResult Function(_GoogleSignUp value)? googleSignUp,
    TResult Function(_TwitterSignIn value)? twitterSignIn,
    TResult Function(_TwitterSignUp value)? twitterSignUp,
    TResult Function(_FacebookSignIn value)? facebookSignIn,
    TResult Function(_FacebookSignUp value)? facebookSignUp,
    TResult Function(_RecoverAccount value)? recoverAccount,
    TResult Function(_Authenticate value)? onAuthenticate,
    TResult Function(_CreateAccount value)? createAccount,
    TResult Function(_RegisterUsername value)? registerUsername,
    required TResult orElse(),
  }) {
    if (registerUsername != null) {
      return registerUsername(this);
    }
    return orElse();
  }
}

abstract class _RegisterUsername implements AuthenticationEvent {
  const factory _RegisterUsername(
      {required String userId, required String username}) = _$_RegisterUsername;

  String get userId;
  String get username;
  @JsonKey(ignore: true)
  _$RegisterUsernameCopyWith<_RegisterUsername> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$AuthenticationStateTearOff {
  const _$AuthenticationStateTearOff();

  _AuthenticationState call(
      {UserModel? user,
      String error = '',
      AuthenticationStatus currentState = AuthenticationStatus.initial}) {
    return _AuthenticationState(
      user: user,
      error: error,
      currentState: currentState,
    );
  }
}

/// @nodoc
const $AuthenticationState = _$AuthenticationStateTearOff();

/// @nodoc
mixin _$AuthenticationState {
  UserModel? get user => throw _privateConstructorUsedError;
  String get error => throw _privateConstructorUsedError;
  AuthenticationStatus get currentState => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AuthenticationStateCopyWith<AuthenticationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthenticationStateCopyWith<$Res> {
  factory $AuthenticationStateCopyWith(
          AuthenticationState value, $Res Function(AuthenticationState) then) =
      _$AuthenticationStateCopyWithImpl<$Res>;
  $Res call({UserModel? user, String error, AuthenticationStatus currentState});

  $UserModelCopyWith<$Res>? get user;
}

/// @nodoc
class _$AuthenticationStateCopyWithImpl<$Res>
    implements $AuthenticationStateCopyWith<$Res> {
  _$AuthenticationStateCopyWithImpl(this._value, this._then);

  final AuthenticationState _value;
  // ignore: unused_field
  final $Res Function(AuthenticationState) _then;

  @override
  $Res call({
    Object? user = freezed,
    Object? error = freezed,
    Object? currentState = freezed,
  }) {
    return _then(_value.copyWith(
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
      currentState: currentState == freezed
          ? _value.currentState
          : currentState // ignore: cast_nullable_to_non_nullable
              as AuthenticationStatus,
    ));
  }

  @override
  $UserModelCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserModelCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc
abstract class _$AuthenticationStateCopyWith<$Res>
    implements $AuthenticationStateCopyWith<$Res> {
  factory _$AuthenticationStateCopyWith(_AuthenticationState value,
          $Res Function(_AuthenticationState) then) =
      __$AuthenticationStateCopyWithImpl<$Res>;
  @override
  $Res call({UserModel? user, String error, AuthenticationStatus currentState});

  @override
  $UserModelCopyWith<$Res>? get user;
}

/// @nodoc
class __$AuthenticationStateCopyWithImpl<$Res>
    extends _$AuthenticationStateCopyWithImpl<$Res>
    implements _$AuthenticationStateCopyWith<$Res> {
  __$AuthenticationStateCopyWithImpl(
      _AuthenticationState _value, $Res Function(_AuthenticationState) _then)
      : super(_value, (v) => _then(v as _AuthenticationState));

  @override
  _AuthenticationState get _value => super._value as _AuthenticationState;

  @override
  $Res call({
    Object? user = freezed,
    Object? error = freezed,
    Object? currentState = freezed,
  }) {
    return _then(_AuthenticationState(
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
      currentState: currentState == freezed
          ? _value.currentState
          : currentState // ignore: cast_nullable_to_non_nullable
              as AuthenticationStatus,
    ));
  }
}

/// @nodoc

class _$_AuthenticationState implements _AuthenticationState {
  const _$_AuthenticationState(
      {this.user,
      this.error = '',
      this.currentState = AuthenticationStatus.initial});

  @override
  final UserModel? user;
  @JsonKey()
  @override
  final String error;
  @JsonKey()
  @override
  final AuthenticationStatus currentState;

  @override
  String toString() {
    return 'AuthenticationState(user: $user, error: $error, currentState: $currentState)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AuthenticationState &&
            const DeepCollectionEquality().equals(other.user, user) &&
            const DeepCollectionEquality().equals(other.error, error) &&
            const DeepCollectionEquality()
                .equals(other.currentState, currentState));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(user),
      const DeepCollectionEquality().hash(error),
      const DeepCollectionEquality().hash(currentState));

  @JsonKey(ignore: true)
  @override
  _$AuthenticationStateCopyWith<_AuthenticationState> get copyWith =>
      __$AuthenticationStateCopyWithImpl<_AuthenticationState>(
          this, _$identity);
}

abstract class _AuthenticationState implements AuthenticationState {
  const factory _AuthenticationState(
      {UserModel? user,
      String error,
      AuthenticationStatus currentState}) = _$_AuthenticationState;

  @override
  UserModel? get user;
  @override
  String get error;
  @override
  AuthenticationStatus get currentState;
  @override
  @JsonKey(ignore: true)
  _$AuthenticationStateCopyWith<_AuthenticationState> get copyWith =>
      throw _privateConstructorUsedError;
}
