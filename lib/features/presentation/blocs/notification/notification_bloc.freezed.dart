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
      {required NotificationDTO notification}) {
    return _SendLikeNotification(
      notification: notification,
    );
  }

  _SendCommentNotification sendCommentNotification(
      {required NotificationDTO notification}) {
    return _SendCommentNotification(
      notification: notification,
    );
  }

  _SendFollowNotification sendFollowNotification(
      {required NotificationDTO notification}) {
    return _SendFollowNotification(
      notification: notification,
    );
  }

  _GetNotifications getNotifications({required String uid}) {
    return _GetNotifications(
      uid: uid,
    );
  }

  _GetPaginatedNotifications getPaginatedNotifications({required String uid}) {
    return _GetPaginatedNotifications(
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
    required TResult Function(NotificationDTO notification)
        sendLikeNotification,
    required TResult Function(NotificationDTO notification)
        sendCommentNotification,
    required TResult Function(NotificationDTO notification)
        sendFollowNotification,
    required TResult Function(String uid) getNotifications,
    required TResult Function(String uid) getPaginatedNotifications,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(NotificationDTO notification)? sendLikeNotification,
    TResult Function(NotificationDTO notification)? sendCommentNotification,
    TResult Function(NotificationDTO notification)? sendFollowNotification,
    TResult Function(String uid)? getNotifications,
    TResult Function(String uid)? getPaginatedNotifications,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(NotificationDTO notification)? sendLikeNotification,
    TResult Function(NotificationDTO notification)? sendCommentNotification,
    TResult Function(NotificationDTO notification)? sendFollowNotification,
    TResult Function(String uid)? getNotifications,
    TResult Function(String uid)? getPaginatedNotifications,
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
    required TResult Function(_GetPaginatedNotifications value)
        getPaginatedNotifications,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SendLikeNotification value)? sendLikeNotification,
    TResult Function(_SendCommentNotification value)? sendCommentNotification,
    TResult Function(_SendFollowNotification value)? sendFollowNotification,
    TResult Function(_GetNotifications value)? getNotifications,
    TResult Function(_GetPaginatedNotifications value)?
        getPaginatedNotifications,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SendLikeNotification value)? sendLikeNotification,
    TResult Function(_SendCommentNotification value)? sendCommentNotification,
    TResult Function(_SendFollowNotification value)? sendFollowNotification,
    TResult Function(_GetNotifications value)? getNotifications,
    TResult Function(_GetPaginatedNotifications value)?
        getPaginatedNotifications,
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
  $Res call({NotificationDTO notification});
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
              as NotificationDTO,
    ));
  }
}

/// @nodoc

class _$_SendLikeNotification implements _SendLikeNotification {
  const _$_SendLikeNotification({required this.notification});

  @override
  final NotificationDTO notification;

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
    required TResult Function(NotificationDTO notification)
        sendLikeNotification,
    required TResult Function(NotificationDTO notification)
        sendCommentNotification,
    required TResult Function(NotificationDTO notification)
        sendFollowNotification,
    required TResult Function(String uid) getNotifications,
    required TResult Function(String uid) getPaginatedNotifications,
  }) {
    return sendLikeNotification(notification);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(NotificationDTO notification)? sendLikeNotification,
    TResult Function(NotificationDTO notification)? sendCommentNotification,
    TResult Function(NotificationDTO notification)? sendFollowNotification,
    TResult Function(String uid)? getNotifications,
    TResult Function(String uid)? getPaginatedNotifications,
  }) {
    return sendLikeNotification?.call(notification);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(NotificationDTO notification)? sendLikeNotification,
    TResult Function(NotificationDTO notification)? sendCommentNotification,
    TResult Function(NotificationDTO notification)? sendFollowNotification,
    TResult Function(String uid)? getNotifications,
    TResult Function(String uid)? getPaginatedNotifications,
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
    required TResult Function(_GetPaginatedNotifications value)
        getPaginatedNotifications,
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
    TResult Function(_GetPaginatedNotifications value)?
        getPaginatedNotifications,
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
    TResult Function(_GetPaginatedNotifications value)?
        getPaginatedNotifications,
    required TResult orElse(),
  }) {
    if (sendLikeNotification != null) {
      return sendLikeNotification(this);
    }
    return orElse();
  }
}

abstract class _SendLikeNotification implements NotificationEvent {
  const factory _SendLikeNotification({required NotificationDTO notification}) =
      _$_SendLikeNotification;

