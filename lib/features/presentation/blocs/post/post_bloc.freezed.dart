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

  _CreateStatusPost createStatusPost({required String status}) {
    return _CreateStatusPost(
      status: status,
    );
  }

  _ReactPost reactToPost(
      {required Post post,
      required UserModel user,
      required PostReaction reaction,
      required List<PostReaction> latestReactions}) {
    return _ReactPost(
      post: post,
      user: user,
      reaction: reaction,
      latestReactions: latestReactions,
    );
  }

  _UpdateReactPost updateReaction(
      {required PostReaction reaction,
      required List<PostReaction> latestReactions}) {
    return _UpdateReactPost(
      reaction: reaction,
      latestReactions: latestReactions,
    );
  }

  _UnReactPost unReactToPost(
      {required PostReaction reaction,
      required List<PostReaction> latestReactions}) {
    return _UnReactPost(
      reaction: reaction,
      latestReactions: latestReactions,
    );
  }

  _SharePost sharePost({required String postId}) {
    return _SharePost(
      postId: postId,
    );
  }

  _SavePost savePost({required SavedPostDTO savedPost}) {
    return _SavePost(
      savedPost: savedPost,
    );
  }

  _UnSavePost unSavePost({required String userId, required String postId}) {
    return _UnSavePost(
      userId: userId,
      postId: postId,
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

  _GetPost getPost({required String postId}) {
    return _GetPost(
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
    required TResult Function(String status) createStatusPost,
    required TResult Function(Post post, UserModel user, PostReaction reaction,
            List<PostReaction> latestReactions)
        reactToPost,
    required TResult Function(
            PostReaction reaction, List<PostReaction> latestReactions)
        updateReaction,
    required TResult Function(
            PostReaction reaction, List<PostReaction> latestReactions)
        unReactToPost,
    required TResult Function(String postId) sharePost,
    required TResult Function(SavedPostDTO savedPost) savePost,
    required TResult Function(String userId, String postId) unSavePost,
    required TResult Function(String postId, String userId) unLikePost,
    required TResult Function(String postId) deletePost,
    required TResult Function(String postId) getPost,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool shouldLoad)? fetchTimelinePosts,
    TResult Function()? fetchPaginatedTimelinePosts,
    TResult Function(String caption, List<GalleryAsset> assets)? createPost,
    TResult Function(String status)? createStatusPost,
    TResult Function(Post post, UserModel user, PostReaction reaction,
            List<PostReaction> latestReactions)?
        reactToPost,
    TResult Function(PostReaction reaction, List<PostReaction> latestReactions)?
        updateReaction,
    TResult Function(PostReaction reaction, List<PostReaction> latestReactions)?
        unReactToPost,
    TResult Function(String postId)? sharePost,
    TResult Function(SavedPostDTO savedPost)? savePost,
    TResult Function(String userId, String postId)? unSavePost,
    TResult Function(String postId, String userId)? unLikePost,
    TResult Function(String postId)? deletePost,
    TResult Function(String postId)? getPost,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool shouldLoad)? fetchTimelinePosts,
    TResult Function()? fetchPaginatedTimelinePosts,
    TResult Function(String caption, List<GalleryAsset> assets)? createPost,
    TResult Function(String status)? createStatusPost,
    TResult Function(Post post, UserModel user, PostReaction reaction,
            List<PostReaction> latestReactions)?
        reactToPost,
    TResult Function(PostReaction reaction, List<PostReaction> latestReactions)?
        updateReaction,
    TResult Function(PostReaction reaction, List<PostReaction> latestReactions)?
        unReactToPost,
    TResult Function(String postId)? sharePost,
    TResult Function(SavedPostDTO savedPost)? savePost,
    TResult Function(String userId, String postId)? unSavePost,
    TResult Function(String postId, String userId)? unLikePost,
    TResult Function(String postId)? deletePost,
    TResult Function(String postId)? getPost,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchTimelinePosts value) fetchTimelinePosts,
    required TResult Function(_FetchTimelinePaginatedPosts value)
        fetchPaginatedTimelinePosts,
    required TResult Function(_CreatePost value) createPost,
    required TResult Function(_CreateStatusPost value) createStatusPost,
    required TResult Function(_ReactPost value) reactToPost,
    required TResult Function(_UpdateReactPost value) updateReaction,
    required TResult Function(_UnReactPost value) unReactToPost,
    required TResult Function(_SharePost value) sharePost,
    required TResult Function(_SavePost value) savePost,
    required TResult Function(_UnSavePost value) unSavePost,
    required TResult Function(_UnLikePost value) unLikePost,
    required TResult Function(_DeletePost value) deletePost,
    required TResult Function(_GetPost value) getPost,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_FetchTimelinePosts value)? fetchTimelinePosts,
    TResult Function(_FetchTimelinePaginatedPosts value)?
        fetchPaginatedTimelinePosts,
    TResult Function(_CreatePost value)? createPost,
    TResult Function(_CreateStatusPost value)? createStatusPost,
    TResult Function(_ReactPost value)? reactToPost,
    TResult Function(_UpdateReactPost value)? updateReaction,
    TResult Function(_UnReactPost value)? unReactToPost,
    TResult Function(_SharePost value)? sharePost,
    TResult Function(_SavePost value)? savePost,
    TResult Function(_UnSavePost value)? unSavePost,
    TResult Function(_UnLikePost value)? unLikePost,
    TResult Function(_DeletePost value)? deletePost,
    TResult Function(_GetPost value)? getPost,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchTimelinePosts value)? fetchTimelinePosts,
    TResult Function(_FetchTimelinePaginatedPosts value)?
        fetchPaginatedTimelinePosts,
    TResult Function(_CreatePost value)? createPost,
    TResult Function(_CreateStatusPost value)? createStatusPost,
    TResult Function(_ReactPost value)? reactToPost,
    TResult Function(_UpdateReactPost value)? updateReaction,
    TResult Function(_UnReactPost value)? unReactToPost,
    TResult Function(_SharePost value)? sharePost,
    TResult Function(_SavePost value)? savePost,
    TResult Function(_UnSavePost value)? unSavePost,
    TResult Function(_UnLikePost value)? unLikePost,
    TResult Function(_DeletePost value)? deletePost,
    TResult Function(_GetPost value)? getPost,
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
    required TResult Function(String status) createStatusPost,
    required TResult Function(Post post, UserModel user, PostReaction reaction,
            List<PostReaction> latestReactions)
        reactToPost,
    required TResult Function(
            PostReaction reaction, List<PostReaction> latestReactions)
        updateReaction,
    required TResult Function(
            PostReaction reaction, List<PostReaction> latestReactions)
        unReactToPost,
    required TResult Function(String postId) sharePost,
    required TResult Function(SavedPostDTO savedPost) savePost,
    required TResult Function(String userId, String postId) unSavePost,
    required TResult Function(String postId, String userId) unLikePost,
    required TResult Function(String postId) deletePost,
    required TResult Function(String postId) getPost,
  }) {
    return fetchTimelinePosts(shouldLoad);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool shouldLoad)? fetchTimelinePosts,
    TResult Function()? fetchPaginatedTimelinePosts,
    TResult Function(String caption, List<GalleryAsset> assets)? createPost,
    TResult Function(String status)? createStatusPost,
    TResult Function(Post post, UserModel user, PostReaction reaction,
            List<PostReaction> latestReactions)?
        reactToPost,
    TResult Function(PostReaction reaction, List<PostReaction> latestReactions)?
        updateReaction,
    TResult Function(PostReaction reaction, List<PostReaction> latestReactions)?
        unReactToPost,
    TResult Function(String postId)? sharePost,
    TResult Function(SavedPostDTO savedPost)? savePost,
    TResult Function(String userId, String postId)? unSavePost,
    TResult Function(String postId, String userId)? unLikePost,
    TResult Function(String postId)? deletePost,
    TResult Function(String postId)? getPost,
  }) {
    return fetchTimelinePosts?.call(shouldLoad);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool shouldLoad)? fetchTimelinePosts,
    TResult Function()? fetchPaginatedTimelinePosts,
    TResult Function(String caption, List<GalleryAsset> assets)? createPost,
    TResult Function(String status)? createStatusPost,
    TResult Function(Post post, UserModel user, PostReaction reaction,
            List<PostReaction> latestReactions)?
        reactToPost,
    TResult Function(PostReaction reaction, List<PostReaction> latestReactions)?
        updateReaction,
    TResult Function(PostReaction reaction, List<PostReaction> latestReactions)?
        unReactToPost,
    TResult Function(String postId)? sharePost,
    TResult Function(SavedPostDTO savedPost)? savePost,
    TResult Function(String userId, String postId)? unSavePost,
    TResult Function(String postId, String userId)? unLikePost,
    TResult Function(String postId)? deletePost,
    TResult Function(String postId)? getPost,
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
    required TResult Function(_CreateStatusPost value) createStatusPost,
    required TResult Function(_ReactPost value) reactToPost,
    required TResult Function(_UpdateReactPost value) updateReaction,
    required TResult Function(_UnReactPost value) unReactToPost,
    required TResult Function(_SharePost value) sharePost,
    required TResult Function(_SavePost value) savePost,
    required TResult Function(_UnSavePost value) unSavePost,
    required TResult Function(_UnLikePost value) unLikePost,
    required TResult Function(_DeletePost value) deletePost,
    required TResult Function(_GetPost value) getPost,
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
    TResult Function(_CreateStatusPost value)? createStatusPost,
    TResult Function(_ReactPost value)? reactToPost,
    TResult Function(_UpdateReactPost value)? updateReaction,
    TResult Function(_UnReactPost value)? unReactToPost,
    TResult Function(_SharePost value)? sharePost,
    TResult Function(_SavePost value)? savePost,
    TResult Function(_UnSavePost value)? unSavePost,
    TResult Function(_UnLikePost value)? unLikePost,
    TResult Function(_DeletePost value)? deletePost,
    TResult Function(_GetPost value)? getPost,
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
    TResult Function(_CreateStatusPost value)? createStatusPost,
    TResult Function(_ReactPost value)? reactToPost,
    TResult Function(_UpdateReactPost value)? updateReaction,
    TResult Function(_UnReactPost value)? unReactToPost,
    TResult Function(_SharePost value)? sharePost,
    TResult Function(_SavePost value)? savePost,
    TResult Function(_UnSavePost value)? unSavePost,
    TResult Function(_UnLikePost value)? unLikePost,
    TResult Function(_DeletePost value)? deletePost,
    TResult Function(_GetPost value)? getPost,
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
    required TResult Function(String status) createStatusPost,
    required TResult Function(Post post, UserModel user, PostReaction reaction,
            List<PostReaction> latestReactions)
        reactToPost,
    required TResult Function(
            PostReaction reaction, List<PostReaction> latestReactions)
        updateReaction,
    required TResult Function(
            PostReaction reaction, List<PostReaction> latestReactions)
        unReactToPost,
    required TResult Function(String postId) sharePost,
    required TResult Function(SavedPostDTO savedPost) savePost,
    required TResult Function(String userId, String postId) unSavePost,
    required TResult Function(String postId, String userId) unLikePost,
    required TResult Function(String postId) deletePost,
    required TResult Function(String postId) getPost,
  }) {
    return fetchPaginatedTimelinePosts();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool shouldLoad)? fetchTimelinePosts,
    TResult Function()? fetchPaginatedTimelinePosts,
    TResult Function(String caption, List<GalleryAsset> assets)? createPost,
    TResult Function(String status)? createStatusPost,
    TResult Function(Post post, UserModel user, PostReaction reaction,
            List<PostReaction> latestReactions)?
        reactToPost,
    TResult Function(PostReaction reaction, List<PostReaction> latestReactions)?
        updateReaction,
    TResult Function(PostReaction reaction, List<PostReaction> latestReactions)?
        unReactToPost,
    TResult Function(String postId)? sharePost,
    TResult Function(SavedPostDTO savedPost)? savePost,
    TResult Function(String userId, String postId)? unSavePost,
    TResult Function(String postId, String userId)? unLikePost,
    TResult Function(String postId)? deletePost,
    TResult Function(String postId)? getPost,
  }) {
    return fetchPaginatedTimelinePosts?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool shouldLoad)? fetchTimelinePosts,
    TResult Function()? fetchPaginatedTimelinePosts,
    TResult Function(String caption, List<GalleryAsset> assets)? createPost,
    TResult Function(String status)? createStatusPost,
    TResult Function(Post post, UserModel user, PostReaction reaction,
            List<PostReaction> latestReactions)?
        reactToPost,
    TResult Function(PostReaction reaction, List<PostReaction> latestReactions)?
        updateReaction,
    TResult Function(PostReaction reaction, List<PostReaction> latestReactions)?
        unReactToPost,
    TResult Function(String postId)? sharePost,
    TResult Function(SavedPostDTO savedPost)? savePost,
    TResult Function(String userId, String postId)? unSavePost,
    TResult Function(String postId, String userId)? unLikePost,
    TResult Function(String postId)? deletePost,
    TResult Function(String postId)? getPost,
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
    required TResult Function(_CreateStatusPost value) createStatusPost,
    required TResult Function(_ReactPost value) reactToPost,
    required TResult Function(_UpdateReactPost value) updateReaction,
    required TResult Function(_UnReactPost value) unReactToPost,
    required TResult Function(_SharePost value) sharePost,
    required TResult Function(_SavePost value) savePost,
    required TResult Function(_UnSavePost value) unSavePost,
    required TResult Function(_UnLikePost value) unLikePost,
    required TResult Function(_DeletePost value) deletePost,
    required TResult Function(_GetPost value) getPost,
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
    TResult Function(_CreateStatusPost value)? createStatusPost,
    TResult Function(_ReactPost value)? reactToPost,
    TResult Function(_UpdateReactPost value)? updateReaction,
    TResult Function(_UnReactPost value)? unReactToPost,
    TResult Function(_SharePost value)? sharePost,
    TResult Function(_SavePost value)? savePost,
    TResult Function(_UnSavePost value)? unSavePost,
    TResult Function(_UnLikePost value)? unLikePost,
    TResult Function(_DeletePost value)? deletePost,
    TResult Function(_GetPost value)? getPost,
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
    TResult Function(_CreateStatusPost value)? createStatusPost,
    TResult Function(_ReactPost value)? reactToPost,
    TResult Function(_UpdateReactPost value)? updateReaction,
    TResult Function(_UnReactPost value)? unReactToPost,
    TResult Function(_SharePost value)? sharePost,
    TResult Function(_SavePost value)? savePost,
    TResult Function(_UnSavePost value)? unSavePost,
    TResult Function(_UnLikePost value)? unLikePost,
    TResult Function(_DeletePost value)? deletePost,
    TResult Function(_GetPost value)? getPost,
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
    required TResult Function(String status) createStatusPost,
    required TResult Function(Post post, UserModel user, PostReaction reaction,
            List<PostReaction> latestReactions)
        reactToPost,
    required TResult Function(
            PostReaction reaction, List<PostReaction> latestReactions)
        updateReaction,
    required TResult Function(
            PostReaction reaction, List<PostReaction> latestReactions)
        unReactToPost,
    required TResult Function(String postId) sharePost,
    required TResult Function(SavedPostDTO savedPost) savePost,
    required TResult Function(String userId, String postId) unSavePost,
    required TResult Function(String postId, String userId) unLikePost,
    required TResult Function(String postId) deletePost,
    required TResult Function(String postId) getPost,
  }) {
    return createPost(caption, assets);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool shouldLoad)? fetchTimelinePosts,
    TResult Function()? fetchPaginatedTimelinePosts,
    TResult Function(String caption, List<GalleryAsset> assets)? createPost,
    TResult Function(String status)? createStatusPost,
    TResult Function(Post post, UserModel user, PostReaction reaction,
            List<PostReaction> latestReactions)?
        reactToPost,
    TResult Function(PostReaction reaction, List<PostReaction> latestReactions)?
        updateReaction,
    TResult Function(PostReaction reaction, List<PostReaction> latestReactions)?
        unReactToPost,
    TResult Function(String postId)? sharePost,
    TResult Function(SavedPostDTO savedPost)? savePost,
    TResult Function(String userId, String postId)? unSavePost,
    TResult Function(String postId, String userId)? unLikePost,
    TResult Function(String postId)? deletePost,
    TResult Function(String postId)? getPost,
  }) {
    return createPost?.call(caption, assets);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool shouldLoad)? fetchTimelinePosts,
    TResult Function()? fetchPaginatedTimelinePosts,
    TResult Function(String caption, List<GalleryAsset> assets)? createPost,
    TResult Function(String status)? createStatusPost,
    TResult Function(Post post, UserModel user, PostReaction reaction,
            List<PostReaction> latestReactions)?
        reactToPost,
    TResult Function(PostReaction reaction, List<PostReaction> latestReactions)?
        updateReaction,
    TResult Function(PostReaction reaction, List<PostReaction> latestReactions)?
        unReactToPost,
    TResult Function(String postId)? sharePost,
    TResult Function(SavedPostDTO savedPost)? savePost,
    TResult Function(String userId, String postId)? unSavePost,
    TResult Function(String postId, String userId)? unLikePost,
    TResult Function(String postId)? deletePost,
    TResult Function(String postId)? getPost,
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
    required TResult Function(_CreateStatusPost value) createStatusPost,
    required TResult Function(_ReactPost value) reactToPost,
    required TResult Function(_UpdateReactPost value) updateReaction,
    required TResult Function(_UnReactPost value) unReactToPost,
    required TResult Function(_SharePost value) sharePost,
    required TResult Function(_SavePost value) savePost,
    required TResult Function(_UnSavePost value) unSavePost,
    required TResult Function(_UnLikePost value) unLikePost,
    required TResult Function(_DeletePost value) deletePost,
    required TResult Function(_GetPost value) getPost,
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
    TResult Function(_CreateStatusPost value)? createStatusPost,
    TResult Function(_ReactPost value)? reactToPost,
    TResult Function(_UpdateReactPost value)? updateReaction,
    TResult Function(_UnReactPost value)? unReactToPost,
    TResult Function(_SharePost value)? sharePost,
    TResult Function(_SavePost value)? savePost,
    TResult Function(_UnSavePost value)? unSavePost,
    TResult Function(_UnLikePost value)? unLikePost,
    TResult Function(_DeletePost value)? deletePost,
    TResult Function(_GetPost value)? getPost,
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
    TResult Function(_CreateStatusPost value)? createStatusPost,
    TResult Function(_ReactPost value)? reactToPost,
    TResult Function(_UpdateReactPost value)? updateReaction,
    TResult Function(_UnReactPost value)? unReactToPost,
    TResult Function(_SharePost value)? sharePost,
    TResult Function(_SavePost value)? savePost,
    TResult Function(_UnSavePost value)? unSavePost,
    TResult Function(_UnLikePost value)? unLikePost,
    TResult Function(_DeletePost value)? deletePost,
    TResult Function(_GetPost value)? getPost,
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
abstract class _$CreateStatusPostCopyWith<$Res> {
  factory _$CreateStatusPostCopyWith(
          _CreateStatusPost value, $Res Function(_CreateStatusPost) then) =
      __$CreateStatusPostCopyWithImpl<$Res>;
  $Res call({String status});
}

