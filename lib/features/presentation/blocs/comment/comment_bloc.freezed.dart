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

  _GetComments getComments(
      {required String postId, required CommentType type}) {
    return _GetComments(
      postId: postId,
      type: type,
    );
  }

  _GetPaginatedComments getPaginatedComments(
      {required String postId, required CommentType type}) {
    return _GetPaginatedComments(
      postId: postId,
      type: type,
    );
  }

  _DeleteComment deleteComment(
      {required String id, required String postId, required CommentType type}) {
    return _DeleteComment(
      id: id,
      postId: postId,
      type: type,
    );
  }

  _PostComment postComment(
      {required CommentType type,
      required CommentDTO comment,
      required NotificationDTO? notification}) {
    return _PostComment(
      type: type,
      comment: comment,
      notification: notification,
    );
  }

  _LikeComment likeComment({required String postId}) {
    return _LikeComment(
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
    required TResult Function(String postId, CommentType type) getComments,
    required TResult Function(String postId, CommentType type)
        getPaginatedComments,
    required TResult Function(String id, String postId, CommentType type)
        deleteComment,
    required TResult Function(
            CommentType type, CommentDTO comment, NotificationDTO? notification)
        postComment,
    required TResult Function(String postId) likeComment,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String postId, CommentType type)? getComments,
    TResult Function(String postId, CommentType type)? getPaginatedComments,
    TResult Function(String id, String postId, CommentType type)? deleteComment,
    TResult Function(CommentType type, CommentDTO comment,
            NotificationDTO? notification)?
        postComment,
    TResult Function(String postId)? likeComment,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String postId, CommentType type)? getComments,
    TResult Function(String postId, CommentType type)? getPaginatedComments,
    TResult Function(String id, String postId, CommentType type)? deleteComment,
    TResult Function(CommentType type, CommentDTO comment,
            NotificationDTO? notification)?
        postComment,
    TResult Function(String postId)? likeComment,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetComments value) getComments,
    required TResult Function(_GetPaginatedComments value) getPaginatedComments,
    required TResult Function(_DeleteComment value) deleteComment,
    required TResult Function(_PostComment value) postComment,
    required TResult Function(_LikeComment value) likeComment,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetComments value)? getComments,
    TResult Function(_GetPaginatedComments value)? getPaginatedComments,
    TResult Function(_DeleteComment value)? deleteComment,
    TResult Function(_PostComment value)? postComment,
    TResult Function(_LikeComment value)? likeComment,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetComments value)? getComments,
    TResult Function(_GetPaginatedComments value)? getPaginatedComments,
    TResult Function(_DeleteComment value)? deleteComment,
    TResult Function(_PostComment value)? postComment,
    TResult Function(_LikeComment value)? likeComment,
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
  $Res call({String postId, CommentType type});
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
    Object? type = freezed,
  }) {
    return _then(_GetComments(
      postId: postId == freezed
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as CommentType,
    ));
  }
}

/// @nodoc

class _$_GetComments implements _GetComments {
  const _$_GetComments({required this.postId, required this.type});

  @override
  final String postId;
  @override
  final CommentType type;

