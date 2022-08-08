import 'package:dartz/dartz.dart';
import 'package:frienderr/core/failure/failure.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:frienderr/features/domain/entities/post.dart';
import 'package:frienderr/features/data/models/user/user_model.dart';
import 'package:frienderr/features/data/models/post/post_model.dart';
import 'package:frienderr/features/domain/entities/media_asset.dart';
import 'package:frienderr/features/data/models/post/post_reaction_model.dart';
import 'package:frienderr/features/domain/entities/save_post.dart';

abstract class IPostRepository {
  Future<Either<Failure, bool>> createPost({
    required String caption,
    required List<GalleryAsset> assets,
  });
  Future<Either<Failure, Timeline>> getPosts();
  Future<Either<Failure, Post>> getPost({required String postId});

  Future<Either<Failure, bool>> deletePost(String postId);

  Future<Either<Failure, bool>> createStatusPost({
    required String status,
  });
  Future<Either<Failure, bool>> savePost({required SavedPostDTO savedPost});
  Future<Either<Failure, bool>> unSavePost(
      {required String postId, required String userId});
  Future<Either<Failure, bool>> updatePostShares({required String postId});

  Future<Either<Failure, bool>> reactToPost(
      {required Post post,
      required UserModel user,
      required PostReaction reaction,
      required List<PostReaction> latestReactions});
  Future<Either<Failure, bool>> updatePostReaction(
      {required PostReaction reaction,
      required List<PostReaction> latestReactions});
  Future<Either<Failure, bool>> unReactToPost(
      {required PostReaction reaction,
      required List<PostReaction> latestReactions});

  Future<Either<Failure, Timeline>> getPaginatedPosts(Post post);
  Either<Failure, Stream<QuerySnapshot<Map<String, dynamic>>>>
      delegateTimelineStream();

  Future<Either<Failure, List<Post>>> getUserPosts({required String uid});
}
