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

  _FetchTimelinePosts fetchTimelinePosts({required bool shouldLoad}) {
    return _FetchTimelinePosts(
      shouldLoad: shouldLoad,
    );
  }

  _FetchTimelinePaginatedPosts fetchPaginatedTimelinePosts() {
    return const _FetchTimelinePaginatedPosts();
  }

  _CreatePost createPost(
      {required String caption, required List<GalleryAsset> assets}) {
    return _CreatePost(
      caption: caption,
      assets: assets,
    );
  }

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
    required TResult Function(bool shouldLoad) fetchTimelinePosts,
    required TResult Function() fetchPaginatedTimelinePosts,
    required TResult Function(String caption, List<GalleryAsset> assets)
        createPost,
    required TResult Function(UserEntity user, dynamic post) likePost,
    required TResult Function(String postId, String userId) unLikePost,
    required TResult Function(String postId) deletePost,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool shouldLoad)? fetchTimelinePosts,
    TResult Function()? fetchPaginatedTimelinePosts,
    TResult Function(String caption, List<GalleryAsset> assets)? createPost,
    TResult Function(UserEntity user, dynamic post)? likePost,
    TResult Function(String postId, String userId)? unLikePost,
    TResult Function(String postId)? deletePost,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool shouldLoad)? fetchTimelinePosts,
    TResult Function()? fetchPaginatedTimelinePosts,
    TResult Function(String caption, List<GalleryAsset> assets)? createPost,
    TResult Function(UserEntity user, dynamic post)? likePost,
    TResult Function(String postId, String userId)? unLikePost,
    TResult Function(String postId)? deletePost,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchTimelinePosts value) fetchTimelinePosts,
    required TResult Function(_FetchTimelinePaginatedPosts value)
        fetchPaginatedTimelinePosts,
    required TResult Function(_CreatePost value) createPost,
    required TResult Function(_LikePost value) likePost,
    required TResult Function(_UnLikePost value) unLikePost,
    required TResult Function(_DeletePost value) deletePost,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_FetchTimelinePosts value)? fetchTimelinePosts,
    TResult Function(_FetchTimelinePaginatedPosts value)?
        fetchPaginatedTimelinePosts,
    TResult Function(_CreatePost value)? createPost,
    TResult Function(_LikePost value)? likePost,
    TResult Function(_UnLikePost value)? unLikePost,
    TResult Function(_DeletePost value)? deletePost,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchTimelinePosts value)? fetchTimelinePosts,
    TResult Function(_FetchTimelinePaginatedPosts value)?
        fetchPaginatedTimelinePosts,
    TResult Function(_CreatePost value)? createPost,
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
abstract class _$FetchTimelinePostsCopyWith<$Res> {
  factory _$FetchTimelinePostsCopyWith(
          _FetchTimelinePosts value, $Res Function(_FetchTimelinePosts) then) =
      __$FetchTimelinePostsCopyWithImpl<$Res>;
  $Res call({bool shouldLoad});
}