/// @nodoc
class __$CreateStatusPostCopyWithImpl<$Res>
    extends _$PostEventCopyWithImpl<$Res>
    implements _$CreateStatusPostCopyWith<$Res> {
  __$CreateStatusPostCopyWithImpl(
      _CreateStatusPost _value, $Res Function(_CreateStatusPost) _then)
      : super(_value, (v) => _then(v as _CreateStatusPost));

  @override
  _CreateStatusPost get _value => super._value as _CreateStatusPost;

  @override
  $Res call({
    Object? status = freezed,
  }) {
    return _then(_CreateStatusPost(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_CreateStatusPost implements _CreateStatusPost {
  const _$_CreateStatusPost({required this.status});

  @override
  final String status;

  @override
  String toString() {
    return 'PostEvent.createStatusPost(status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CreateStatusPost &&
            const DeepCollectionEquality().equals(other.status, status));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(status));

  @JsonKey(ignore: true)
  @override
  _$CreateStatusPostCopyWith<_CreateStatusPost> get copyWith =>
      __$CreateStatusPostCopyWithImpl<_CreateStatusPost>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool shouldLoad) fetchTimelinePosts,
    required TResult Function() fetchPaginatedTimelinePosts,
    required TResult Function(String caption, List<GalleryAsset> assets)
        createPost,
    required TResult Function(String status) createStatusPost,
    required TResult Function(Post post, UserModel user, PostReaction reaction,
            List<PostReaction> latestReactions)
        reactToPost,
    required TResult Function(
            PostReaction reaction, List<PostReaction> latestReactions)
        updateReaction,
    required TResult Function(
            PostReaction reaction, List<PostReaction> latestReactions)
        unReactToPost,
    required TResult Function(String postId) sharePost,
    required TResult Function(SavedPostDTO savedPost) savePost,
    required TResult Function(String userId, String postId) unSavePost,
    required TResult Function(String postId, String userId) unLikePost,
    required TResult Function(String postId) deletePost,
    required TResult Function(String postId) getPost,
  }) {
    return createStatusPost(status);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool shouldLoad)? fetchTimelinePosts,
    TResult Function()? fetchPaginatedTimelinePosts,
    TResult Function(String caption, List<GalleryAsset> assets)? createPost,
    TResult Function(String status)? createStatusPost,
    TResult Function(Post post, UserModel user, PostReaction reaction,
            List<PostReaction> latestReactions)?
        reactToPost,
    TResult Function(PostReaction reaction, List<PostReaction> latestReactions)?
        updateReaction,
    TResult Function(PostReaction reaction, List<PostReaction> latestReactions)?
        unReactToPost,
    TResult Function(String postId)? sharePost,
    TResult Function(SavedPostDTO savedPost)? savePost,
    TResult Function(String userId, String postId)? unSavePost,
    TResult Function(String postId, String userId)? unLikePost,
    TResult Function(String postId)? deletePost,
    TResult Function(String postId)? getPost,
  }) {
    return createStatusPost?.call(status);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool shouldLoad)? fetchTimelinePosts,
    TResult Function()? fetchPaginatedTimelinePosts,
    TResult Function(String caption, List<GalleryAsset> assets)? createPost,
    TResult Function(String status)? createStatusPost,
    TResult Function(Post post, UserModel user, PostReaction reaction,
            List<PostReaction> latestReactions)?
        reactToPost,
    TResult Function(PostReaction reaction, List<PostReaction> latestReactions)?
        updateReaction,
    TResult Function(PostReaction reaction, List<PostReaction> latestReactions)?
        unReactToPost,
    TResult Function(String postId)? sharePost,
    TResult Function(SavedPostDTO savedPost)? savePost,
    TResult Function(String userId, String postId)? unSavePost,
    TResult Function(String postId, String userId)? unLikePost,
    TResult Function(String postId)? deletePost,
    TResult Function(String postId)? getPost,
    required TResult orElse(),
  }) {
    if (createStatusPost != null) {
      return createStatusPost(status);
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
    required TResult Function(_CreateStatusPost value) createStatusPost,
    required TResult Function(_ReactPost value) reactToPost,
    required TResult Function(_UpdateReactPost value) updateReaction,
    required TResult Function(_UnReactPost value) unReactToPost,
    required TResult Function(_SharePost value) sharePost,
    required TResult Function(_SavePost value) savePost,
    required TResult Function(_UnSavePost value) unSavePost,
    required TResult Function(_UnLikePost value) unLikePost,
    required TResult Function(_DeletePost value) deletePost,
    required TResult Function(_GetPost value) getPost,
  }) {
    return createStatusPost(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_FetchTimelinePosts value)? fetchTimelinePosts,
    TResult Function(_FetchTimelinePaginatedPosts value)?
        fetchPaginatedTimelinePosts,
    TResult Function(_CreatePost value)? createPost,
    TResult Function(_CreateStatusPost value)? createStatusPost,
    TResult Function(_ReactPost value)? reactToPost,
    TResult Function(_UpdateReactPost value)? updateReaction,
    TResult Function(_UnReactPost value)? unReactToPost,
    TResult Function(_SharePost value)? sharePost,
    TResult Function(_SavePost value)? savePost,
    TResult Function(_UnSavePost value)? unSavePost,
    TResult Function(_UnLikePost value)? unLikePost,
    TResult Function(_DeletePost value)? deletePost,
    TResult Function(_GetPost value)? getPost,
  }) {
    return createStatusPost?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchTimelinePosts value)? fetchTimelinePosts,
    TResult Function(_FetchTimelinePaginatedPosts value)?
        fetchPaginatedTimelinePosts,
    TResult Function(_CreatePost value)? createPost,
    TResult Function(_CreateStatusPost value)? createStatusPost,
    TResult Function(_ReactPost value)? reactToPost,
    TResult Function(_UpdateReactPost value)? updateReaction,
    TResult Function(_UnReactPost value)? unReactToPost,
    TResult Function(_SharePost value)? sharePost,
    TResult Function(_SavePost value)? savePost,
    TResult Function(_UnSavePost value)? unSavePost,
    TResult Function(_UnLikePost value)? unLikePost,
    TResult Function(_DeletePost value)? deletePost,
    TResult Function(_GetPost value)? getPost,
    required TResult orElse(),
  }) {
    if (createStatusPost != null) {
      return createStatusPost(this);
    }
    return orElse();
  }
}

