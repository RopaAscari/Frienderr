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

  _GetPaginatedComments getPaginatedComments({required String postId}) {
    return _GetPaginatedComments(
      postId: postId,
    );
  }

  _PostComment postComment(
      {required UserEntity user,
      required PostEntity post,
      required CommentEntity comment}) {
    return _PostComment(
      user: user,
      post: post,
      comment: comment,
    );
  }

  _LikeComment likeComemnt(
      {required CommentEntity comment, required String postId}) {
    return _LikeComment(
      comment: comment,
      postId: postId,
    );
  }
}

/// @nodoc
const $CommentEvent = _$CommentEventTearOff();

/// @nodoc
mixin _$CommentEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String postId) getComments,
    required TResult Function(String postId) getPaginatedComments,
    required TResult Function(
            UserEntity user, PostEntity post, CommentEntity comment)
        postComment,
    required TResult Function(CommentEntity comment, String postId) likeComemnt,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String postId)? getComments,
    TResult Function(String postId)? getPaginatedComments,
    TResult Function(UserEntity user, PostEntity post, CommentEntity comment)?
        postComment,
    TResult Function(CommentEntity comment, String postId)? likeComemnt,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String postId)? getComments,
    TResult Function(String postId)? getPaginatedComments,
    TResult Function(UserEntity user, PostEntity post, CommentEntity comment)?
        postComment,
    TResult Function(CommentEntity comment, String postId)? likeComemnt,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetComments value) getComments,
    required TResult Function(_GetPaginatedComments value) getPaginatedComments,
    required TResult Function(_PostComment value) postComment,
    required TResult Function(_LikeComment value) likeComemnt,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetComments value)? getComments,
    TResult Function(_GetPaginatedComments value)? getPaginatedComments,
    TResult Function(_PostComment value)? postComment,
    TResult Function(_LikeComment value)? likeComemnt,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetComments value)? getComments,
    TResult Function(_GetPaginatedComments value)? getPaginatedComments,
    TResult Function(_PostComment value)? postComment,
    TResult Function(_LikeComment value)? likeComemnt,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentEventCopyWith<$Res> {
  factory $CommentEventCopyWith(
          CommentEvent value, $Res Function(CommentEvent) then) =
      _$CommentEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$CommentEventCopyWithImpl<$Res> implements $CommentEventCopyWith<$Res> {
  _$CommentEventCopyWithImpl(this._value, this._then);

  final CommentEvent _value;
  // ignore: unused_field
  final $Res Function(CommentEvent) _then;
}

/// @nodoc
abstract class _$GetCommentsCopyWith<$Res> {
  factory _$GetCommentsCopyWith(
          _GetComments value, $Res Function(_GetComments) then) =
      __$GetCommentsCopyWithImpl<$Res>;
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
    required TResult Function(String postId) getPaginatedComments,
    required TResult Function(
            UserEntity user, PostEntity post, CommentEntity comment)
        postComment,
    required TResult Function(CommentEntity comment, String postId) likeComemnt,
  }) {
    return getComments(postId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String postId)? getComments,
    TResult Function(String postId)? getPaginatedComments,
    TResult Function(UserEntity user, PostEntity post, CommentEntity comment)?
        postComment,
    TResult Function(CommentEntity comment, String postId)? likeComemnt,
  }) {
    return getComments?.call(postId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String postId)? getComments,
    TResult Function(String postId)? getPaginatedComments,
    TResult Function(UserEntity user, PostEntity post, CommentEntity comment)?
        postComment,
    TResult Function(CommentEntity comment, String postId)? likeComemnt,
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
    required TResult Function(_GetPaginatedComments value) getPaginatedComments,
    required TResult Function(_PostComment value) postComment,
    required TResult Function(_LikeComment value) likeComemnt,
  }) {
    return getComments(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetComments value)? getComments,
    TResult Function(_GetPaginatedComments value)? getPaginatedComments,
    TResult Function(_PostComment value)? postComment,
    TResult Function(_LikeComment value)? likeComemnt,
  }) {
    return getComments?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetComments value)? getComments,
    TResult Function(_GetPaginatedComments value)? getPaginatedComments,
    TResult Function(_PostComment value)? postComment,
    TResult Function(_LikeComment value)? likeComemnt,
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

  String get postId;
  @JsonKey(ignore: true)
  _$GetCommentsCopyWith<_GetComments> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$GetPaginatedCommentsCopyWith<$Res> {
  factory _$GetPaginatedCommentsCopyWith(_GetPaginatedComments value,
          $Res Function(_GetPaginatedComments) then) =
      __$GetPaginatedCommentsCopyWithImpl<$Res>;
  $Res call({String postId});
}

