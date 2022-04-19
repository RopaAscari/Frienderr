// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PostUser _$PostUserFromJson(Map<String, dynamic> json) {
  return _PostUser.fromJson(json);
}

/// @nodoc
class _$PostUserTearOff {
  const _$PostUserTearOff();

  _PostUser call(
      {String id = '', String username = '', String profilePic = ''}) {
    return _PostUser(
      id: id,
      username: username,
      profilePic: profilePic,
    );
  }

  PostUser fromJson(Map<String, Object?> json) {
    return PostUser.fromJson(json);
  }
}

/// @nodoc
const $PostUser = _$PostUserTearOff();

/// @nodoc
mixin _$PostUser {
  String get id => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String get profilePic => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostUserCopyWith<PostUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostUserCopyWith<$Res> {
  factory $PostUserCopyWith(PostUser value, $Res Function(PostUser) then) =
      _$PostUserCopyWithImpl<$Res>;
  $Res call({String id, String username, String profilePic});
}

/// @nodoc
class _$PostUserCopyWithImpl<$Res> implements $PostUserCopyWith<$Res> {
  _$PostUserCopyWithImpl(this._value, this._then);

  final PostUser _value;
  // ignore: unused_field
  final $Res Function(PostUser) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? username = freezed,
    Object? profilePic = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      profilePic: profilePic == freezed
          ? _value.profilePic
          : profilePic // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$PostUserCopyWith<$Res> implements $PostUserCopyWith<$Res> {
  factory _$PostUserCopyWith(_PostUser value, $Res Function(_PostUser) then) =
      __$PostUserCopyWithImpl<$Res>;
  @override
  $Res call({String id, String username, String profilePic});
}

/// @nodoc
class __$PostUserCopyWithImpl<$Res> extends _$PostUserCopyWithImpl<$Res>
    implements _$PostUserCopyWith<$Res> {
  __$PostUserCopyWithImpl(_PostUser _value, $Res Function(_PostUser) _then)
      : super(_value, (v) => _then(v as _PostUser));

  @override
  _PostUser get _value => super._value as _PostUser;

  @override
  $Res call({
    Object? id = freezed,
    Object? username = freezed,
    Object? profilePic = freezed,
  }) {
    return _then(_PostUser(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      profilePic: profilePic == freezed
          ? _value.profilePic
          : profilePic // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PostUser implements _PostUser {
  const _$_PostUser({this.id = '', this.username = '', this.profilePic = ''});

  factory _$_PostUser.fromJson(Map<String, dynamic> json) =>
      _$$_PostUserFromJson(json);

  @JsonKey()
  @override
  final String id;
  @JsonKey()
  @override
  final String username;
  @JsonKey()
  @override
  final String profilePic;

  @override
  String toString() {
    return 'PostUser(id: $id, username: $username, profilePic: $profilePic)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PostUser &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.username, username) &&
            const DeepCollectionEquality()
                .equals(other.profilePic, profilePic));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(username),
      const DeepCollectionEquality().hash(profilePic));

  @JsonKey(ignore: true)
  @override
  _$PostUserCopyWith<_PostUser> get copyWith =>
      __$PostUserCopyWithImpl<_PostUser>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PostUserToJson(this);
  }
}

abstract class _PostUser implements PostUser {
  const factory _PostUser({String id, String username, String profilePic}) =
      _$_PostUser;

  factory _PostUser.fromJson(Map<String, dynamic> json) = _$_PostUser.fromJson;

  @override
  String get id;
  @override
  String get username;
  @override
  String get profilePic;
  @override
  @JsonKey(ignore: true)
  _$PostUserCopyWith<_PostUser> get copyWith =>
      throw _privateConstructorUsedError;
}
