// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'story_metadata.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StoryMetadataModel _$StoryMetadataModelFromJson(Map<String, dynamic> json) {
  return _StoryMetadataModel.fromJson(json);
}

/// @nodoc
class _$StoryMetadataModelTearOff {
  const _$StoryMetadataModelTearOff();

  _StoryMetadataModel call({int duration = 0, String? thumbnail = null}) {
    return _StoryMetadataModel(
      duration: duration,
      thumbnail: thumbnail,
    );
  }

  StoryMetadataModel fromJson(Map<String, Object?> json) {
    return StoryMetadataModel.fromJson(json);
  }
}

/// @nodoc
const $StoryMetadataModel = _$StoryMetadataModelTearOff();

/// @nodoc
mixin _$StoryMetadataModel {
  int get duration => throw _privateConstructorUsedError;
  String? get thumbnail => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StoryMetadataModelCopyWith<StoryMetadataModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoryMetadataModelCopyWith<$Res> {
  factory $StoryMetadataModelCopyWith(
          StoryMetadataModel value, $Res Function(StoryMetadataModel) then) =
      _$StoryMetadataModelCopyWithImpl<$Res>;
  $Res call({int duration, String? thumbnail});
}

/// @nodoc
class _$StoryMetadataModelCopyWithImpl<$Res>
    implements $StoryMetadataModelCopyWith<$Res> {
  _$StoryMetadataModelCopyWithImpl(this._value, this._then);

  final StoryMetadataModel _value;
  // ignore: unused_field
  final $Res Function(StoryMetadataModel) _then;

  @override
  $Res call({
    Object? duration = freezed,
    Object? thumbnail = freezed,
  }) {
    return _then(_value.copyWith(
      duration: duration == freezed
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
      thumbnail: thumbnail == freezed
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$StoryMetadataModelCopyWith<$Res>
    implements $StoryMetadataModelCopyWith<$Res> {
  factory _$StoryMetadataModelCopyWith(
          _StoryMetadataModel value, $Res Function(_StoryMetadataModel) then) =
      __$StoryMetadataModelCopyWithImpl<$Res>;
  @override
  $Res call({int duration, String? thumbnail});
}

/// @nodoc
class __$StoryMetadataModelCopyWithImpl<$Res>
    extends _$StoryMetadataModelCopyWithImpl<$Res>
    implements _$StoryMetadataModelCopyWith<$Res> {
  __$StoryMetadataModelCopyWithImpl(
      _StoryMetadataModel _value, $Res Function(_StoryMetadataModel) _then)
      : super(_value, (v) => _then(v as _StoryMetadataModel));

  @override
  _StoryMetadataModel get _value => super._value as _StoryMetadataModel;

  @override
  $Res call({
    Object? duration = freezed,
    Object? thumbnail = freezed,
  }) {
    return _then(_StoryMetadataModel(
      duration: duration == freezed
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
      thumbnail: thumbnail == freezed
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_StoryMetadataModel implements _StoryMetadataModel {
  const _$_StoryMetadataModel({this.duration = 0, this.thumbnail = null});

  factory _$_StoryMetadataModel.fromJson(Map<String, dynamic> json) =>
      _$$_StoryMetadataModelFromJson(json);

  @JsonKey()
  @override
  final int duration;
  @JsonKey()
  @override
  final String? thumbnail;

  @override
  String toString() {
    return 'StoryMetadataModel(duration: $duration, thumbnail: $thumbnail)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _StoryMetadataModel &&
            const DeepCollectionEquality().equals(other.duration, duration) &&
            const DeepCollectionEquality().equals(other.thumbnail, thumbnail));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(duration),
      const DeepCollectionEquality().hash(thumbnail));

  @JsonKey(ignore: true)
  @override
  _$StoryMetadataModelCopyWith<_StoryMetadataModel> get copyWith =>
      __$StoryMetadataModelCopyWithImpl<_StoryMetadataModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StoryMetadataModelToJson(this);
  }
}

abstract class _StoryMetadataModel implements StoryMetadataModel {
  const factory _StoryMetadataModel({int duration, String? thumbnail}) =
      _$_StoryMetadataModel;

  factory _StoryMetadataModel.fromJson(Map<String, dynamic> json) =
      _$_StoryMetadataModel.fromJson;

  @override
  int get duration;
  @override
  String? get thumbnail;
  @override
  @JsonKey(ignore: true)
  _$StoryMetadataModelCopyWith<_StoryMetadataModel> get copyWith =>
      throw _privateConstructorUsedError;
}
