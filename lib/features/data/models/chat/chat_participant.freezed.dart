// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'chat_participant.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ChatParticipant _$ChatParticipantFromJson(Map<String, dynamic> json) {
  return _ChatParticipant.fromJson(json);
}

/// @nodoc
class _$ChatParticipantTearOff {
  const _$ChatParticipantTearOff();

  _ChatParticipant call(
      {String id = '', String profilePic = '', String username = ''}) {
    return _ChatParticipant(
      id: id,
      profilePic: profilePic,
      username: username,
    );
  }

  ChatParticipant fromJson(Map<String, Object?> json) {
    return ChatParticipant.fromJson(json);
  }
}

/// @nodoc
const $ChatParticipant = _$ChatParticipantTearOff();

/// @nodoc
mixin _$ChatParticipant {
  String get id => throw _privateConstructorUsedError;
  String get profilePic => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatParticipantCopyWith<ChatParticipant> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatParticipantCopyWith<$Res> {
  factory $ChatParticipantCopyWith(
          ChatParticipant value, $Res Function(ChatParticipant) then) =
      _$ChatParticipantCopyWithImpl<$Res>;
  $Res call({String id, String profilePic, String username});
}

/// @nodoc
class _$ChatParticipantCopyWithImpl<$Res>
    implements $ChatParticipantCopyWith<$Res> {
  _$ChatParticipantCopyWithImpl(this._value, this._then);

  final ChatParticipant _value;
  // ignore: unused_field
  final $Res Function(ChatParticipant) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? profilePic = freezed,
    Object? username = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      profilePic: profilePic == freezed
          ? _value.profilePic
          : profilePic // ignore: cast_nullable_to_non_nullable
              as String,
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$ChatParticipantCopyWith<$Res>
    implements $ChatParticipantCopyWith<$Res> {
  factory _$ChatParticipantCopyWith(
          _ChatParticipant value, $Res Function(_ChatParticipant) then) =
      __$ChatParticipantCopyWithImpl<$Res>;
  @override
  $Res call({String id, String profilePic, String username});
}

/// @nodoc
class __$ChatParticipantCopyWithImpl<$Res>
    extends _$ChatParticipantCopyWithImpl<$Res>
    implements _$ChatParticipantCopyWith<$Res> {
  __$ChatParticipantCopyWithImpl(
      _ChatParticipant _value, $Res Function(_ChatParticipant) _then)
      : super(_value, (v) => _then(v as _ChatParticipant));

  @override
  _ChatParticipant get _value => super._value as _ChatParticipant;

  @override
  $Res call({
    Object? id = freezed,
    Object? profilePic = freezed,
    Object? username = freezed,
  }) {
    return _then(_ChatParticipant(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      profilePic: profilePic == freezed
          ? _value.profilePic
          : profilePic // ignore: cast_nullable_to_non_nullable
              as String,
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ChatParticipant implements _ChatParticipant {
  const _$_ChatParticipant(
      {this.id = '', this.profilePic = '', this.username = ''});

  factory _$_ChatParticipant.fromJson(Map<String, dynamic> json) =>
      _$$_ChatParticipantFromJson(json);

  @JsonKey()
  @override
  final String id;
  @JsonKey()
  @override
  final String profilePic;
  @JsonKey()
  @override
  final String username;

  @override
  String toString() {
    return 'ChatParticipant(id: $id, profilePic: $profilePic, username: $username)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChatParticipant &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality()
                .equals(other.profilePic, profilePic) &&
            const DeepCollectionEquality().equals(other.username, username));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(profilePic),
      const DeepCollectionEquality().hash(username));

  @JsonKey(ignore: true)
  @override
  _$ChatParticipantCopyWith<_ChatParticipant> get copyWith =>
      __$ChatParticipantCopyWithImpl<_ChatParticipant>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChatParticipantToJson(this);
  }
}

abstract class _ChatParticipant implements ChatParticipant {
  const factory _ChatParticipant(
      {String id, String profilePic, String username}) = _$_ChatParticipant;

  factory _ChatParticipant.fromJson(Map<String, dynamic> json) =
      _$_ChatParticipant.fromJson;

  @override
  String get id;
  @override
  String get profilePic;
  @override
  String get username;
  @override
  @JsonKey(ignore: true)
  _$ChatParticipantCopyWith<_ChatParticipant> get copyWith =>
      throw _privateConstructorUsedError;
}