abstract class _CreateStatusPost implements PostEvent {
  const factory _CreateStatusPost({required String status}) =
      _$_CreateStatusPost;

  String get status;
  @JsonKey(ignore: true)
  _$CreateStatusPostCopyWith<_CreateStatusPost> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$ReactPostCopyWith<$Res> {
  factory _$ReactPostCopyWith(
          _ReactPost value, $Res Function(_ReactPost) then) =
      __$ReactPostCopyWithImpl<$Res>;
  $Res call(
      {Post post,
      UserModel user,
      PostReaction reaction,
      List<PostReaction> latestReactions});

  $PostCopyWith<$Res> get post;
  $UserModelCopyWith<$Res> get user;
  $PostReactionCopyWith<$Res> get reaction;
}

/// @nodoc
class __$ReactPostCopyWithImpl<$Res> extends _$PostEventCopyWithImpl<$Res>
    implements _$ReactPostCopyWith<$Res> {
  __$ReactPostCopyWithImpl(_ReactPost _value, $Res Function(_ReactPost) _then)
      : super(_value, (v) => _then(v as _ReactPost));

  @override
  _ReactPost get _value => super._value as _ReactPost;

  @override
  $Res call({
    Object? post = freezed,
    Object? user = freezed,
    Object? reaction = freezed,
    Object? latestReactions = freezed,
  }) {
    return _then(_ReactPost(
      post: post == freezed
          ? _value.post
          : post // ignore: cast_nullable_to_non_nullable
              as Post,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel,
      reaction: reaction == freezed
          ? _value.reaction
          : reaction // ignore: cast_nullable_to_non_nullable
              as PostReaction,
      latestReactions: latestReactions == freezed
          ? _value.latestReactions
          : latestReactions // ignore: cast_nullable_to_non_nullable
              as List<PostReaction>,
    ));
  }

  @override
  $PostCopyWith<$Res> get post {
    return $PostCopyWith<$Res>(_value.post, (value) {
      return _then(_value.copyWith(post: value));
    });
  }

  @override
  $UserModelCopyWith<$Res> get user {
    return $UserModelCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }

  @override
  $PostReactionCopyWith<$Res> get reaction {
    return $PostReactionCopyWith<$Res>(_value.reaction, (value) {
      return _then(_value.copyWith(reaction: value));
    });
  }
}

/// @nodoc

class _$_ReactPost implements _ReactPost {
  const _$_ReactPost(
      {required this.post,
      required this.user,
      required this.reaction,
      required this.latestReactions});

  @override
  final Post post;
  @override
  final UserModel user;
  @override
  final PostReaction reaction;
  @override
  final List<PostReaction> latestReactions;

  @override
  String toString() {
    return 'PostEvent.reactToPost(post: $post, user: $user, reaction: $reaction, latestReactions: $latestReactions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ReactPost &&
            const DeepCollectionEquality().equals(other.post, post) &&
            const DeepCollectionEquality().equals(other.user, user) &&
            const DeepCollectionEquality().equals(other.reaction, reaction) &&
            const DeepCollectionEquality()
                .equals(other.latestReactions, latestReactions));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(post),
      const DeepCollectionEquality().hash(user),
      const DeepCollectionEquality().hash(reaction),
      const DeepCollectionEquality().hash(latestReactions));

  @JsonKey(ignore: true)
  @override
  _$ReactPostCopyWith<_ReactPost> get copyWith =>
      __$ReactPostCopyWithImpl<_ReactPost>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool shouldLoad) fetchTimelinePosts,
    required TResult Function() fetchPaginatedTimelinePosts,
    required TResult Function(String caption, List<GalleryAsset> assets)
        createPost,
    required TResult Function(String status) createStatusPost,
    required TResult Function(Post post, UserModel user, PostReaction reaction,
            List<PostReaction> latestReactions)
        reactToPost,
    required TResult Function(
            PostReaction reaction, List<PostReaction> latestReactions)
        updateReaction,
    required TResult Function(
            PostReaction reaction, List<PostReaction> latestReactions)
        unReactToPost,
    required TResult Function(String postId) sharePost,
    required TResult Function(SavedPostDTO savedPost) savePost,
    required TResult Function(String userId, String postId) unSavePost,
    required TResult Function(String postId, String userId) unLikePost,
    required TResult Function(String postId) deletePost,
    required TResult Function(String postId) getPost,
  }) {
    return reactToPost(post, user, reaction, latestReactions);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool shouldLoad)? fetchTimelinePosts,
    TResult Function()? fetchPaginatedTimelinePosts,
    TResult Function(String caption, List<GalleryAsset> assets)? createPost,
    TResult Function(String status)? createStatusPost,
    TResult Function(Post post, UserModel user, PostReaction reaction,
            List<PostReaction> latestReactions)?
        reactToPost,
    TResult Function(PostReaction reaction, List<PostReaction> latestReactions)?
        updateReaction,
    TResult Function(PostReaction reaction, List<PostReaction> latestReactions)?
        unReactToPost,
    TResult Function(String postId)? sharePost,
    TResult Function(SavedPostDTO savedPost)? savePost,
    TResult Function(String userId, String postId)? unSavePost,
    TResult Function(String postId, String userId)? unLikePost,
    TResult Function(String postId)? deletePost,
    TResult Function(String postId)? getPost,
  }) {
    return reactToPost?.call(post, user, reaction, latestReactions);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool shouldLoad)? fetchTimelinePosts,
    TResult Function()? fetchPaginatedTimelinePosts,
    TResult Function(String caption, List<GalleryAsset> assets)? createPost,
    TResult Function(String status)? createStatusPost,
    TResult Function(Post post, UserModel user, PostReaction reaction,
            List<PostReaction> latestReactions)?
        reactToPost,
    TResult Function(PostReaction reaction, List<PostReaction> latestReactions)?
        updateReaction,
    TResult Function(PostReaction reaction, List<PostReaction> latestReactions)?
        unReactToPost,
    TResult Function(String postId)? sharePost,
    TResult Function(SavedPostDTO savedPost)? savePost,
    TResult Function(String userId, String postId)? unSavePost,
    TResult Function(String postId, String userId)? unLikePost,
    TResult Function(String postId)? deletePost,
    TResult Function(String postId)? getPost,
    required TResult orElse(),
  }) {
    if (reactToPost != null) {
      return reactToPost(post, user, reaction, latestReactions);
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
    required TResult Function(_CreateStatusPost value) createStatusPost,
    required TResult Function(_ReactPost value) reactToPost,
    required TResult Function(_UpdateReactPost value) updateReaction,
    required TResult Function(_UnReactPost value) unReactToPost,
    required TResult Function(_SharePost value) sharePost,
    required TResult Function(_SavePost value) savePost,
    required TResult Function(_UnSavePost value) unSavePost,
    required TResult Function(_UnLikePost value) unLikePost,
    required TResult Function(_DeletePost value) deletePost,
    required TResult Function(_GetPost value) getPost,
  }) {
    return reactToPost(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_FetchTimelinePosts value)? fetchTimelinePosts,
    TResult Function(_FetchTimelinePaginatedPosts value)?
        fetchPaginatedTimelinePosts,
    TResult Function(_CreatePost value)? createPost,
    TResult Function(_CreateStatusPost value)? createStatusPost,
    TResult Function(_ReactPost value)? reactToPost,
    TResult Function(_UpdateReactPost value)? updateReaction,
    TResult Function(_UnReactPost value)? unReactToPost,
    TResult Function(_SharePost value)? sharePost,
    TResult Function(_SavePost value)? savePost,
    TResult Function(_UnSavePost value)? unSavePost,
    TResult Function(_UnLikePost value)? unLikePost,
    TResult Function(_DeletePost value)? deletePost,
    TResult Function(_GetPost value)? getPost,
  }) {
    return reactToPost?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchTimelinePosts value)? fetchTimelinePosts,
    TResult Function(_FetchTimelinePaginatedPosts value)?
        fetchPaginatedTimelinePosts,
    TResult Function(_CreatePost value)? createPost,
    TResult Function(_CreateStatusPost value)? createStatusPost,
    TResult Function(_ReactPost value)? reactToPost,
    TResult Function(_UpdateReactPost value)? updateReaction,
    TResult Function(_UnReactPost value)? unReactToPost,
    TResult Function(_SharePost value)? sharePost,
    TResult Function(_SavePost value)? savePost,
    TResult Function(_UnSavePost value)? unSavePost,
    TResult Function(_UnLikePost value)? unLikePost,
    TResult Function(_DeletePost value)? deletePost,
    TResult Function(_GetPost value)? getPost,
    required TResult orElse(),
  }) {
    if (reactToPost != null) {
      return reactToPost(this);
    }
    return orElse();
  }
}