  @override
  String toString() {
    return 'CommentEvent.getComments(postId: $postId, type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GetComments &&
            const DeepCollectionEquality().equals(other.postId, postId) &&
            const DeepCollectionEquality().equals(other.type, type));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(postId),
      const DeepCollectionEquality().hash(type));

  @JsonKey(ignore: true)
  @override
  _$GetCommentsCopyWith<_GetComments> get copyWith =>
      __$GetCommentsCopyWithImpl<_GetComments>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String postId, CommentType type) getComments,
    required TResult Function(String postId, CommentType type)
        getPaginatedComments,
    required TResult Function(String id, String postId, CommentType type)
        deleteComment,
    required TResult Function(
            CommentType type, CommentDTO comment, NotificationDTO? notification)
        postComment,
    required TResult Function(String postId) likeComment,
  }) {
    return getComments(postId, type);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String postId, CommentType type)? getComments,
    TResult Function(String postId, CommentType type)? getPaginatedComments,
    TResult Function(String id, String postId, CommentType type)? deleteComment,
    TResult Function(CommentType type, CommentDTO comment,
            NotificationDTO? notification)?
        postComment,
    TResult Function(String postId)? likeComment,
  }) {
    return getComments?.call(postId, type);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String postId, CommentType type)? getComments,
    TResult Function(String postId, CommentType type)? getPaginatedComments,
    TResult Function(String id, String postId, CommentType type)? deleteComment,
    TResult Function(CommentType type, CommentDTO comment,
            NotificationDTO? notification)?
        postComment,
    TResult Function(String postId)? likeComment,
    required TResult orElse(),
  }) {
    if (getComments != null) {
      return getComments(postId, type);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetComments value) getComments,
    required TResult Function(_GetPaginatedComments value) getPaginatedComments,
    required TResult Function(_DeleteComment value) deleteComment,
    required TResult Function(_PostComment value) postComment,
    required TResult Function(_LikeComment value) likeComment,
  }) {
    return getComments(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetComments value)? getComments,
    TResult Function(_GetPaginatedComments value)? getPaginatedComments,
    TResult Function(_DeleteComment value)? deleteComment,
    TResult Function(_PostComment value)? postComment,
    TResult Function(_LikeComment value)? likeComment,
  }) {
    return getComments?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetComments value)? getComments,
    TResult Function(_GetPaginatedComments value)? getPaginatedComments,
    TResult Function(_DeleteComment value)? deleteComment,
    TResult Function(_PostComment value)? postComment,
    TResult Function(_LikeComment value)? likeComment,
    required TResult orElse(),
  }) {
    if (getComments != null) {
      return getComments(this);
    }
    return orElse();
  }
}

abstract class _GetComments implements CommentEvent {
  const factory _GetComments(
      {required String postId, required CommentType type}) = _$_GetComments;

  String get postId;
  CommentType get type;
  @JsonKey(ignore: true)
  _$GetCommentsCopyWith<_GetComments> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$GetPaginatedCommentsCopyWith<$Res> {
  factory _$GetPaginatedCommentsCopyWith(_GetPaginatedComments value,
          $Res Function(_GetPaginatedComments) then) =
      __$GetPaginatedCommentsCopyWithImpl<$Res>;
  $Res call({String postId, CommentType type});
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
    Object? type = freezed,
  }) {
    return _then(_GetPaginatedComments(
      postId: postId == freezed
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as CommentType,
    ));
  }
}

/// @nodoc

class _$_GetPaginatedComments implements _GetPaginatedComments {
  const _$_GetPaginatedComments({required this.postId, required this.type});

  @override
  final String postId;
  @override
  final CommentType type;

  @override
  String toString() {
    return 'CommentEvent.getPaginatedComments(postId: $postId, type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GetPaginatedComments &&
            const DeepCollectionEquality().equals(other.postId, postId) &&
            const DeepCollectionEquality().equals(other.type, type));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(postId),
      const DeepCollectionEquality().hash(type));

  @JsonKey(ignore: true)
  @override
  _$GetPaginatedCommentsCopyWith<_GetPaginatedComments> get copyWith =>
      __$GetPaginatedCommentsCopyWithImpl<_GetPaginatedComments>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String postId, CommentType type) getComments,
    required TResult Function(String postId, CommentType type)
        getPaginatedComments,
    required TResult Function(String id, String postId, CommentType type)
        deleteComment,
    required TResult Function(
            CommentType type, CommentDTO comment, NotificationDTO? notification)
        postComment,
    required TResult Function(String postId) likeComment,
  }) {
    return getPaginatedComments(postId, type);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String postId, CommentType type)? getComments,
    TResult Function(String postId, CommentType type)? getPaginatedComments,
    TResult Function(String id, String postId, CommentType type)? deleteComment,
    TResult Function(CommentType type, CommentDTO comment,
            NotificationDTO? notification)?
        postComment,
    TResult Function(String postId)? likeComment,
  }) {
    return getPaginatedComments?.call(postId, type);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String postId, CommentType type)? getComments,
    TResult Function(String postId, CommentType type)? getPaginatedComments,
    TResult Function(String id, String postId, CommentType type)? deleteComment,
    TResult Function(CommentType type, CommentDTO comment,
            NotificationDTO? notification)?
        postComment,
    TResult Function(String postId)? likeComment,
    required TResult orElse(),
  }) {
    if (getPaginatedComments != null) {
      return getPaginatedComments(postId, type);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetComments value) getComments,
    required TResult Function(_GetPaginatedComments value) getPaginatedComments,
    required TResult Function(_DeleteComment value) deleteComment,
    required TResult Function(_PostComment value) postComment,
    required TResult Function(_LikeComment value) likeComment,
  }) {
    return getPaginatedComments(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetComments value)? getComments,
    TResult Function(_GetPaginatedComments value)? getPaginatedComments,
    TResult Function(_DeleteComment value)? deleteComment,
    TResult Function(_PostComment value)? postComment,
    TResult Function(_LikeComment value)? likeComment,
  }) {
    return getPaginatedComments?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetComments value)? getComments,
    TResult Function(_GetPaginatedComments value)? getPaginatedComments,
    TResult Function(_DeleteComment value)? deleteComment,
    TResult Function(_PostComment value)? postComment,
    TResult Function(_LikeComment value)? likeComment,
    required TResult orElse(),
  }) {
    if (getPaginatedComments != null) {
      return getPaginatedComments(this);
    }
    return orElse();
  }
}

