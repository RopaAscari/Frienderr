// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'notification_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$NotificationEventTearOff {
  const _$NotificationEventTearOff();

  _SendLikeNotification sendLikeNotification(
      {required NotificationEntity notification}) {
    return _SendLikeNotification(
      notification: notification,
    );
  }

  _SendCommentNotification sendCommentNotification(
      {required NotificationEntity notification}) {
    return _SendCommentNotification(
      notification: notification,
    );
  }

  _SendFollowNotification sendFollowNotification(
      {required NotificationEntity notification}) {
    return _SendFollowNotification(
      notification: notification,
    );
  }

  _GetNotifications getNotifications({required String uid}) {
    return _GetNotifications(
      uid: uid,
    );
  }
}

/// @nodoc
const $NotificationEvent = _$NotificationEventTearOff();

/// @nodoc
mixin _$NotificationEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(NotificationEntity notification)
        sendLikeNotification,
    required TResult Function(NotificationEntity notification)
        sendCommentNotification,
    required TResult Function(NotificationEntity notification)
        sendFollowNotification,
    required TResult Function(String uid) getNotifications,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(NotificationEntity notification)? sendLikeNotification,
    TResult Function(NotificationEntity notification)? sendCommentNotification,
    TResult Function(NotificationEntity notification)? sendFollowNotification,
    TResult Function(String uid)? getNotifications,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(NotificationEntity notification)? sendLikeNotification,
    TResult Function(NotificationEntity notification)? sendCommentNotification,
    TResult Function(NotificationEntity notification)? sendFollowNotification,
    TResult Function(String uid)? getNotifications,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SendLikeNotification value) sendLikeNotification,
    required TResult Function(_SendCommentNotification value)
        sendCommentNotification,
    required TResult Function(_SendFollowNotification value)
        sendFollowNotification,
    required TResult Function(_GetNotifications value) getNotifications,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SendLikeNotification value)? sendLikeNotification,
    TResult Function(_SendCommentNotification value)? sendCommentNotification,
    TResult Function(_SendFollowNotification value)? sendFollowNotification,
    TResult Function(_GetNotifications value)? getNotifications,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SendLikeNotification value)? sendLikeNotification,
    TResult Function(_SendCommentNotification value)? sendCommentNotification,
    TResult Function(_SendFollowNotification value)? sendFollowNotification,
    TResult Function(_GetNotifications value)? getNotifications,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationEventCopyWith<$Res> {
  factory $NotificationEventCopyWith(
          NotificationEvent value, $Res Function(NotificationEvent) then) =
      _$NotificationEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$NotificationEventCopyWithImpl<$Res>
    implements $NotificationEventCopyWith<$Res> {
  _$NotificationEventCopyWithImpl(this._value, this._then);

  final NotificationEvent _value;
  // ignore: unused_field
  final $Res Function(NotificationEvent) _then;
}

/// @nodoc
abstract class _$SendLikeNotificationCopyWith<$Res> {
  factory _$SendLikeNotificationCopyWith(_SendLikeNotification value,
          $Res Function(_SendLikeNotification) then) =
      __$SendLikeNotificationCopyWithImpl<$Res>;
  $Res call({NotificationEntity notification});
}

/// @nodoc
class __$SendLikeNotificationCopyWithImpl<$Res>
    extends _$NotificationEventCopyWithImpl<$Res>
    implements _$SendLikeNotificationCopyWith<$Res> {
  __$SendLikeNotificationCopyWithImpl(
      _SendLikeNotification _value, $Res Function(_SendLikeNotification) _then)
      : super(_value, (v) => _then(v as _SendLikeNotification));

  @override
  _SendLikeNotification get _value => super._value as _SendLikeNotification;

  @override
  $Res call({
    Object? notification = freezed,
  }) {
    return _then(_SendLikeNotification(
      notification: notification == freezed
          ? _value.notification
          : notification // ignore: cast_nullable_to_non_nullable
              as NotificationEntity,
    ));
  }
}

/// @nodoc

class _$_SendLikeNotification implements _SendLikeNotification {
  const _$_SendLikeNotification({required this.notification});

  @override
  final NotificationEntity notification;

  @override
  String toString() {
    return 'NotificationEvent.sendLikeNotification(notification: $notification)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SendLikeNotification &&
            const DeepCollectionEquality()
                .equals(other.notification, notification));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(notification));

  @JsonKey(ignore: true)
  @override
  _$SendLikeNotificationCopyWith<_SendLikeNotification> get copyWith =>
      __$SendLikeNotificationCopyWithImpl<_SendLikeNotification>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(NotificationEntity notification)
        sendLikeNotification,
    required TResult Function(NotificationEntity notification)
        sendCommentNotification,
    required TResult Function(NotificationEntity notification)
        sendFollowNotification,
    required TResult Function(String uid) getNotifications,
  }) {
    return sendLikeNotification(notification);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(NotificationEntity notification)? sendLikeNotification,
    TResult Function(NotificationEntity notification)? sendCommentNotification,
    TResult Function(NotificationEntity notification)? sendFollowNotification,
    TResult Function(String uid)? getNotifications,
  }) {
    return sendLikeNotification?.call(notification);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(NotificationEntity notification)? sendLikeNotification,
    TResult Function(NotificationEntity notification)? sendCommentNotification,
    TResult Function(NotificationEntity notification)? sendFollowNotification,
    TResult Function(String uid)? getNotifications,
    required TResult orElse(),
  }) {
    if (sendLikeNotification != null) {
      return sendLikeNotification(notification);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SendLikeNotification value) sendLikeNotification,
    required TResult Function(_SendCommentNotification value)
        sendCommentNotification,
    required TResult Function(_SendFollowNotification value)
        sendFollowNotification,
    required TResult Function(_GetNotifications value) getNotifications,
  }) {
    return sendLikeNotification(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SendLikeNotification value)? sendLikeNotification,
    TResult Function(_SendCommentNotification value)? sendCommentNotification,
    TResult Function(_SendFollowNotification value)? sendFollowNotification,
    TResult Function(_GetNotifications value)? getNotifications,
  }) {
    return sendLikeNotification?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SendLikeNotification value)? sendLikeNotification,
    TResult Function(_SendCommentNotification value)? sendCommentNotification,
    TResult Function(_SendFollowNotification value)? sendFollowNotification,
    TResult Function(_GetNotifications value)? getNotifications,
    required TResult orElse(),
  }) {
    if (sendLikeNotification != null) {
      return sendLikeNotification(this);
    }
    return orElse();
  }
}