abstract class _ReactPost implements PostEvent {
  const factory _ReactPost(
      {required Post post,
      required UserModel user,
      required PostReaction reaction,
      required List<PostReaction> latestReactions}) = _$_ReactPost;

  Post get post;
  UserModel get user;
  PostReaction get reaction;
  List<PostReaction> get latestReactions;
  @JsonKey(ignore: true)
  _$ReactPostCopyWith<_ReactPost> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$UpdateReactPostCopyWith<$Res> {
  factory _$UpdateReactPostCopyWith(
          _UpdateReactPost value, $Res Function(_UpdateReactPost) then) =
      __$UpdateReactPostCopyWithImpl<$Res>;
  $Res call({PostReaction reaction, List<PostReaction> latestReactions});

  $PostReactionCopyWith<$Res> get reaction;
}

/// @nodoc
class __$UpdateReactPostCopyWithImpl<$Res> extends _$PostEventCopyWithImpl<$Res>
    implements _$UpdateReactPostCopyWith<$Res> {
  __$UpdateReactPostCopyWithImpl(
      _UpdateReactPost _value, $Res Function(_UpdateReactPost) _then)
      : super(_value, (v) => _then(v as _UpdateReactPost));

  @override
  _UpdateReactPost get _value => super._value as _UpdateReactPost;

  @override
  $Res call({
    Object? reaction = freezed,
    Object? latestReactions = freezed,
  }) {
    return _then(_UpdateReactPost(
      reaction: reaction == freezed
          ? _value.reaction
          : reaction // ignore: cast_nullable_to_non_nullable
              as PostReaction,
      latestReactions: latestReactions == freezed
          ? _value.latestReactions
          : latestReactions // ignore: cast_nullable_to_non_nullable
              as List<PostReaction>,
    ));
  }

  @override
  $PostReactionCopyWith<$Res> get reaction {
    return $PostReactionCopyWith<$Res>(_value.reaction, (value) {
      return _then(_value.copyWith(reaction: value));
    });
  }
}

/// @nodoc

class _$_UpdateReactPost implements _UpdateReactPost {
  const _$_UpdateReactPost(
      {required this.reaction, required this.latestReactions});

  @override
  final PostReaction reaction;
  @override
  final List<PostReaction> latestReactions;

  @override
  String toString() {
    return 'PostEvent.updateReaction(reaction: $reaction, latestReactions: $latestReactions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UpdateReactPost &&
            const DeepCollectionEquality().equals(other.reaction, reaction) &&
            const DeepCollectionEquality()
                .equals(other.latestReactions, latestReactions));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(reaction),
      const DeepCollectionEquality().hash(latestReactions));

  @JsonKey(ignore: true)
  @override
  _$UpdateReactPostCopyWith<_UpdateReactPost> get copyWith =>
      __$UpdateReactPostCopyWithImpl<_UpdateReactPost>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool shouldLoad) fetchTimelinePosts,
    required TResult Function() fetchPaginatedTimelinePosts,
    required TResult Function(String caption, List<GalleryAsset> assets)
        createPost,
    required TResult Function(String status) createStatusPost,
    required TResult Function(Post post, UserModel user, PostReaction reaction,
            List<PostReaction> latestReactions)
        reactToPost,
    required TResult Function(
            PostReaction reaction, List<PostReaction> latestReactions)
        updateReaction,
    required TResult Function(
            PostReaction reaction, List<PostReaction> latestReactions)
        unReactToPost,
    required TResult Function(String postId) sharePost,
    required TResult Function(SavedPostDTO savedPost) savePost,
    required TResult Function(String userId, String postId) unSavePost,
    required TResult Function(String postId, String userId) unLikePost,
    required TResult Function(String postId) deletePost,
    required TResult Function(String postId) getPost,
  }) {
    return updateReaction(reaction, latestReactions);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool shouldLoad)? fetchTimelinePosts,
    TResult Function()? fetchPaginatedTimelinePosts,
    TResult Function(String caption, List<GalleryAsset> assets)? createPost,
    TResult Function(String status)? createStatusPost,
    TResult Function(Post post, UserModel user, PostReaction reaction,
            List<PostReaction> latestReactions)?
        reactToPost,
    TResult Function(PostReaction reaction, List<PostReaction> latestReactions)?
        updateReaction,
    TResult Function(PostReaction reaction, List<PostReaction> latestReactions)?
        unReactToPost,
    TResult Function(String postId)? sharePost,
    TResult Function(SavedPostDTO savedPost)? savePost,
    TResult Function(String userId, String postId)? unSavePost,
    TResult Function(String postId, String userId)? unLikePost,
    TResult Function(String postId)? deletePost,
    TResult Function(String postId)? getPost,
  }) {
    return updateReaction?.call(reaction, latestReactions);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool shouldLoad)? fetchTimelinePosts,
    TResult Function()? fetchPaginatedTimelinePosts,
    TResult Function(String caption, List<GalleryAsset> assets)? createPost,
    TResult Function(String status)? createStatusPost,
    TResult Function(Post post, UserModel user, PostReaction reaction,
            List<PostReaction> latestReactions)?
        reactToPost,
    TResult Function(PostReaction reaction, List<PostReaction> latestReactions)?
        updateReaction,
    TResult Function(PostReaction reaction, List<PostReaction> latestReactions)?
        unReactToPost,
    TResult Function(String postId)? sharePost,
    TResult Function(SavedPostDTO savedPost)? savePost,
    TResult Function(String userId, String postId)? unSavePost,
    TResult Function(String postId, String userId)? unLikePost,
    TResult Function(String postId)? deletePost,
    TResult Function(String postId)? getPost,
    required TResult orElse(),
  }) {
    if (updateReaction != null) {
      return updateReaction(reaction, latestReactions);
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
    required TResult Function(_CreateStatusPost value) createStatusPost,
    required TResult Function(_ReactPost value) reactToPost,
    required TResult Function(_UpdateReactPost value) updateReaction,
    required TResult Function(_UnReactPost value) unReactToPost,
    required TResult Function(_SharePost value) sharePost,
    required TResult Function(_SavePost value) savePost,
    required TResult Function(_UnSavePost value) unSavePost,
    required TResult Function(_UnLikePost value) unLikePost,
    required TResult Function(_DeletePost value) deletePost,
    required TResult Function(_GetPost value) getPost,
  }) {
    return updateReaction(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_FetchTimelinePosts value)? fetchTimelinePosts,
    TResult Function(_FetchTimelinePaginatedPosts value)?
        fetchPaginatedTimelinePosts,
    TResult Function(_CreatePost value)? createPost,
    TResult Function(_CreateStatusPost value)? createStatusPost,
    TResult Function(_ReactPost value)? reactToPost,
    TResult Function(_UpdateReactPost value)? updateReaction,
    TResult Function(_UnReactPost value)? unReactToPost,
    TResult Function(_SharePost value)? sharePost,
    TResult Function(_SavePost value)? savePost,
    TResult Function(_UnSavePost value)? unSavePost,
    TResult Function(_UnLikePost value)? unLikePost,
    TResult Function(_DeletePost value)? deletePost,
    TResult Function(_GetPost value)? getPost,
  }) {
    return updateReaction?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchTimelinePosts value)? fetchTimelinePosts,
    TResult Function(_FetchTimelinePaginatedPosts value)?
        fetchPaginatedTimelinePosts,
    TResult Function(_CreatePost value)? createPost,
    TResult Function(_CreateStatusPost value)? createStatusPost,
    TResult Function(_ReactPost value)? reactToPost,
    TResult Function(_UpdateReactPost value)? updateReaction,
    TResult Function(_UnReactPost value)? unReactToPost,
    TResult Function(_SharePost value)? sharePost,
    TResult Function(_SavePost value)? savePost,
    TResult Function(_UnSavePost value)? unSavePost,
    TResult Function(_UnLikePost value)? unLikePost,
    TResult Function(_DeletePost value)? deletePost,
    TResult Function(_GetPost value)? getPost,
    required TResult orElse(),
  }) {
    if (updateReaction != null) {
      return updateReaction(this);
    }
    return orElse();
  }
}

abstract class _UpdateReactPost implements PostEvent {
  const factory _UpdateReactPost(
      {required PostReaction reaction,
      required List<PostReaction> latestReactions}) = _$_UpdateReactPost;

  PostReaction get reaction;
  List<PostReaction> get latestReactions;
  @JsonKey(ignore: true)
  _$UpdateReactPostCopyWith<_UpdateReactPost> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$UnReactPostCopyWith<$Res> {
  factory _$UnReactPostCopyWith(
          _UnReactPost value, $Res Function(_UnReactPost) then) =
      __$UnReactPostCopyWithImpl<$Res>;
  $Res call({PostReaction reaction, List<PostReaction> latestReactions});

  $PostReactionCopyWith<$Res> get reaction;
}

/// @nodoc
class __$UnReactPostCopyWithImpl<$Res> extends _$PostEventCopyWithImpl<$Res>
    implements _$UnReactPostCopyWith<$Res> {
  __$UnReactPostCopyWithImpl(
      _UnReactPost _value, $Res Function(_UnReactPost) _then)
      : super(_value, (v) => _then(v as _UnReactPost));

  @override
  _UnReactPost get _value => super._value as _UnReactPost;

  @override
  $Res call({
    Object? reaction = freezed,
    Object? latestReactions = freezed,
  }) {
    return _then(_UnReactPost(
      reaction: reaction == freezed
          ? _value.reaction
          : reaction // ignore: cast_nullable_to_non_nullable
              as PostReaction,
      latestReactions: latestReactions == freezed
          ? _value.latestReactions
          : latestReactions // ignore: cast_nullable_to_non_nullable
              as List<PostReaction>,
    ));
  }

  @override
  $PostReactionCopyWith<$Res> get reaction {
    return $PostReactionCopyWith<$Res>(_value.reaction, (value) {
      return _then(_value.copyWith(reaction: value));
    });
  }
}

/// @nodoc

class _$_UnReactPost implements _UnReactPost {
  const _$_UnReactPost({required this.reaction, required this.latestReactions});

  @override
  final PostReaction reaction;
  @override
  final List<PostReaction> latestReactions;

  @override
  String toString() {
    return 'PostEvent.unReactToPost(reaction: $reaction, latestReactions: $latestReactions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UnReactPost &&
            const DeepCollectionEquality().equals(other.reaction, reaction) &&
            const DeepCollectionEquality()
                .equals(other.latestReactions, latestReactions));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(reaction),
      const DeepCollectionEquality().hash(latestReactions));

