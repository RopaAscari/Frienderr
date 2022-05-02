import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:frienderr/core/failure/failure.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:frienderr/features/domain/entities/post.dart';
import 'package:frienderr/features/domain/entities/user.dart';
import 'package:frienderr/features/domain/entities/media_asset.dart';
import 'package:frienderr/features/data/models/post/post_model.dart';
import 'package:frienderr/features/data/models/user/user_model.dart';
import 'package:frienderr/features/data/providers/post_provider.dart';
import 'package:frienderr/features/data/providers/user_provider.dart';
import 'package:frienderr/features/data/models/post/content_model.dart';
import 'package:frienderr/features/data/models/post/metadata_model.dart';
import 'package:frienderr/features/domain/repositiories/post_repository.dart';

@LazySingleton(as: IPostRepository)
class PostRepository implements IPostRepository {
  final IPostRemoteDataProvider _postRemoteDataProvider;
  final IUserDataRemoteProvider _userRemoteDataProvider;
  const PostRepository(
      this._postRemoteDataProvider, this._userRemoteDataProvider);

  @override
  Either<Failure, Stream<QuerySnapshot<Map<String, dynamic>>>>
      delegateTimelineStream() {
    try {
      return Right(_postRemoteDataProvider.delegateTimelineStream());
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> createPost({
    required String caption,
    required List<GalleryAsset> assets,
  }) async {
    try {
      final bool postCreated = await _postRemoteDataProvider.createPost(
          caption: caption, assets: assets);

      return Right(postCreated);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, TimelineResponse>> getPosts() async {
    try {
      final QuerySnapshot<Object?> rawPosts =
          await _postRemoteDataProvider.getPosts();

      final QuerySnapshot<Object?> users =
          await _userRemoteDataProvider.getPlatformUsers();

      final List<Map<String, dynamic>> postMap =
          rawPosts.docs.map((e) => e.data() as Map<String, dynamic>).toList();

      final List<PostModel> posts = postsFromJson(postMap, users.docs);

      return Right(TimelineResponse(userCaughtUp: false, posts: posts));
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, TimelineResponse>> getPaginatedPosts(
      List<Map<String, dynamic>> previousList) async {
    try {
      bool userCaughtUp = false;

      final QuerySnapshot<Object?> response =
          await _postRemoteDataProvider.getPaginatedPosts(previousList);

      final QuerySnapshot<Object?> users =
          await _userRemoteDataProvider.getPlatformUsers();

      final List<Map<String, dynamic>> currentList = response.docs
          .map((post) => post.data() as Map<String, dynamic>)
          .toList();

      final List<Map<String, dynamic>> newPosts = []
        ..addAll(previousList)
        ..addAll(currentList);

      final List<PostModel> finalPosts = postsFromJson(newPosts, users.docs);

      if (newPosts.length == currentList.length) {
        userCaughtUp = true;
      }

      return Right(
          TimelineResponse(userCaughtUp: userCaughtUp, posts: finalPosts));
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> likePost(
      PostEntity post, UserEntity user) async {
    try {
      return Right(await _postRemoteDataProvider.likePost(post, user));
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> unLikePost(String postId, String userId) async {
    try {
      return Right(await _postRemoteDataProvider.unLikePost(postId, userId));
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> deletePost(String postId) async {
    try {
      return Right(await _postRemoteDataProvider.deletePost(postId));
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  List<PostModel> postsFromJson(
      List<dynamic> posts, List<QueryDocumentSnapshot<Object?>> users) {
    return posts.map((post) {
      final List<ContentModel> content = post['content']
          .map((content) {
            return ContentModel(
              type: content['type'],
              media: content['media'],
              metadata: PostMetadataModel(thumbnail: content['thumbnail']),
            );
          })
          .toList()
          .cast<ContentModel>();

      final UserModel user = UserModel.fromJson(users.firstWhere((user) {
        return (user.data() as Map)['id'] == post['user']['id'];
      }).data() as Map<String, dynamic>);

      return PostModel(
        user: user,
        id: post['id'],
        content: content,
        caption: post['caption'],
        dateCreated: post['dateCreated'],
        commentCount: post['commentCount'],
        likes: post['likes'].cast<String>(),
        shares: post['shares'].cast<String>(),
      );
    }).toList();
  }
}
