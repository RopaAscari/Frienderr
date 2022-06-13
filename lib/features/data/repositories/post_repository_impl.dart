import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:frienderr/core/failure/failure.dart';
import 'package:frienderr/core/services/helpers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:frienderr/features/domain/entities/post.dart';
import 'package:frienderr/features/domain/entities/user.dart';
import 'package:frienderr/features/domain/entities/notification.dart';
import 'package:frienderr/features/domain/entities/media_asset.dart';
import 'package:frienderr/features/data/models/post/post_model.dart';
import 'package:frienderr/features/data/models/user/user_model.dart';
import 'package:frienderr/features/data/providers/post_provider.dart';
import 'package:frienderr/features/data/providers/user_provider.dart';
import 'package:frienderr/features/data/models/post/content_model.dart';
import 'package:frienderr/features/data/models/post/metadata_model.dart';
import 'package:frienderr/features/domain/repositiories/post_repository.dart';
import 'package:frienderr/features/domain/repositiories/notification_repository.dart';

@LazySingleton(as: IPostRepository)
class PostRepository implements IPostRepository {
  final INotificationRepository _notificationRepository;
  final IPostRemoteDataProvider _postRemoteDataProvider;
  final IUserDataRemoteProvider _userRemoteDataProvider;
  const PostRepository(this._postRemoteDataProvider,
      this._userRemoteDataProvider, this._notificationRepository);

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
  Future<Either<Failure, List<PostEntity>>> getUserPosts(
      {required String uid}) async {
    try {
      final userPosts = await _postRemoteDataProvider.getUserPosts(uid: uid);
      final posts = userPosts.docs
          .map((post) => PostEntity.fromJson(post.data()))
          .toList();

      return Right(posts);
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

      final List<PostEntity> posts = postsFromJson(postMap, users.docs);

      return Right(TimelineResponse(
          userCaughtUp: false, posts: posts.cast<PostEntity>()));
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

      final List<PostEntity> finalPosts = postsFromJson(newPosts, users.docs);

      if (newPosts.length == currentList.length) {
        userCaughtUp = true;
      }

      return Right(TimelineResponse(
          userCaughtUp: userCaughtUp, posts: finalPosts.cast<PostEntity>()));
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> likePost(
      PostEntity post, UserEntity user) async {
    try {
      final _result = await _postRemoteDataProvider.likePost(post, user);

      print(post.user.id != user.id);
      if (post.user.id != user.id) {
        late final String display;

        if (post.content.first.type == 'video') {
          display = post.content.first.metadata.thumbnail as String;
        } else {
          display = post.content.first.media;
        }

        final NotificationEntity notification = NotificationEntity(
          type: 1,
          mediaType: 1,
          recipientId: post.user.id,
          id: Helpers.generateId(25),
          metadata: NotificationMetadataEntity(),
          dateCreated: DateTime.now().microsecondsSinceEpoch,
          post: PartialPostEntity(id: post.id, display: display),
          user: UserEntity(id: user.id, username: user.username),
        );

        await _notificationRepository.sendLikeNotification(
            notification: notification);
      }

      return Right(_result);
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

  List<PostEntity> postsFromJson(
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

      return PostEntity(
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