  @JsonKey(ignore: true)
  @override
  _$UnReactPostCopyWith<_UnReactPost> get copyWith =>
      __$UnReactPostCopyWithImpl<_UnReactPost>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool shouldLoad) fetchTimelinePosts,
    required TResult Function() fetchPaginatedTimelinePosts,
    required TResult Function(String caption, List<GalleryAsset> assets)
        createPost,
    required TResult Function(String status) createStatusPost,
    required TResult Function(Post post, UserModel user, PostReaction reaction,
            List<PostReaction> latestReactions)
        reactToPost,
    required TResult Function(
            PostReaction reaction, List<PostReaction> latestReactions)
        updateReaction,
    required TResult Function(
            PostReaction reaction, List<PostReaction> latestReactions)
        unReactToPost,
    required TResult Function(String postId) sharePost,
    required TResult Function(SavedPostDTO savedPost) savePost,
    required TResult Function(String userId, String postId) unSavePost,
    required TResult Function(String postId, String userId) unLikePost,
    required TResult Function(String postId) deletePost,
    required TResult Function(String postId) getPost,
  }) {
    return unReactToPost(reaction, latestReactions);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool shouldLoad)? fetchTimelinePosts,
    TResult Function()? fetchPaginatedTimelinePosts,
    TResult Function(String caption, List<GalleryAsset> assets)? createPost,
    TResult Function(String status)? createStatusPost,
    TResult Function(Post post, UserModel user, PostReaction reaction,
            List<PostReaction> latestReactions)?
        reactToPost,
    TResult Function(PostReaction reaction, List<PostReaction> latestReactions)?
        updateReaction,
    TResult Function(PostReaction reaction, List<PostReaction> latestReactions)?
        unReactToPost,
    TResult Function(String postId)? sharePost,
    TResult Function(SavedPostDTO savedPost)? savePost,
    TResult Function(String userId, String postId)? unSavePost,
    TResult Function(String postId, String userId)? unLikePost,
    TResult Function(String postId)? deletePost,
    TResult Function(String postId)? getPost,
  }) {
    return unReactToPost?.call(reaction, latestReactions);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool shouldLoad)? fetchTimelinePosts,
    TResult Function()? fetchPaginatedTimelinePosts,
    TResult Function(String caption, List<GalleryAsset> assets)? createPost,
    TResult Function(String status)? createStatusPost,
    TResult Function(Post post, UserModel user, PostReaction reaction,
            List<PostReaction> latestReactions)?
        reactToPost,
    TResult Function(PostReaction reaction, List<PostReaction> latestReactions)?
        updateReaction,
    TResult Function(PostReaction reaction, List<PostReaction> latestReactions)?
        unReactToPost,
    TResult Function(String postId)? sharePost,
    TResult Function(SavedPostDTO savedPost)? savePost,
    TResult Function(String userId, String postId)? unSavePost,
    TResult Function(String postId, String userId)? unLikePost,
    TResult Function(String postId)? deletePost,
    TResult Function(String postId)? getPost,
    required TResult orElse(),
  }) {
    if (unReactToPost != null) {
      return unReactToPost(reaction, latestReactions);
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
    required TResult Function(_CreateStatusPost value) createStatusPost,
    required TResult Function(_ReactPost value) reactToPost,
    required TResult Function(_UpdateReactPost value) updateReaction,
    required TResult Function(_UnReactPost value) unReactToPost,
    required TResult Function(_SharePost value) sharePost,
    required TResult Function(_SavePost value) savePost,
    required TResult Function(_UnSavePost value) unSavePost,
    required TResult Function(_UnLikePost value) unLikePost,
    required TResult Function(_DeletePost value) deletePost,
    required TResult Function(_GetPost value) getPost,
  }) {
    return unReactToPost(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_FetchTimelinePosts value)? fetchTimelinePosts,
    TResult Function(_FetchTimelinePaginatedPosts value)?
        fetchPaginatedTimelinePosts,
    TResult Function(_CreatePost value)? createPost,
    TResult Function(_CreateStatusPost value)? createStatusPost,
    TResult Function(_ReactPost value)? reactToPost,
    TResult Function(_UpdateReactPost value)? updateReaction,
    TResult Function(_UnReactPost value)? unReactToPost,
    TResult Function(_SharePost value)? sharePost,
    TResult Function(_SavePost value)? savePost,
    TResult Function(_UnSavePost value)? unSavePost,
    TResult Function(_UnLikePost value)? unLikePost,
    TResult Function(_DeletePost value)? deletePost,
    TResult Function(_GetPost value)? getPost,
  }) {
    return unReactToPost?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchTimelinePosts value)? fetchTimelinePosts,
    TResult Function(_FetchTimelinePaginatedPosts value)?
        fetchPaginatedTimelinePosts,
    TResult Function(_CreatePost value)? createPost,
    TResult Function(_CreateStatusPost value)? createStatusPost,
    TResult Function(_ReactPost value)? reactToPost,
    TResult Function(_UpdateReactPost value)? updateReaction,
    TResult Function(_UnReactPost value)? unReactToPost,
    TResult Function(_SharePost value)? sharePost,
    TResult Function(_SavePost value)? savePost,
    TResult Function(_UnSavePost value)? unSavePost,
    TResult Function(_UnLikePost value)? unLikePost,
    TResult Function(_DeletePost value)? deletePost,
    TResult Function(_GetPost value)? getPost,
    required TResult orElse(),
  }) {
    if (unReactToPost != null) {
      return unReactToPost(this);
    }
    return orElse();
  }
}

abstract class _UnReactPost implements PostEvent {
  const factory _UnReactPost(
      {required PostReaction reaction,
      required List<PostReaction> latestReactions}) = _$_UnReactPost;

  PostReaction get reaction;
  List<PostReaction> get latestReactions;
  @JsonKey(ignore: true)
  _$UnReactPostCopyWith<_UnReactPost> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$SharePostCopyWith<$Res> {
  factory _$SharePostCopyWith(
          _SharePost value, $Res Function(_SharePost) then) =
      __$SharePostCopyWithImpl<$Res>;
  $Res call({String postId});
}

/// @nodoc
class __$SharePostCopyWithImpl<$Res> extends _$PostEventCopyWithImpl<$Res>
    implements _$SharePostCopyWith<$Res> {
  __$SharePostCopyWithImpl(_SharePost _value, $Res Function(_SharePost) _then)
      : super(_value, (v) => _then(v as _SharePost));

  @override
  _SharePost get _value => super._value as _SharePost;

  @override
  $Res call({
    Object? postId = freezed,
  }) {
    return _then(_SharePost(
      postId: postId == freezed
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_SharePost implements _SharePost {
  const _$_SharePost({required this.postId});

  @override
  final String postId;

  @override
  String toString() {
    return 'PostEvent.sharePost(postId: $postId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SharePost &&
            const DeepCollectionEquality().equals(other.postId, postId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(postId));

  @JsonKey(ignore: true)
  @override
  _$SharePostCopyWith<_SharePost> get copyWith =>
      __$SharePostCopyWithImpl<_SharePost>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool shouldLoad) fetchTimelinePosts,
    required TResult Function() fetchPaginatedTimelinePosts,
    required TResult Function(String caption, List<GalleryAsset> assets)
        createPost,
    required TResult Function(String status) createStatusPost,
    required TResult Function(Post post, UserModel user, PostReaction reaction,
            List<PostReaction> latestReactions)
        reactToPost,
    required TResult Function(
            PostReaction reaction, List<PostReaction> latestReactions)
        updateReaction,
    required TResult Function(
            PostReaction reaction, List<PostReaction> latestReactions)
        unReactToPost,
    required TResult Function(String postId) sharePost,
    required TResult Function(SavedPostDTO savedPost) savePost,
    required TResult Function(String userId, String postId) unSavePost,
    required TResult Function(String postId, String userId) unLikePost,
    required TResult Function(String postId) deletePost,
    required TResult Function(String postId) getPost,
  }) {
    return sharePost(postId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool shouldLoad)? fetchTimelinePosts,
    TResult Function()? fetchPaginatedTimelinePosts,
    TResult Function(String caption, List<GalleryAsset> assets)? createPost,
    TResult Function(String status)? createStatusPost,
    TResult Function(Post post, UserModel user, PostReaction reaction,
            List<PostReaction> latestReactions)?
        reactToPost,
    TResult Function(PostReaction reaction, List<PostReaction> latestReactions)?
        updateReaction,
    TResult Function(PostReaction reaction, List<PostReaction> latestReactions)?
        unReactToPost,
    TResult Function(String postId)? sharePost,
    TResult Function(SavedPostDTO savedPost)? savePost,
    TResult Function(String userId, String postId)? unSavePost,
    TResult Function(String postId, String userId)? unLikePost,
    TResult Function(String postId)? deletePost,
    TResult Function(String postId)? getPost,
  }) {
    return sharePost?.call(postId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool shouldLoad)? fetchTimelinePosts,
    TResult Function()? fetchPaginatedTimelinePosts,
    TResult Function(String caption, List<GalleryAsset> assets)? createPost,
    TResult Function(String status)? createStatusPost,
    TResult Function(Post post, UserModel user, PostReaction reaction,
            List<PostReaction> latestReactions)?
        reactToPost,
    TResult Function(PostReaction reaction, List<PostReaction> latestReactions)?
        updateReaction,
    TResult Function(PostReaction reaction, List<PostReaction> latestReactions)?
        unReactToPost,
    TResult Function(String postId)? sharePost,
    TResult Function(SavedPostDTO savedPost)? savePost,
    TResult Function(String userId, String postId)? unSavePost,
    TResult Function(String postId, String userId)? unLikePost,
    TResult Function(String postId)? deletePost,
    TResult Function(String postId)? getPost,
    required TResult orElse(),
  }) {
    if (sharePost != null) {
      return sharePost(postId);
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
    required TResult Function(_CreateStatusPost value) createStatusPost,
    required TResult Function(_ReactPost value) reactToPost,
    required TResult Function(_UpdateReactPost value) updateReaction,
    required TResult Function(_UnReactPost value) unReactToPost,
    required TResult Function(_SharePost value) sharePost,
    required TResult Function(_SavePost value) savePost,
    required TResult Function(_UnSavePost value) unSavePost,
    required TResult Function(_UnLikePost value) unLikePost,
    required TResult Function(_DeletePost value) deletePost,
    required TResult Function(_GetPost value) getPost,
  }) {
    return sharePost(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_FetchTimelinePosts value)? fetchTimelinePosts,
    TResult Function(_FetchTimelinePaginatedPosts value)?
        fetchPaginatedTimelinePosts,
    TResult Function(_CreatePost value)? createPost,
    TResult Function(_CreateStatusPost value)? createStatusPost,
    TResult Function(_ReactPost value)? reactToPost,
    TResult Function(_UpdateReactPost value)? updateReaction,
    TResult Function(_UnReactPost value)? unReactToPost,
    TResult Function(_SharePost value)? sharePost,
    TResult Function(_SavePost value)? savePost,
    TResult Function(_UnSavePost value)? unSavePost,
    TResult Function(_UnLikePost value)? unLikePost,
    TResult Function(_DeletePost value)? deletePost,
    TResult Function(_GetPost value)? getPost,
  }) {
    return sharePost?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchTimelinePosts value)? fetchTimelinePosts,
    TResult Function(_FetchTimelinePaginatedPosts value)?
        fetchPaginatedTimelinePosts,
    TResult Function(_CreatePost value)? createPost,
    TResult Function(_CreateStatusPost value)? createStatusPost,
    TResult Function(_ReactPost value)? reactToPost,
    TResult Function(_UpdateReactPost value)? updateReaction,
    TResult Function(_UnReactPost value)? unReactToPost,
    TResult Function(_SharePost value)? sharePost,
    TResult Function(_SavePost value)? savePost,
    TResult Function(_UnSavePost value)? unSavePost,
    TResult Function(_UnLikePost value)? unLikePost,
    TResult Function(_DeletePost value)? deletePost,
    TResult Function(_GetPost value)? getPost,
    required TResult orElse(),
  }) {
    if (sharePost != null) {
      return sharePost(this);
    }
    return orElse();
  }
}

abstract class _SharePost implements PostEvent {
  const factory _SharePost({required String postId}) = _$_SharePost;

