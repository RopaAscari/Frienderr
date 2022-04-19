// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'messaging.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MessagingMetaData _$MessagingMetaDataFromJson(Map<String, dynamic> json) {
  return _MessagingMetaData.fromJson(json);
}

/// @nodoc
class _$MessagingMetaDataTearOff {
  const _$MessagingMetaDataTearOff();

  _MessagingMetaData call(
      {String chatId = '',
      dynamic chatRecipient = const {},
      dynamic chatUser = const {}}) {
    return _MessagingMetaData(
      chatId: chatId,
      chatRecipient: chatRecipient,
      chatUser: chatUser,
    );
  }

  MessagingMetaData fromJson(Map<String, Object?> json) {
    return MessagingMetaData.fromJson(json);
  }
}

/// @nodoc
const $MessagingMetaData = _$MessagingMetaDataTearOff();

/// @nodoc
mixin _$MessagingMetaData {
  String get chatId => throw _privateConstructorUsedError;
  dynamic get chatRecipient => throw _privateConstructorUsedError;
  dynamic get chatUser => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MessagingMetaDataCopyWith<MessagingMetaData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessagingMetaDataCopyWith<$Res> {
  factory $MessagingMetaDataCopyWith(
          MessagingMetaData value, $Res Function(MessagingMetaData) then) =
      _$MessagingMetaDataCopyWithImpl<$Res>;
  $Res call({String chatId, dynamic chatRecipient, dynamic chatUser});
}

/// @nodoc
class _$MessagingMetaDataCopyWithImpl<$Res>
    implements $MessagingMetaDataCopyWith<$Res> {
  _$MessagingMetaDataCopyWithImpl(this._value, this._then);

  final MessagingMetaData _value;
  // ignore: unused_field
  final $Res Function(MessagingMetaData) _then;

  @override
  $Res call({
    Object? chatId = freezed,
    Object? chatRecipient = freezed,
    Object? chatUser = freezed,
  }) {
    return _then(_value.copyWith(
      chatId: chatId == freezed
          ? _value.chatId
          : chatId // ignore: cast_nullable_to_non_nullable
              as String,
      chatRecipient: chatRecipient == freezed
          ? _value.chatRecipient
          : chatRecipient // ignore: cast_nullable_to_non_nullable
              as dynamic,
      chatUser: chatUser == freezed
          ? _value.chatUser
          : chatUser // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
abstract class _$MessagingMetaDataCopyWith<$Res>
    implements $MessagingMetaDataCopyWith<$Res> {
  factory _$MessagingMetaDataCopyWith(
          _MessagingMetaData value, $Res Function(_MessagingMetaData) then) =
      __$MessagingMetaDataCopyWithImpl<$Res>;
  @override
  $Res call({String chatId, dynamic chatRecipient, dynamic chatUser});
}

/// @nodoc
class __$MessagingMetaDataCopyWithImpl<$Res>
    extends _$MessagingMetaDataCopyWithImpl<$Res>
    implements _$MessagingMetaDataCopyWith<$Res> {
  __$MessagingMetaDataCopyWithImpl(
      _MessagingMetaData _value, $Res Function(_MessagingMetaData) _then)
      : super(_value, (v) => _then(v as _MessagingMetaData));

  @override
  _MessagingMetaData get _value => super._value as _MessagingMetaData;

  @override
  $Res call({
    Object? chatId = freezed,
    Object? chatRecipient = freezed,
    Object? chatUser = freezed,
  }) {
    return _then(_MessagingMetaData(
      chatId: chatId == freezed
          ? _value.chatId
          : chatId // ignore: cast_nullable_to_non_nullable
              as String,
      chatRecipient: chatRecipient == freezed
          ? _value.chatRecipient
          : chatRecipient // ignore: cast_nullable_to_non_nullable
              as dynamic,
      chatUser: chatUser == freezed
          ? _value.chatUser
          : chatUser // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MessagingMetaData implements _MessagingMetaData {
  const _$_MessagingMetaData(
      {this.chatId = '',
      this.chatRecipient = const {},
      this.chatUser = const {}});

  factory _$_MessagingMetaData.fromJson(Map<String, dynamic> json) =>
      _$$_MessagingMetaDataFromJson(json);

  @JsonKey()
  @override
  final String chatId;
  @JsonKey()
  @override
  final dynamic chatRecipient;
  @JsonKey()
  @override
  final dynamic chatUser;

  @override
  String toString() {
    return 'MessagingMetaData(chatId: $chatId, chatRecipient: $chatRecipient, chatUser: $chatUser)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MessagingMetaData &&
            const DeepCollectionEquality().equals(other.chatId, chatId) &&
            const DeepCollectionEquality()
                .equals(other.chatRecipient, chatRecipient) &&
            const DeepCollectionEquality().equals(other.chatUser, chatUser));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(chatId),
      const DeepCollectionEquality().hash(chatRecipient),
      const DeepCollectionEquality().hash(chatUser));

  @JsonKey(ignore: true)
  @override
  _$MessagingMetaDataCopyWith<_MessagingMetaData> get copyWith =>
      __$MessagingMetaDataCopyWithImpl<_MessagingMetaData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MessagingMetaDataToJson(this);
  }
}

abstract class _MessagingMetaData implements MessagingMetaData {
  const factory _MessagingMetaData(
      {String chatId,
      dynamic chatRecipient,
      dynamic chatUser}) = _$_MessagingMetaData;

  factory _MessagingMetaData.fromJson(Map<String, dynamic> json) =
      _$_MessagingMetaData.fromJson;

  @override
  String get chatId;
  @override
  dynamic get chatRecipient;
  @override
  dynamic get chatUser;
  @override
  @JsonKey(ignore: true)
  _$MessagingMetaDataCopyWith<_MessagingMetaData> get copyWith =>
      throw _privateConstructorUsedError;
}
