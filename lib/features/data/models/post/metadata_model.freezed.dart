// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'metadata_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PostMetadata _$PostMetadataFromJson(Map<String, dynamic> json) {
  return _PostMetadata.fromJson(json);
}

/// @nodoc
class _$PostMetadataTearOff {
  const _$PostMetadataTearOff();

  _PostMetadata call({String? thumbnail = null}) {
    return _PostMetadata(
      thumbnail: thumbnail,
    );
  }

  PostMetadata fromJson(Map<String, Object?> json) {
    return PostMetadata.fromJson(json);
  }
}

/// @nodoc
const $PostMetadata = _$PostMetadataTearOff();

/// @nodoc
mixin _$PostMetadata {
  String? get thumbnail => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostMetadataCopyWith<PostMetadata> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostMetadataCopyWith<$Res> {
  factory $PostMetadataCopyWith(
          PostMetadata value, $Res Function(PostMetadata) then) =
      _$PostMetadataCopyWithImpl<$Res>;
  $Res call({String? thumbnail});
}

/// @nodoc
class _$PostMetadataCopyWithImpl<$Res> implements $PostMetadataCopyWith<$Res> {
  _$PostMetadataCopyWithImpl(this._value, this._then);

  final PostMetadata _value;
  // ignore: unused_field
  final $Res Function(PostMetadata) _then;

  @override
  $Res call({
    Object? thumbnail = freezed,
  }) {
    return _then(_value.copyWith(
      thumbnail: thumbnail == freezed
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$PostMetadataCopyWith<$Res>
    implements $PostMetadataCopyWith<$Res> {
  factory _$PostMetadataCopyWith(
          _PostMetadata value, $Res Function(_PostMetadata) then) =
      __$PostMetadataCopyWithImpl<$Res>;
  @override
  $Res call({String? thumbnail});
}

/// @nodoc
class __$PostMetadataCopyWithImpl<$Res> extends _$PostMetadataCopyWithImpl<$Res>
    implements _$PostMetadataCopyWith<$Res> {
  __$PostMetadataCopyWithImpl(
      _PostMetadata _value, $Res Function(_PostMetadata) _then)
      : super(_value, (v) => _then(v as _PostMetadata));

  @override
  _PostMetadata get _value => super._value as _PostMetadata;

  @override
  $Res call({
    Object? thumbnail = freezed,
  }) {
    return _then(_PostMetadata(
      thumbnail: thumbnail == freezed
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PostMetadata implements _PostMetadata {
  const _$_PostMetadata({this.thumbnail = null});

  factory _$_PostMetadata.fromJson(Map<String, dynamic> json) =>
      _$$_PostMetadataFromJson(json);

  @JsonKey()
  @override
  final String? thumbnail;

  @override
  String toString() {
    return 'PostMetadata(thumbnail: $thumbnail)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PostMetadata &&
            const DeepCollectionEquality().equals(other.thumbnail, thumbnail));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(thumbnail));

  @JsonKey(ignore: true)
  @override
  _$PostMetadataCopyWith<_PostMetadata> get copyWith =>
      __$PostMetadataCopyWithImpl<_PostMetadata>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PostMetadataToJson(this);
  }
}

abstract class _PostMetadata implements PostMetadata {
  const factory _PostMetadata({String? thumbnail}) = _$_PostMetadata;

  factory _PostMetadata.fromJson(Map<String, dynamic> json) =
      _$_PostMetadata.fromJson;

  @override
  String? get thumbnail;
  @override
  @JsonKey(ignore: true)
  _$PostMetadataCopyWith<_PostMetadata> get copyWith =>
      throw _privateConstructorUsedError;
}
