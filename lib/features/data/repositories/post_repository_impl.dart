import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:frienderr/core/injection/injection.dart';
import 'package:frienderr/features/data/models/post/content_model.dart';
import 'package:frienderr/features/domain/entities/post.dart';
import 'package:frienderr/features/presentation/blocs/user/user_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:frienderr/core/failure/failure.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:frienderr/features/domain/entities/user.dart';
import 'package:frienderr/features/data/models/post/post_model.dart';
import 'package:frienderr/features/data/models/user/user_model.dart';
import 'package:frienderr/features/data/providers/post_provider.dart';
import 'package:frienderr/features/domain/repositiories/post_repository.dart';

@LazySingleton(as: IPostRepository)
class PostRepository implements IPostRepository {
  final IPostRemoteDataProvider _postRemoteDataProvider;

  const PostRepository(this._postRemoteDataProvider);

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
  Future<Either<Failure, TimelineResponse>> getPosts() async {
    try {
      final userBloc = getIt<UserBloc>();
      final platformUsers = userBloc.state.platformUsers;

      final QuerySnapshot<Object?> response =
          await _postRemoteDataProvider.getPosts();

      final List<PostModel> posts = response.docs.map((post) {
        final data = post.data() as Map<String, dynamic>;

        List<ContentModel> contentItems = [];

        final content = data['content'].map((content) {
          contentItems.add(ContentModel(
              type: content['type'],
              media: content['media'],
              metadata: content['metadata'],
              thumbnail: content['thumbnail']));
          return ContentModel(
              type: content['type'],
              media: content['media'],
              metadata: content['metadata'],
              thumbnail: content['thumbnail']);
        }).toList();

        return PostModel(
          id: data['id'],
          shares: data['shares'],
          user: UserEntity(
            id: data['user']['id'],
            username: data['user']['username'],
            profilePic: data['user']['profilePic'],
          ),
          likes: data['likes'],
          caption: data['caption'],
          content: contentItems,
          userLikes: data['userLikes'],
          dateCreated: data['dateCreated'],
          commentCount: data['commentCount'],
        );
      }).toList();

      return Right(TimelineResponse(userCaughtUp: false, posts: posts));
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, TimelineResponse>> getPaginatedPosts(
      List<PostModel> postList) async {
    try {
      bool userCaughtUp = false;
      Map<String, dynamic> postsMap = json.decode(postList.toString());

      final QuerySnapshot<Object?> response =
          await _postRemoteDataProvider.getPaginatedPosts(postsMap);

      final List<Map<String, dynamic>> posts = response.docs
          .map((post) => post.data() as Map<String, dynamic>)
          .toList();

      final List<Map<String, dynamic>> newPosts = []
        ..addAll(posts)
        ..addAll([postsMap]);

      final List<PostModel> finalPosts = posts.map((post) {
        List<ContentModel> contentItems = [];

        final content = post['content'].map((content) {
          contentItems.add(ContentModel(
              type: content['type'],
              media: content['media'],
              metadata: content['metadata'],
              thumbnail: content['thumbnail']));
          return ContentModel(
              type: content['type'],
              media: content['media'],
              metadata: content['metadata'],
              thumbnail: content['thumbnail']);
        }).toList();

        return PostModel(
          id: post['id'],
          shares: post['shares'],
          user: UserEntity(
            id: post['user']['id'],
            username: post['user']['username'],
            profilePic: post['user']['profilePic'],
          ),
          likes: post['likes'],
          caption: post['caption'],
          content: contentItems,
          userLikes: post['userLikes'],
          dateCreated: post['dateCreated'],
          commentCount: post['commentCount'],
        );
      }).toList();

      if (newPosts.length == postsMap.length) {
        userCaughtUp = true;
      }

      return Right(
          TimelineResponse(userCaughtUp: userCaughtUp, posts: finalPosts));
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> likePost(dynamic post, UserEntity user) async {
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
}
