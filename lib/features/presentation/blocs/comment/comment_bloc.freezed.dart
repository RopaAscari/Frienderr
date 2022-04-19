// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'comment_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$CommentEventTearOff {
  const _$CommentEventTearOff();

  _GetComments getComments({required String postId}) {
    return _GetComments(
      postId: postId,
    );
  }

  _PostComment postComment(
      {required CommentEntity comment, required String postId}) {
    return _PostComment(
      comment: comment,
      postId: postId,
    );
  }
}

/// @nodoc
const $CommentEvent = _$CommentEventTearOff();

/// @nodoc
mixin _$CommentEvent {
  String get postId => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String postId) getComments,
    required TResult Function(CommentEntity comment, String postId) postComment,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String postId)? getComments,
    TResult Function(CommentEntity comment, String postId)? postComment,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String postId)? getComments,
    TResult Function(CommentEntity comment, String postId)? postComment,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetComments value) getComments,
    required TResult Function(_PostComment value) postComment,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetComments value)? getComments,
    TResult Function(_PostComment value)? postComment,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetComments value)? getComments,
    TResult Function(_PostComment value)? postComment,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CommentEventCopyWith<CommentEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentEventCopyWith<$Res> {
  factory $CommentEventCopyWith(
          CommentEvent value, $Res Function(CommentEvent) then) =
      _$CommentEventCopyWithImpl<$Res>;
  $Res call({String postId});
}

/// @nodoc
class _$CommentEventCopyWithImpl<$Res> implements $CommentEventCopyWith<$Res> {
  _$CommentEventCopyWithImpl(this._value, this._then);

  final CommentEvent _value;
  // ignore: unused_field
  final $Res Function(CommentEvent) _then;

  @override
  $Res call({
    Object? postId = freezed,
  }) {
    return _then(_value.copyWith(
      postId: postId == freezed
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$GetCommentsCopyWith<$Res>
    implements $CommentEventCopyWith<$Res> {
  factory _$GetCommentsCopyWith(
          _GetComments value, $Res Function(_GetComments) then) =
      __$GetCommentsCopyWithImpl<$Res>;
  @override
  $Res call({String postId});
}

/// @nodoc
class __$GetCommentsCopyWithImpl<$Res> extends _$CommentEventCopyWithImpl<$Res>
    implements _$GetCommentsCopyWith<$Res> {
  __$GetCommentsCopyWithImpl(
      _GetComments _value, $Res Function(_GetComments) _then)
      : super(_value, (v) => _then(v as _GetComments));

  @override
  _GetComments get _value => super._value as _GetComments;

  @override
  $Res call({
    Object? postId = freezed,
  }) {
    return _then(_GetComments(
      postId: postId == freezed
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_GetComments implements _GetComments {
  const _$_GetComments({required this.postId});

  @override
  final String postId;

  @override
  String toString() {
    return 'CommentEvent.getComments(postId: $postId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GetComments &&
            const DeepCollectionEquality().equals(other.postId, postId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(postId));

  @JsonKey(ignore: true)
  @override
  _$GetCommentsCopyWith<_GetComments> get copyWith =>
      __$GetCommentsCopyWithImpl<_GetComments>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String postId) getComments,
    required TResult Function(CommentEntity comment, String postId) postComment,
  }) {
    return getComments(postId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String postId)? getComments,
    TResult Function(CommentEntity comment, String postId)? postComment,
  }) {
    return getComments?.call(postId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String postId)? getComments,
    TResult Function(CommentEntity comment, String postId)? postComment,
    required TResult orElse(),
  }) {
    if (getComments != null) {
      return getComments(postId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetComments value) getComments,
    required TResult Function(_PostComment value) postComment,
  }) {
    return getComments(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetComments value)? getComments,
    TResult Function(_PostComment value)? postComment,
  }) {
    return getComments?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetComments value)? getComments,
    TResult Function(_PostComment value)? postComment,
    required TResult orElse(),
  }) {
    if (getComments != null) {
      return getComments(this);
    }
    return orElse();
  }
}

abstract class _GetComments implements CommentEvent {
  const factory _GetComments({required String postId}) = _$_GetComments;

  @override
  String get postId;
  @override
  @JsonKey(ignore: true)
  _$GetCommentsCopyWith<_GetComments> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$PostCommentCopyWith<$Res>
    implements $CommentEventCopyWith<$Res> {
  factory _$PostCommentCopyWith(
          _PostComment value, $Res Function(_PostComment) then) =
      __$PostCommentCopyWithImpl<$Res>;
  @override
  $Res call({CommentEntity comment, String postId});
}

/// @nodoc
class __$PostCommentCopyWithImpl<$Res> extends _$CommentEventCopyWithImpl<$Res>
    implements _$PostCommentCopyWith<$Res> {
  __$PostCommentCopyWithImpl(
      _PostComment _value, $Res Function(_PostComment) _then)
      : super(_value, (v) => _then(v as _PostComment));

  @override
  _PostComment get _value => super._value as _PostComment;

  @override
  $Res call({
    Object? comment = freezed,
    Object? postId = freezed,
  }) {
    return _then(_PostComment(
      comment: comment == freezed
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as CommentEntity,
      postId: postId == freezed
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_PostComment implements _PostComment {
  const _$_PostComment({required this.comment, required this.postId});

  @override
  final CommentEntity comment;
  @override
  final String postId;

  @override
  String toString() {
    return 'CommentEvent.postComment(comment: $comment, postId: $postId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PostComment &&
            const DeepCollectionEquality().equals(other.comment, comment) &&
            const DeepCollectionEquality().equals(other.postId, postId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(comment),
      const DeepCollectionEquality().hash(postId));

  @JsonKey(ignore: true)
  @override
  _$PostCommentCopyWith<_PostComment> get copyWith =>
      __$PostCommentCopyWithImpl<_PostComment>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String postId) getComments,
    required TResult Function(CommentEntity comment, String postId) postComment,
  }) {
    return postComment(comment, postId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String postId)? getComments,
    TResult Function(CommentEntity comment, String postId)? postComment,
  }) {
    return postComment?.call(comment, postId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String postId)? getComments,
    TResult Function(CommentEntity comment, String postId)? postComment,
    required TResult orElse(),
  }) {
    if (postComment != null) {
      return postComment(comment, postId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetComments value) getComments,
    required TResult Function(_PostComment value) postComment,
  }) {
    return postComment(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetComments value)? getComments,
    TResult Function(_PostComment value)? postComment,
  }) {
    return postComment?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetComments value)? getComments,
    TResult Function(_PostComment value)? postComment,
    required TResult orElse(),
  }) {
    if (postComment != null) {
      return postComment(this);
    }
    return orElse();
  }
}

