part of 'post_bloc.dart';

@freezed
class PostEvent with _$PostEvent {
  const factory PostEvent.fetchTimelinePosts({required bool shouldLoad}) =
      _FetchTimelinePosts;
  const factory PostEvent.fetchPaginatedTimelinePosts() =
      _FetchTimelinePaginatedPosts;

  const factory PostEvent.createPost(
      {required String caption,
      required List<GalleryAsset> assets}) = _CreatePost;

  const factory PostEvent.likePost(
      {required UserEntity user, required dynamic post}) = _LikePost;

  const factory PostEvent.unLikePost(
      {required String postId, required String userId}) = _UnLikePost;

  const factory PostEvent.deletePost({required String postId}) = _DeletePost;
}