abstract class _GetPaginatedComments implements CommentEvent {
  const factory _GetPaginatedComments(
      {required String postId,
      required CommentType type}) = _$_GetPaginatedComments;

  String get postId;
  CommentType get type;
  @JsonKey(ignore: true)
  _$GetPaginatedCommentsCopyWith<_GetPaginatedComments> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$DeleteCommentCopyWith<$Res> {
  factory _$DeleteCommentCopyWith(
          _DeleteComment value, $Res Function(_DeleteComment) then) =
      __$DeleteCommentCopyWithImpl<$Res>;
  $Res call({String id, String postId, CommentType type});
}

/// @nodoc
class __$DeleteCommentCopyWithImpl<$Res>
    extends _$CommentEventCopyWithImpl<$Res>
    implements _$DeleteCommentCopyWith<$Res> {
  __$DeleteCommentCopyWithImpl(
      _DeleteComment _value, $Res Function(_DeleteComment) _then)
      : super(_value, (v) => _then(v as _DeleteComment));

  @override
  _DeleteComment get _value => super._value as _DeleteComment;

  @override
  $Res call({
    Object? id = freezed,
    Object? postId = freezed,
    Object? type = freezed,
  }) {
    return _then(_DeleteComment(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      postId: postId == freezed
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as CommentType,
    ));
  }
}

/// @nodoc

class _$_DeleteComment implements _DeleteComment {
  const _$_DeleteComment(
      {required this.id, required this.postId, required this.type});

  @override
  final String id;
  @override
  final String postId;
  @override
  final CommentType type;

  @override
  String toString() {
    return 'CommentEvent.deleteComment(id: $id, postId: $postId, type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DeleteComment &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.postId, postId) &&
            const DeepCollectionEquality().equals(other.type, type));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(postId),
      const DeepCollectionEquality().hash(type));