abstract class _SendLikeNotification implements NotificationEvent {
  const factory _SendLikeNotification(
      {required NotificationEntity notification}) = _$_SendLikeNotification;

  NotificationEntity get notification;
  @JsonKey(ignore: true)
  _$SendLikeNotificationCopyWith<_SendLikeNotification> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$SendCommentNotificationCopyWith<$Res> {
  factory _$SendCommentNotificationCopyWith(_SendCommentNotification value,
          $Res Function(_SendCommentNotification) then) =
      __$SendCommentNotificationCopyWithImpl<$Res>;
  $Res call({NotificationEntity notification});
}

/// @nodoc
class __$SendCommentNotificationCopyWithImpl<$Res>
    extends _$NotificationEventCopyWithImpl<$Res>
    implements _$SendCommentNotificationCopyWith<$Res> {
  __$SendCommentNotificationCopyWithImpl(_SendCommentNotification _value,
      $Res Function(_SendCommentNotification) _then)
      : super(_value, (v) => _then(v as _SendCommentNotification));

  @override
  _SendCommentNotification get _value =>
      super._value as _SendCommentNotification;

  @override
  $Res call({
    Object? notification = freezed,
  }) {
    return _then(_SendCommentNotification(
      notification: notification == freezed
          ? _value.notification
          : notification // ignore: cast_nullable_to_non_nullable
              as NotificationEntity,
    ));
  }
}

/// @nodoc

class _$_SendCommentNotification implements _SendCommentNotification {
  const _$_SendCommentNotification({required this.notification});

