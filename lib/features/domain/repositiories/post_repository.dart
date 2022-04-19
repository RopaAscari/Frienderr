import 'package:dartz/dartz.dart';
import 'package:frienderr/core/failure/failure.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:frienderr/features/domain/entities/post.dart';
import 'package:frienderr/features/domain/entities/user.dart';
import 'package:frienderr/features/data/models/post/post_model.dart';
import 'package:frienderr/features/data/models/user/user_model.dart';

abstract class IPostRepository {
  Future<Either<Failure, TimelineResponse>> getPosts();
  Future<Either<Failure, bool>> deletePost(String postId);
  Future<Either<Failure, bool>> likePost(dynamic post, UserEntity user);
  Future<Either<Failure, bool>> unLikePost(String postId, String userId);
  Future<Either<Failure, TimelineResponse>> getPaginatedPosts(
      List<PostModel> posts);
  Either<Failure, Stream<QuerySnapshot<Map<String, dynamic>>>>
      delegateTimelineStream();
}
