// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'post_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$PostEventTearOff {
  const _$PostEventTearOff();

  _LikePost likePost({required UserEntity user, required dynamic post}) {
    return _LikePost(
      user: user,
      post: post,
    );
  }

  _UnLikePost unLikePost({required String postId, required String userId}) {
    return _UnLikePost(
      postId: postId,
      userId: userId,
    );
  }

  _DeletePost deletePost({required String postId}) {
    return _DeletePost(
      postId: postId,
    );
  }
}

/// @nodoc
const $PostEvent = _$PostEventTearOff();

/// @nodoc
mixin _$PostEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UserEntity user, dynamic post) likePost,
    required TResult Function(String postId, String userId) unLikePost,
    required TResult Function(String postId) deletePost,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(UserEntity user, dynamic post)? likePost,
    TResult Function(String postId, String userId)? unLikePost,
    TResult Function(String postId)? deletePost,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserEntity user, dynamic post)? likePost,
    TResult Function(String postId, String userId)? unLikePost,
    TResult Function(String postId)? deletePost,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LikePost value) likePost,
    required TResult Function(_UnLikePost value) unLikePost,
    required TResult Function(_DeletePost value) deletePost,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_LikePost value)? likePost,
    TResult Function(_UnLikePost value)? unLikePost,
    TResult Function(_DeletePost value)? deletePost,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LikePost value)? likePost,
    TResult Function(_UnLikePost value)? unLikePost,
    TResult Function(_DeletePost value)? deletePost,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostEventCopyWith<$Res> {
  factory $PostEventCopyWith(PostEvent value, $Res Function(PostEvent) then) =
      _$PostEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$PostEventCopyWithImpl<$Res> implements $PostEventCopyWith<$Res> {
  _$PostEventCopyWithImpl(this._value, this._then);

  final PostEvent _value;
  // ignore: unused_field
  final $Res Function(PostEvent) _then;
}

/// @nodoc
abstract class _$LikePostCopyWith<$Res> {
  factory _$LikePostCopyWith(_LikePost value, $Res Function(_LikePost) then) =
      __$LikePostCopyWithImpl<$Res>;
  $Res call({UserEntity user, dynamic post});
}

/// @nodoc
class __$LikePostCopyWithImpl<$Res> extends _$PostEventCopyWithImpl<$Res>
    implements _$LikePostCopyWith<$Res> {
  __$LikePostCopyWithImpl(_LikePost _value, $Res Function(_LikePost) _then)
      : super(_value, (v) => _then(v as _LikePost));

  @override
  _LikePost get _value => super._value as _LikePost;

  @override
  $Res call({
    Object? user = freezed,
    Object? post = freezed,
  }) {
    return _then(_LikePost(
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserEntity,
      post: post == freezed
          ? _value.post
          : post // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

class _$_LikePost implements _LikePost {
  const _$_LikePost({required this.user, required this.post});

  @override
  final UserEntity user;
  @override
  final dynamic post;

  @override
  String toString() {
    return 'PostEvent.likePost(user: $user, post: $post)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LikePost &&
            const DeepCollectionEquality().equals(other.user, user) &&
            const DeepCollectionEquality().equals(other.post, post));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(user),
      const DeepCollectionEquality().hash(post));

  @JsonKey(ignore: true)
  @override
  _$LikePostCopyWith<_LikePost> get copyWith =>
      __$LikePostCopyWithImpl<_LikePost>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UserEntity user, dynamic post) likePost,
    required TResult Function(String postId, String userId) unLikePost,
    required TResult Function(String postId) deletePost,
  }) {
    return likePost(user, post);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(UserEntity user, dynamic post)? likePost,
    TResult Function(String postId, String userId)? unLikePost,
    TResult Function(String postId)? deletePost,
  }) {
    return likePost?.call(user, post);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserEntity user, dynamic post)? likePost,
    TResult Function(String postId, String userId)? unLikePost,
    TResult Function(String postId)? deletePost,
    required TResult orElse(),
  }) {
    if (likePost != null) {
      return likePost(user, post);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LikePost value) likePost,
    required TResult Function(_UnLikePost value) unLikePost,
    required TResult Function(_DeletePost value) deletePost,
  }) {
    return likePost(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_LikePost value)? likePost,
    TResult Function(_UnLikePost value)? unLikePost,
    TResult Function(_DeletePost value)? deletePost,
  }) {
    return likePost?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LikePost value)? likePost,
    TResult Function(_UnLikePost value)? unLikePost,
    TResult Function(_DeletePost value)? deletePost,
    required TResult orElse(),
  }) {
    if (likePost != null) {
      return likePost(this);
    }
    return orElse();
  }
}

abstract class _LikePost implements PostEvent {
  const factory _LikePost({required UserEntity user, required dynamic post}) =
      _$_LikePost;

