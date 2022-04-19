// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'follow_notification_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FollowNotificationModel _$FollowNotificationModelFromJson(
    Map<String, dynamic> json) {
  return _FollowNotificationModel.fromJson(json);
}

/// @nodoc
class _$FollowNotificationModelTearOff {
  const _$FollowNotificationModelTearOff();

  _FollowNotificationModel call(
      {String type = '',
      int dateCreated = 0,
      String senderId = '',
      String recipient = '',
      String senderUsername = '',
      String senderProfilePic = ''}) {
    return _FollowNotificationModel(
      type: type,
      dateCreated: dateCreated,
      senderId: senderId,
      recipient: recipient,
      senderUsername: senderUsername,
      senderProfilePic: senderProfilePic,
    );
  }

  FollowNotificationModel fromJson(Map<String, Object?> json) {
    return FollowNotificationModel.fromJson(json);
  }
}

/// @nodoc
const $FollowNotificationModel = _$FollowNotificationModelTearOff();

/// @nodoc
mixin _$FollowNotificationModel {
  String get type => throw _privateConstructorUsedError;
  int get dateCreated => throw _privateConstructorUsedError;
  String get senderId => throw _privateConstructorUsedError;
  String get recipient => throw _privateConstructorUsedError;
  String get senderUsername => throw _privateConstructorUsedError;
  String get senderProfilePic => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FollowNotificationModelCopyWith<FollowNotificationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FollowNotificationModelCopyWith<$Res> {
  factory $FollowNotificationModelCopyWith(FollowNotificationModel value,
          $Res Function(FollowNotificationModel) then) =
      _$FollowNotificationModelCopyWithImpl<$Res>;
  $Res call(
      {String type,
      int dateCreated,
      String senderId,
      String recipient,
      String senderUsername,
      String senderProfilePic});
}

/// @nodoc
class _$FollowNotificationModelCopyWithImpl<$Res>
    implements $FollowNotificationModelCopyWith<$Res> {
  _$FollowNotificationModelCopyWithImpl(this._value, this._then);

  final FollowNotificationModel _value;
  // ignore: unused_field
  final $Res Function(FollowNotificationModel) _then;

  @override
  $Res call({
    Object? type = freezed,
    Object? dateCreated = freezed,
    Object? senderId = freezed,
    Object? recipient = freezed,
    Object? senderUsername = freezed,
    Object? senderProfilePic = freezed,
  }) {
    return _then(_value.copyWith(
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      dateCreated: dateCreated == freezed
          ? _value.dateCreated
          : dateCreated // ignore: cast_nullable_to_non_nullable
              as int,
      senderId: senderId == freezed
          ? _value.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as String,
      recipient: recipient == freezed
          ? _value.recipient
          : recipient // ignore: cast_nullable_to_non_nullable
              as String,
      senderUsername: senderUsername == freezed
          ? _value.senderUsername
          : senderUsername // ignore: cast_nullable_to_non_nullable
              as String,
      senderProfilePic: senderProfilePic == freezed
          ? _value.senderProfilePic
          : senderProfilePic // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$FollowNotificationModelCopyWith<$Res>
    implements $FollowNotificationModelCopyWith<$Res> {
  factory _$FollowNotificationModelCopyWith(_FollowNotificationModel value,
          $Res Function(_FollowNotificationModel) then) =
      __$FollowNotificationModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String type,
      int dateCreated,
      String senderId,
      String recipient,
      String senderUsername,
      String senderProfilePic});
}

/// @nodoc
class __$FollowNotificationModelCopyWithImpl<$Res>
    extends _$FollowNotificationModelCopyWithImpl<$Res>
    implements _$FollowNotificationModelCopyWith<$Res> {
  __$FollowNotificationModelCopyWithImpl(_FollowNotificationModel _value,
      $Res Function(_FollowNotificationModel) _then)
      : super(_value, (v) => _then(v as _FollowNotificationModel));

  @override
  _FollowNotificationModel get _value =>
      super._value as _FollowNotificationModel;

  @override
  $Res call({
    Object? type = freezed,
    Object? dateCreated = freezed,
    Object? senderId = freezed,
    Object? recipient = freezed,
    Object? senderUsername = freezed,
    Object? senderProfilePic = freezed,
  }) {
    return _then(_FollowNotificationModel(
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      dateCreated: dateCreated == freezed
          ? _value.dateCreated
          : dateCreated // ignore: cast_nullable_to_non_nullable
              as int,
      senderId: senderId == freezed
          ? _value.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as String,
      recipient: recipient == freezed
          ? _value.recipient
          : recipient // ignore: cast_nullable_to_non_nullable
              as String,
      senderUsername: senderUsername == freezed
          ? _value.senderUsername
          : senderUsername // ignore: cast_nullable_to_non_nullable
              as String,
      senderProfilePic: senderProfilePic == freezed
          ? _value.senderProfilePic
          : senderProfilePic // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FollowNotificationModel implements _FollowNotificationModel {
  const _$_FollowNotificationModel(
      {this.type = '',
      this.dateCreated = 0,
      this.senderId = '',
      this.recipient = '',
      this.senderUsername = '',
      this.senderProfilePic = ''});

  factory _$_FollowNotificationModel.fromJson(Map<String, dynamic> json) =>
      _$$_FollowNotificationModelFromJson(json);

  @JsonKey()
  @override
  final String type;
  @JsonKey()
  @override
  final int dateCreated;
  @JsonKey()
  @override
  final String senderId;
  @JsonKey()
  @override
  final String recipient;
  @JsonKey()
  @override
  final String senderUsername;
  @JsonKey()
  @override
  final String senderProfilePic;

  @override
  String toString() {
    return 'FollowNotificationModel(type: $type, dateCreated: $dateCreated, senderId: $senderId, recipient: $recipient, senderUsername: $senderUsername, senderProfilePic: $senderProfilePic)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FollowNotificationModel &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality()
                .equals(other.dateCreated, dateCreated) &&
            const DeepCollectionEquality().equals(other.senderId, senderId) &&
            const DeepCollectionEquality().equals(other.recipient, recipient) &&
            const DeepCollectionEquality()
                .equals(other.senderUsername, senderUsername) &&
            const DeepCollectionEquality()
                .equals(other.senderProfilePic, senderProfilePic));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(dateCreated),
      const DeepCollectionEquality().hash(senderId),
      const DeepCollectionEquality().hash(recipient),
      const DeepCollectionEquality().hash(senderUsername),
      const DeepCollectionEquality().hash(senderProfilePic));

  @JsonKey(ignore: true)
  @override
  _$FollowNotificationModelCopyWith<_FollowNotificationModel> get copyWith =>
      __$FollowNotificationModelCopyWithImpl<_FollowNotificationModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FollowNotificationModelToJson(this);
  }
}

abstract class _FollowNotificationModel implements FollowNotificationModel {
  const factory _FollowNotificationModel(
      {String type,
      int dateCreated,
      String senderId,
      String recipient,
      String senderUsername,
      String senderProfilePic}) = _$_FollowNotificationModel;

  factory _FollowNotificationModel.fromJson(Map<String, dynamic> json) =
      _$_FollowNotificationModel.fromJson;

  @override
  String get type;
  @override
  int get dateCreated;
  @override
  String get senderId;
  @override
  String get recipient;
  @override
  String get senderUsername;
  @override
  String get senderProfilePic;
  @override
  @JsonKey(ignore: true)
  _$FollowNotificationModelCopyWith<_FollowNotificationModel> get copyWith =>
      throw _privateConstructorUsedError;
}
