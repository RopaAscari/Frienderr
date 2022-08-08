// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'story_media.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StoryMedia _$StoryMediaFromJson(Map<String, dynamic> json) {
  return _StoryMedia.fromJson(json);
}

/// @nodoc
class _$StoryMediaTearOff {
  const _$StoryMediaTearOff();

  _StoryMedia call(
      {String url = '', String type = '', required StoryMetadata metadata}) {
    return _StoryMedia(
      url: url,
      type: type,
      metadata: metadata,
    );
  }

  StoryMedia fromJson(Map<String, Object?> json) {
    return StoryMedia.fromJson(json);
  }
}

/// @nodoc
const $StoryMedia = _$StoryMediaTearOff();

/// @nodoc
mixin _$StoryMedia {
  String get url => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  StoryMetadata get metadata => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StoryMediaCopyWith<StoryMedia> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoryMediaCopyWith<$Res> {
  factory $StoryMediaCopyWith(
          StoryMedia value, $Res Function(StoryMedia) then) =
      _$StoryMediaCopyWithImpl<$Res>;
  $Res call({String url, String type, StoryMetadata metadata});

  $StoryMetadataCopyWith<$Res> get metadata;
}

/// @nodoc
class _$StoryMediaCopyWithImpl<$Res> implements $StoryMediaCopyWith<$Res> {
  _$StoryMediaCopyWithImpl(this._value, this._then);

  final StoryMedia _value;
  // ignore: unused_field
  final $Res Function(StoryMedia) _then;

  @override
  $Res call({
    Object? url = freezed,
    Object? type = freezed,
    Object? metadata = freezed,
  }) {
    return _then(_value.copyWith(
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      metadata: metadata == freezed
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as StoryMetadata,
    ));
  }

  @override
  $StoryMetadataCopyWith<$Res> get metadata {
    return $StoryMetadataCopyWith<$Res>(_value.metadata, (value) {
      return _then(_value.copyWith(metadata: value));
    });
  }
}

/// @nodoc
abstract class _$StoryMediaCopyWith<$Res> implements $StoryMediaCopyWith<$Res> {
  factory _$StoryMediaCopyWith(
          _StoryMedia value, $Res Function(_StoryMedia) then) =
      __$StoryMediaCopyWithImpl<$Res>;
  @override
  $Res call({String url, String type, StoryMetadata metadata});

  @override
  $StoryMetadataCopyWith<$Res> get metadata;
}

/// @nodoc
class __$StoryMediaCopyWithImpl<$Res> extends _$StoryMediaCopyWithImpl<$Res>
    implements _$StoryMediaCopyWith<$Res> {
  __$StoryMediaCopyWithImpl(
      _StoryMedia _value, $Res Function(_StoryMedia) _then)
      : super(_value, (v) => _then(v as _StoryMedia));

  @override
  _StoryMedia get _value => super._value as _StoryMedia;

  @override
  $Res call({
    Object? url = freezed,
    Object? type = freezed,
    Object? metadata = freezed,
  }) {
    return _then(_StoryMedia(
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      metadata: metadata == freezed
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as StoryMetadata,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_StoryMedia implements _StoryMedia {
  const _$_StoryMedia({this.url = '', this.type = '', required this.metadata});

  factory _$_StoryMedia.fromJson(Map<String, dynamic> json) =>
      _$$_StoryMediaFromJson(json);

  @JsonKey()
  @override
  final String url;
  @JsonKey()
  @override
  final String type;
  @override
  final StoryMetadata metadata;

  @override
  String toString() {
    return 'StoryMedia(url: $url, type: $type, metadata: $metadata)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _StoryMedia &&
            const DeepCollectionEquality().equals(other.url, url) &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality().equals(other.metadata, metadata));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(url),
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(metadata));

  @JsonKey(ignore: true)
  @override
  _$StoryMediaCopyWith<_StoryMedia> get copyWith =>
      __$StoryMediaCopyWithImpl<_StoryMedia>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StoryMediaToJson(this);
  }
}

abstract class _StoryMedia implements StoryMedia {
  const factory _StoryMedia(
      {String url,
      String type,
      required StoryMetadata metadata}) = _$_StoryMedia;

  factory _StoryMedia.fromJson(Map<String, dynamic> json) =
      _$_StoryMedia.fromJson;

  @override
  String get url;
  @override
  String get type;
  @override
  StoryMetadata get metadata;
  @override
  @JsonKey(ignore: true)
  _$StoryMediaCopyWith<_StoryMedia> get copyWith =>
      throw _privateConstructorUsedError;
}
