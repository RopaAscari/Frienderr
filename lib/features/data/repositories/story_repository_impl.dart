import 'package:dartz/dartz.dart';
import '../models/user/user_model.dart';
import 'package:injectable/injectable.dart';
import 'package:collection/collection.dart';
import 'package:frienderr/core/failure/failure.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:frienderr/features/domain/entities/story.dart';
import 'package:frienderr/features/domain/entities/media_asset.dart';
import 'package:frienderr/features/data/providers/user_provider.dart';
import 'package:frienderr/features/data/models/story/story_media.dart';
import 'package:frienderr/features/data/models/story/story_model.dart';
import 'package:frienderr/features/data/providers/story_provider.dart';
import 'package:frienderr/features/data/models/story/story_content.dart';
import 'package:frienderr/features/data/models/story/story_metadata.dart';
import 'package:frienderr/features/domain/repositiories/story_repository.dart';

@LazySingleton(as: IStoryRepository)
class StoryRepository implements IStoryRepository {
  final IStoryDataRemoteProvider _storyDataProvider;
  final IUserDataRemoteProvider _userRemoteDataProvider;

  StoryRepository(this._storyDataProvider, this._userRemoteDataProvider);

  @override
  Either<Failure, Stream<QuerySnapshot<Map<String, dynamic>>>>
      delegateStoryStream(String userId) {
    try {
      return Right(_storyDataProvider.delegateStoryStream(userId));
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, StoryResponse>> fetchStories(String userId) async {
    try {
      final _rawStories = await _storyDataProvider.fetchStories(userId);

      final QuerySnapshot<Object?> _users =
          await _userRemoteDataProvider.getPlatformUsers();

      final List<StoryModel> _stories =
          storiesFromJson(_rawStories.docs, _users.docs);

      final _userStory = _stories.firstWhereOrNull((story) {
        return story.user.id == userId;
      });

      _stories.removeWhere((item) => item.id == userId);

      final _storyResponse = StoryResponse(
          stories: _stories.cast<StoryModel>(),
          userStory: UserStory(
            story: _userStory,
            doesUserHaveStories: _userStory != null,
          ));

      return Right(_storyResponse);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> createStory(
      {required List<GalleryAsset> assets}) async {
    try {
      return Right(await _storyDataProvider.createStory(assets: assets));
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> updateStory(
      {required String userId, required List<GalleryAsset> assets}) async {
    try {
      return Right(
          await _storyDataProvider.updateStory(userId: userId, assets: assets));
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> viewStory(
      {required String userId,
      required String storyId,
      required List<StoryContent> stories}) async {
    try {
      return Right(await _storyDataProvider.viewStory(
          userId: userId, storyId: storyId, stories: stories));
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> deleteStory(
      {required bool isLast,
      required String userId,
      required StoryContent story}) async {
    try {
      return Right(await _storyDataProvider.deleteStory(
          userId: userId, isLast: isLast, story: story));
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  List<StoryModel> storiesFromJson(List<QueryDocumentSnapshot<Object?>> stories,
      List<QueryDocumentSnapshot<Object?>> users) {
    return stories.map((post) {
      final data = post.data() as Map<String, dynamic>;

      final List<StoryContent> content = data['content']
          .map((content) {
            return StoryContent(
              id: content['id'],
              dateCreated: content['dateCreated'],
              views: content['views'].cast<String>(),
              likes: content['likes'].cast<String>(),
              media: StoryMedia(
                  url: content['media']['url'],
                  type: content['media']['type'],
                  metadata: StoryMetadataModel(
                      duration: content['media']['metadata']['duration'],
                      thumbnail: content['media']['metadata']['thumbnail'])),
            );
          })
          .toList()
          .cast<StoryContent>();

      final UserModel user = UserModel.fromJson(users.firstWhere((user) {
        return (user.data() as Map)['id'] == data['user']['id'];
      }).data() as Map<String, dynamic>);

      return StoryModel(
        user: user,
        id: data['id'],
        content: content,
        dateUpdated: data['dateUpdated'],
      );
    }).toList();
  }
}