  String get postId;
  @JsonKey(ignore: true)
  _$SharePostCopyWith<_SharePost> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$SavePostCopyWith<$Res> {
  factory _$SavePostCopyWith(_SavePost value, $Res Function(_SavePost) then) =
      __$SavePostCopyWithImpl<$Res>;
  $Res call({SavedPostDTO savedPost});
}

/// @nodoc
class __$SavePostCopyWithImpl<$Res> extends _$PostEventCopyWithImpl<$Res>
    implements _$SavePostCopyWith<$Res> {
  __$SavePostCopyWithImpl(_SavePost _value, $Res Function(_SavePost) _then)
      : super(_value, (v) => _then(v as _SavePost));

  @override
  _SavePost get _value => super._value as _SavePost;

  @override
  $Res call({
    Object? savedPost = freezed,
  }) {
    return _then(_SavePost(
      savedPost: savedPost == freezed
          ? _value.savedPost
          : savedPost // ignore: cast_nullable_to_non_nullable
              as SavedPostDTO,
    ));
  }
}

/// @nodoc

class _$_SavePost implements _SavePost {
  const _$_SavePost({required this.savedPost});

  @override
  final SavedPostDTO savedPost;

  @override
  String toString() {
    return 'PostEvent.savePost(savedPost: $savedPost)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SavePost &&
            const DeepCollectionEquality().equals(other.savedPost, savedPost));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(savedPost));

  @JsonKey(ignore: true)
  @override
  _$SavePostCopyWith<_SavePost> get copyWith =>
      __$SavePostCopyWithImpl<_SavePost>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool shouldLoad) fetchTimelinePosts,
    required TResult Function() fetchPaginatedTimelinePosts,
    required TResult Function(String caption, List<GalleryAsset> assets)
        createPost,
    required TResult Function(String status) createStatusPost,
    required TResult Function(Post post, UserModel user, PostReaction reaction,
            List<PostReaction> latestReactions)
        reactToPost,
    required TResult Function(
            PostReaction reaction, List<PostReaction> latestReactions)
        updateReaction,
    required TResult Function(
            PostReaction reaction, List<PostReaction> latestReactions)
        unReactToPost,
    required TResult Function(String postId) sharePost,
    required TResult Function(SavedPostDTO savedPost) savePost,
    required TResult Function(String userId, String postId) unSavePost,
    required TResult Function(String postId, String userId) unLikePost,
    required TResult Function(String postId) deletePost,
    required TResult Function(String postId) getPost,
  }) {
    return savePost(savedPost);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool shouldLoad)? fetchTimelinePosts,
    TResult Function()? fetchPaginatedTimelinePosts,
    TResult Function(String caption, List<GalleryAsset> assets)? createPost,
    TResult Function(String status)? createStatusPost,
    TResult Function(Post post, UserModel user, PostReaction reaction,
            List<PostReaction> latestReactions)?
        reactToPost,
    TResult Function(PostReaction reaction, List<PostReaction> latestReactions)?
        updateReaction,
    TResult Function(PostReaction reaction, List<PostReaction> latestReactions)?
        unReactToPost,
    TResult Function(String postId)? sharePost,
    TResult Function(SavedPostDTO savedPost)? savePost,
    TResult Function(String userId, String postId)? unSavePost,
    TResult Function(String postId, String userId)? unLikePost,
    TResult Function(String postId)? deletePost,
    TResult Function(String postId)? getPost,
  }) {
    return savePost?.call(savedPost);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool shouldLoad)? fetchTimelinePosts,
    TResult Function()? fetchPaginatedTimelinePosts,
    TResult Function(String caption, List<GalleryAsset> assets)? createPost,
    TResult Function(String status)? createStatusPost,
    TResult Function(Post post, UserModel user, PostReaction reaction,
            List<PostReaction> latestReactions)?
        reactToPost,
    TResult Function(PostReaction reaction, List<PostReaction> latestReactions)?
        updateReaction,
    TResult Function(PostReaction reaction, List<PostReaction> latestReactions)?
        unReactToPost,
    TResult Function(String postId)? sharePost,
    TResult Function(SavedPostDTO savedPost)? savePost,
    TResult Function(String userId, String postId)? unSavePost,
    TResult Function(String postId, String userId)? unLikePost,
    TResult Function(String postId)? deletePost,
    TResult Function(String postId)? getPost,
    required TResult orElse(),
  }) {
    if (savePost != null) {
      return savePost(savedPost);
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
    required TResult Function(_CreateStatusPost value) createStatusPost,
    required TResult Function(_ReactPost value) reactToPost,
    required TResult Function(_UpdateReactPost value) updateReaction,
    required TResult Function(_UnReactPost value) unReactToPost,
    required TResult Function(_SharePost value) sharePost,
    required TResult Function(_SavePost value) savePost,
    required TResult Function(_UnSavePost value) unSavePost,
    required TResult Function(_UnLikePost value) unLikePost,
    required TResult Function(_DeletePost value) deletePost,
    required TResult Function(_GetPost value) getPost,
  }) {
    return savePost(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_FetchTimelinePosts value)? fetchTimelinePosts,
    TResult Function(_FetchTimelinePaginatedPosts value)?
        fetchPaginatedTimelinePosts,
    TResult Function(_CreatePost value)? createPost,
    TResult Function(_CreateStatusPost value)? createStatusPost,
    TResult Function(_ReactPost value)? reactToPost,
    TResult Function(_UpdateReactPost value)? updateReaction,
    TResult Function(_UnReactPost value)? unReactToPost,
    TResult Function(_SharePost value)? sharePost,
    TResult Function(_SavePost value)? savePost,
    TResult Function(_UnSavePost value)? unSavePost,
    TResult Function(_UnLikePost value)? unLikePost,
    TResult Function(_DeletePost value)? deletePost,
    TResult Function(_GetPost value)? getPost,
  }) {
    return savePost?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchTimelinePosts value)? fetchTimelinePosts,
    TResult Function(_FetchTimelinePaginatedPosts value)?
        fetchPaginatedTimelinePosts,
    TResult Function(_CreatePost value)? createPost,
    TResult Function(_CreateStatusPost value)? createStatusPost,
    TResult Function(_ReactPost value)? reactToPost,
    TResult Function(_UpdateReactPost value)? updateReaction,
    TResult Function(_UnReactPost value)? unReactToPost,
    TResult Function(_SharePost value)? sharePost,
    TResult Function(_SavePost value)? savePost,
    TResult Function(_UnSavePost value)? unSavePost,
    TResult Function(_UnLikePost value)? unLikePost,
    TResult Function(_DeletePost value)? deletePost,
    TResult Function(_GetPost value)? getPost,
    required TResult orElse(),
  }) {
    if (savePost != null) {
      return savePost(this);
    }
    return orElse();
  }
}

abstract class _SavePost implements PostEvent {
  const factory _SavePost({required SavedPostDTO savedPost}) = _$_SavePost;

  SavedPostDTO get savedPost;
  @JsonKey(ignore: true)
  _$SavePostCopyWith<_SavePost> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$UnSavePostCopyWith<$Res> {
  factory _$UnSavePostCopyWith(
          _UnSavePost value, $Res Function(_UnSavePost) then) =
      __$UnSavePostCopyWithImpl<$Res>;
  $Res call({String userId, String postId});
}

/// @nodoc
class __$UnSavePostCopyWithImpl<$Res> extends _$PostEventCopyWithImpl<$Res>
    implements _$UnSavePostCopyWith<$Res> {
  __$UnSavePostCopyWithImpl(
      _UnSavePost _value, $Res Function(_UnSavePost) _then)
      : super(_value, (v) => _then(v as _UnSavePost));

  @override
  _UnSavePost get _value => super._value as _UnSavePost;

  @override
  $Res call({
    Object? userId = freezed,
    Object? postId = freezed,
  }) {
    return _then(_UnSavePost(
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      postId: postId == freezed
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_UnSavePost implements _UnSavePost {
  const _$_UnSavePost({required this.userId, required this.postId});

  @override
  final String userId;
  @override
  final String postId;

  @override
  String toString() {
    return 'PostEvent.unSavePost(userId: $userId, postId: $postId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UnSavePost &&
            const DeepCollectionEquality().equals(other.userId, userId) &&
            const DeepCollectionEquality().equals(other.postId, postId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(userId),
      const DeepCollectionEquality().hash(postId));

  @JsonKey(ignore: true)
  @override
  _$UnSavePostCopyWith<_UnSavePost> get copyWith =>
      __$UnSavePostCopyWithImpl<_UnSavePost>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool shouldLoad) fetchTimelinePosts,
    required TResult Function() fetchPaginatedTimelinePosts,
    required TResult Function(String caption, List<GalleryAsset> assets)
        createPost,
    required TResult Function(String status) createStatusPost,
    required TResult Function(Post post, UserModel user, PostReaction reaction,
            List<PostReaction> latestReactions)
        reactToPost,
    required TResult Function(
            PostReaction reaction, List<PostReaction> latestReactions)
        updateReaction,
    required TResult Function(
            PostReaction reaction, List<PostReaction> latestReactions)
        unReactToPost,
    required TResult Function(String postId) sharePost,
    required TResult Function(SavedPostDTO savedPost) savePost,
    required TResult Function(String userId, String postId) unSavePost,
    required TResult Function(String postId, String userId) unLikePost,
    required TResult Function(String postId) deletePost,
    required TResult Function(String postId) getPost,
  }) {
    return unSavePost(userId, postId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool shouldLoad)? fetchTimelinePosts,
    TResult Function()? fetchPaginatedTimelinePosts,
    TResult Function(String caption, List<GalleryAsset> assets)? createPost,
    TResult Function(String status)? createStatusPost,
    TResult Function(Post post, UserModel user, PostReaction reaction,
            List<PostReaction> latestReactions)?
        reactToPost,
    TResult Function(PostReaction reaction, List<PostReaction> latestReactions)?
        updateReaction,
    TResult Function(PostReaction reaction, List<PostReaction> latestReactions)?
        unReactToPost,
    TResult Function(String postId)? sharePost,
    TResult Function(SavedPostDTO savedPost)? savePost,
    TResult Function(String userId, String postId)? unSavePost,
    TResult Function(String postId, String userId)? unLikePost,
    TResult Function(String postId)? deletePost,
    TResult Function(String postId)? getPost,
  }) {
    return unSavePost?.call(userId, postId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool shouldLoad)? fetchTimelinePosts,
    TResult Function()? fetchPaginatedTimelinePosts,
    TResult Function(String caption, List<GalleryAsset> assets)? createPost,
    TResult Function(String status)? createStatusPost,
    TResult Function(Post post, UserModel user, PostReaction reaction,
            List<PostReaction> latestReactions)?
        reactToPost,
    TResult Function(PostReaction reaction, List<PostReaction> latestReactions)?
        updateReaction,
    TResult Function(PostReaction reaction, List<PostReaction> latestReactions)?
        unReactToPost,
    TResult Function(String postId)? sharePost,
    TResult Function(SavedPostDTO savedPost)? savePost,
    TResult Function(String userId, String postId)? unSavePost,
    TResult Function(String postId, String userId)? unLikePost,
    TResult Function(String postId)? deletePost,
    TResult Function(String postId)? getPost,
    required TResult orElse(),
  }) {
    if (unSavePost != null) {
      return unSavePost(userId, postId);
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
    required TResult Function(_CreateStatusPost value) createStatusPost,
    required TResult Function(_ReactPost value) reactToPost,
    required TResult Function(_UpdateReactPost value) updateReaction,
    required TResult Function(_UnReactPost value) unReactToPost,
    required TResult Function(_SharePost value) sharePost,
    required TResult Function(_SavePost value) savePost,
    required TResult Function(_UnSavePost value) unSavePost,
    required TResult Function(_UnLikePost value) unLikePost,
    required TResult Function(_DeletePost value) deletePost,
    required TResult Function(_GetPost value) getPost,
  }) {
    return unSavePost(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_FetchTimelinePosts value)? fetchTimelinePosts,
    TResult Function(_FetchTimelinePaginatedPosts value)?
        fetchPaginatedTimelinePosts,
    TResult Function(_CreatePost value)? createPost,
    TResult Function(_CreateStatusPost value)? createStatusPost,
    TResult Function(_ReactPost value)? reactToPost,
    TResult Function(_UpdateReactPost value)? updateReaction,
    TResult Function(_UnReactPost value)? unReactToPost,
    TResult Function(_SharePost value)? sharePost,
    TResult Function(_SavePost value)? savePost,
    TResult Function(_UnSavePost value)? unSavePost,
    TResult Function(_UnLikePost value)? unLikePost,
    TResult Function(_DeletePost value)? deletePost,
    TResult Function(_GetPost value)? getPost,
  }) {
    return unSavePost?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchTimelinePosts value)? fetchTimelinePosts,
    TResult Function(_FetchTimelinePaginatedPosts value)?
        fetchPaginatedTimelinePosts,
    TResult Function(_CreatePost value)? createPost,
    TResult Function(_CreateStatusPost value)? createStatusPost,
    TResult Function(_ReactPost value)? reactToPost,
    TResult Function(_UpdateReactPost value)? updateReaction,
    TResult Function(_UnReactPost value)? unReactToPost,
    TResult Function(_SharePost value)? sharePost,
    TResult Function(_SavePost value)? savePost,
    TResult Function(_UnSavePost value)? unSavePost,
    TResult Function(_UnLikePost value)? unLikePost,
    TResult Function(_DeletePost value)? deletePost,
    TResult Function(_GetPost value)? getPost,
    required TResult orElse(),
  }) {
    if (unSavePost != null) {
      return unSavePost(this);
    }
    return orElse();
  }
}

