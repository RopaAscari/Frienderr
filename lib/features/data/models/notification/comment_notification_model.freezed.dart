// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'comment_notification_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CommentNotificationModel _$CommentNotificationModelFromJson(
    Map<String, dynamic> json) {
  return _CommentNotificationModel.fromJson(json);
}

/// @nodoc
class _$CommentNotificationModelTearOff {
  const _$CommentNotificationModelTearOff();

  _CommentNotificationModel call(
      {String type = '',
      String postId = '',
      String comment = '',
      String senderId = '',
      int dateCreated = 0,
      String mediaType = '',
      String recipient = '',
      String postThumbnail = '',
      String senderUsername = '',
      String senderProfilePic = ''}) {
    return _CommentNotificationModel(
      type: type,
      postId: postId,
      comment: comment,
      senderId: senderId,
      dateCreated: dateCreated,
      mediaType: mediaType,
      recipient: recipient,
      postThumbnail: postThumbnail,
      senderUsername: senderUsername,
      senderProfilePic: senderProfilePic,
    );
  }

  CommentNotificationModel fromJson(Map<String, Object?> json) {
    return CommentNotificationModel.fromJson(json);
  }
}

/// @nodoc
const $CommentNotificationModel = _$CommentNotificationModelTearOff();

/// @nodoc
mixin _$CommentNotificationModel {
  String get type => throw _privateConstructorUsedError;
  String get postId => throw _privateConstructorUsedError;
  String get comment => throw _privateConstructorUsedError;
  String get senderId => throw _privateConstructorUsedError;
  int get dateCreated => throw _privateConstructorUsedError;
  String get mediaType => throw _privateConstructorUsedError;
  String get recipient => throw _privateConstructorUsedError;
  String get postThumbnail => throw _privateConstructorUsedError;
  String get senderUsername => throw _privateConstructorUsedError;
  String get senderProfilePic => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CommentNotificationModelCopyWith<CommentNotificationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentNotificationModelCopyWith<$Res> {
  factory $CommentNotificationModelCopyWith(CommentNotificationModel value,
          $Res Function(CommentNotificationModel) then) =
      _$CommentNotificationModelCopyWithImpl<$Res>;
  $Res call(
      {String type,
      String postId,
      String comment,
      String senderId,
      int dateCreated,
      String mediaType,
      String recipient,
      String postThumbnail,
      String senderUsername,
      String senderProfilePic});
}

/// @nodoc
class _$CommentNotificationModelCopyWithImpl<$Res>
    implements $CommentNotificationModelCopyWith<$Res> {
  _$CommentNotificationModelCopyWithImpl(this._value, this._then);

  final CommentNotificationModel _value;
  // ignore: unused_field
  final $Res Function(CommentNotificationModel) _then;

  @override
  $Res call({
    Object? type = freezed,
    Object? postId = freezed,
    Object? comment = freezed,
    Object? senderId = freezed,
    Object? dateCreated = freezed,
    Object? mediaType = freezed,
    Object? recipient = freezed,
    Object? postThumbnail = freezed,
    Object? senderUsername = freezed,
    Object? senderProfilePic = freezed,
  }) {
    return _then(_value.copyWith(
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      postId: postId == freezed
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String,
      comment: comment == freezed
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      senderId: senderId == freezed
          ? _value.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as String,
      dateCreated: dateCreated == freezed
          ? _value.dateCreated
          : dateCreated // ignore: cast_nullable_to_non_nullable
              as int,
      mediaType: mediaType == freezed
          ? _value.mediaType
          : mediaType // ignore: cast_nullable_to_non_nullable
              as String,
      recipient: recipient == freezed
          ? _value.recipient
          : recipient // ignore: cast_nullable_to_non_nullable
              as String,
      postThumbnail: postThumbnail == freezed
          ? _value.postThumbnail
          : postThumbnail // ignore: cast_nullable_to_non_nullable
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
abstract class _$CommentNotificationModelCopyWith<$Res>
    implements $CommentNotificationModelCopyWith<$Res> {
  factory _$CommentNotificationModelCopyWith(_CommentNotificationModel value,
          $Res Function(_CommentNotificationModel) then) =
      __$CommentNotificationModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String type,
      String postId,
      String comment,
      String senderId,
      int dateCreated,
      String mediaType,
      String recipient,
      String postThumbnail,
      String senderUsername,
      String senderProfilePic});
}

/// @nodoc
class __$CommentNotificationModelCopyWithImpl<$Res>
    extends _$CommentNotificationModelCopyWithImpl<$Res>
    implements _$CommentNotificationModelCopyWith<$Res> {
  __$CommentNotificationModelCopyWithImpl(_CommentNotificationModel _value,
      $Res Function(_CommentNotificationModel) _then)
      : super(_value, (v) => _then(v as _CommentNotificationModel));

  @override
  _CommentNotificationModel get _value =>
      super._value as _CommentNotificationModel;

  @override
  $Res call({
    Object? type = freezed,
    Object? postId = freezed,
    Object? comment = freezed,
    Object? senderId = freezed,
    Object? dateCreated = freezed,
    Object? mediaType = freezed,
    Object? recipient = freezed,
    Object? postThumbnail = freezed,
    Object? senderUsername = freezed,
    Object? senderProfilePic = freezed,
  }) {
    return _then(_CommentNotificationModel(
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      postId: postId == freezed
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String,
      comment: comment == freezed
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      senderId: senderId == freezed
          ? _value.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as String,
      dateCreated: dateCreated == freezed
          ? _value.dateCreated
          : dateCreated // ignore: cast_nullable_to_non_nullable
              as int,
      mediaType: mediaType == freezed
          ? _value.mediaType
          : mediaType // ignore: cast_nullable_to_non_nullable
              as String,
      recipient: recipient == freezed
          ? _value.recipient
          : recipient // ignore: cast_nullable_to_non_nullable
              as String,
      postThumbnail: postThumbnail == freezed
          ? _value.postThumbnail
          : postThumbnail // ignore: cast_nullable_to_non_nullable
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
class _$_CommentNotificationModel implements _CommentNotificationModel {
  const _$_CommentNotificationModel(
      {this.type = '',
      this.postId = '',
      this.comment = '',
      this.senderId = '',
      this.dateCreated = 0,
      this.mediaType = '',
      this.recipient = '',
      this.postThumbnail = '',
      this.senderUsername = '',
      this.senderProfilePic = ''});

  factory _$_CommentNotificationModel.fromJson(Map<String, dynamic> json) =>
      _$$_CommentNotificationModelFromJson(json);

  @JsonKey()
  @override
  final String type;
  @JsonKey()
  @override
  final String postId;
  @JsonKey()
  @override
  final String comment;
  @JsonKey()
  @override
  final String senderId;
  @JsonKey()
  @override
  final int dateCreated;
  @JsonKey()
  @override
  final String mediaType;
  @JsonKey()
  @override
  final String recipient;
  @JsonKey()
  @override
  final String postThumbnail;
  @JsonKey()
  @override
  final String senderUsername;
  @JsonKey()
  @override
  final String senderProfilePic;

  @override
  String toString() {
    return 'CommentNotificationModel(type: $type, postId: $postId, comment: $comment, senderId: $senderId, dateCreated: $dateCreated, mediaType: $mediaType, recipient: $recipient, postThumbnail: $postThumbnail, senderUsername: $senderUsername, senderProfilePic: $senderProfilePic)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CommentNotificationModel &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality().equals(other.postId, postId) &&
            const DeepCollectionEquality().equals(other.comment, comment) &&
            const DeepCollectionEquality().equals(other.senderId, senderId) &&
            const DeepCollectionEquality()
                .equals(other.dateCreated, dateCreated) &&
            const DeepCollectionEquality().equals(other.mediaType, mediaType) &&
            const DeepCollectionEquality().equals(other.recipient, recipient) &&
            const DeepCollectionEquality()
                .equals(other.postThumbnail, postThumbnail) &&
            const DeepCollectionEquality()
                .equals(other.senderUsername, senderUsername) &&
            const DeepCollectionEquality()
                .equals(other.senderProfilePic, senderProfilePic));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(postId),
      const DeepCollectionEquality().hash(comment),
      const DeepCollectionEquality().hash(senderId),
      const DeepCollectionEquality().hash(dateCreated),
      const DeepCollectionEquality().hash(mediaType),
      const DeepCollectionEquality().hash(recipient),
      const DeepCollectionEquality().hash(postThumbnail),
      const DeepCollectionEquality().hash(senderUsername),
      const DeepCollectionEquality().hash(senderProfilePic));

  @JsonKey(ignore: true)
  @override
  _$CommentNotificationModelCopyWith<_CommentNotificationModel> get copyWith =>
      __$CommentNotificationModelCopyWithImpl<_CommentNotificationModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CommentNotificationModelToJson(this);
  }
}

abstract class _CommentNotificationModel implements CommentNotificationModel {
  const factory _CommentNotificationModel(
      {String type,
      String postId,
      String comment,
      String senderId,
      int dateCreated,
      String mediaType,
      String recipient,
      String postThumbnail,
      String senderUsername,
      String senderProfilePic}) = _$_CommentNotificationModel;

  factory _CommentNotificationModel.fromJson(Map<String, dynamic> json) =
      _$_CommentNotificationModel.fromJson;

  @override
  String get type;
  @override
  String get postId;
  @override
  String get comment;
  @override
  String get senderId;
  @override
  int get dateCreated;
  @override
  String get mediaType;
  @override
  String get recipient;
  @override
  String get postThumbnail;
  @override
  String get senderUsername;
  @override
  String get senderProfilePic;
  @override
  @JsonKey(ignore: true)
  _$CommentNotificationModelCopyWith<_CommentNotificationModel> get copyWith =>
      throw _privateConstructorUsedError;
}
