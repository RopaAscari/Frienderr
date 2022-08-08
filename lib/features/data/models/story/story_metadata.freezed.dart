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

StoryMetadata _$StoryMetadataFromJson(Map<String, dynamic> json) {
  return _StoryMetadata.fromJson(json);
}

/// @nodoc
class _$StoryMetadataTearOff {
  const _$StoryMetadataTearOff();

  _StoryMetadata call({int duration = 0, String? thumbnail = null}) {
    return _StoryMetadata(
      duration: duration,
      thumbnail: thumbnail,
    );
  }

  StoryMetadata fromJson(Map<String, Object?> json) {
    return StoryMetadata.fromJson(json);
  }
}

/// @nodoc
const $StoryMetadata = _$StoryMetadataTearOff();

/// @nodoc
mixin _$StoryMetadata {
  int get duration => throw _privateConstructorUsedError;
  String? get thumbnail => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StoryMetadataCopyWith<StoryMetadata> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoryMetadataCopyWith<$Res> {
  factory $StoryMetadataCopyWith(
          StoryMetadata value, $Res Function(StoryMetadata) then) =
      _$StoryMetadataCopyWithImpl<$Res>;
  $Res call({int duration, String? thumbnail});
}

/// @nodoc
class _$StoryMetadataCopyWithImpl<$Res>
    implements $StoryMetadataCopyWith<$Res> {
  _$StoryMetadataCopyWithImpl(this._value, this._then);

  final StoryMetadata _value;
  // ignore: unused_field
  final $Res Function(StoryMetadata) _then;

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
abstract class _$StoryMetadataCopyWith<$Res>
    implements $StoryMetadataCopyWith<$Res> {
  factory _$StoryMetadataCopyWith(
          _StoryMetadata value, $Res Function(_StoryMetadata) then) =
      __$StoryMetadataCopyWithImpl<$Res>;
  @override
  $Res call({int duration, String? thumbnail});
}

/// @nodoc
class __$StoryMetadataCopyWithImpl<$Res>
    extends _$StoryMetadataCopyWithImpl<$Res>
    implements _$StoryMetadataCopyWith<$Res> {
  __$StoryMetadataCopyWithImpl(
      _StoryMetadata _value, $Res Function(_StoryMetadata) _then)
      : super(_value, (v) => _then(v as _StoryMetadata));

  @override
  _StoryMetadata get _value => super._value as _StoryMetadata;

  @override
  $Res call({
    Object? duration = freezed,
    Object? thumbnail = freezed,
  }) {
    return _then(_StoryMetadata(
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
class _$_StoryMetadata implements _StoryMetadata {
  const _$_StoryMetadata({this.duration = 0, this.thumbnail = null});

  factory _$_StoryMetadata.fromJson(Map<String, dynamic> json) =>
      _$$_StoryMetadataFromJson(json);

  @JsonKey()
  @override
  final int duration;
  @JsonKey()
  @override
  final String? thumbnail;

  @override
  String toString() {
    return 'StoryMetadata(duration: $duration, thumbnail: $thumbnail)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _StoryMetadata &&
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
  _$StoryMetadataCopyWith<_StoryMetadata> get copyWith =>
      __$StoryMetadataCopyWithImpl<_StoryMetadata>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StoryMetadataToJson(this);
  }
}

abstract class _StoryMetadata implements StoryMetadata {
  const factory _StoryMetadata({int duration, String? thumbnail}) =
      _$_StoryMetadata;

  factory _StoryMetadata.fromJson(Map<String, dynamic> json) =
      _$_StoryMetadata.fromJson;

  @override
  int get duration;
  @override
  String? get thumbnail;
  @override
  @JsonKey(ignore: true)
  _$StoryMetadataCopyWith<_StoryMetadata> get copyWith =>
      throw _privateConstructorUsedError;
}