/// @nodoc
class __$GetPaginatedCommentsCopyWithImpl<$Res>
    extends _$CommentEventCopyWithImpl<$Res>
    implements _$GetPaginatedCommentsCopyWith<$Res> {
  __$GetPaginatedCommentsCopyWithImpl(
      _GetPaginatedComments _value, $Res Function(_GetPaginatedComments) _then)
      : super(_value, (v) => _then(v as _GetPaginatedComments));

  @override
  _GetPaginatedComments get _value => super._value as _GetPaginatedComments;

  @override
  $Res call({
    Object? postId = freezed,
  }) {
    return _then(_GetPaginatedComments(
      postId: postId == freezed
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_GetPaginatedComments implements _GetPaginatedComments {
  const _$_GetPaginatedComments({required this.postId});

  @override
  final String postId;

  @override
  String toString() {
    return 'CommentEvent.getPaginatedComments(postId: $postId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GetPaginatedComments &&
            const DeepCollectionEquality().equals(other.postId, postId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(postId));

  @JsonKey(ignore: true)
  @override
  _$GetPaginatedCommentsCopyWith<_GetPaginatedComments> get copyWith =>
      __$GetPaginatedCommentsCopyWithImpl<_GetPaginatedComments>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String postId) getComments,
    required TResult Function(String postId) getPaginatedComments,
    required TResult Function(
            UserEntity user, PostEntity post, CommentEntity comment)
        postComment,
    required TResult Function(CommentEntity comment, String postId) likeComemnt,
  }) {
    return getPaginatedComments(postId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String postId)? getComments,
    TResult Function(String postId)? getPaginatedComments,
    TResult Function(UserEntity user, PostEntity post, CommentEntity comment)?
        postComment,
    TResult Function(CommentEntity comment, String postId)? likeComemnt,
  }) {
    return getPaginatedComments?.call(postId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String postId)? getComments,
    TResult Function(String postId)? getPaginatedComments,
    TResult Function(UserEntity user, PostEntity post, CommentEntity comment)?
        postComment,
    TResult Function(CommentEntity comment, String postId)? likeComemnt,
    required TResult orElse(),
  }) {
    if (getPaginatedComments != null) {
      return getPaginatedComments(postId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetComments value) getComments,
    required TResult Function(_GetPaginatedComments value) getPaginatedComments,
    required TResult Function(_PostComment value) postComment,
    required TResult Function(_LikeComment value) likeComemnt,
  }) {
    return getPaginatedComments(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetComments value)? getComments,
    TResult Function(_GetPaginatedComments value)? getPaginatedComments,
    TResult Function(_PostComment value)? postComment,
    TResult Function(_LikeComment value)? likeComemnt,
  }) {
    return getPaginatedComments?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetComments value)? getComments,
    TResult Function(_GetPaginatedComments value)? getPaginatedComments,
    TResult Function(_PostComment value)? postComment,
    TResult Function(_LikeComment value)? likeComemnt,
    required TResult orElse(),
  }) {
    if (getPaginatedComments != null) {
      return getPaginatedComments(this);
    }
    return orElse();
  }
}

abstract class _GetPaginatedComments implements CommentEvent {
  const factory _GetPaginatedComments({required String postId}) =
      _$_GetPaginatedComments;

  String get postId;
  @JsonKey(ignore: true)
  _$GetPaginatedCommentsCopyWith<_GetPaginatedComments> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$PostCommentCopyWith<$Res> {
  factory _$PostCommentCopyWith(
          _PostComment value, $Res Function(_PostComment) then) =
      __$PostCommentCopyWithImpl<$Res>;
  $Res call({UserEntity user, PostEntity post, CommentEntity comment});
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
    Object? user = freezed,
    Object? post = freezed,
    Object? comment = freezed,
  }) {
    return _then(_PostComment(
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserEntity,
      post: post == freezed
          ? _value.post
          : post // ignore: cast_nullable_to_non_nullable
              as PostEntity,
      comment: comment == freezed
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as CommentEntity,
    ));
  }
}

/// @nodoc

