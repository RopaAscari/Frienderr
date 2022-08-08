import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:automap/automap.dart';
import '../models/user/user_model.dart';
import 'package:injectable/injectable.dart';
import 'package:collection/collection.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:frienderr/core/failure/failure.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:frienderr/features/domain/entities/user.dart';
import 'package:frienderr/features/domain/entities/story.dart';
import 'package:frienderr/features/domain/entities/story_view.dart';
import 'package:frienderr/features/domain/entities/media_asset.dart';
import 'package:frienderr/features/data/providers/user_provider.dart';
import 'package:frienderr/features/data/models/story/story_media.dart';
import 'package:frienderr/features/data/models/story/story_model.dart';
import 'package:frienderr/features/data/providers/story_provider.dart';
import 'package:frienderr/features/data/models/story/story_content.dart';
import 'package:frienderr/features/data/models/story/story_metadata.dart';
import 'package:frienderr/features/presentation/navigation/app_router.dart';
import 'package:frienderr/features/domain/repositiories/story_repository.dart';

@LazySingleton(as: IStoryRepository)
class StoryRepository implements IStoryRepository {
  final FirebaseAuth auth;
  final IStoryDataRemoteProvider _storyDataProvider;
  final IUserDataRemoteProvider _userRemoteDataProvider;

  StoryRepository(
      this.auth, this._storyDataProvider, this._userRemoteDataProvider);

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
      log('init');
      late Late<Story?> _userStory = Late(null);
      final storyQuery = await _storyDataProvider.fetchStories(userId);

      log('fetching');

      List<String> userIds =
          storyQuery.docs.map((p) => p.data().user.id).toSet().toList();

      final userStoryQuery = await _storyDataProvider.fetchUserStory(userId);

      final userStory = userStoryQuery.data();

      if (userStory != null) {
        userStory.content.sort((a, b) {
          if (a.dateCreated > b.dateCreated) {
            return -1;
          } else if (a.dateCreated < b.dateCreated) {
            return 1;
          } else {
            return 0;
          }
        });

        _userStory.value = AutoMapper.I.map<StoryDTO, Story>(
          userStory,
        );
      } else {
        _userStory.value = null;
      }

      if (userIds.isEmpty) {
        return Right(StoryResponse(
            stories: [],
            userStory: UserStory(
              story: _userStory.value,
              doesUserHaveStories: _userStory.value != null,
            )));
      }

      final QuerySnapshot<UserDTO> userQuery =
          await _userRemoteDataProvider.getUsersByIds(userIds: userIds);

      List<String> latestContentIds = storyQuery.docs
          .map((p) {
            final content = p.data().content;
            return content[content.length - 1].id;
          })
          .toSet()
          .toList();

      final QuerySnapshot<StoryViewDTO?> storyViewQuery =
          await _storyDataProvider.fetchUserStoryViews(
              latestContentIds: latestContentIds,
              userId: auth.currentUser!.uid);

      final _storiesDto = _handleQueryMapping(
          stories: storyQuery, users: userQuery, views: storyViewQuery);

      final _stories = AutoMapper.I.map<List<StoryDTO>, List<Story>>(
        _storiesDto,
      );

