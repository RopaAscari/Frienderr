// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'story_content.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StoryContent _$StoryContentFromJson(Map<String, dynamic> json) {
  return _StoryContent.fromJson(json);
}

/// @nodoc
class _$StoryContentTearOff {
  const _$StoryContentTearOff();

  _StoryContent call(
      {String id = '',
      required StoryMedia media,
      int dateCreated = 0,
      List<String> views = const [],
      List<String> likes = const []}) {
    return _StoryContent(
      id: id,
      media: media,
      dateCreated: dateCreated,
      views: views,
      likes: likes,
    );
  }

  StoryContent fromJson(Map<String, Object?> json) {
    return StoryContent.fromJson(json);
  }
}

/// @nodoc
const $StoryContent = _$StoryContentTearOff();

/// @nodoc
mixin _$StoryContent {
  String get id => throw _privateConstructorUsedError;
  StoryMedia get media => throw _privateConstructorUsedError;
  int get dateCreated => throw _privateConstructorUsedError;
  List<String> get views => throw _privateConstructorUsedError;
  List<String> get likes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StoryContentCopyWith<StoryContent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoryContentCopyWith<$Res> {
  factory $StoryContentCopyWith(
          StoryContent value, $Res Function(StoryContent) then) =
      _$StoryContentCopyWithImpl<$Res>;
  $Res call(
      {String id,
      StoryMedia media,
      int dateCreated,
      List<String> views,
      List<String> likes});

  $StoryMediaCopyWith<$Res> get media;
}

/// @nodoc
class _$StoryContentCopyWithImpl<$Res> implements $StoryContentCopyWith<$Res> {
  _$StoryContentCopyWithImpl(this._value, this._then);

  final StoryContent _value;
  // ignore: unused_field
  final $Res Function(StoryContent) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? media = freezed,
    Object? dateCreated = freezed,
    Object? views = freezed,
    Object? likes = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      media: media == freezed
          ? _value.media
          : media // ignore: cast_nullable_to_non_nullable
              as StoryMedia,
      dateCreated: dateCreated == freezed
          ? _value.dateCreated
          : dateCreated // ignore: cast_nullable_to_non_nullable
              as int,
      views: views == freezed
          ? _value.views
          : views // ignore: cast_nullable_to_non_nullable
              as List<String>,
      likes: likes == freezed
          ? _value.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }

  @override
  $StoryMediaCopyWith<$Res> get media {
    return $StoryMediaCopyWith<$Res>(_value.media, (value) {
      return _then(_value.copyWith(media: value));
    });
  }
}

/// @nodoc
abstract class _$StoryContentCopyWith<$Res>
    implements $StoryContentCopyWith<$Res> {
  factory _$StoryContentCopyWith(
          _StoryContent value, $Res Function(_StoryContent) then) =
      __$StoryContentCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      StoryMedia media,
      int dateCreated,
      List<String> views,
      List<String> likes});

  @override
  $StoryMediaCopyWith<$Res> get media;
}

/// @nodoc
class __$StoryContentCopyWithImpl<$Res> extends _$StoryContentCopyWithImpl<$Res>
    implements _$StoryContentCopyWith<$Res> {
  __$StoryContentCopyWithImpl(
      _StoryContent _value, $Res Function(_StoryContent) _then)
      : super(_value, (v) => _then(v as _StoryContent));

  @override
  _StoryContent get _value => super._value as _StoryContent;

  @override
  $Res call({
    Object? id = freezed,
    Object? media = freezed,
    Object? dateCreated = freezed,
    Object? views = freezed,
    Object? likes = freezed,
  }) {
    return _then(_StoryContent(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      media: media == freezed
          ? _value.media
          : media // ignore: cast_nullable_to_non_nullable
              as StoryMedia,
      dateCreated: dateCreated == freezed
          ? _value.dateCreated
          : dateCreated // ignore: cast_nullable_to_non_nullable
              as int,
      views: views == freezed
          ? _value.views
          : views // ignore: cast_nullable_to_non_nullable
              as List<String>,
      likes: likes == freezed
          ? _value.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_StoryContent implements _StoryContent {
  const _$_StoryContent(
      {this.id = '',
      required this.media,
      this.dateCreated = 0,
      this.views = const [],
      this.likes = const []});

  factory _$_StoryContent.fromJson(Map<String, dynamic> json) =>
      _$$_StoryContentFromJson(json);

  @JsonKey()
  @override
  final String id;
  @override
  final StoryMedia media;
  @JsonKey()
  @override
  final int dateCreated;
  @JsonKey()
  @override
  final List<String> views;
  @JsonKey()
  @override
  final List<String> likes;

  @override
  String toString() {
    return 'StoryContent(id: $id, media: $media, dateCreated: $dateCreated, views: $views, likes: $likes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _StoryContent &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.media, media) &&
            const DeepCollectionEquality()
                .equals(other.dateCreated, dateCreated) &&
            const DeepCollectionEquality().equals(other.views, views) &&
            const DeepCollectionEquality().equals(other.likes, likes));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(media),
      const DeepCollectionEquality().hash(dateCreated),
      const DeepCollectionEquality().hash(views),
      const DeepCollectionEquality().hash(likes));

  @JsonKey(ignore: true)
  @override
  _$StoryContentCopyWith<_StoryContent> get copyWith =>
      __$StoryContentCopyWithImpl<_StoryContent>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StoryContentToJson(this);
  }
}

abstract class _StoryContent implements StoryContent {
  const factory _StoryContent(
      {String id,
      required StoryMedia media,
      int dateCreated,
      List<String> views,
      List<String> likes}) = _$_StoryContent;

  factory _StoryContent.fromJson(Map<String, dynamic> json) =
      _$_StoryContent.fromJson;

  @override
  String get id;
  @override
  StoryMedia get media;
  @override
  int get dateCreated;
  @override
  List<String> get views;
  @override
  List<String> get likes;
  @override
  @JsonKey(ignore: true)
  _$StoryContentCopyWith<_StoryContent> get copyWith =>
      throw _privateConstructorUsedError;
}