  @JsonKey(ignore: true)
  @override
  _$DeleteCommentCopyWith<_DeleteComment> get copyWith =>
      __$DeleteCommentCopyWithImpl<_DeleteComment>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String postId, CommentType type) getComments,
    required TResult Function(String postId, CommentType type)
        getPaginatedComments,
    required TResult Function(String id, String postId, CommentType type)
        deleteComment,
    required TResult Function(
            CommentType type, CommentDTO comment, NotificationDTO? notification)
        postComment,
    required TResult Function(String postId) likeComment,
  }) {
    return deleteComment(id, postId, type);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String postId, CommentType type)? getComments,
    TResult Function(String postId, CommentType type)? getPaginatedComments,
    TResult Function(String id, String postId, CommentType type)? deleteComment,
    TResult Function(CommentType type, CommentDTO comment,
            NotificationDTO? notification)?
        postComment,
    TResult Function(String postId)? likeComment,
  }) {
    return deleteComment?.call(id, postId, type);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String postId, CommentType type)? getComments,
    TResult Function(String postId, CommentType type)? getPaginatedComments,
    TResult Function(String id, String postId, CommentType type)? deleteComment,
    TResult Function(CommentType type, CommentDTO comment,
            NotificationDTO? notification)?
        postComment,
    TResult Function(String postId)? likeComment,
    required TResult orElse(),
  }) {
    if (deleteComment != null) {
      return deleteComment(id, postId, type);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetComments value) getComments,
    required TResult Function(_GetPaginatedComments value) getPaginatedComments,
    required TResult Function(_DeleteComment value) deleteComment,
    required TResult Function(_PostComment value) postComment,
    required TResult Function(_LikeComment value) likeComment,
  }) {
    return deleteComment(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetComments value)? getComments,
    TResult Function(_GetPaginatedComments value)? getPaginatedComments,
    TResult Function(_DeleteComment value)? deleteComment,
    TResult Function(_PostComment value)? postComment,
    TResult Function(_LikeComment value)? likeComment,
  }) {
    return deleteComment?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetComments value)? getComments,
    TResult Function(_GetPaginatedComments value)? getPaginatedComments,
    TResult Function(_DeleteComment value)? deleteComment,
    TResult Function(_PostComment value)? postComment,
    TResult Function(_LikeComment value)? likeComment,
    required TResult orElse(),
  }) {
    if (deleteComment != null) {
      return deleteComment(this);
    }
    return orElse();
  }
}

abstract class _DeleteComment implements CommentEvent {
  const factory _DeleteComment(
      {required String id,
      required String postId,
      required CommentType type}) = _$_DeleteComment;

  String get id;
  String get postId;
  CommentType get type;
  @JsonKey(ignore: true)
  _$DeleteCommentCopyWith<_DeleteComment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$PostCommentCopyWith<$Res> {
  factory _$PostCommentCopyWith(
          _PostComment value, $Res Function(_PostComment) then) =
      __$PostCommentCopyWithImpl<$Res>;
  $Res call(
      {CommentType type, CommentDTO comment, NotificationDTO? notification});
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
    Object? type = freezed,
    Object? comment = freezed,
    Object? notification = freezed,
  }) {
    return _then(_PostComment(
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as CommentType,
      comment: comment == freezed
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as CommentDTO,
      notification: notification == freezed
          ? _value.notification
          : notification // ignore: cast_nullable_to_non_nullable
              as NotificationDTO?,
    ));
  }
}

/// @nodoc

class _$_PostComment implements _PostComment {
  const _$_PostComment(
      {required this.type, required this.comment, required this.notification});

  @override
  final CommentType type;
  @override
  final CommentDTO comment;
  @override
  final NotificationDTO? notification;