/// @nodoc
class __$FetchTimelinePostsCopyWithImpl<$Res>
    extends _$PostEventCopyWithImpl<$Res>
    implements _$FetchTimelinePostsCopyWith<$Res> {
  __$FetchTimelinePostsCopyWithImpl(
      _FetchTimelinePosts _value, $Res Function(_FetchTimelinePosts) _then)
      : super(_value, (v) => _then(v as _FetchTimelinePosts));

  @override
  _FetchTimelinePosts get _value => super._value as _FetchTimelinePosts;

  @override
  $Res call({
    Object? shouldLoad = freezed,
  }) {
    return _then(_FetchTimelinePosts(
      shouldLoad: shouldLoad == freezed
          ? _value.shouldLoad
          : shouldLoad // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_FetchTimelinePosts implements _FetchTimelinePosts {
  const _$_FetchTimelinePosts({required this.shouldLoad});

  @override
  final bool shouldLoad;

  @override
  String toString() {
    return 'PostEvent.fetchTimelinePosts(shouldLoad: $shouldLoad)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FetchTimelinePosts &&
            const DeepCollectionEquality()
                .equals(other.shouldLoad, shouldLoad));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(shouldLoad));

  @JsonKey(ignore: true)
  @override
  _$FetchTimelinePostsCopyWith<_FetchTimelinePosts> get copyWith =>
      __$FetchTimelinePostsCopyWithImpl<_FetchTimelinePosts>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool shouldLoad) fetchTimelinePosts,
    required TResult Function() fetchPaginatedTimelinePosts,
    required TResult Function(String caption, List<GalleryAsset> assets)
        createPost,
    required TResult Function(UserEntity user, dynamic post) likePost,
    required TResult Function(String postId, String userId) unLikePost,
    required TResult Function(String postId) deletePost,
  }) {
    return fetchTimelinePosts(shouldLoad);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool shouldLoad)? fetchTimelinePosts,
    TResult Function()? fetchPaginatedTimelinePosts,
    TResult Function(String caption, List<GalleryAsset> assets)? createPost,
    TResult Function(UserEntity user, dynamic post)? likePost,
    TResult Function(String postId, String userId)? unLikePost,
    TResult Function(String postId)? deletePost,
  }) {
    return fetchTimelinePosts?.call(shouldLoad);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool shouldLoad)? fetchTimelinePosts,
    TResult Function()? fetchPaginatedTimelinePosts,
    TResult Function(String caption, List<GalleryAsset> assets)? createPost,
    TResult Function(UserEntity user, dynamic post)? likePost,
    TResult Function(String postId, String userId)? unLikePost,
    TResult Function(String postId)? deletePost,
    required TResult orElse(),
  }) {
    if (fetchTimelinePosts != null) {
      return fetchTimelinePosts(shouldLoad);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchTimelinePosts value) fetchTimelinePosts,
    required TResult Function(_FetchTimelinePaginatedPosts value)
        fetchPaginatedTimelinePosts,
    required TResult Function(_CreatePost value) createPost,
    required TResult Function(_LikePost value) likePost,
    required TResult Function(_UnLikePost value) unLikePost,
    required TResult Function(_DeletePost value) deletePost,
  }) {
    return fetchTimelinePosts(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_FetchTimelinePosts value)? fetchTimelinePosts,
    TResult Function(_FetchTimelinePaginatedPosts value)?
        fetchPaginatedTimelinePosts,
    TResult Function(_CreatePost value)? createPost,
    TResult Function(_LikePost value)? likePost,
    TResult Function(_UnLikePost value)? unLikePost,
    TResult Function(_DeletePost value)? deletePost,
  }) {
    return fetchTimelinePosts?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchTimelinePosts value)? fetchTimelinePosts,
    TResult Function(_FetchTimelinePaginatedPosts value)?
        fetchPaginatedTimelinePosts,
    TResult Function(_CreatePost value)? createPost,
    TResult Function(_LikePost value)? likePost,
    TResult Function(_UnLikePost value)? unLikePost,
    TResult Function(_DeletePost value)? deletePost,
    required TResult orElse(),
  }) {
    if (fetchTimelinePosts != null) {
      return fetchTimelinePosts(this);
    }
    return orElse();
  }
}

abstract class _FetchTimelinePosts implements PostEvent {
  const factory _FetchTimelinePosts({required bool shouldLoad}) =
      _$_FetchTimelinePosts;

