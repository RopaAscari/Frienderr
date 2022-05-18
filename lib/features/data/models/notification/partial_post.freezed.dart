// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'partial_post.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PartialPost _$PartialPostFromJson(Map<String, dynamic> json) {
  return _PartialPost.fromJson(json);
}

/// @nodoc
class _$PartialPostTearOff {
  const _$PartialPostTearOff();

  _PartialPost call({required String id, required String display}) {
    return _PartialPost(
      id: id,
      display: display,
    );
  }

  PartialPost fromJson(Map<String, Object?> json) {
    return PartialPost.fromJson(json);
  }
}

/// @nodoc
const $PartialPost = _$PartialPostTearOff();

/// @nodoc
mixin _$PartialPost {
  String get id => throw _privateConstructorUsedError;
  String get display => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PartialPostCopyWith<PartialPost> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PartialPostCopyWith<$Res> {
  factory $PartialPostCopyWith(
          PartialPost value, $Res Function(PartialPost) then) =
      _$PartialPostCopyWithImpl<$Res>;
  $Res call({String id, String display});
}

/// @nodoc
class _$PartialPostCopyWithImpl<$Res> implements $PartialPostCopyWith<$Res> {
  _$PartialPostCopyWithImpl(this._value, this._then);

  final PartialPost _value;
  // ignore: unused_field
  final $Res Function(PartialPost) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? display = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      display: display == freezed
          ? _value.display
          : display // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$PartialPostCopyWith<$Res>
    implements $PartialPostCopyWith<$Res> {
  factory _$PartialPostCopyWith(
          _PartialPost value, $Res Function(_PartialPost) then) =
      __$PartialPostCopyWithImpl<$Res>;
  @override
  $Res call({String id, String display});
}

/// @nodoc
class __$PartialPostCopyWithImpl<$Res> extends _$PartialPostCopyWithImpl<$Res>
    implements _$PartialPostCopyWith<$Res> {
  __$PartialPostCopyWithImpl(
      _PartialPost _value, $Res Function(_PartialPost) _then)
      : super(_value, (v) => _then(v as _PartialPost));

  @override
  _PartialPost get _value => super._value as _PartialPost;

  @override
  $Res call({
    Object? id = freezed,
    Object? display = freezed,
  }) {
    return _then(_PartialPost(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      display: display == freezed
          ? _value.display
          : display // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PartialPost implements _PartialPost {
  const _$_PartialPost({required this.id, required this.display});

  factory _$_PartialPost.fromJson(Map<String, dynamic> json) =>
      _$$_PartialPostFromJson(json);

  @override
  final String id;
  @override
  final String display;

  @override
  String toString() {
    return 'PartialPost(id: $id, display: $display)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PartialPost &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.display, display));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(display));

  @JsonKey(ignore: true)
  @override
  _$PartialPostCopyWith<_PartialPost> get copyWith =>
      __$PartialPostCopyWithImpl<_PartialPost>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PartialPostToJson(this);
  }
}

abstract class _PartialPost implements PartialPost {
  const factory _PartialPost({required String id, required String display}) =
      _$_PartialPost;

  factory _PartialPost.fromJson(Map<String, dynamic> json) =
      _$_PartialPost.fromJson;

  @override
  String get id;
  @override
  String get display;
  @override
  @JsonKey(ignore: true)
  _$PartialPostCopyWith<_PartialPost> get copyWith =>
      throw _privateConstructorUsedError;
}