  @override
  String toString() {
    return 'CommentEvent.postComment(type: $type, comment: $comment, notification: $notification)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PostComment &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality().equals(other.comment, comment) &&
            const DeepCollectionEquality()
                .equals(other.notification, notification));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(comment),
      const DeepCollectionEquality().hash(notification));

  @JsonKey(ignore: true)
  @override
  _$PostCommentCopyWith<_PostComment> get copyWith =>
      __$PostCommentCopyWithImpl<_PostComment>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String postId, CommentType type) getComments,
    required TResult Function(String postId, CommentType type)
        getPaginatedComments,
    required TResult Function(String id, String postId, CommentType type)
        deleteComment,
    required TResult Function(
            CommentType type, CommentDTO comment, NotificationDTO? notification)
        postComment,
    required TResult Function(String postId) likeComment,
  }) {
    return postComment(type, comment, notification);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String postId, CommentType type)? getComments,
    TResult Function(String postId, CommentType type)? getPaginatedComments,
    TResult Function(String id, String postId, CommentType type)? deleteComment,
    TResult Function(CommentType type, CommentDTO comment,
            NotificationDTO? notification)?
        postComment,
    TResult Function(String postId)? likeComment,
  }) {
    return postComment?.call(type, comment, notification);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String postId, CommentType type)? getComments,
    TResult Function(String postId, CommentType type)? getPaginatedComments,
    TResult Function(String id, String postId, CommentType type)? deleteComment,
    TResult Function(CommentType type, CommentDTO comment,
            NotificationDTO? notification)?
        postComment,
    TResult Function(String postId)? likeComment,
    required TResult orElse(),
  }) {
    if (postComment != null) {
      return postComment(type, comment, notification);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetComments value) getComments,
    required TResult Function(_GetPaginatedComments value) getPaginatedComments,
    required TResult Function(_DeleteComment value) deleteComment,
    required TResult Function(_PostComment value) postComment,
    required TResult Function(_LikeComment value) likeComment,
  }) {
    return postComment(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetComments value)? getComments,
    TResult Function(_GetPaginatedComments value)? getPaginatedComments,
    TResult Function(_DeleteComment value)? deleteComment,
    TResult Function(_PostComment value)? postComment,
    TResult Function(_LikeComment value)? likeComment,
  }) {
    return postComment?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetComments value)? getComments,
    TResult Function(_GetPaginatedComments value)? getPaginatedComments,
    TResult Function(_DeleteComment value)? deleteComment,
    TResult Function(_PostComment value)? postComment,
    TResult Function(_LikeComment value)? likeComment,
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
      {required CommentType type,
      required CommentDTO comment,
      required NotificationDTO? notification}) = _$_PostComment;

  CommentType get type;
  CommentDTO get comment;
  NotificationDTO? get notification;
  @JsonKey(ignore: true)
  _$PostCommentCopyWith<_PostComment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$LikeCommentCopyWith<$Res> {
  factory _$LikeCommentCopyWith(
          _LikeComment value, $Res Function(_LikeComment) then) =
      __$LikeCommentCopyWithImpl<$Res>;
  $Res call({String postId});
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
    Object? postId = freezed,
  }) {
    return _then(_LikeComment(
      postId: postId == freezed
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_LikeComment implements _LikeComment {
  const _$_LikeComment({required this.postId});

  @override
  final String postId;

  @override
  String toString() {
    return 'CommentEvent.likeComment(postId: $postId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LikeComment &&
            const DeepCollectionEquality().equals(other.postId, postId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(postId));

  @JsonKey(ignore: true)
  @override
  _$LikeCommentCopyWith<_LikeComment> get copyWith =>
      __$LikeCommentCopyWithImpl<_LikeComment>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String postId, CommentType type) getComments,
    required TResult Function(String postId, CommentType type)
        getPaginatedComments,
    required TResult Function(String id, String postId, CommentType type)
        deleteComment,
    required TResult Function(
            CommentType type, CommentDTO comment, NotificationDTO? notification)
        postComment,
    required TResult Function(String postId) likeComment,
  }) {
    return likeComment(postId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String postId, CommentType type)? getComments,
    TResult Function(String postId, CommentType type)? getPaginatedComments,
    TResult Function(String id, String postId, CommentType type)? deleteComment,
    TResult Function(CommentType type, CommentDTO comment,
            NotificationDTO? notification)?
        postComment,
    TResult Function(String postId)? likeComment,
  }) {
    return likeComment?.call(postId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String postId, CommentType type)? getComments,
    TResult Function(String postId, CommentType type)? getPaginatedComments,
    TResult Function(String id, String postId, CommentType type)? deleteComment,
    TResult Function(CommentType type, CommentDTO comment,
            NotificationDTO? notification)?
        postComment,
    TResult Function(String postId)? likeComment,
    required TResult orElse(),
  }) {
    if (likeComment != null) {
      return likeComment(postId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetComments value) getComments,
    required TResult Function(_GetPaginatedComments value) getPaginatedComments,
    required TResult Function(_DeleteComment value) deleteComment,
    required TResult Function(_PostComment value) postComment,
    required TResult Function(_LikeComment value) likeComment,
  }) {
    return likeComment(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetComments value)? getComments,
    TResult Function(_GetPaginatedComments value)? getPaginatedComments,
    TResult Function(_DeleteComment value)? deleteComment,
    TResult Function(_PostComment value)? postComment,
    TResult Function(_LikeComment value)? likeComment,
  }) {
    return likeComment?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetComments value)? getComments,
    TResult Function(_GetPaginatedComments value)? getPaginatedComments,
    TResult Function(_DeleteComment value)? deleteComment,
    TResult Function(_PostComment value)? postComment,
    TResult Function(_LikeComment value)? likeComment,
    required TResult orElse(),
  }) {
    if (likeComment != null) {
      return likeComment(this);
    }
    return orElse();
  }
}