class _$_PostComment implements _PostComment {
  const _$_PostComment(
      {required this.user, required this.post, required this.comment});

  @override
  final UserEntity user;
  @override
  final PostEntity post;
  @override
  final CommentEntity comment;

  @override
  String toString() {
    return 'CommentEvent.postComment(user: $user, post: $post, comment: $comment)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PostComment &&
            const DeepCollectionEquality().equals(other.user, user) &&
            const DeepCollectionEquality().equals(other.post, post) &&
            const DeepCollectionEquality().equals(other.comment, comment));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(user),
      const DeepCollectionEquality().hash(post),
      const DeepCollectionEquality().hash(comment));

  @JsonKey(ignore: true)
  @override
  _$PostCommentCopyWith<_PostComment> get copyWith =>
      __$PostCommentCopyWithImpl<_PostComment>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String postId) getComments,
    required TResult Function(String postId) getPaginatedComments,
    required TResult Function(
            UserEntity user, PostEntity post, CommentEntity comment)
        postComment,
    required TResult Function(CommentEntity comment, String postId) likeComemnt,
  }) {
    return postComment(user, post, comment);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String postId)? getComments,
    TResult Function(String postId)? getPaginatedComments,
    TResult Function(UserEntity user, PostEntity post, CommentEntity comment)?
        postComment,
    TResult Function(CommentEntity comment, String postId)? likeComemnt,
  }) {
    return postComment?.call(user, post, comment);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String postId)? getComments,
    TResult Function(String postId)? getPaginatedComments,
    TResult Function(UserEntity user, PostEntity post, CommentEntity comment)?
        postComment,
    TResult Function(CommentEntity comment, String postId)? likeComemnt,
    required TResult orElse(),
  }) {
    if (postComment != null) {
      return postComment(user, post, comment);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetComments value) getComments,
    required TResult Function(_GetPaginatedComments value) getPaginatedComments,
    required TResult Function(_PostComment value) postComment,
    required TResult Function(_LikeComment value) likeComemnt,
  }) {
    return postComment(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetComments value)? getComments,
    TResult Function(_GetPaginatedComments value)? getPaginatedComments,
    TResult Function(_PostComment value)? postComment,
    TResult Function(_LikeComment value)? likeComemnt,
  }) {
    return postComment?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetComments value)? getComments,
    TResult Function(_GetPaginatedComments value)? getPaginatedComments,
    TResult Function(_PostComment value)? postComment,
    TResult Function(_LikeComment value)? likeComemnt,
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
      {required UserEntity user,
      required PostEntity post,
      required CommentEntity comment}) = _$_PostComment;

  UserEntity get user;
  PostEntity get post;
  CommentEntity get comment;
  @JsonKey(ignore: true)
  _$PostCommentCopyWith<_PostComment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$LikeCommentCopyWith<$Res> {
  factory _$LikeCommentCopyWith(
          _LikeComment value, $Res Function(_LikeComment) then) =
      __$LikeCommentCopyWithImpl<$Res>;
  $Res call({CommentEntity comment, String postId});
}

