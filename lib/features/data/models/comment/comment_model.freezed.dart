// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'comment_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CommentModel _$CommentModelFromJson(Map<String, dynamic> json) {
  return _CommentModel.fromJson(json);
}

/// @nodoc
class _$CommentModelTearOff {
  const _$CommentModelTearOff();

  _CommentModel call(
      {String id = '',
      String postId = '',
      dynamic user = const {},
      String comment = '',
      int dateCreated = 0,
      List<String> likes = const []}) {
    return _CommentModel(
      id: id,
      postId: postId,
      user: user,
      comment: comment,
      dateCreated: dateCreated,
      likes: likes,
    );
  }

  CommentModel fromJson(Map<String, Object?> json) {
    return CommentModel.fromJson(json);
  }
}

/// @nodoc
const $CommentModel = _$CommentModelTearOff();

/// @nodoc
mixin _$CommentModel {
  String get id => throw _privateConstructorUsedError;
  String get postId => throw _privateConstructorUsedError;
  dynamic get user => throw _privateConstructorUsedError;
  String get comment => throw _privateConstructorUsedError;
  int get dateCreated => throw _privateConstructorUsedError;
  List<String> get likes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CommentModelCopyWith<CommentModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentModelCopyWith<$Res> {
  factory $CommentModelCopyWith(
          CommentModel value, $Res Function(CommentModel) then) =
      _$CommentModelCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String postId,
      dynamic user,
      String comment,
      int dateCreated,
      List<String> likes});
}

/// @nodoc
class _$CommentModelCopyWithImpl<$Res> implements $CommentModelCopyWith<$Res> {
  _$CommentModelCopyWithImpl(this._value, this._then);

  final CommentModel _value;
  // ignore: unused_field
  final $Res Function(CommentModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? postId = freezed,
    Object? user = freezed,
    Object? comment = freezed,
    Object? dateCreated = freezed,
    Object? likes = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      postId: postId == freezed
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as dynamic,
      comment: comment == freezed
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      dateCreated: dateCreated == freezed
          ? _value.dateCreated
          : dateCreated // ignore: cast_nullable_to_non_nullable
              as int,
      likes: likes == freezed
          ? _value.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
abstract class _$CommentModelCopyWith<$Res>
    implements $CommentModelCopyWith<$Res> {
  factory _$CommentModelCopyWith(
          _CommentModel value, $Res Function(_CommentModel) then) =
      __$CommentModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String postId,
      dynamic user,
      String comment,
      int dateCreated,
      List<String> likes});
}

/// @nodoc
class __$CommentModelCopyWithImpl<$Res> extends _$CommentModelCopyWithImpl<$Res>
    implements _$CommentModelCopyWith<$Res> {
  __$CommentModelCopyWithImpl(
      _CommentModel _value, $Res Function(_CommentModel) _then)
      : super(_value, (v) => _then(v as _CommentModel));

  @override
  _CommentModel get _value => super._value as _CommentModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? postId = freezed,
    Object? user = freezed,
    Object? comment = freezed,
    Object? dateCreated = freezed,
    Object? likes = freezed,
  }) {
    return _then(_CommentModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      postId: postId == freezed
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as dynamic,
      comment: comment == freezed
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      dateCreated: dateCreated == freezed
          ? _value.dateCreated
          : dateCreated // ignore: cast_nullable_to_non_nullable
              as int,
      likes: likes == freezed
          ? _value.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CommentModel implements _CommentModel {
  const _$_CommentModel(
      {this.id = '',
      this.postId = '',
      this.user = const {},
      this.comment = '',
      this.dateCreated = 0,
      this.likes = const []});

  factory _$_CommentModel.fromJson(Map<String, dynamic> json) =>
      _$$_CommentModelFromJson(json);

  @JsonKey()
  @override
  final String id;
  @JsonKey()
  @override
  final String postId;
  @JsonKey()
  @override
  final dynamic user;
  @JsonKey()
  @override
  final String comment;
  @JsonKey()
  @override
  final int dateCreated;
  @JsonKey()
  @override
  final List<String> likes;

  @override
  String toString() {
    return 'CommentModel(id: $id, postId: $postId, user: $user, comment: $comment, dateCreated: $dateCreated, likes: $likes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CommentModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.postId, postId) &&
            const DeepCollectionEquality().equals(other.user, user) &&
            const DeepCollectionEquality().equals(other.comment, comment) &&
            const DeepCollectionEquality()
                .equals(other.dateCreated, dateCreated) &&
            const DeepCollectionEquality().equals(other.likes, likes));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(postId),
      const DeepCollectionEquality().hash(user),
      const DeepCollectionEquality().hash(comment),
      const DeepCollectionEquality().hash(dateCreated),
      const DeepCollectionEquality().hash(likes));

  @JsonKey(ignore: true)
  @override
  _$CommentModelCopyWith<_CommentModel> get copyWith =>
      __$CommentModelCopyWithImpl<_CommentModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CommentModelToJson(this);
  }
}

abstract class _CommentModel implements CommentModel {
  const factory _CommentModel(
      {String id,
      String postId,
      dynamic user,
      String comment,
      int dateCreated,
      List<String> likes}) = _$_CommentModel;

  factory _CommentModel.fromJson(Map<String, dynamic> json) =
      _$_CommentModel.fromJson;

  @override
  String get id;
  @override
  String get postId;
  @override
  dynamic get user;
  @override
  String get comment;
  @override
  int get dateCreated;
  @override
  List<String> get likes;
  @override
  @JsonKey(ignore: true)
  _$CommentModelCopyWith<_CommentModel> get copyWith =>
      throw _privateConstructorUsedError;
}