  NotificationDTO get notification;
  @JsonKey(ignore: true)
  _$SendLikeNotificationCopyWith<_SendLikeNotification> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$SendCommentNotificationCopyWith<$Res> {
  factory _$SendCommentNotificationCopyWith(_SendCommentNotification value,
          $Res Function(_SendCommentNotification) then) =
      __$SendCommentNotificationCopyWithImpl<$Res>;
  $Res call({NotificationDTO notification});
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
              as NotificationDTO,
    ));
  }
}

/// @nodoc

class _$_SendCommentNotification implements _SendCommentNotification {
  const _$_SendCommentNotification({required this.notification});

  @override
  final NotificationDTO notification;

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
    required TResult Function(NotificationDTO notification)
        sendLikeNotification,
    required TResult Function(NotificationDTO notification)
        sendCommentNotification,
    required TResult Function(NotificationDTO notification)
        sendFollowNotification,
    required TResult Function(String uid) getNotifications,
    required TResult Function(String uid) getPaginatedNotifications,
  }) {
    return sendCommentNotification(notification);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(NotificationDTO notification)? sendLikeNotification,
    TResult Function(NotificationDTO notification)? sendCommentNotification,
    TResult Function(NotificationDTO notification)? sendFollowNotification,
    TResult Function(String uid)? getNotifications,
    TResult Function(String uid)? getPaginatedNotifications,
  }) {
    return sendCommentNotification?.call(notification);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(NotificationDTO notification)? sendLikeNotification,
    TResult Function(NotificationDTO notification)? sendCommentNotification,
    TResult Function(NotificationDTO notification)? sendFollowNotification,
    TResult Function(String uid)? getNotifications,
    TResult Function(String uid)? getPaginatedNotifications,
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
    required TResult Function(_GetPaginatedNotifications value)
        getPaginatedNotifications,
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
    TResult Function(_GetPaginatedNotifications value)?
        getPaginatedNotifications,
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
    TResult Function(_GetPaginatedNotifications value)?
        getPaginatedNotifications,
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
      {required NotificationDTO notification}) = _$_SendCommentNotification;

  NotificationDTO get notification;
  @JsonKey(ignore: true)
  _$SendCommentNotificationCopyWith<_SendCommentNotification> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$SendFollowNotificationCopyWith<$Res> {
  factory _$SendFollowNotificationCopyWith(_SendFollowNotification value,
          $Res Function(_SendFollowNotification) then) =
      __$SendFollowNotificationCopyWithImpl<$Res>;
  $Res call({NotificationDTO notification});
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
              as NotificationDTO,
    ));
  }
}

/// @nodoc

class _$_SendFollowNotification implements _SendFollowNotification {
  const _$_SendFollowNotification({required this.notification});