  @override
  final NotificationEntity notification;

  @override
  String toString() {
    return 'NotificationEvent.sendCommentNotification(notification: $notification)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SendCommentNotification &&
            const DeepCollectionEquality()
                .equals(other.notification, notification));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(notification));

  @JsonKey(ignore: true)
  @override
  _$SendCommentNotificationCopyWith<_SendCommentNotification> get copyWith =>
      __$SendCommentNotificationCopyWithImpl<_SendCommentNotification>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(NotificationEntity notification)
        sendLikeNotification,
    required TResult Function(NotificationEntity notification)
        sendCommentNotification,
    required TResult Function(NotificationEntity notification)
        sendFollowNotification,
    required TResult Function(String uid) getNotifications,
  }) {
    return sendCommentNotification(notification);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(NotificationEntity notification)? sendLikeNotification,
    TResult Function(NotificationEntity notification)? sendCommentNotification,
    TResult Function(NotificationEntity notification)? sendFollowNotification,
    TResult Function(String uid)? getNotifications,
  }) {
    return sendCommentNotification?.call(notification);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(NotificationEntity notification)? sendLikeNotification,
    TResult Function(NotificationEntity notification)? sendCommentNotification,
    TResult Function(NotificationEntity notification)? sendFollowNotification,
    TResult Function(String uid)? getNotifications,
    required TResult orElse(),
  }) {
    if (sendCommentNotification != null) {
      return sendCommentNotification(notification);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SendLikeNotification value) sendLikeNotification,
    required TResult Function(_SendCommentNotification value)
        sendCommentNotification,
    required TResult Function(_SendFollowNotification value)
        sendFollowNotification,
    required TResult Function(_GetNotifications value) getNotifications,
  }) {
    return sendCommentNotification(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SendLikeNotification value)? sendLikeNotification,
    TResult Function(_SendCommentNotification value)? sendCommentNotification,
    TResult Function(_SendFollowNotification value)? sendFollowNotification,
    TResult Function(_GetNotifications value)? getNotifications,
  }) {
    return sendCommentNotification?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SendLikeNotification value)? sendLikeNotification,
    TResult Function(_SendCommentNotification value)? sendCommentNotification,
    TResult Function(_SendFollowNotification value)? sendFollowNotification,
    TResult Function(_GetNotifications value)? getNotifications,
    required TResult orElse(),
  }) {
    if (sendCommentNotification != null) {
      return sendCommentNotification(this);
    }
    return orElse();
  }
}

abstract class _SendCommentNotification implements NotificationEvent {
  const factory _SendCommentNotification(
      {required NotificationEntity notification}) = _$_SendCommentNotification;

  NotificationEntity get notification;
  @JsonKey(ignore: true)
  _$SendCommentNotificationCopyWith<_SendCommentNotification> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$SendFollowNotificationCopyWith<$Res> {
  factory _$SendFollowNotificationCopyWith(_SendFollowNotification value,
          $Res Function(_SendFollowNotification) then) =
      __$SendFollowNotificationCopyWithImpl<$Res>;
  $Res call({NotificationEntity notification});
}

/// @nodoc
class __$SendFollowNotificationCopyWithImpl<$Res>
    extends _$NotificationEventCopyWithImpl<$Res>
    implements _$SendFollowNotificationCopyWith<$Res> {
  __$SendFollowNotificationCopyWithImpl(_SendFollowNotification _value,
      $Res Function(_SendFollowNotification) _then)
      : super(_value, (v) => _then(v as _SendFollowNotification));

  @override
  _SendFollowNotification get _value => super._value as _SendFollowNotification;

  @override
  $Res call({
    Object? notification = freezed,
  }) {
    return _then(_SendFollowNotification(
      notification: notification == freezed
          ? _value.notification
          : notification // ignore: cast_nullable_to_non_nullable
              as NotificationEntity,
    ));
  }
}

/// @nodoc

class _$_SendFollowNotification implements _SendFollowNotification {
  const _$_SendFollowNotification({required this.notification});

