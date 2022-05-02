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

PostMetadataModel _$PostMetadataModelFromJson(Map<String, dynamic> json) {
  return _PostMetadataModel.fromJson(json);
}

/// @nodoc
class _$PostMetadataModelTearOff {
  const _$PostMetadataModelTearOff();

  _PostMetadataModel call({String? thumbnail = null}) {
    return _PostMetadataModel(
      thumbnail: thumbnail,
    );
  }

  PostMetadataModel fromJson(Map<String, Object?> json) {
    return PostMetadataModel.fromJson(json);
  }
}

/// @nodoc
const $PostMetadataModel = _$PostMetadataModelTearOff();

/// @nodoc
mixin _$PostMetadataModel {
  String? get thumbnail => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostMetadataModelCopyWith<PostMetadataModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostMetadataModelCopyWith<$Res> {
  factory $PostMetadataModelCopyWith(
          PostMetadataModel value, $Res Function(PostMetadataModel) then) =
      _$PostMetadataModelCopyWithImpl<$Res>;
  $Res call({String? thumbnail});
}

/// @nodoc
class _$PostMetadataModelCopyWithImpl<$Res>
    implements $PostMetadataModelCopyWith<$Res> {
  _$PostMetadataModelCopyWithImpl(this._value, this._then);

  final PostMetadataModel _value;
  // ignore: unused_field
  final $Res Function(PostMetadataModel) _then;

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
abstract class _$PostMetadataModelCopyWith<$Res>
    implements $PostMetadataModelCopyWith<$Res> {
  factory _$PostMetadataModelCopyWith(
          _PostMetadataModel value, $Res Function(_PostMetadataModel) then) =
      __$PostMetadataModelCopyWithImpl<$Res>;
  @override
  $Res call({String? thumbnail});
}

/// @nodoc
class __$PostMetadataModelCopyWithImpl<$Res>
    extends _$PostMetadataModelCopyWithImpl<$Res>
    implements _$PostMetadataModelCopyWith<$Res> {
  __$PostMetadataModelCopyWithImpl(
      _PostMetadataModel _value, $Res Function(_PostMetadataModel) _then)
      : super(_value, (v) => _then(v as _PostMetadataModel));

  @override
  _PostMetadataModel get _value => super._value as _PostMetadataModel;

  @override
  $Res call({
    Object? thumbnail = freezed,
  }) {
    return _then(_PostMetadataModel(
      thumbnail: thumbnail == freezed
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PostMetadataModel implements _PostMetadataModel {
  const _$_PostMetadataModel({this.thumbnail = null});

  factory _$_PostMetadataModel.fromJson(Map<String, dynamic> json) =>
      _$$_PostMetadataModelFromJson(json);

  @JsonKey()
  @override
  final String? thumbnail;

  @override
  String toString() {
    return 'PostMetadataModel(thumbnail: $thumbnail)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PostMetadataModel &&
            const DeepCollectionEquality().equals(other.thumbnail, thumbnail));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(thumbnail));

  @JsonKey(ignore: true)
  @override
  _$PostMetadataModelCopyWith<_PostMetadataModel> get copyWith =>
      __$PostMetadataModelCopyWithImpl<_PostMetadataModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PostMetadataModelToJson(this);
  }
}

abstract class _PostMetadataModel implements PostMetadataModel {
  const factory _PostMetadataModel({String? thumbnail}) = _$_PostMetadataModel;

  factory _PostMetadataModel.fromJson(Map<String, dynamic> json) =
      _$_PostMetadataModel.fromJson;

  @override
  String? get thumbnail;
  @override
  @JsonKey(ignore: true)
  _$PostMetadataModelCopyWith<_PostMetadataModel> get copyWith =>
      throw _privateConstructorUsedError;
}