  UserEntity get user;
  dynamic get post;
  @JsonKey(ignore: true)
  _$LikePostCopyWith<_LikePost> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$UnLikePostCopyWith<$Res> {
  factory _$UnLikePostCopyWith(
          _UnLikePost value, $Res Function(_UnLikePost) then) =
      __$UnLikePostCopyWithImpl<$Res>;
  $Res call({String postId, String userId});
}

/// @nodoc
class __$UnLikePostCopyWithImpl<$Res> extends _$PostEventCopyWithImpl<$Res>
    implements _$UnLikePostCopyWith<$Res> {
  __$UnLikePostCopyWithImpl(
      _UnLikePost _value, $Res Function(_UnLikePost) _then)
      : super(_value, (v) => _then(v as _UnLikePost));

  @override
  _UnLikePost get _value => super._value as _UnLikePost;

  @override
  $Res call({
    Object? postId = freezed,
    Object? userId = freezed,
  }) {
    return _then(_UnLikePost(
      postId: postId == freezed
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_UnLikePost implements _UnLikePost {
  const _$_UnLikePost({required this.postId, required this.userId});

  @override
  final String postId;
  @override
  final String userId;

  @override
  String toString() {
    return 'PostEvent.unLikePost(postId: $postId, userId: $userId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UnLikePost &&
            const DeepCollectionEquality().equals(other.postId, postId) &&
            const DeepCollectionEquality().equals(other.userId, userId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(postId),
      const DeepCollectionEquality().hash(userId));

  @JsonKey(ignore: true)
  @override
  _$UnLikePostCopyWith<_UnLikePost> get copyWith =>
      __$UnLikePostCopyWithImpl<_UnLikePost>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UserEntity user, dynamic post) likePost,
    required TResult Function(String postId, String userId) unLikePost,
    required TResult Function(String postId) deletePost,
  }) {
    return unLikePost(postId, userId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(UserEntity user, dynamic post)? likePost,
    TResult Function(String postId, String userId)? unLikePost,
    TResult Function(String postId)? deletePost,
  }) {
    return unLikePost?.call(postId, userId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserEntity user, dynamic post)? likePost,
    TResult Function(String postId, String userId)? unLikePost,
    TResult Function(String postId)? deletePost,
    required TResult orElse(),
  }) {
    if (unLikePost != null) {
      return unLikePost(postId, userId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LikePost value) likePost,
    required TResult Function(_UnLikePost value) unLikePost,
    required TResult Function(_DeletePost value) deletePost,
  }) {
    return unLikePost(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_LikePost value)? likePost,
    TResult Function(_UnLikePost value)? unLikePost,
    TResult Function(_DeletePost value)? deletePost,
  }) {
    return unLikePost?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LikePost value)? likePost,
    TResult Function(_UnLikePost value)? unLikePost,
    TResult Function(_DeletePost value)? deletePost,
    required TResult orElse(),
  }) {
    if (unLikePost != null) {
      return unLikePost(this);
    }
    return orElse();
  }
}

abstract class _UnLikePost implements PostEvent {
  const factory _UnLikePost({required String postId, required String userId}) =
      _$_UnLikePost;

  String get postId;
  String get userId;
  @JsonKey(ignore: true)
  _$UnLikePostCopyWith<_UnLikePost> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$DeletePostCopyWith<$Res> {
  factory _$DeletePostCopyWith(
          _DeletePost value, $Res Function(_DeletePost) then) =
      __$DeletePostCopyWithImpl<$Res>;
  $Res call({String postId});
}

/// @nodoc
class __$DeletePostCopyWithImpl<$Res> extends _$PostEventCopyWithImpl<$Res>
    implements _$DeletePostCopyWith<$Res> {
  __$DeletePostCopyWithImpl(
      _DeletePost _value, $Res Function(_DeletePost) _then)
      : super(_value, (v) => _then(v as _DeletePost));

  @override
  _DeletePost get _value => super._value as _DeletePost;

  @override
  $Res call({
    Object? postId = freezed,
  }) {
    return _then(_DeletePost(
      postId: postId == freezed
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_DeletePost implements _DeletePost {
  const _$_DeletePost({required this.postId});

  @override
  final String postId;

  @override
  String toString() {
    return 'PostEvent.deletePost(postId: $postId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DeletePost &&
            const DeepCollectionEquality().equals(other.postId, postId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(postId));

  @JsonKey(ignore: true)
  @override
  _$DeletePostCopyWith<_DeletePost> get copyWith =>
      __$DeletePostCopyWithImpl<_DeletePost>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UserEntity user, dynamic post) likePost,
    required TResult Function(String postId, String userId) unLikePost,
    required TResult Function(String postId) deletePost,
  }) {
    return deletePost(postId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(UserEntity user, dynamic post)? likePost,
    TResult Function(String postId, String userId)? unLikePost,
    TResult Function(String postId)? deletePost,
  }) {
    return deletePost?.call(postId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UserEntity user, dynamic post)? likePost,
    TResult Function(String postId, String userId)? unLikePost,
    TResult Function(String postId)? deletePost,
    required TResult orElse(),
  }) {
    if (deletePost != null) {
      return deletePost(postId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LikePost value) likePost,
    required TResult Function(_UnLikePost value) unLikePost,
    required TResult Function(_DeletePost value) deletePost,
  }) {
    return deletePost(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_LikePost value)? likePost,
    TResult Function(_UnLikePost value)? unLikePost,
    TResult Function(_DeletePost value)? deletePost,
  }) {
    return deletePost?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LikePost value)? likePost,
    TResult Function(_UnLikePost value)? unLikePost,
    TResult Function(_DeletePost value)? deletePost,
    required TResult orElse(),
  }) {
    if (deletePost != null) {
      return deletePost(this);
    }
    return orElse();
  }
}