  bool get shouldLoad;
  @JsonKey(ignore: true)
  _$FetchTimelinePostsCopyWith<_FetchTimelinePosts> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$FetchTimelinePaginatedPostsCopyWith<$Res> {
  factory _$FetchTimelinePaginatedPostsCopyWith(
          _FetchTimelinePaginatedPosts value,
          $Res Function(_FetchTimelinePaginatedPosts) then) =
      __$FetchTimelinePaginatedPostsCopyWithImpl<$Res>;
}

/// @nodoc
class __$FetchTimelinePaginatedPostsCopyWithImpl<$Res>
    extends _$PostEventCopyWithImpl<$Res>
    implements _$FetchTimelinePaginatedPostsCopyWith<$Res> {
  __$FetchTimelinePaginatedPostsCopyWithImpl(
      _FetchTimelinePaginatedPosts _value,
      $Res Function(_FetchTimelinePaginatedPosts) _then)
      : super(_value, (v) => _then(v as _FetchTimelinePaginatedPosts));

  @override
  _FetchTimelinePaginatedPosts get _value =>
      super._value as _FetchTimelinePaginatedPosts;
}

/// @nodoc

class _$_FetchTimelinePaginatedPosts implements _FetchTimelinePaginatedPosts {
  const _$_FetchTimelinePaginatedPosts();

  @override
  String toString() {
    return 'PostEvent.fetchPaginatedTimelinePosts()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FetchTimelinePaginatedPosts);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool shouldLoad) fetchTimelinePosts,
    required TResult Function() fetchPaginatedTimelinePosts,
    required TResult Function(String caption, List<GalleryAsset> assets)
        createPost,
    required TResult Function(UserEntity user, dynamic post) likePost,
    required TResult Function(String postId, String userId) unLikePost,
    required TResult Function(String postId) deletePost,
  }) {
    return fetchPaginatedTimelinePosts();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool shouldLoad)? fetchTimelinePosts,
    TResult Function()? fetchPaginatedTimelinePosts,
    TResult Function(String caption, List<GalleryAsset> assets)? createPost,
    TResult Function(UserEntity user, dynamic post)? likePost,
    TResult Function(String postId, String userId)? unLikePost,
    TResult Function(String postId)? deletePost,
  }) {
    return fetchPaginatedTimelinePosts?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool shouldLoad)? fetchTimelinePosts,
    TResult Function()? fetchPaginatedTimelinePosts,
    TResult Function(String caption, List<GalleryAsset> assets)? createPost,
    TResult Function(UserEntity user, dynamic post)? likePost,
    TResult Function(String postId, String userId)? unLikePost,
    TResult Function(String postId)? deletePost,
    required TResult orElse(),
  }) {
    if (fetchPaginatedTimelinePosts != null) {
      return fetchPaginatedTimelinePosts();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchTimelinePosts value) fetchTimelinePosts,
    required TResult Function(_FetchTimelinePaginatedPosts value)
        fetchPaginatedTimelinePosts,
    required TResult Function(_CreatePost value) createPost,
    required TResult Function(_LikePost value) likePost,
    required TResult Function(_UnLikePost value) unLikePost,
    required TResult Function(_DeletePost value) deletePost,
  }) {
    return fetchPaginatedTimelinePosts(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_FetchTimelinePosts value)? fetchTimelinePosts,
    TResult Function(_FetchTimelinePaginatedPosts value)?
        fetchPaginatedTimelinePosts,
    TResult Function(_CreatePost value)? createPost,
    TResult Function(_LikePost value)? likePost,
    TResult Function(_UnLikePost value)? unLikePost,
    TResult Function(_DeletePost value)? deletePost,
  }) {
    return fetchPaginatedTimelinePosts?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchTimelinePosts value)? fetchTimelinePosts,
    TResult Function(_FetchTimelinePaginatedPosts value)?
        fetchPaginatedTimelinePosts,
    TResult Function(_CreatePost value)? createPost,
    TResult Function(_LikePost value)? likePost,
    TResult Function(_UnLikePost value)? unLikePost,
    TResult Function(_DeletePost value)? deletePost,
    required TResult orElse(),
  }) {
    if (fetchPaginatedTimelinePosts != null) {
      return fetchPaginatedTimelinePosts(this);
    }
    return orElse();
  }
}