  @override
  final NotificationEntity notification;

  @override
  String toString() {
    return 'NotificationEvent.sendFollowNotification(notification: $notification)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SendFollowNotification &&
            const DeepCollectionEquality()
                .equals(other.notification, notification));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(notification));

  @JsonKey(ignore: true)
  @override
  _$SendFollowNotificationCopyWith<_SendFollowNotification> get copyWith =>
      __$SendFollowNotificationCopyWithImpl<_SendFollowNotification>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(NotificationEntity notification)
        sendLikeNotification,
    required TResult Function(NotificationEntity notification)
        sendCommentNotification,
    required TResult Function(NotificationEntity notification)
        sendFollowNotification,
    required TResult Function(String uid) getNotifications,
  }) {
    return sendFollowNotification(notification);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(NotificationEntity notification)? sendLikeNotification,
    TResult Function(NotificationEntity notification)? sendCommentNotification,
    TResult Function(NotificationEntity notification)? sendFollowNotification,
    TResult Function(String uid)? getNotifications,
  }) {
    return sendFollowNotification?.call(notification);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(NotificationEntity notification)? sendLikeNotification,
    TResult Function(NotificationEntity notification)? sendCommentNotification,
    TResult Function(NotificationEntity notification)? sendFollowNotification,
    TResult Function(String uid)? getNotifications,
    required TResult orElse(),
  }) {
    if (sendFollowNotification != null) {
      return sendFollowNotification(notification);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SendLikeNotification value) sendLikeNotification,
    required TResult Function(_SendCommentNotification value)
        sendCommentNotification,
    required TResult Function(_SendFollowNotification value)
        sendFollowNotification,
    required TResult Function(_GetNotifications value) getNotifications,
  }) {
    return sendFollowNotification(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SendLikeNotification value)? sendLikeNotification,
    TResult Function(_SendCommentNotification value)? sendCommentNotification,
    TResult Function(_SendFollowNotification value)? sendFollowNotification,
    TResult Function(_GetNotifications value)? getNotifications,
  }) {
    return sendFollowNotification?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SendLikeNotification value)? sendLikeNotification,
    TResult Function(_SendCommentNotification value)? sendCommentNotification,
    TResult Function(_SendFollowNotification value)? sendFollowNotification,
    TResult Function(_GetNotifications value)? getNotifications,
    required TResult orElse(),
  }) {
    if (sendFollowNotification != null) {
      return sendFollowNotification(this);
    }
    return orElse();
  }
}

abstract class _SendFollowNotification implements NotificationEvent {
  const factory _SendFollowNotification(
      {required NotificationEntity notification}) = _$_SendFollowNotification;