abstract class _DeletePost implements PostEvent {
  const factory _DeletePost({required String postId}) = _$_DeletePost;

  String get postId;
  @JsonKey(ignore: true)
  _$DeletePostCopyWith<_DeletePost> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$PostStateTearOff {
  const _$PostStateTearOff();

  _PostState call(
      {String error = '', PostStatus currentState = PostStatus.Initial}) {
    return _PostState(
      error: error,
      currentState: currentState,
    );
  }
}

/// @nodoc
const $PostState = _$PostStateTearOff();

/// @nodoc
mixin _$PostState {
  String get error => throw _privateConstructorUsedError;
  PostStatus get currentState => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PostStateCopyWith<PostState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostStateCopyWith<$Res> {
  factory $PostStateCopyWith(PostState value, $Res Function(PostState) then) =
      _$PostStateCopyWithImpl<$Res>;
  $Res call({String error, PostStatus currentState});
}

/// @nodoc
class _$PostStateCopyWithImpl<$Res> implements $PostStateCopyWith<$Res> {
  _$PostStateCopyWithImpl(this._value, this._then);

  final PostState _value;
  // ignore: unused_field
  final $Res Function(PostState) _then;

  @override
  $Res call({
    Object? error = freezed,
    Object? currentState = freezed,
  }) {
    return _then(_value.copyWith(
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
      currentState: currentState == freezed
          ? _value.currentState
          : currentState // ignore: cast_nullable_to_non_nullable
              as PostStatus,
    ));
  }
}

/// @nodoc
abstract class _$PostStateCopyWith<$Res> implements $PostStateCopyWith<$Res> {
  factory _$PostStateCopyWith(
          _PostState value, $Res Function(_PostState) then) =
      __$PostStateCopyWithImpl<$Res>;
  @override
  $Res call({String error, PostStatus currentState});
}

/// @nodoc
class __$PostStateCopyWithImpl<$Res> extends _$PostStateCopyWithImpl<$Res>
    implements _$PostStateCopyWith<$Res> {
  __$PostStateCopyWithImpl(_PostState _value, $Res Function(_PostState) _then)
      : super(_value, (v) => _then(v as _PostState));

  @override
  _PostState get _value => super._value as _PostState;

  @override
  $Res call({
    Object? error = freezed,
    Object? currentState = freezed,
  }) {
    return _then(_PostState(
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
      currentState: currentState == freezed
          ? _value.currentState
          : currentState // ignore: cast_nullable_to_non_nullable
              as PostStatus,
    ));
  }
}

/// @nodoc

class _$_PostState implements _PostState {
  const _$_PostState({this.error = '', this.currentState = PostStatus.Initial});

  @JsonKey()
  @override
  final String error;
  @JsonKey()
  @override
  final PostStatus currentState;

  @override
  String toString() {
    return 'PostState(error: $error, currentState: $currentState)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PostState &&
            const DeepCollectionEquality().equals(other.error, error) &&
            const DeepCollectionEquality()
                .equals(other.currentState, currentState));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(error),
      const DeepCollectionEquality().hash(currentState));

  @JsonKey(ignore: true)
  @override
  _$PostStateCopyWith<_PostState> get copyWith =>
      __$PostStateCopyWithImpl<_PostState>(this, _$identity);
}

abstract class _PostState implements PostState {
  const factory _PostState({String error, PostStatus currentState}) =
      _$_PostState;

  @override
  String get error;
  @override
  PostStatus get currentState;
  @override
  @JsonKey(ignore: true)
  _$PostStateCopyWith<_PostState> get copyWith =>
      throw _privateConstructorUsedError;
}
