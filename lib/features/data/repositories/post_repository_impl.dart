import 'package:dartz/dartz.dart';
import 'package:automap/automap.dart';
import 'package:injectable/injectable.dart';
import 'package:collection/collection.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:frienderr/core/failure/failure.dart';
import 'package:frienderr/core/services/helpers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:frienderr/core/constants/constants.dart';
import 'package:frienderr/core/mappers/mapping_profile.dart';
import 'package:frienderr/features/domain/entities/post.dart';
import 'package:frienderr/features/domain/entities/user.dart';
import 'package:frienderr/features/domain/entities/save_post.dart';
import 'package:frienderr/features/domain/entities/media_asset.dart';
import 'package:frienderr/features/data/models/post/post_model.dart';
import 'package:frienderr/features/data/models/user/user_model.dart';
import 'package:frienderr/features/data/providers/post_provider.dart';
import 'package:frienderr/features/data/providers/user_provider.dart';
import 'package:frienderr/features/domain/entities/notification.dart';
import 'package:frienderr/features/domain/repositiories/post_repository.dart';
import 'package:frienderr/features/data/models/post/post_reaction_model.dart';
import 'package:frienderr/features/domain/repositiories/notification_repository.dart';

@LazySingleton(as: IPostRepository)
class PostRepository implements IPostRepository {
  final FirebaseAuth _auth;
  final MappingProfile _mappingProfile;
  final INotificationRepository _notificationRepository;
  final IPostRemoteDataProvider _postRemoteDataProvider;
  final IUserDataRemoteProvider _userRemoteDataProvider;

