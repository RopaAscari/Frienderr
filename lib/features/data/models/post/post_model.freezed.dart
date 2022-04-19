// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'post_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PostModel _$PostModelFromJson(Map<String, dynamic> json) {
  return _PostModel.fromJson(json);
}

/// @nodoc
class _$PostModelTearOff {
  const _$PostModelTearOff();

  _PostModel call(
      {String id = '',
      int shares = 0,
      dynamic user = const {},
      List<dynamic> userLikes = const [],
      String caption = '',
      int dateCreated = 0,
      int commentCount = 0,
      int likes = 0,
      List<ContentModel> content = const []}) {
    return _PostModel(
      id: id,
      shares: shares,
      user: user,
      userLikes: userLikes,
      caption: caption,
      dateCreated: dateCreated,
      commentCount: commentCount,
      likes: likes,
      content: content,
    );
  }

  PostModel fromJson(Map<String, Object?> json) {
    return PostModel.fromJson(json);
  }
}

/// @nodoc
const $PostModel = _$PostModelTearOff();

/// @nodoc
mixin _$PostModel {
  String get id => throw _privateConstructorUsedError;
  int get shares => throw _privateConstructorUsedError;
  dynamic get user => throw _privateConstructorUsedError;
  List<dynamic> get userLikes => throw _privateConstructorUsedError;
  String get caption => throw _privateConstructorUsedError;
  int get dateCreated => throw _privateConstructorUsedError;
  int get commentCount => throw _privateConstructorUsedError;
  int get likes => throw _privateConstructorUsedError;
  List<ContentModel> get content => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostModelCopyWith<PostModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostModelCopyWith<$Res> {
  factory $PostModelCopyWith(PostModel value, $Res Function(PostModel) then) =
      _$PostModelCopyWithImpl<$Res>;
  $Res call(
      {String id,
      int shares,
      dynamic user,
      List<dynamic> userLikes,
      String caption,
      int dateCreated,
      int commentCount,
      int likes,
      List<ContentModel> content});
}

/// @nodoc
class _$PostModelCopyWithImpl<$Res> implements $PostModelCopyWith<$Res> {
  _$PostModelCopyWithImpl(this._value, this._then);

  final PostModel _value;
  // ignore: unused_field
  final $Res Function(PostModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? shares = freezed,
    Object? user = freezed,
    Object? userLikes = freezed,
    Object? caption = freezed,
    Object? dateCreated = freezed,
    Object? commentCount = freezed,
    Object? likes = freezed,
    Object? content = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      shares: shares == freezed
          ? _value.shares
          : shares // ignore: cast_nullable_to_non_nullable
              as int,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as dynamic,
      userLikes: userLikes == freezed
          ? _value.userLikes
          : userLikes // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      caption: caption == freezed
          ? _value.caption
          : caption // ignore: cast_nullable_to_non_nullable
              as String,
      dateCreated: dateCreated == freezed
          ? _value.dateCreated
          : dateCreated // ignore: cast_nullable_to_non_nullable
              as int,
      commentCount: commentCount == freezed
          ? _value.commentCount
          : commentCount // ignore: cast_nullable_to_non_nullable
              as int,
      likes: likes == freezed
          ? _value.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as int,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as List<ContentModel>,
    ));
  }
}

/// @nodoc
abstract class _$PostModelCopyWith<$Res> implements $PostModelCopyWith<$Res> {
  factory _$PostModelCopyWith(
          _PostModel value, $Res Function(_PostModel) then) =
      __$PostModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      int shares,
      dynamic user,
      List<dynamic> userLikes,
      String caption,
      int dateCreated,
      int commentCount,
      int likes,
      List<ContentModel> content});
}