  @override
  final NotificationDTO notification;

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
    required TResult Function(NotificationDTO notification)
        sendLikeNotification,
    required TResult Function(NotificationDTO notification)
        sendCommentNotification,
    required TResult Function(NotificationDTO notification)
        sendFollowNotification,
    required TResult Function(String uid) getNotifications,
    required TResult Function(String uid) getPaginatedNotifications,
  }) {
    return sendFollowNotification(notification);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(NotificationDTO notification)? sendLikeNotification,
    TResult Function(NotificationDTO notification)? sendCommentNotification,
    TResult Function(NotificationDTO notification)? sendFollowNotification,
    TResult Function(String uid)? getNotifications,
    TResult Function(String uid)? getPaginatedNotifications,
  }) {
    return sendFollowNotification?.call(notification);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(NotificationDTO notification)? sendLikeNotification,
    TResult Function(NotificationDTO notification)? sendCommentNotification,
    TResult Function(NotificationDTO notification)? sendFollowNotification,
    TResult Function(String uid)? getNotifications,
    TResult Function(String uid)? getPaginatedNotifications,
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
    required TResult Function(_GetPaginatedNotifications value)
        getPaginatedNotifications,
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
    TResult Function(_GetPaginatedNotifications value)?
        getPaginatedNotifications,
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
    TResult Function(_GetPaginatedNotifications value)?
        getPaginatedNotifications,
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
      {required NotificationDTO notification}) = _$_SendFollowNotification;

  NotificationDTO get notification;
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
    required TResult Function(NotificationDTO notification)
        sendLikeNotification,
    required TResult Function(NotificationDTO notification)
        sendCommentNotification,
    required TResult Function(NotificationDTO notification)
        sendFollowNotification,
    required TResult Function(String uid) getNotifications,
    required TResult Function(String uid) getPaginatedNotifications,
  }) {
    return getNotifications(uid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(NotificationDTO notification)? sendLikeNotification,
    TResult Function(NotificationDTO notification)? sendCommentNotification,
    TResult Function(NotificationDTO notification)? sendFollowNotification,
    TResult Function(String uid)? getNotifications,
    TResult Function(String uid)? getPaginatedNotifications,
  }) {
    return getNotifications?.call(uid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(NotificationDTO notification)? sendLikeNotification,
    TResult Function(NotificationDTO notification)? sendCommentNotification,
    TResult Function(NotificationDTO notification)? sendFollowNotification,
    TResult Function(String uid)? getNotifications,
    TResult Function(String uid)? getPaginatedNotifications,
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
    required TResult Function(_GetPaginatedNotifications value)
        getPaginatedNotifications,
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
    TResult Function(_GetPaginatedNotifications value)?
        getPaginatedNotifications,
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
    TResult Function(_GetPaginatedNotifications value)?
        getPaginatedNotifications,
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
abstract class _$GetPaginatedNotificationsCopyWith<$Res> {
  factory _$GetPaginatedNotificationsCopyWith(_GetPaginatedNotifications value,
          $Res Function(_GetPaginatedNotifications) then) =
      __$GetPaginatedNotificationsCopyWithImpl<$Res>;
  $Res call({String uid});
}

/// @nodoc
class __$GetPaginatedNotificationsCopyWithImpl<$Res>
    extends _$NotificationEventCopyWithImpl<$Res>
    implements _$GetPaginatedNotificationsCopyWith<$Res> {
  __$GetPaginatedNotificationsCopyWithImpl(_GetPaginatedNotifications _value,
      $Res Function(_GetPaginatedNotifications) _then)
      : super(_value, (v) => _then(v as _GetPaginatedNotifications));

  @override
  _GetPaginatedNotifications get _value =>
      super._value as _GetPaginatedNotifications;

  @override
  $Res call({
    Object? uid = freezed,
  }) {
    return _then(_GetPaginatedNotifications(
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_GetPaginatedNotifications implements _GetPaginatedNotifications {
  const _$_GetPaginatedNotifications({required this.uid});

  @override
  final String uid;

  @override
  String toString() {
    return 'NotificationEvent.getPaginatedNotifications(uid: $uid)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GetPaginatedNotifications &&
            const DeepCollectionEquality().equals(other.uid, uid));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(uid));

  @JsonKey(ignore: true)
  @override
  _$GetPaginatedNotificationsCopyWith<_GetPaginatedNotifications>
      get copyWith =>
          __$GetPaginatedNotificationsCopyWithImpl<_GetPaginatedNotifications>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(NotificationDTO notification)
        sendLikeNotification,
    required TResult Function(NotificationDTO notification)
        sendCommentNotification,
    required TResult Function(NotificationDTO notification)
        sendFollowNotification,
    required TResult Function(String uid) getNotifications,
    required TResult Function(String uid) getPaginatedNotifications,
  }) {
    return getPaginatedNotifications(uid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(NotificationDTO notification)? sendLikeNotification,
    TResult Function(NotificationDTO notification)? sendCommentNotification,
    TResult Function(NotificationDTO notification)? sendFollowNotification,
    TResult Function(String uid)? getNotifications,
    TResult Function(String uid)? getPaginatedNotifications,
  }) {
    return getPaginatedNotifications?.call(uid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(NotificationDTO notification)? sendLikeNotification,
    TResult Function(NotificationDTO notification)? sendCommentNotification,
    TResult Function(NotificationDTO notification)? sendFollowNotification,
    TResult Function(String uid)? getNotifications,
    TResult Function(String uid)? getPaginatedNotifications,
    required TResult orElse(),
  }) {
    if (getPaginatedNotifications != null) {
      return getPaginatedNotifications(uid);
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
    required TResult Function(_GetPaginatedNotifications value)
        getPaginatedNotifications,
  }) {
    return getPaginatedNotifications(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SendLikeNotification value)? sendLikeNotification,
    TResult Function(_SendCommentNotification value)? sendCommentNotification,
    TResult Function(_SendFollowNotification value)? sendFollowNotification,
    TResult Function(_GetNotifications value)? getNotifications,
    TResult Function(_GetPaginatedNotifications value)?
        getPaginatedNotifications,
  }) {
    return getPaginatedNotifications?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SendLikeNotification value)? sendLikeNotification,
    TResult Function(_SendCommentNotification value)? sendCommentNotification,
    TResult Function(_SendFollowNotification value)? sendFollowNotification,
    TResult Function(_GetNotifications value)? getNotifications,
    TResult Function(_GetPaginatedNotifications value)?
        getPaginatedNotifications,
    required TResult orElse(),
  }) {
    if (getPaginatedNotifications != null) {
      return getPaginatedNotifications(this);
    }
    return orElse();
  }
}