abstract class _FetchTimelinePaginatedPosts implements PostEvent {
  const factory _FetchTimelinePaginatedPosts() = _$_FetchTimelinePaginatedPosts;
}

/// @nodoc
abstract class _$CreatePostCopyWith<$Res> {
  factory _$CreatePostCopyWith(
          _CreatePost value, $Res Function(_CreatePost) then) =
      __$CreatePostCopyWithImpl<$Res>;
  $Res call({String caption, List<GalleryAsset> assets});
}

/// @nodoc
class __$CreatePostCopyWithImpl<$Res> extends _$PostEventCopyWithImpl<$Res>
    implements _$CreatePostCopyWith<$Res> {
  __$CreatePostCopyWithImpl(
      _CreatePost _value, $Res Function(_CreatePost) _then)
      : super(_value, (v) => _then(v as _CreatePost));

  @override
  _CreatePost get _value => super._value as _CreatePost;

  @override
  $Res call({
    Object? caption = freezed,
    Object? assets = freezed,
  }) {
    return _then(_CreatePost(
      caption: caption == freezed
          ? _value.caption
          : caption // ignore: cast_nullable_to_non_nullable
              as String,
      assets: assets == freezed
          ? _value.assets
          : assets // ignore: cast_nullable_to_non_nullable
              as List<GalleryAsset>,
    ));
  }
}

/// @nodoc

class _$_CreatePost implements _CreatePost {
  const _$_CreatePost({required this.caption, required this.assets});

  @override
  final String caption;
  @override
  final List<GalleryAsset> assets;

  @override
  String toString() {
    return 'PostEvent.createPost(caption: $caption, assets: $assets)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CreatePost &&
            const DeepCollectionEquality().equals(other.caption, caption) &&
            const DeepCollectionEquality().equals(other.assets, assets));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(caption),
      const DeepCollectionEquality().hash(assets));

  @JsonKey(ignore: true)
  @override
  _$CreatePostCopyWith<_CreatePost> get copyWith =>
      __$CreatePostCopyWithImpl<_CreatePost>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool shouldLoad) fetchTimelinePosts,
    required TResult Function() fetchPaginatedTimelinePosts,
    required TResult Function(String caption, List<GalleryAsset> assets)
        createPost,
    required TResult Function(UserEntity user, dynamic post) likePost,
    required TResult Function(String postId, String userId) unLikePost,
    required TResult Function(String postId) deletePost,
  }) {
    return createPost(caption, assets);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool shouldLoad)? fetchTimelinePosts,
    TResult Function()? fetchPaginatedTimelinePosts,
    TResult Function(String caption, List<GalleryAsset> assets)? createPost,
    TResult Function(UserEntity user, dynamic post)? likePost,
    TResult Function(String postId, String userId)? unLikePost,
    TResult Function(String postId)? deletePost,
  }) {
    return createPost?.call(caption, assets);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool shouldLoad)? fetchTimelinePosts,
    TResult Function()? fetchPaginatedTimelinePosts,
    TResult Function(String caption, List<GalleryAsset> assets)? createPost,
    TResult Function(UserEntity user, dynamic post)? likePost,
    TResult Function(String postId, String userId)? unLikePost,
    TResult Function(String postId)? deletePost,
    required TResult orElse(),
  }) {
    if (createPost != null) {
      return createPost(caption, assets);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchTimelinePosts value) fetchTimelinePosts,
    required TResult Function(_FetchTimelinePaginatedPosts value)
        fetchPaginatedTimelinePosts,
    required TResult Function(_CreatePost value) createPost,
    required TResult Function(_LikePost value) likePost,
    required TResult Function(_UnLikePost value) unLikePost,
    required TResult Function(_DeletePost value) deletePost,
  }) {
    return createPost(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_FetchTimelinePosts value)? fetchTimelinePosts,
    TResult Function(_FetchTimelinePaginatedPosts value)?
        fetchPaginatedTimelinePosts,
    TResult Function(_CreatePost value)? createPost,
    TResult Function(_LikePost value)? likePost,
    TResult Function(_UnLikePost value)? unLikePost,
    TResult Function(_DeletePost value)? deletePost,
  }) {
    return createPost?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchTimelinePosts value)? fetchTimelinePosts,
    TResult Function(_FetchTimelinePaginatedPosts value)?
        fetchPaginatedTimelinePosts,
    TResult Function(_CreatePost value)? createPost,
    TResult Function(_LikePost value)? likePost,
    TResult Function(_UnLikePost value)? unLikePost,
    TResult Function(_DeletePost value)? deletePost,
    required TResult orElse(),
  }) {
    if (createPost != null) {
      return createPost(this);
    }
    return orElse();
  }
}

