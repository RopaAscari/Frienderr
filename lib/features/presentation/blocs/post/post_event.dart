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

  const factory PostEvent.createStatusPost({
    required String status,
  }) = _CreateStatusPost;

  const factory PostEvent.reactToPost({
    required Post post,
    required UserModel user,
    required PostReaction reaction,
    required List<PostReaction> latestReactions,
  }) = _ReactPost;

  const factory PostEvent.updateReaction({
    required PostReaction reaction,
    required List<PostReaction> latestReactions,
  }) = _UpdateReactPost;

  const factory PostEvent.unReactToPost({
    required PostReaction reaction,
    required List<PostReaction> latestReactions,
  }) = _UnReactPost;

  const factory PostEvent.sharePost({required String postId}) = _SharePost;

  const factory PostEvent.savePost({required SavedPostDTO savedPost}) =
      _SavePost;

  const factory PostEvent.unSavePost(
      {required String userId, required String postId}) = _UnSavePost;

  const factory PostEvent.unLikePost(
      {required String postId, required String userId}) = _UnLikePost;

  const factory PostEvent.deletePost({required String postId}) = _DeletePost;

  const factory PostEvent.getPost({required String postId}) = _GetPost;
}