      return Right(StoryResponse(
          stories: _stories,
          userStory: UserStory(
            story: _userStory.value,
            doesUserHaveStories: _userStory.value != null,
          )));
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, StoryResponse>> fetchPaginatedStories(
      String userId, Story previousStory) async {
    try {
      late Late<Story?> _userStory = Late(null);
      final storyQuery =
          await _storyDataProvider.fetchPaginatedStories(userId, previousStory);

      List<String> userIds =
          storyQuery.docs.map((p) => p.data().user.id).toSet().toList();

      final userStoryQuery = await _storyDataProvider.fetchUserStory(userId);

      StoryDTO? userStory = userStoryQuery.data();

      if (userStory != null) {
        userStory.content.sort((a, b) {
          if (a.dateCreated > b.dateCreated) {
            return -1;
          } else if (a.dateCreated < b.dateCreated) {
            return 1;
          } else {
            return 0;
          }
        });
        _userStory.value = AutoMapper.I.map<StoryDTO, Story>(
          userStory,
        );
      } else {
        _userStory.value = null;
      }

      if (userIds.isEmpty) {
        return Right(StoryResponse(
            stories: [],
            userStory: UserStory(
              story: _userStory.value,
              doesUserHaveStories: _userStory.value != null,
            )));
      }

      final QuerySnapshot<UserDTO> userQuery =
          await _userRemoteDataProvider.getUsersByIds(userIds: userIds);

      List<String> latestContentIds = storyQuery.docs
          .map((p) {
            final content = p.data().content;
            return content[content.length - 1].id;
          })
          .toSet()
          .toList();

      final QuerySnapshot<StoryViewDTO?> storyViewQuery =
          await _storyDataProvider.fetchUserStoryViews(
              latestContentIds: latestContentIds,
              userId: auth.currentUser!.uid);

      final _storiesDto = _handleQueryMapping(
          stories: storyQuery, users: userQuery, views: storyViewQuery);

      final _stories = AutoMapper.I.map<List<StoryDTO>, List<Story>>(
        _storiesDto,
      );

      return Right(StoryResponse(
          stories: _stories,
          userStory: UserStory(
            story: _userStory.value,
            doesUserHaveStories: _userStory.value != null,
          )));
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
      required String contentId,
      required List<StoryContent> stories}) async {
    try {
      return Right(await _storyDataProvider.viewStory(
          userId: userId,
          stories: stories,
          storyId: storyId,
          contentId: contentId));
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> deleteStory(
      {required bool isLast,
      required String userId,
      required List<StoryContent>? content}) async {
    try {
      final _content =
          AutoMapper.I.map<List<StoryContent>, List<StoryContentDTO>>(
        content!,
      );

      return Right(await _storyDataProvider.deleteStory(
          userId: userId, isLast: isLast, content: _content));
    } catch (e) {
      log(e.toString());
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, StoryViewResponse>> getPaginatedStoryViewers(
      {required String userId,
      required String contentId,
      required int previousStoryViewerTimestamp}) async {
    try {
      final _viewers = await _storyDataProvider.getPaginatedStoryViewers(
          userId: userId,
          contentId: contentId,
          previousStoryViewerTimestamp: previousStoryViewerTimestamp);

      final List<String?> userIds =
          _viewers.docs.map((x) => x.data()?.userId).toSet().toList();

      final QuerySnapshot<UserDTO> userQuery = await _userRemoteDataProvider
          .getUsersByIds(userIds: userIds as List<String>);

      final users = userQuery.docs.map((x) => x.data()).toList();

      final _users = AutoMapper.I.map<List<UserDTO>, List<UserModel>>(
        users,
      );

      return Right(
          StoryViewResponse(users: _users, previousStoryViewerTimestamp: 0));
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, StoryViewResponse>> getStoryViewers({
    required String userId,
    required String contentId,
  }) async {
    try {
      final _viewers = await _storyDataProvider.getStoryViewers(
        userId: userId,
        contentId: contentId,
      );

      final List<String> userIds =
          _viewers.docs.map((x) => x.data()!.userId).toSet().toList();

      if (userIds.isEmpty) {
        return Right(
            StoryViewResponse(users: [], previousStoryViewerTimestamp: 0));
      }

      final QuerySnapshot<UserDTO> userQuery =
          await _userRemoteDataProvider.getUsersByIds(userIds: userIds);

      final users = userQuery.docs.map((x) => x.data()).toList();

      final _users = AutoMapper.I.map<List<UserDTO>, List<UserModel>>(
        users,
      );

      return Right(
          StoryViewResponse(users: _users, previousStoryViewerTimestamp: 0));
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  List<StoryDTO> _handleQueryMapping(
      {required QuerySnapshot<UserDTO> users,
      required QuerySnapshot<StoryDTO> stories,
      required QuerySnapshot<StoryViewDTO?> views}) {
    List<StoryDTO> result = [];

    for (var document in stories.docs) {
      StoryDTO story = document.data();

      if (story.user.id != auth.currentUser!.uid) {
        story.user = users.docs
            .firstWhere((x) => x.data().id == document.data().user.id)
            .data();

        story.content = story.content.map((x) {
          x.isViewed = views.docs.any((v) => v.data()?.contentId == x.id);

          return x;
        }).toList();

        story.content.sort((a, b) {
          if (a.dateCreated > b.dateCreated) {
            return -1;
          } else if (a.dateCreated < b.dateCreated) {
            return 1;
          } else {
            return 0;
          }
        });

        result.add(story);
      }
    }

    return result;
  }
}