abstract class _CreatePost implements PostEvent {
  const factory _CreatePost(
      {required String caption,
      required List<GalleryAsset> assets}) = _$_CreatePost;

  String get caption;
  List<GalleryAsset> get assets;
  @JsonKey(ignore: true)
  _$CreatePostCopyWith<_CreatePost> get copyWith =>
      throw _privateConstructorUsedError;
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
    required TResult Function(bool shouldLoad) fetchTimelinePosts,
    required TResult Function() fetchPaginatedTimelinePosts,
    required TResult Function(String caption, List<GalleryAsset> assets)
        createPost,
    required TResult Function(UserEntity user, dynamic post) likePost,
    required TResult Function(String postId, String userId) unLikePost,
    required TResult Function(String postId) deletePost,
  }) {
    return likePost(user, post);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool shouldLoad)? fetchTimelinePosts,
    TResult Function()? fetchPaginatedTimelinePosts,
    TResult Function(String caption, List<GalleryAsset> assets)? createPost,
    TResult Function(UserEntity user, dynamic post)? likePost,
    TResult Function(String postId, String userId)? unLikePost,
    TResult Function(String postId)? deletePost,
  }) {
    return likePost?.call(user, post);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool shouldLoad)? fetchTimelinePosts,
    TResult Function()? fetchPaginatedTimelinePosts,
    TResult Function(String caption, List<GalleryAsset> assets)? createPost,
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
    required TResult Function(_FetchTimelinePosts value) fetchTimelinePosts,
    required TResult Function(_FetchTimelinePaginatedPosts value)
        fetchPaginatedTimelinePosts,
    required TResult Function(_CreatePost value) createPost,
    required TResult Function(_LikePost value) likePost,
    required TResult Function(_UnLikePost value) unLikePost,
    required TResult Function(_DeletePost value) deletePost,
  }) {
    return likePost(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_FetchTimelinePosts value)? fetchTimelinePosts,
    TResult Function(_FetchTimelinePaginatedPosts value)?
        fetchPaginatedTimelinePosts,
    TResult Function(_CreatePost value)? createPost,
    TResult Function(_LikePost value)? likePost,
    TResult Function(_UnLikePost value)? unLikePost,
    TResult Function(_DeletePost value)? deletePost,
  }) {
    return likePost?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchTimelinePosts value)? fetchTimelinePosts,
    TResult Function(_FetchTimelinePaginatedPosts value)?
        fetchPaginatedTimelinePosts,
    TResult Function(_CreatePost value)? createPost,
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
    required TResult Function(bool shouldLoad) fetchTimelinePosts,
    required TResult Function() fetchPaginatedTimelinePosts,
    required TResult Function(String caption, List<GalleryAsset> assets)
        createPost,
    required TResult Function(UserEntity user, dynamic post) likePost,
    required TResult Function(String postId, String userId) unLikePost,
    required TResult Function(String postId) deletePost,
  }) {
    return unLikePost(postId, userId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool shouldLoad)? fetchTimelinePosts,
    TResult Function()? fetchPaginatedTimelinePosts,
    TResult Function(String caption, List<GalleryAsset> assets)? createPost,
    TResult Function(UserEntity user, dynamic post)? likePost,
    TResult Function(String postId, String userId)? unLikePost,
    TResult Function(String postId)? deletePost,
  }) {
    return unLikePost?.call(postId, userId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool shouldLoad)? fetchTimelinePosts,
    TResult Function()? fetchPaginatedTimelinePosts,
    TResult Function(String caption, List<GalleryAsset> assets)? createPost,
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
    required TResult Function(_FetchTimelinePosts value) fetchTimelinePosts,
    required TResult Function(_FetchTimelinePaginatedPosts value)
        fetchPaginatedTimelinePosts,
    required TResult Function(_CreatePost value) createPost,
    required TResult Function(_LikePost value) likePost,
    required TResult Function(_UnLikePost value) unLikePost,
    required TResult Function(_DeletePost value) deletePost,
  }) {
    return unLikePost(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_FetchTimelinePosts value)? fetchTimelinePosts,
    TResult Function(_FetchTimelinePaginatedPosts value)?
        fetchPaginatedTimelinePosts,
    TResult Function(_CreatePost value)? createPost,
    TResult Function(_LikePost value)? likePost,
    TResult Function(_UnLikePost value)? unLikePost,
    TResult Function(_DeletePost value)? deletePost,
  }) {
    return unLikePost?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchTimelinePosts value)? fetchTimelinePosts,
    TResult Function(_FetchTimelinePaginatedPosts value)?
        fetchPaginatedTimelinePosts,
    TResult Function(_CreatePost value)? createPost,
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
    required TResult Function(bool shouldLoad) fetchTimelinePosts,
    required TResult Function() fetchPaginatedTimelinePosts,
    required TResult Function(String caption, List<GalleryAsset> assets)
        createPost,
    required TResult Function(UserEntity user, dynamic post) likePost,
    required TResult Function(String postId, String userId) unLikePost,
    required TResult Function(String postId) deletePost,
  }) {
    return deletePost(postId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool shouldLoad)? fetchTimelinePosts,
    TResult Function()? fetchPaginatedTimelinePosts,
    TResult Function(String caption, List<GalleryAsset> assets)? createPost,
    TResult Function(UserEntity user, dynamic post)? likePost,
    TResult Function(String postId, String userId)? unLikePost,
    TResult Function(String postId)? deletePost,
  }) {
    return deletePost?.call(postId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool shouldLoad)? fetchTimelinePosts,
    TResult Function()? fetchPaginatedTimelinePosts,
    TResult Function(String caption, List<GalleryAsset> assets)? createPost,
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
    required TResult Function(_FetchTimelinePosts value) fetchTimelinePosts,
    required TResult Function(_FetchTimelinePaginatedPosts value)
        fetchPaginatedTimelinePosts,
    required TResult Function(_CreatePost value) createPost,
    required TResult Function(_LikePost value) likePost,
    required TResult Function(_UnLikePost value) unLikePost,
    required TResult Function(_DeletePost value) deletePost,
  }) {
    return deletePost(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_FetchTimelinePosts value)? fetchTimelinePosts,
    TResult Function(_FetchTimelinePaginatedPosts value)?
        fetchPaginatedTimelinePosts,
    TResult Function(_CreatePost value)? createPost,
    TResult Function(_LikePost value)? likePost,
    TResult Function(_UnLikePost value)? unLikePost,
    TResult Function(_DeletePost value)? deletePost,
  }) {
    return deletePost?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchTimelinePosts value)? fetchTimelinePosts,
    TResult Function(_FetchTimelinePaginatedPosts value)?
        fetchPaginatedTimelinePosts,
    TResult Function(_CreatePost value)? createPost,
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
      {String error = '',
      required TimelineResponse timelinePosts,
      PostStatus currentState = PostStatus.idle,
      PostListenableAction action = PostListenableAction.idle}) {
    return _PostState(
      error: error,
      timelinePosts: timelinePosts,
      currentState: currentState,
      action: action,
    );
  }
}