abstract class _GetPaginatedNotifications implements NotificationEvent {
  const factory _GetPaginatedNotifications({required String uid}) =
      _$_GetPaginatedNotifications;

  String get uid;
  @JsonKey(ignore: true)
  _$GetPaginatedNotificationsCopyWith<_GetPaginatedNotifications>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
class _$NotificationStateTearOff {
  const _$NotificationStateTearOff();

  _NotificationState call(
      {bool reachedMaximumThreshold = false,
      required PagingController<int, NotificationModel> paginationController,
      NotificationListenableAction action =
          NotificationListenableAction.idle}) {
    return _NotificationState(
      reachedMaximumThreshold: reachedMaximumThreshold,
      paginationController: paginationController,
      action: action,
    );
  }
}

/// @nodoc
const $NotificationState = _$NotificationStateTearOff();

/// @nodoc
mixin _$NotificationState {
  bool get reachedMaximumThreshold => throw _privateConstructorUsedError;
  PagingController<int, NotificationModel> get paginationController =>
      throw _privateConstructorUsedError;
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
      {bool reachedMaximumThreshold,
      PagingController<int, NotificationModel> paginationController,
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
    Object? reachedMaximumThreshold = freezed,
    Object? paginationController = freezed,
    Object? action = freezed,
  }) {
    return _then(_value.copyWith(
      reachedMaximumThreshold: reachedMaximumThreshold == freezed
          ? _value.reachedMaximumThreshold
          : reachedMaximumThreshold // ignore: cast_nullable_to_non_nullable
              as bool,
      paginationController: paginationController == freezed
          ? _value.paginationController
          : paginationController // ignore: cast_nullable_to_non_nullable
              as PagingController<int, NotificationModel>,
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
      {bool reachedMaximumThreshold,
      PagingController<int, NotificationModel> paginationController,
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
    Object? reachedMaximumThreshold = freezed,
    Object? paginationController = freezed,
    Object? action = freezed,
  }) {
    return _then(_NotificationState(
      reachedMaximumThreshold: reachedMaximumThreshold == freezed
          ? _value.reachedMaximumThreshold
          : reachedMaximumThreshold // ignore: cast_nullable_to_non_nullable
              as bool,
      paginationController: paginationController == freezed
          ? _value.paginationController
          : paginationController // ignore: cast_nullable_to_non_nullable
              as PagingController<int, NotificationModel>,
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
      {this.reachedMaximumThreshold = false,
      required this.paginationController,
      this.action = NotificationListenableAction.idle});

  @JsonKey()
  @override
  final bool reachedMaximumThreshold;
  @override
  final PagingController<int, NotificationModel> paginationController;
  @JsonKey()
  @override
  final NotificationListenableAction action;

  @override
  String toString() {
    return 'NotificationState(reachedMaximumThreshold: $reachedMaximumThreshold, paginationController: $paginationController, action: $action)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NotificationState &&
            const DeepCollectionEquality().equals(
                other.reachedMaximumThreshold, reachedMaximumThreshold) &&
            const DeepCollectionEquality()
                .equals(other.paginationController, paginationController) &&
            const DeepCollectionEquality().equals(other.action, action));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(reachedMaximumThreshold),
      const DeepCollectionEquality().hash(paginationController),
      const DeepCollectionEquality().hash(action));

  @JsonKey(ignore: true)
  @override
  _$NotificationStateCopyWith<_NotificationState> get copyWith =>
      __$NotificationStateCopyWithImpl<_NotificationState>(this, _$identity);
}

abstract class _NotificationState implements NotificationState {
  const factory _NotificationState(
      {bool reachedMaximumThreshold,
      required PagingController<int, NotificationModel> paginationController,
      NotificationListenableAction action}) = _$_NotificationState;

  @override
  bool get reachedMaximumThreshold;
  @override
  PagingController<int, NotificationModel> get paginationController;
  @override
  NotificationListenableAction get action;
  @override
  @JsonKey(ignore: true)
  _$NotificationStateCopyWith<_NotificationState> get copyWith =>
      throw _privateConstructorUsedError;
}
