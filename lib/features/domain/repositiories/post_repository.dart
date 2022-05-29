import 'package:dartz/dartz.dart';
import 'package:frienderr/core/failure/failure.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:frienderr/features/domain/entities/post.dart';
import 'package:frienderr/features/domain/entities/user.dart';
import 'package:frienderr/features/data/models/post/post_model.dart';
import 'package:frienderr/features/domain/entities/media_asset.dart';

abstract class IPostRepository {
  Future<Either<Failure, bool>> createPost({
    required String caption,
    required List<GalleryAsset> assets,
  });
  Future<Either<Failure, TimelineResponse>> getPosts();
  Future<Either<Failure, bool>> deletePost(String postId);
  Future<Either<Failure, bool>> likePost(PostEntity post, UserEntity user);
  Future<Either<Failure, bool>> unLikePost(String postId, String userId);
  Future<Either<Failure, TimelineResponse>> getPaginatedPosts(
      List<Map<String, dynamic>> posts);
  Either<Failure, Stream<QuerySnapshot<Map<String, dynamic>>>>
      delegateTimelineStream();

  Future<Either<Failure, List<PostEntity>>> getUserPosts({required String uid});
}