/// @nodoc
const $PostState = _$PostStateTearOff();

/// @nodoc
mixin _$PostState {
  String get error => throw _privateConstructorUsedError;
  TimelineResponse get timelinePosts => throw _privateConstructorUsedError;
  PostStatus get currentState => throw _privateConstructorUsedError;
  PostListenableAction get action => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PostStateCopyWith<PostState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostStateCopyWith<$Res> {
  factory $PostStateCopyWith(PostState value, $Res Function(PostState) then) =
      _$PostStateCopyWithImpl<$Res>;
  $Res call(
      {String error,
      TimelineResponse timelinePosts,
      PostStatus currentState,
      PostListenableAction action});
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
    Object? timelinePosts = freezed,
    Object? currentState = freezed,
    Object? action = freezed,
  }) {
    return _then(_value.copyWith(
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
      timelinePosts: timelinePosts == freezed
          ? _value.timelinePosts
          : timelinePosts // ignore: cast_nullable_to_non_nullable
              as TimelineResponse,
      currentState: currentState == freezed
          ? _value.currentState
          : currentState // ignore: cast_nullable_to_non_nullable
              as PostStatus,
      action: action == freezed
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as PostListenableAction,
    ));
  }
}

/// @nodoc
abstract class _$PostStateCopyWith<$Res> implements $PostStateCopyWith<$Res> {
  factory _$PostStateCopyWith(
          _PostState value, $Res Function(_PostState) then) =
      __$PostStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {String error,
      TimelineResponse timelinePosts,
      PostStatus currentState,
      PostListenableAction action});
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
    Object? timelinePosts = freezed,
    Object? currentState = freezed,
    Object? action = freezed,
  }) {
    return _then(_PostState(
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
      timelinePosts: timelinePosts == freezed
          ? _value.timelinePosts
          : timelinePosts // ignore: cast_nullable_to_non_nullable
              as TimelineResponse,
      currentState: currentState == freezed
          ? _value.currentState
          : currentState // ignore: cast_nullable_to_non_nullable
              as PostStatus,
      action: action == freezed
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as PostListenableAction,
    ));
  }
}