abstract class _UnSavePost implements PostEvent {
  const factory _UnSavePost({required String userId, required String postId}) =
      _$_UnSavePost;

  String get userId;
  String get postId;
  @JsonKey(ignore: true)
  _$UnSavePostCopyWith<_UnSavePost> get copyWith =>
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
    required TResult Function(String status) createStatusPost,
    required TResult Function(Post post, UserModel user, PostReaction reaction,
            List<PostReaction> latestReactions)
        reactToPost,
    required TResult Function(
            PostReaction reaction, List<PostReaction> latestReactions)
        updateReaction,
    required TResult Function(
            PostReaction reaction, List<PostReaction> latestReactions)
        unReactToPost,
    required TResult Function(String postId) sharePost,
    required TResult Function(SavedPostDTO savedPost) savePost,
    required TResult Function(String userId, String postId) unSavePost,
    required TResult Function(String postId, String userId) unLikePost,
    required TResult Function(String postId) deletePost,
    required TResult Function(String postId) getPost,
  }) {
    return unLikePost(postId, userId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool shouldLoad)? fetchTimelinePosts,
    TResult Function()? fetchPaginatedTimelinePosts,
    TResult Function(String caption, List<GalleryAsset> assets)? createPost,
    TResult Function(String status)? createStatusPost,
    TResult Function(Post post, UserModel user, PostReaction reaction,
            List<PostReaction> latestReactions)?
        reactToPost,
    TResult Function(PostReaction reaction, List<PostReaction> latestReactions)?
        updateReaction,
    TResult Function(PostReaction reaction, List<PostReaction> latestReactions)?
        unReactToPost,
    TResult Function(String postId)? sharePost,
    TResult Function(SavedPostDTO savedPost)? savePost,
    TResult Function(String userId, String postId)? unSavePost,
    TResult Function(String postId, String userId)? unLikePost,
    TResult Function(String postId)? deletePost,
    TResult Function(String postId)? getPost,
  }) {
    return unLikePost?.call(postId, userId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool shouldLoad)? fetchTimelinePosts,
    TResult Function()? fetchPaginatedTimelinePosts,
    TResult Function(String caption, List<GalleryAsset> assets)? createPost,
    TResult Function(String status)? createStatusPost,
    TResult Function(Post post, UserModel user, PostReaction reaction,
            List<PostReaction> latestReactions)?
        reactToPost,
    TResult Function(PostReaction reaction, List<PostReaction> latestReactions)?
        updateReaction,
    TResult Function(PostReaction reaction, List<PostReaction> latestReactions)?
        unReactToPost,
    TResult Function(String postId)? sharePost,
    TResult Function(SavedPostDTO savedPost)? savePost,
    TResult Function(String userId, String postId)? unSavePost,
    TResult Function(String postId, String userId)? unLikePost,
    TResult Function(String postId)? deletePost,
    TResult Function(String postId)? getPost,
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
    required TResult Function(_CreateStatusPost value) createStatusPost,
    required TResult Function(_ReactPost value) reactToPost,
    required TResult Function(_UpdateReactPost value) updateReaction,
    required TResult Function(_UnReactPost value) unReactToPost,
    required TResult Function(_SharePost value) sharePost,
    required TResult Function(_SavePost value) savePost,
    required TResult Function(_UnSavePost value) unSavePost,
    required TResult Function(_UnLikePost value) unLikePost,
    required TResult Function(_DeletePost value) deletePost,
    required TResult Function(_GetPost value) getPost,
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
    TResult Function(_CreateStatusPost value)? createStatusPost,
    TResult Function(_ReactPost value)? reactToPost,
    TResult Function(_UpdateReactPost value)? updateReaction,
    TResult Function(_UnReactPost value)? unReactToPost,
    TResult Function(_SharePost value)? sharePost,
    TResult Function(_SavePost value)? savePost,
    TResult Function(_UnSavePost value)? unSavePost,
    TResult Function(_UnLikePost value)? unLikePost,
    TResult Function(_DeletePost value)? deletePost,
    TResult Function(_GetPost value)? getPost,
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
    TResult Function(_CreateStatusPost value)? createStatusPost,
    TResult Function(_ReactPost value)? reactToPost,
    TResult Function(_UpdateReactPost value)? updateReaction,
    TResult Function(_UnReactPost value)? unReactToPost,
    TResult Function(_SharePost value)? sharePost,
    TResult Function(_SavePost value)? savePost,
    TResult Function(_UnSavePost value)? unSavePost,
    TResult Function(_UnLikePost value)? unLikePost,
    TResult Function(_DeletePost value)? deletePost,
    TResult Function(_GetPost value)? getPost,
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
    required TResult Function(String status) createStatusPost,
    required TResult Function(Post post, UserModel user, PostReaction reaction,
            List<PostReaction> latestReactions)
        reactToPost,
    required TResult Function(
            PostReaction reaction, List<PostReaction> latestReactions)
        updateReaction,
    required TResult Function(
            PostReaction reaction, List<PostReaction> latestReactions)
        unReactToPost,
    required TResult Function(String postId) sharePost,
    required TResult Function(SavedPostDTO savedPost) savePost,
    required TResult Function(String userId, String postId) unSavePost,
    required TResult Function(String postId, String userId) unLikePost,
    required TResult Function(String postId) deletePost,
    required TResult Function(String postId) getPost,
  }) {
    return deletePost(postId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool shouldLoad)? fetchTimelinePosts,
    TResult Function()? fetchPaginatedTimelinePosts,
    TResult Function(String caption, List<GalleryAsset> assets)? createPost,
    TResult Function(String status)? createStatusPost,
    TResult Function(Post post, UserModel user, PostReaction reaction,
            List<PostReaction> latestReactions)?
        reactToPost,
    TResult Function(PostReaction reaction, List<PostReaction> latestReactions)?
        updateReaction,
    TResult Function(PostReaction reaction, List<PostReaction> latestReactions)?
        unReactToPost,
    TResult Function(String postId)? sharePost,
    TResult Function(SavedPostDTO savedPost)? savePost,
    TResult Function(String userId, String postId)? unSavePost,
    TResult Function(String postId, String userId)? unLikePost,
    TResult Function(String postId)? deletePost,
    TResult Function(String postId)? getPost,
  }) {
    return deletePost?.call(postId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool shouldLoad)? fetchTimelinePosts,
    TResult Function()? fetchPaginatedTimelinePosts,
    TResult Function(String caption, List<GalleryAsset> assets)? createPost,
    TResult Function(String status)? createStatusPost,
    TResult Function(Post post, UserModel user, PostReaction reaction,
            List<PostReaction> latestReactions)?
        reactToPost,
    TResult Function(PostReaction reaction, List<PostReaction> latestReactions)?
        updateReaction,
    TResult Function(PostReaction reaction, List<PostReaction> latestReactions)?
        unReactToPost,
    TResult Function(String postId)? sharePost,
    TResult Function(SavedPostDTO savedPost)? savePost,
    TResult Function(String userId, String postId)? unSavePost,
    TResult Function(String postId, String userId)? unLikePost,
    TResult Function(String postId)? deletePost,
    TResult Function(String postId)? getPost,
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
    required TResult Function(_CreateStatusPost value) createStatusPost,
    required TResult Function(_ReactPost value) reactToPost,
    required TResult Function(_UpdateReactPost value) updateReaction,
    required TResult Function(_UnReactPost value) unReactToPost,
    required TResult Function(_SharePost value) sharePost,
    required TResult Function(_SavePost value) savePost,
    required TResult Function(_UnSavePost value) unSavePost,
    required TResult Function(_UnLikePost value) unLikePost,
    required TResult Function(_DeletePost value) deletePost,
    required TResult Function(_GetPost value) getPost,
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
    TResult Function(_CreateStatusPost value)? createStatusPost,
    TResult Function(_ReactPost value)? reactToPost,
    TResult Function(_UpdateReactPost value)? updateReaction,
    TResult Function(_UnReactPost value)? unReactToPost,
    TResult Function(_SharePost value)? sharePost,
    TResult Function(_SavePost value)? savePost,
    TResult Function(_UnSavePost value)? unSavePost,
    TResult Function(_UnLikePost value)? unLikePost,
    TResult Function(_DeletePost value)? deletePost,
    TResult Function(_GetPost value)? getPost,
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
    TResult Function(_CreateStatusPost value)? createStatusPost,
    TResult Function(_ReactPost value)? reactToPost,
    TResult Function(_UpdateReactPost value)? updateReaction,
    TResult Function(_UnReactPost value)? unReactToPost,
    TResult Function(_SharePost value)? sharePost,
    TResult Function(_SavePost value)? savePost,
    TResult Function(_UnSavePost value)? unSavePost,
    TResult Function(_UnLikePost value)? unLikePost,
    TResult Function(_DeletePost value)? deletePost,
    TResult Function(_GetPost value)? getPost,
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
abstract class _$GetPostCopyWith<$Res> {
  factory _$GetPostCopyWith(_GetPost value, $Res Function(_GetPost) then) =
      __$GetPostCopyWithImpl<$Res>;
  $Res call({String postId});
}

/// @nodoc
class __$GetPostCopyWithImpl<$Res> extends _$PostEventCopyWithImpl<$Res>
    implements _$GetPostCopyWith<$Res> {
  __$GetPostCopyWithImpl(_GetPost _value, $Res Function(_GetPost) _then)
      : super(_value, (v) => _then(v as _GetPost));

  @override
  _GetPost get _value => super._value as _GetPost;

  @override
  $Res call({
    Object? postId = freezed,
  }) {
    return _then(_GetPost(
      postId: postId == freezed
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_GetPost implements _GetPost {
  const _$_GetPost({required this.postId});

  @override
  final String postId;

  @override
  String toString() {
    return 'PostEvent.getPost(postId: $postId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GetPost &&
            const DeepCollectionEquality().equals(other.postId, postId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(postId));

  @JsonKey(ignore: true)
  @override
  _$GetPostCopyWith<_GetPost> get copyWith =>
      __$GetPostCopyWithImpl<_GetPost>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool shouldLoad) fetchTimelinePosts,
    required TResult Function() fetchPaginatedTimelinePosts,
    required TResult Function(String caption, List<GalleryAsset> assets)
        createPost,
    required TResult Function(String status) createStatusPost,
    required TResult Function(Post post, UserModel user, PostReaction reaction,
            List<PostReaction> latestReactions)
        reactToPost,
    required TResult Function(
            PostReaction reaction, List<PostReaction> latestReactions)
        updateReaction,
    required TResult Function(
            PostReaction reaction, List<PostReaction> latestReactions)
        unReactToPost,
    required TResult Function(String postId) sharePost,
    required TResult Function(SavedPostDTO savedPost) savePost,
    required TResult Function(String userId, String postId) unSavePost,
    required TResult Function(String postId, String userId) unLikePost,
    required TResult Function(String postId) deletePost,
    required TResult Function(String postId) getPost,
  }) {
    return getPost(postId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool shouldLoad)? fetchTimelinePosts,
    TResult Function()? fetchPaginatedTimelinePosts,
    TResult Function(String caption, List<GalleryAsset> assets)? createPost,
    TResult Function(String status)? createStatusPost,
    TResult Function(Post post, UserModel user, PostReaction reaction,
            List<PostReaction> latestReactions)?
        reactToPost,
    TResult Function(PostReaction reaction, List<PostReaction> latestReactions)?
        updateReaction,
    TResult Function(PostReaction reaction, List<PostReaction> latestReactions)?
        unReactToPost,
    TResult Function(String postId)? sharePost,
    TResult Function(SavedPostDTO savedPost)? savePost,
    TResult Function(String userId, String postId)? unSavePost,
    TResult Function(String postId, String userId)? unLikePost,
    TResult Function(String postId)? deletePost,
    TResult Function(String postId)? getPost,
  }) {
    return getPost?.call(postId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool shouldLoad)? fetchTimelinePosts,
    TResult Function()? fetchPaginatedTimelinePosts,
    TResult Function(String caption, List<GalleryAsset> assets)? createPost,
    TResult Function(String status)? createStatusPost,
    TResult Function(Post post, UserModel user, PostReaction reaction,
            List<PostReaction> latestReactions)?
        reactToPost,
    TResult Function(PostReaction reaction, List<PostReaction> latestReactions)?
        updateReaction,
    TResult Function(PostReaction reaction, List<PostReaction> latestReactions)?
        unReactToPost,
    TResult Function(String postId)? sharePost,
    TResult Function(SavedPostDTO savedPost)? savePost,
    TResult Function(String userId, String postId)? unSavePost,
    TResult Function(String postId, String userId)? unLikePost,
    TResult Function(String postId)? deletePost,
    TResult Function(String postId)? getPost,
    required TResult orElse(),
  }) {
    if (getPost != null) {
      return getPost(postId);
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
    required TResult Function(_CreateStatusPost value) createStatusPost,
    required TResult Function(_ReactPost value) reactToPost,
    required TResult Function(_UpdateReactPost value) updateReaction,
    required TResult Function(_UnReactPost value) unReactToPost,
    required TResult Function(_SharePost value) sharePost,
    required TResult Function(_SavePost value) savePost,
    required TResult Function(_UnSavePost value) unSavePost,
    required TResult Function(_UnLikePost value) unLikePost,
    required TResult Function(_DeletePost value) deletePost,
    required TResult Function(_GetPost value) getPost,
  }) {
    return getPost(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_FetchTimelinePosts value)? fetchTimelinePosts,
    TResult Function(_FetchTimelinePaginatedPosts value)?
        fetchPaginatedTimelinePosts,
    TResult Function(_CreatePost value)? createPost,
    TResult Function(_CreateStatusPost value)? createStatusPost,
    TResult Function(_ReactPost value)? reactToPost,
    TResult Function(_UpdateReactPost value)? updateReaction,
    TResult Function(_UnReactPost value)? unReactToPost,
    TResult Function(_SharePost value)? sharePost,
    TResult Function(_SavePost value)? savePost,
    TResult Function(_UnSavePost value)? unSavePost,
    TResult Function(_UnLikePost value)? unLikePost,
    TResult Function(_DeletePost value)? deletePost,
    TResult Function(_GetPost value)? getPost,
  }) {
    return getPost?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchTimelinePosts value)? fetchTimelinePosts,
    TResult Function(_FetchTimelinePaginatedPosts value)?
        fetchPaginatedTimelinePosts,
    TResult Function(_CreatePost value)? createPost,
    TResult Function(_CreateStatusPost value)? createStatusPost,
    TResult Function(_ReactPost value)? reactToPost,
    TResult Function(_UpdateReactPost value)? updateReaction,
    TResult Function(_UnReactPost value)? unReactToPost,
    TResult Function(_SharePost value)? sharePost,
    TResult Function(_SavePost value)? savePost,
    TResult Function(_UnSavePost value)? unSavePost,
    TResult Function(_UnLikePost value)? unLikePost,
    TResult Function(_DeletePost value)? deletePost,
    TResult Function(_GetPost value)? getPost,
    required TResult orElse(),
  }) {
    if (getPost != null) {
      return getPost(this);
    }
    return orElse();
  }
}