  NotificationEntity get notification;
  @JsonKey(ignore: true)
  _$SendFollowNotificationCopyWith<_SendFollowNotification> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$GetNotificationsCopyWith<$Res> {
  factory _$GetNotificationsCopyWith(
          _GetNotifications value, $Res Function(_GetNotifications) then) =
      __$GetNotificationsCopyWithImpl<$Res>;
  $Res call({String uid});
}

/// @nodoc
class __$GetNotificationsCopyWithImpl<$Res>
    extends _$NotificationEventCopyWithImpl<$Res>
    implements _$GetNotificationsCopyWith<$Res> {
  __$GetNotificationsCopyWithImpl(
      _GetNotifications _value, $Res Function(_GetNotifications) _then)
      : super(_value, (v) => _then(v as _GetNotifications));

  @override
  _GetNotifications get _value => super._value as _GetNotifications;

  @override
  $Res call({
    Object? uid = freezed,
  }) {
    return _then(_GetNotifications(
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_GetNotifications implements _GetNotifications {
  const _$_GetNotifications({required this.uid});

  @override
  final String uid;

  @override
  String toString() {
    return 'NotificationEvent.getNotifications(uid: $uid)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GetNotifications &&
            const DeepCollectionEquality().equals(other.uid, uid));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(uid));

  @JsonKey(ignore: true)
  @override
  _$GetNotificationsCopyWith<_GetNotifications> get copyWith =>
      __$GetNotificationsCopyWithImpl<_GetNotifications>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(NotificationEntity notification)
        sendLikeNotification,
    required TResult Function(NotificationEntity notification)
        sendCommentNotification,
    required TResult Function(NotificationEntity notification)
        sendFollowNotification,
    required TResult Function(String uid) getNotifications,
  }) {
    return getNotifications(uid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(NotificationEntity notification)? sendLikeNotification,
    TResult Function(NotificationEntity notification)? sendCommentNotification,
    TResult Function(NotificationEntity notification)? sendFollowNotification,
    TResult Function(String uid)? getNotifications,
  }) {
    return getNotifications?.call(uid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(NotificationEntity notification)? sendLikeNotification,
    TResult Function(NotificationEntity notification)? sendCommentNotification,
    TResult Function(NotificationEntity notification)? sendFollowNotification,
    TResult Function(String uid)? getNotifications,
    required TResult orElse(),
  }) {
    if (getNotifications != null) {
      return getNotifications(uid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SendLikeNotification value) sendLikeNotification,
    required TResult Function(_SendCommentNotification value)
        sendCommentNotification,
    required TResult Function(_SendFollowNotification value)
        sendFollowNotification,
    required TResult Function(_GetNotifications value) getNotifications,
  }) {
    return getNotifications(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SendLikeNotification value)? sendLikeNotification,
    TResult Function(_SendCommentNotification value)? sendCommentNotification,
    TResult Function(_SendFollowNotification value)? sendFollowNotification,
    TResult Function(_GetNotifications value)? getNotifications,
  }) {
    return getNotifications?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SendLikeNotification value)? sendLikeNotification,
    TResult Function(_SendCommentNotification value)? sendCommentNotification,
    TResult Function(_SendFollowNotification value)? sendFollowNotification,
    TResult Function(_GetNotifications value)? getNotifications,
    required TResult orElse(),
  }) {
    if (getNotifications != null) {
      return getNotifications(this);
    }
    return orElse();
  }
}

abstract class _GetNotifications implements NotificationEvent {
  const factory _GetNotifications({required String uid}) = _$_GetNotifications;