abstract class _PostComment implements CommentEvent {
  const factory _PostComment(
      {required CommentEntity comment,
      required String postId}) = _$_PostComment;

  CommentEntity get comment;
  @override
  String get postId;
  @override
  @JsonKey(ignore: true)
  _$PostCommentCopyWith<_PostComment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$CommentStateTearOff {
  const _$CommentStateTearOff();

  _CommentState call(
      {String error = '',
      required List<CommentEntity> comments,
      CommentStatus currentState = CommentStatus.Initial}) {
    return _CommentState(
      error: error,
      comments: comments,
      currentState: currentState,
    );
  }
}

/// @nodoc
const $CommentState = _$CommentStateTearOff();

/// @nodoc
mixin _$CommentState {
  String get error => throw _privateConstructorUsedError;
  List<CommentEntity> get comments => throw _privateConstructorUsedError;
  CommentStatus get currentState => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CommentStateCopyWith<CommentState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentStateCopyWith<$Res> {
  factory $CommentStateCopyWith(
          CommentState value, $Res Function(CommentState) then) =
      _$CommentStateCopyWithImpl<$Res>;
  $Res call(
      {String error, List<CommentEntity> comments, CommentStatus currentState});
}

/// @nodoc
class _$CommentStateCopyWithImpl<$Res> implements $CommentStateCopyWith<$Res> {
  _$CommentStateCopyWithImpl(this._value, this._then);

  final CommentState _value;
  // ignore: unused_field
  final $Res Function(CommentState) _then;

  @override
  $Res call({
    Object? error = freezed,
    Object? comments = freezed,
    Object? currentState = freezed,
  }) {
    return _then(_value.copyWith(
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
      comments: comments == freezed
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<CommentEntity>,
      currentState: currentState == freezed
          ? _value.currentState
          : currentState // ignore: cast_nullable_to_non_nullable
              as CommentStatus,
    ));
  }
}

/// @nodoc
abstract class _$CommentStateCopyWith<$Res>
    implements $CommentStateCopyWith<$Res> {
  factory _$CommentStateCopyWith(
          _CommentState value, $Res Function(_CommentState) then) =
      __$CommentStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {String error, List<CommentEntity> comments, CommentStatus currentState});
}

/// @nodoc
class __$CommentStateCopyWithImpl<$Res> extends _$CommentStateCopyWithImpl<$Res>
    implements _$CommentStateCopyWith<$Res> {
  __$CommentStateCopyWithImpl(
      _CommentState _value, $Res Function(_CommentState) _then)
      : super(_value, (v) => _then(v as _CommentState));

  @override
  _CommentState get _value => super._value as _CommentState;

  @override
  $Res call({
    Object? error = freezed,
    Object? comments = freezed,
    Object? currentState = freezed,
  }) {
    return _then(_CommentState(
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
      comments: comments == freezed
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<CommentEntity>,
      currentState: currentState == freezed
          ? _value.currentState
          : currentState // ignore: cast_nullable_to_non_nullable
              as CommentStatus,
    ));
  }
}

/// @nodoc

class _$_CommentState implements _CommentState {
  const _$_CommentState(
      {this.error = '',
      required this.comments,
      this.currentState = CommentStatus.Initial});

  @JsonKey()
  @override
  final String error;
  @override
  final List<CommentEntity> comments;
  @JsonKey()
  @override
  final CommentStatus currentState;

  @override
  String toString() {
    return 'CommentState(error: $error, comments: $comments, currentState: $currentState)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CommentState &&
            const DeepCollectionEquality().equals(other.error, error) &&
            const DeepCollectionEquality().equals(other.comments, comments) &&
            const DeepCollectionEquality()
                .equals(other.currentState, currentState));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(error),
      const DeepCollectionEquality().hash(comments),
      const DeepCollectionEquality().hash(currentState));

  @JsonKey(ignore: true)
  @override
  _$CommentStateCopyWith<_CommentState> get copyWith =>
      __$CommentStateCopyWithImpl<_CommentState>(this, _$identity);
}

abstract class _CommentState implements CommentState {
  const factory _CommentState(
      {String error,
      required List<CommentEntity> comments,
      CommentStatus currentState}) = _$_CommentState;

  @override
  String get error;
  @override
  List<CommentEntity> get comments;
  @override
  CommentStatus get currentState;
  @override
  @JsonKey(ignore: true)
  _$CommentStateCopyWith<_CommentState> get copyWith =>
      throw _privateConstructorUsedError;
}