/// @nodoc

class _$_PostState implements _PostState {
  const _$_PostState(
      {this.error = '',
      required this.timelinePosts,
      this.currentState = PostStatus.idle,
      this.action = PostListenableAction.idle});

  @JsonKey()
  @override
  final String error;
  @override
  final TimelineResponse timelinePosts;
  @JsonKey()
  @override
  final PostStatus currentState;
  @JsonKey()
  @override
  final PostListenableAction action;

  @override
  String toString() {
    return 'PostState(error: $error, timelinePosts: $timelinePosts, currentState: $currentState, action: $action)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PostState &&
            const DeepCollectionEquality().equals(other.error, error) &&
            const DeepCollectionEquality()
                .equals(other.timelinePosts, timelinePosts) &&
            const DeepCollectionEquality()
                .equals(other.currentState, currentState) &&
            const DeepCollectionEquality().equals(other.action, action));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(error),
      const DeepCollectionEquality().hash(timelinePosts),
      const DeepCollectionEquality().hash(currentState),
      const DeepCollectionEquality().hash(action));

  @JsonKey(ignore: true)
  @override
  _$PostStateCopyWith<_PostState> get copyWith =>
      __$PostStateCopyWithImpl<_PostState>(this, _$identity);
}

abstract class _PostState implements PostState {
  const factory _PostState(
      {String error,
      required TimelineResponse timelinePosts,
      PostStatus currentState,
      PostListenableAction action}) = _$_PostState;

  @override
  String get error;
  @override
  TimelineResponse get timelinePosts;
  @override
  PostStatus get currentState;
  @override
  PostListenableAction get action;
  @override
  @JsonKey(ignore: true)
  _$PostStateCopyWith<_PostState> get copyWith =>
      throw _privateConstructorUsedError;
}