abstract class _GetPost implements PostEvent {
  const factory _GetPost({required String postId}) = _$_GetPost;

  String get postId;
  @JsonKey(ignore: true)
  _$GetPostCopyWith<_GetPost> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$PostStateTearOff {
  const _$PostStateTearOff();

  _PostState call(
      {Post? rehydratedPost = null,
      bool reachedMaximumThreshold = false,
      required PagingController<int, Post> paginationController,
      PostListenableAction action = PostListenableAction.idle}) {
    return _PostState(
      rehydratedPost: rehydratedPost,
      reachedMaximumThreshold: reachedMaximumThreshold,
      paginationController: paginationController,
      action: action,
    );
  }
}

/// @nodoc
const $PostState = _$PostStateTearOff();

/// @nodoc
mixin _$PostState {
  Post? get rehydratedPost => throw _privateConstructorUsedError;
  bool get reachedMaximumThreshold => throw _privateConstructorUsedError;
  PagingController<int, Post> get paginationController =>
      throw _privateConstructorUsedError;
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
      {Post? rehydratedPost,
      bool reachedMaximumThreshold,
      PagingController<int, Post> paginationController,
      PostListenableAction action});

  $PostCopyWith<$Res>? get rehydratedPost;
}

/// @nodoc
class _$PostStateCopyWithImpl<$Res> implements $PostStateCopyWith<$Res> {
  _$PostStateCopyWithImpl(this._value, this._then);

  final PostState _value;
  // ignore: unused_field
  final $Res Function(PostState) _then;

  @override
  $Res call({
    Object? rehydratedPost = freezed,
    Object? reachedMaximumThreshold = freezed,
    Object? paginationController = freezed,
    Object? action = freezed,
  }) {
    return _then(_value.copyWith(
      rehydratedPost: rehydratedPost == freezed
          ? _value.rehydratedPost
          : rehydratedPost // ignore: cast_nullable_to_non_nullable
              as Post?,
      reachedMaximumThreshold: reachedMaximumThreshold == freezed
          ? _value.reachedMaximumThreshold
          : reachedMaximumThreshold // ignore: cast_nullable_to_non_nullable
              as bool,
      paginationController: paginationController == freezed
          ? _value.paginationController
          : paginationController // ignore: cast_nullable_to_non_nullable
              as PagingController<int, Post>,
      action: action == freezed
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as PostListenableAction,
    ));
  }

  @override
  $PostCopyWith<$Res>? get rehydratedPost {
    if (_value.rehydratedPost == null) {
      return null;
    }

    return $PostCopyWith<$Res>(_value.rehydratedPost!, (value) {
      return _then(_value.copyWith(rehydratedPost: value));
    });
  }
}

/// @nodoc
abstract class _$PostStateCopyWith<$Res> implements $PostStateCopyWith<$Res> {
  factory _$PostStateCopyWith(
          _PostState value, $Res Function(_PostState) then) =
      __$PostStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {Post? rehydratedPost,
      bool reachedMaximumThreshold,
      PagingController<int, Post> paginationController,
      PostListenableAction action});

  @override
  $PostCopyWith<$Res>? get rehydratedPost;
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
    Object? rehydratedPost = freezed,
    Object? reachedMaximumThreshold = freezed,
    Object? paginationController = freezed,
    Object? action = freezed,
  }) {
    return _then(_PostState(
      rehydratedPost: rehydratedPost == freezed
          ? _value.rehydratedPost
          : rehydratedPost // ignore: cast_nullable_to_non_nullable
              as Post?,
      reachedMaximumThreshold: reachedMaximumThreshold == freezed
          ? _value.reachedMaximumThreshold
          : reachedMaximumThreshold // ignore: cast_nullable_to_non_nullable
              as bool,
      paginationController: paginationController == freezed
          ? _value.paginationController
          : paginationController // ignore: cast_nullable_to_non_nullable
              as PagingController<int, Post>,
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
      {this.rehydratedPost = null,
      this.reachedMaximumThreshold = false,
      required this.paginationController,
      this.action = PostListenableAction.idle});

  @JsonKey()
  @override
  final Post? rehydratedPost;
  @JsonKey()
  @override
  final bool reachedMaximumThreshold;
  @override
  final PagingController<int, Post> paginationController;
  @JsonKey()
  @override
  final PostListenableAction action;

  @override
  String toString() {
    return 'PostState(rehydratedPost: $rehydratedPost, reachedMaximumThreshold: $reachedMaximumThreshold, paginationController: $paginationController, action: $action)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PostState &&
            const DeepCollectionEquality()
                .equals(other.rehydratedPost, rehydratedPost) &&
            const DeepCollectionEquality().equals(
                other.reachedMaximumThreshold, reachedMaximumThreshold) &&
            const DeepCollectionEquality()
                .equals(other.paginationController, paginationController) &&
            const DeepCollectionEquality().equals(other.action, action));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(rehydratedPost),
      const DeepCollectionEquality().hash(reachedMaximumThreshold),
      const DeepCollectionEquality().hash(paginationController),
      const DeepCollectionEquality().hash(action));

  @JsonKey(ignore: true)
  @override
  _$PostStateCopyWith<_PostState> get copyWith =>
      __$PostStateCopyWithImpl<_PostState>(this, _$identity);
}

abstract class _PostState implements PostState {
  const factory _PostState(
      {Post? rehydratedPost,
      bool reachedMaximumThreshold,
      required PagingController<int, Post> paginationController,
      PostListenableAction action}) = _$_PostState;

  @override
  Post? get rehydratedPost;
  @override
  bool get reachedMaximumThreshold;
  @override
  PagingController<int, Post> get paginationController;
  @override
  PostListenableAction get action;
  @override
  @JsonKey(ignore: true)
  _$PostStateCopyWith<_PostState> get copyWith =>
      throw _privateConstructorUsedError;
}