abstract class _LikeComment implements CommentEvent {
  const factory _LikeComment({required String postId}) = _$_LikeComment;

  String get postId;
  @JsonKey(ignore: true)
  _$LikeCommentCopyWith<_LikeComment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$CommentStateTearOff {
  const _$CommentStateTearOff();

  _CommentState call(
      {bool reachedMaximumThreshold = false,
      required PagingController<int, Comment> paginationController,
      CommentListenableAction action = CommentListenableAction.idle}) {
    return _CommentState(
      reachedMaximumThreshold: reachedMaximumThreshold,
      paginationController: paginationController,
      action: action,
    );
  }
}

/// @nodoc
const $CommentState = _$CommentStateTearOff();

/// @nodoc
mixin _$CommentState {
  bool get reachedMaximumThreshold => throw _privateConstructorUsedError;
  PagingController<int, Comment> get paginationController =>
      throw _privateConstructorUsedError;
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
      {bool reachedMaximumThreshold,
      PagingController<int, Comment> paginationController,
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
    Object? reachedMaximumThreshold = freezed,
    Object? paginationController = freezed,
    Object? action = freezed,
  }) {
    return _then(_value.copyWith(
      reachedMaximumThreshold: reachedMaximumThreshold == freezed
          ? _value.reachedMaximumThreshold
          : reachedMaximumThreshold // ignore: cast_nullable_to_non_nullable
              as bool,
      paginationController: paginationController == freezed
          ? _value.paginationController
          : paginationController // ignore: cast_nullable_to_non_nullable
              as PagingController<int, Comment>,
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
      {bool reachedMaximumThreshold,
      PagingController<int, Comment> paginationController,
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
    Object? reachedMaximumThreshold = freezed,
    Object? paginationController = freezed,
    Object? action = freezed,
  }) {
    return _then(_CommentState(
      reachedMaximumThreshold: reachedMaximumThreshold == freezed
          ? _value.reachedMaximumThreshold
          : reachedMaximumThreshold // ignore: cast_nullable_to_non_nullable
              as bool,
      paginationController: paginationController == freezed
          ? _value.paginationController
          : paginationController // ignore: cast_nullable_to_non_nullable
              as PagingController<int, Comment>,
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
      {this.reachedMaximumThreshold = false,
      required this.paginationController,
      this.action = CommentListenableAction.idle});

  @JsonKey()
  @override
  final bool reachedMaximumThreshold;
  @override
  final PagingController<int, Comment> paginationController;
  @JsonKey()
  @override
  final CommentListenableAction action;

  @override
  String toString() {
    return 'CommentState(reachedMaximumThreshold: $reachedMaximumThreshold, paginationController: $paginationController, action: $action)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CommentState &&
            const DeepCollectionEquality().equals(
                other.reachedMaximumThreshold, reachedMaximumThreshold) &&
            const DeepCollectionEquality()
                .equals(other.paginationController, paginationController) &&
            const DeepCollectionEquality().equals(other.action, action));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(reachedMaximumThreshold),
      const DeepCollectionEquality().hash(paginationController),
      const DeepCollectionEquality().hash(action));

  @JsonKey(ignore: true)
  @override
  _$CommentStateCopyWith<_CommentState> get copyWith =>
      __$CommentStateCopyWithImpl<_CommentState>(this, _$identity);
}

abstract class _CommentState implements CommentState {
  const factory _CommentState(
      {bool reachedMaximumThreshold,
      required PagingController<int, Comment> paginationController,
      CommentListenableAction action}) = _$_CommentState;

  @override
  bool get reachedMaximumThreshold;
  @override
  PagingController<int, Comment> get paginationController;
  @override
  CommentListenableAction get action;
  @override
  @JsonKey(ignore: true)
  _$CommentStateCopyWith<_CommentState> get copyWith =>
      throw _privateConstructorUsedError;
}
