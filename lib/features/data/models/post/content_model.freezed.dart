// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'content_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ContentModel _$ContentModelFromJson(Map<String, dynamic> json) {
  return _ContentModel.fromJson(json);
}

/// @nodoc
class _$ContentModelTearOff {
  const _$ContentModelTearOff();

  _ContentModel call(
      {String type = '',
      String media = '',
      String thumbnail = '',
      List<dynamic> metadata = const []}) {
    return _ContentModel(
      type: type,
      media: media,
      thumbnail: thumbnail,
      metadata: metadata,
    );
  }

  ContentModel fromJson(Map<String, Object?> json) {
    return ContentModel.fromJson(json);
  }
}

/// @nodoc
const $ContentModel = _$ContentModelTearOff();

/// @nodoc
mixin _$ContentModel {
  String get type => throw _privateConstructorUsedError;
  String get media => throw _privateConstructorUsedError;
  String get thumbnail => throw _privateConstructorUsedError;
  List<dynamic> get metadata => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ContentModelCopyWith<ContentModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContentModelCopyWith<$Res> {
  factory $ContentModelCopyWith(
          ContentModel value, $Res Function(ContentModel) then) =
      _$ContentModelCopyWithImpl<$Res>;
  $Res call(
      {String type, String media, String thumbnail, List<dynamic> metadata});
}

/// @nodoc
class _$ContentModelCopyWithImpl<$Res> implements $ContentModelCopyWith<$Res> {
  _$ContentModelCopyWithImpl(this._value, this._then);

  final ContentModel _value;
  // ignore: unused_field
  final $Res Function(ContentModel) _then;

  @override
  $Res call({
    Object? type = freezed,
    Object? media = freezed,
    Object? thumbnail = freezed,
    Object? metadata = freezed,
  }) {
    return _then(_value.copyWith(
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      media: media == freezed
          ? _value.media
          : media // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnail: thumbnail == freezed
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String,
      metadata: metadata == freezed
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ));
  }
}

/// @nodoc
abstract class _$ContentModelCopyWith<$Res>
    implements $ContentModelCopyWith<$Res> {
  factory _$ContentModelCopyWith(
          _ContentModel value, $Res Function(_ContentModel) then) =
      __$ContentModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String type, String media, String thumbnail, List<dynamic> metadata});
}

/// @nodoc
class __$ContentModelCopyWithImpl<$Res> extends _$ContentModelCopyWithImpl<$Res>
    implements _$ContentModelCopyWith<$Res> {
  __$ContentModelCopyWithImpl(
      _ContentModel _value, $Res Function(_ContentModel) _then)
      : super(_value, (v) => _then(v as _ContentModel));

  @override
  _ContentModel get _value => super._value as _ContentModel;

  @override
  $Res call({
    Object? type = freezed,
    Object? media = freezed,
    Object? thumbnail = freezed,
    Object? metadata = freezed,
  }) {
    return _then(_ContentModel(
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      media: media == freezed
          ? _value.media
          : media // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnail: thumbnail == freezed
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String,
      metadata: metadata == freezed
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ContentModel implements _ContentModel {
  const _$_ContentModel(
      {this.type = '',
      this.media = '',
      this.thumbnail = '',
      this.metadata = const []});

  factory _$_ContentModel.fromJson(Map<String, dynamic> json) =>
      _$$_ContentModelFromJson(json);

  @JsonKey()
  @override
  final String type;
  @JsonKey()
  @override
  final String media;
  @JsonKey()
  @override
  final String thumbnail;
  @JsonKey()
  @override
  final List<dynamic> metadata;

  @override
  String toString() {
    return 'ContentModel(type: $type, media: $media, thumbnail: $thumbnail, metadata: $metadata)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ContentModel &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality().equals(other.media, media) &&
            const DeepCollectionEquality().equals(other.thumbnail, thumbnail) &&
            const DeepCollectionEquality().equals(other.metadata, metadata));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(media),
      const DeepCollectionEquality().hash(thumbnail),
      const DeepCollectionEquality().hash(metadata));

  @JsonKey(ignore: true)
  @override
  _$ContentModelCopyWith<_ContentModel> get copyWith =>
      __$ContentModelCopyWithImpl<_ContentModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ContentModelToJson(this);
  }
}

abstract class _ContentModel implements ContentModel {
  const factory _ContentModel(
      {String type,
      String media,
      String thumbnail,
      List<dynamic> metadata}) = _$_ContentModel;

  factory _ContentModel.fromJson(Map<String, dynamic> json) =
      _$_ContentModel.fromJson;

  @override
  String get type;
  @override
  String get media;
  @override
  String get thumbnail;
  @override
  List<dynamic> get metadata;
  @override
  @JsonKey(ignore: true)
  _$ContentModelCopyWith<_ContentModel> get copyWith =>
      throw _privateConstructorUsedError;
}