  String get uid;
  @JsonKey(ignore: true)
  _$GetNotificationsCopyWith<_GetNotifications> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$NotificationStateTearOff {
  const _$NotificationStateTearOff();

  _NotificationState call(
      {String error = '',
      List<NotificationEntity> notifications = const [],
      NotificationStatus currentState = NotificationStatus.idle,
      NotificationListenableAction action =
          NotificationListenableAction.idle}) {
    return _NotificationState(
      error: error,
      notifications: notifications,
      currentState: currentState,
      action: action,
    );
  }
}

/// @nodoc
const $NotificationState = _$NotificationStateTearOff();

/// @nodoc
mixin _$NotificationState {
  String get error => throw _privateConstructorUsedError;
  List<NotificationEntity> get notifications =>
      throw _privateConstructorUsedError;
  NotificationStatus get currentState => throw _privateConstructorUsedError;
  NotificationListenableAction get action => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NotificationStateCopyWith<NotificationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationStateCopyWith<$Res> {
  factory $NotificationStateCopyWith(
          NotificationState value, $Res Function(NotificationState) then) =
      _$NotificationStateCopyWithImpl<$Res>;
  $Res call(
      {String error,
      List<NotificationEntity> notifications,
      NotificationStatus currentState,
      NotificationListenableAction action});
}

/// @nodoc
class _$NotificationStateCopyWithImpl<$Res>
    implements $NotificationStateCopyWith<$Res> {
  _$NotificationStateCopyWithImpl(this._value, this._then);

  final NotificationState _value;
  // ignore: unused_field
  final $Res Function(NotificationState) _then;

  @override
  $Res call({
    Object? error = freezed,
    Object? notifications = freezed,
    Object? currentState = freezed,
    Object? action = freezed,
  }) {
    return _then(_value.copyWith(
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
      notifications: notifications == freezed
          ? _value.notifications
          : notifications // ignore: cast_nullable_to_non_nullable
              as List<NotificationEntity>,
      currentState: currentState == freezed
          ? _value.currentState
          : currentState // ignore: cast_nullable_to_non_nullable
              as NotificationStatus,
      action: action == freezed
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as NotificationListenableAction,
    ));
  }
}

/// @nodoc
abstract class _$NotificationStateCopyWith<$Res>
    implements $NotificationStateCopyWith<$Res> {
  factory _$NotificationStateCopyWith(
          _NotificationState value, $Res Function(_NotificationState) then) =
      __$NotificationStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {String error,
      List<NotificationEntity> notifications,
      NotificationStatus currentState,
      NotificationListenableAction action});
}

/// @nodoc
class __$NotificationStateCopyWithImpl<$Res>
    extends _$NotificationStateCopyWithImpl<$Res>
    implements _$NotificationStateCopyWith<$Res> {
  __$NotificationStateCopyWithImpl(
      _NotificationState _value, $Res Function(_NotificationState) _then)
      : super(_value, (v) => _then(v as _NotificationState));

  @override
  _NotificationState get _value => super._value as _NotificationState;

  @override
  $Res call({
    Object? error = freezed,
    Object? notifications = freezed,
    Object? currentState = freezed,
    Object? action = freezed,
  }) {
    return _then(_NotificationState(
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
      notifications: notifications == freezed
          ? _value.notifications
          : notifications // ignore: cast_nullable_to_non_nullable
              as List<NotificationEntity>,
      currentState: currentState == freezed
          ? _value.currentState
          : currentState // ignore: cast_nullable_to_non_nullable
              as NotificationStatus,
      action: action == freezed
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as NotificationListenableAction,
    ));
  }
}

/// @nodoc

class _$_NotificationState implements _NotificationState {
  const _$_NotificationState(
      {this.error = '',
      this.notifications = const [],
      this.currentState = NotificationStatus.idle,
      this.action = NotificationListenableAction.idle});

  @JsonKey()
  @override
  final String error;
  @JsonKey()
  @override
  final List<NotificationEntity> notifications;
  @JsonKey()
  @override
  final NotificationStatus currentState;
  @JsonKey()
  @override
  final NotificationListenableAction action;

  @override
  String toString() {
    return 'NotificationState(error: $error, notifications: $notifications, currentState: $currentState, action: $action)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NotificationState &&
            const DeepCollectionEquality().equals(other.error, error) &&
            const DeepCollectionEquality()
                .equals(other.notifications, notifications) &&
            const DeepCollectionEquality()
                .equals(other.currentState, currentState) &&
            const DeepCollectionEquality().equals(other.action, action));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(error),
      const DeepCollectionEquality().hash(notifications),
      const DeepCollectionEquality().hash(currentState),
      const DeepCollectionEquality().hash(action));

  @JsonKey(ignore: true)
  @override
  _$NotificationStateCopyWith<_NotificationState> get copyWith =>
      __$NotificationStateCopyWithImpl<_NotificationState>(this, _$identity);
}

abstract class _NotificationState implements NotificationState {
  const factory _NotificationState(
      {String error,
      List<NotificationEntity> notifications,
      NotificationStatus currentState,
      NotificationListenableAction action}) = _$_NotificationState;

  @override
  String get error;
  @override
  List<NotificationEntity> get notifications;
  @override
  NotificationStatus get currentState;
  @override
  NotificationListenableAction get action;
  @override
  @JsonKey(ignore: true)
  _$NotificationStateCopyWith<_NotificationState> get copyWith =>
      throw _privateConstructorUsedError;
}