/// @nodoc
class __$LikeCommentCopyWithImpl<$Res> extends _$CommentEventCopyWithImpl<$Res>
    implements _$LikeCommentCopyWith<$Res> {
  __$LikeCommentCopyWithImpl(
      _LikeComment _value, $Res Function(_LikeComment) _then)
      : super(_value, (v) => _then(v as _LikeComment));

  @override
  _LikeComment get _value => super._value as _LikeComment;

  @override
  $Res call({
    Object? comment = freezed,
    Object? postId = freezed,
  }) {
    return _then(_LikeComment(
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

class _$_LikeComment implements _LikeComment {
  const _$_LikeComment({required this.comment, required this.postId});

  @override
  final CommentEntity comment;
  @override
  final String postId;

  @override
  String toString() {
    return 'CommentEvent.likeComemnt(comment: $comment, postId: $postId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LikeComment &&
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
  _$LikeCommentCopyWith<_LikeComment> get copyWith =>
      __$LikeCommentCopyWithImpl<_LikeComment>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String postId) getComments,
    required TResult Function(String postId) getPaginatedComments,
    required TResult Function(
            UserEntity user, PostEntity post, CommentEntity comment)
        postComment,
    required TResult Function(CommentEntity comment, String postId) likeComemnt,
  }) {
    return likeComemnt(comment, postId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String postId)? getComments,
    TResult Function(String postId)? getPaginatedComments,
    TResult Function(UserEntity user, PostEntity post, CommentEntity comment)?
        postComment,
    TResult Function(CommentEntity comment, String postId)? likeComemnt,
  }) {
    return likeComemnt?.call(comment, postId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String postId)? getComments,
    TResult Function(String postId)? getPaginatedComments,
    TResult Function(UserEntity user, PostEntity post, CommentEntity comment)?
        postComment,
    TResult Function(CommentEntity comment, String postId)? likeComemnt,
    required TResult orElse(),
  }) {
    if (likeComemnt != null) {
      return likeComemnt(comment, postId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetComments value) getComments,
    required TResult Function(_GetPaginatedComments value) getPaginatedComments,
    required TResult Function(_PostComment value) postComment,
    required TResult Function(_LikeComment value) likeComemnt,
  }) {
    return likeComemnt(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetComments value)? getComments,
    TResult Function(_GetPaginatedComments value)? getPaginatedComments,
    TResult Function(_PostComment value)? postComment,
    TResult Function(_LikeComment value)? likeComemnt,
  }) {
    return likeComemnt?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetComments value)? getComments,
    TResult Function(_GetPaginatedComments value)? getPaginatedComments,
    TResult Function(_PostComment value)? postComment,
    TResult Function(_LikeComment value)? likeComemnt,
    required TResult orElse(),
  }) {
    if (likeComemnt != null) {
      return likeComemnt(this);
    }
    return orElse();
  }
}

abstract class _LikeComment implements CommentEvent {
  const factory _LikeComment(
      {required CommentEntity comment,
      required String postId}) = _$_LikeComment;

  CommentEntity get comment;
  String get postId;
  @JsonKey(ignore: true)
  _$LikeCommentCopyWith<_LikeComment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$CommentStateTearOff {
  const _$CommentStateTearOff();

  _CommentState call(
      {String error = '',
      required List<CommentEntity> comments,
      CommentStatus currentState = CommentStatus.idle,
      CommentListenableAction action = CommentListenableAction.idle}) {
    return _CommentState(
      error: error,
      comments: comments,
      currentState: currentState,
      action: action,
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
  CommentListenableAction get action => throw _privateConstructorUsedError;

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
      {String error,
      List<CommentEntity> comments,
      CommentStatus currentState,
      CommentListenableAction action});
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
    Object? action = freezed,
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
      action: action == freezed
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as CommentListenableAction,
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
      {String error,
      List<CommentEntity> comments,
      CommentStatus currentState,
      CommentListenableAction action});
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
    Object? action = freezed,
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
      action: action == freezed
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as CommentListenableAction,
    ));
  }
}

/// @nodoc

class _$_CommentState implements _CommentState {
  const _$_CommentState(
      {this.error = '',
      required this.comments,
      this.currentState = CommentStatus.idle,
      this.action = CommentListenableAction.idle});

  @JsonKey()
  @override
  final String error;
  @override
  final List<CommentEntity> comments;
  @JsonKey()
  @override
  final CommentStatus currentState;
  @JsonKey()
  @override
  final CommentListenableAction action;

  @override
  String toString() {
    return 'CommentState(error: $error, comments: $comments, currentState: $currentState, action: $action)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CommentState &&
            const DeepCollectionEquality().equals(other.error, error) &&
            const DeepCollectionEquality().equals(other.comments, comments) &&
            const DeepCollectionEquality()
                .equals(other.currentState, currentState) &&
            const DeepCollectionEquality().equals(other.action, action));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(error),
      const DeepCollectionEquality().hash(comments),
      const DeepCollectionEquality().hash(currentState),
      const DeepCollectionEquality().hash(action));

  @JsonKey(ignore: true)
  @override
  _$CommentStateCopyWith<_CommentState> get copyWith =>
      __$CommentStateCopyWithImpl<_CommentState>(this, _$identity);
}

abstract class _CommentState implements CommentState {
  const factory _CommentState(
      {String error,
      required List<CommentEntity> comments,
      CommentStatus currentState,
      CommentListenableAction action}) = _$_CommentState;

  @override
  String get error;
  @override
  List<CommentEntity> get comments;
  @override
  CommentStatus get currentState;
  @override
  CommentListenableAction get action;
  @override
  @JsonKey(ignore: true)
  _$CommentStateCopyWith<_CommentState> get copyWith =>
      throw _privateConstructorUsedError;
}