/// @nodoc
class __$PostModelCopyWithImpl<$Res> extends _$PostModelCopyWithImpl<$Res>
    implements _$PostModelCopyWith<$Res> {
  __$PostModelCopyWithImpl(_PostModel _value, $Res Function(_PostModel) _then)
      : super(_value, (v) => _then(v as _PostModel));

  @override
  _PostModel get _value => super._value as _PostModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? shares = freezed,
    Object? user = freezed,
    Object? userLikes = freezed,
    Object? caption = freezed,
    Object? dateCreated = freezed,
    Object? commentCount = freezed,
    Object? likes = freezed,
    Object? content = freezed,
  }) {
    return _then(_PostModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      shares: shares == freezed
          ? _value.shares
          : shares // ignore: cast_nullable_to_non_nullable
              as int,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as dynamic,
      userLikes: userLikes == freezed
          ? _value.userLikes
          : userLikes // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      caption: caption == freezed
          ? _value.caption
          : caption // ignore: cast_nullable_to_non_nullable
              as String,
      dateCreated: dateCreated == freezed
          ? _value.dateCreated
          : dateCreated // ignore: cast_nullable_to_non_nullable
              as int,
      commentCount: commentCount == freezed
          ? _value.commentCount
          : commentCount // ignore: cast_nullable_to_non_nullable
              as int,
      likes: likes == freezed
          ? _value.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as int,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as List<ContentModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PostModel implements _PostModel {
  const _$_PostModel(
      {this.id = '',
      this.shares = 0,
      this.user = const {},
      this.userLikes = const [],
      this.caption = '',
      this.dateCreated = 0,
      this.commentCount = 0,
      this.likes = 0,
      this.content = const []});

  factory _$_PostModel.fromJson(Map<String, dynamic> json) =>
      _$$_PostModelFromJson(json);

  @JsonKey()
  @override
  final String id;
  @JsonKey()
  @override
  final int shares;
  @JsonKey()
  @override
  final dynamic user;
  @JsonKey()
  @override
  final List<dynamic> userLikes;
  @JsonKey()
  @override
  final String caption;
  @JsonKey()
  @override
  final int dateCreated;
  @JsonKey()
  @override
  final int commentCount;
  @JsonKey()
  @override
  final int likes;
  @JsonKey()
  @override
  final List<ContentModel> content;

  @override
  String toString() {
    return 'PostModel(id: $id, shares: $shares, user: $user, userLikes: $userLikes, caption: $caption, dateCreated: $dateCreated, commentCount: $commentCount, likes: $likes, content: $content)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PostModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.shares, shares) &&
            const DeepCollectionEquality().equals(other.user, user) &&
            const DeepCollectionEquality().equals(other.userLikes, userLikes) &&
            const DeepCollectionEquality().equals(other.caption, caption) &&
            const DeepCollectionEquality()
                .equals(other.dateCreated, dateCreated) &&
            const DeepCollectionEquality()
                .equals(other.commentCount, commentCount) &&
            const DeepCollectionEquality().equals(other.likes, likes) &&
            const DeepCollectionEquality().equals(other.content, content));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(shares),
      const DeepCollectionEquality().hash(user),
      const DeepCollectionEquality().hash(userLikes),
      const DeepCollectionEquality().hash(caption),
      const DeepCollectionEquality().hash(dateCreated),
      const DeepCollectionEquality().hash(commentCount),
      const DeepCollectionEquality().hash(likes),
      const DeepCollectionEquality().hash(content));

  @JsonKey(ignore: true)
  @override
  _$PostModelCopyWith<_PostModel> get copyWith =>
      __$PostModelCopyWithImpl<_PostModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PostModelToJson(this);
  }
}

abstract class _PostModel implements PostModel {
  const factory _PostModel(
      {String id,
      int shares,
      dynamic user,
      List<dynamic> userLikes,
      String caption,
      int dateCreated,
      int commentCount,
      int likes,
      List<ContentModel> content}) = _$_PostModel;

  factory _PostModel.fromJson(Map<String, dynamic> json) =
      _$_PostModel.fromJson;

  @override
  String get id;
  @override
  int get shares;
  @override
  dynamic get user;
  @override
  List<dynamic> get userLikes;
  @override
  String get caption;
  @override
  int get dateCreated;
  @override
  int get commentCount;
  @override
  int get likes;
  @override
  List<ContentModel> get content;
  @override
  @JsonKey(ignore: true)
  _$PostModelCopyWith<_PostModel> get copyWith =>
      throw _privateConstructorUsedError;
}