  const PostRepository(
    this._auth,
    this._mappingProfile,
    this._postRemoteDataProvider,
    this._userRemoteDataProvider,
    this._notificationRepository,
  );

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
  Future<Either<Failure, bool>> unSavePost({
    required String userId,
    required String postId,
  }) async {
    try {
      final bool _success = await _postRemoteDataProvider.unSavePost(
          userId: userId, postId: postId);

      return Right(_success);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> updatePostShares({
    required String postId,
  }) async {
    try {
      final bool success = await _postRemoteDataProvider.updatePostShares(
        postId: postId,
      );

      return Right(success);
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
  Future<Either<Failure, bool>> createStatusPost({
    required String status,
  }) async {
    try {
      final bool postCreated = await _postRemoteDataProvider.createStatusPost(
        status: status,
      );

      return Right(postCreated);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Post>> getPost({required String postId}) async {
    try {
      final postDTO = await _postRemoteDataProvider.getPost(postId: postId);

      if (postDTO.data() == null) {
        return const Left(Failure(message: "An error occured"));
      }

      final DocumentSnapshot<UserDTO> userDoc =
          await _userRemoteDataProvider.getUser(uid: postDTO.data()!.user.id);

      PostDTO _post = postDTO.data()!;

      _post.user = userDoc.data()!;

      final post = AutoMapper.I.map<PostDTO, Post>(
        _post,
      );

      return Right(post);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Post>>> getUserPosts(
      {required String uid}) async {
    try {
      final result = await _postRemoteDataProvider.getUserPosts(uid: uid);

      final postsDTO = result.docs.map((e) => e.data()).toList();

      final posts = AutoMapper.I.map<List<PostDTO>, List<Post>>(
        postsDTO,
      );

      return Right(posts);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Timeline>> getPosts() async {
    try {
      final QuerySnapshot<PostDTO> postQuery =
          await _postRemoteDataProvider.getPosts();

      List<String> userIds =
          postQuery.docs.map((p) => p.data().user.id).toSet().toList();
      if (userIds.isEmpty) {
        return Right(Timeline(userCaughtUp: true, posts: []));
      }

      final QuerySnapshot<UserDTO> userQuery =
          await _userRemoteDataProvider.getUsersByIds(userIds: userIds);

      List<String> postIds =
          postQuery.docs.map((p) => p.data().id).toSet().toList();

      if (postIds.isEmpty) {
        return Right(Timeline(userCaughtUp: true, posts: []));
      }

      final QuerySnapshot<PostReactionDTO> reactionQuery =
          await _postRemoteDataProvider.getUserPostReactions(
              postIds: postIds, userId: _auth.currentUser!.uid);

      final QuerySnapshot<SavedPostDTO?> savedPostQuery =
          await _postRemoteDataProvider.getUserSavedPosts(
              postIds: postIds, userId: _auth.currentUser!.uid);

      final _postsDto = _handleDTOMapping(
        posts: postQuery,
        users: userQuery,
        reactions: reactionQuery,
        savedPosts: savedPostQuery,
      );

      List<Post> posts = AutoMapper.I.map<List<PostDTO>, List<Post>>(
        _postsDto,
      );

      return Right(Timeline(
          userCaughtUp: posts.length < Constants.pageSize, posts: posts));
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Timeline>> getPaginatedPosts(Post previousPost) async {
    try {
      final QuerySnapshot<PostDTO> postQuery =
          await _postRemoteDataProvider.getPaginatedPosts(previousPost);

      List<String> userIds =
          postQuery.docs.map((p) => p.data().user.id).toSet().toList();

      if (userIds.isEmpty) {
        return Right(Timeline(userCaughtUp: true, posts: []));
      }

      final QuerySnapshot<UserDTO> userQuery =
          await _userRemoteDataProvider.getUsersByIds(userIds: userIds);
      List<String> postIds =
          postQuery.docs.map((p) => p.data().id).toSet().toList();

      if (postIds.isEmpty) {
        return Right(Timeline(userCaughtUp: true, posts: []));
      }

      final QuerySnapshot<PostReactionDTO> reactionQuery =
          await _postRemoteDataProvider.getUserPostReactions(
              postIds: postIds, userId: _auth.currentUser!.uid);

      final QuerySnapshot<SavedPostDTO?> savedPostQuery =
          await _postRemoteDataProvider.getUserSavedPosts(
              postIds: postIds, userId: _auth.currentUser!.uid);
      final _postsDto = _handleDTOMapping(
          posts: postQuery,
          users: userQuery,
          reactions: reactionQuery,
          savedPosts: savedPostQuery);

      final posts = AutoMapper.I.map<List<PostDTO>, List<Post>>(
        _postsDto,
      );

      return Right(Timeline(
          userCaughtUp: posts.length < Constants.pageSize, posts: posts));
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> reactToPost(
      {required Post post,
      required UserModel user,
      required PostReaction reaction,
      required List<PostReaction> latestReactions}) async {
    try {
      final _result = await _postRemoteDataProvider.reactToPost(
          reaction: reaction, latestReactions: latestReactions);

      if (post.user.id != user.id) {
        late final String display;

        if (post.content.first.type == 'video') {
          display = post.content.first.metadata.thumbnail as String;
        } else {
          display = post.content.first.media;
        }

        final NotificationDTO notification = NotificationDTO(
          type: 1,
          mediaType: 1,
          recipientId: post.user.id,
          id: Helpers.generateId(25),
          metadata: NotificationMetadataDTO(),
          dateCreated: DateTime.now().microsecondsSinceEpoch,
          post: PartialPostDTO(id: post.id, display: display),
          user: UserDTO(id: user.id, username: user.username),
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
  Future<Either<Failure, bool>> unReactToPost(
      {required PostReaction reaction,
      required List<PostReaction> latestReactions}) async {
    try {
      return Right(await _postRemoteDataProvider.unReactToPost(
          reaction: reaction, latestReactions: latestReactions));
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> updatePostReaction(
      {required PostReaction reaction,
      required List<PostReaction> latestReactions}) async {
    try {
      return Right(await _postRemoteDataProvider.updatePostReaction(
          reaction: reaction, latestReactions: latestReactions));
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> savePost({
    required SavedPostDTO savedPost,
  }) async {
    try {
      return Right(
          await _postRemoteDataProvider.savePost(savedPost: savedPost));
    } catch (e) {
      return const Left(Failure(message: "Unable to favourite post"));
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

  List<PostDTO> _handleDTOMapping(
      {required QuerySnapshot<PostDTO> posts,
      required QuerySnapshot<UserDTO> users,
      required QuerySnapshot<SavedPostDTO?> savedPosts,
      required QuerySnapshot<PostReactionDTO> reactions}) {
    List<PostDTO> result = [];

    for (var document in posts.docs) {
      PostDTO post = document.data();

      post.user = users.docs.firstWhere((x) {
        return x.data().id == document.data().user.id;
      }).data();

      post.userReaction = reactions.docs.firstWhereOrNull((r) {
        return r.data().postId == post.id;
      })?.data();

      post.isSaved = savedPosts.docs.any((s) {
        return s.data()?.postId == post.id;
      });

      result.add(post);
    }

    return result;
  }
}
