import 'package:dartz/dartz.dart';
import 'package:frienderr/core/failure/failure.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:frienderr/features/data/models/story/story_content.dart';
import 'package:frienderr/features/data/models/story/story_model.dart';
import 'package:frienderr/features/domain/entities/story.dart';
import 'package:frienderr/features/domain/entities/media_asset.dart';
import 'package:frienderr/features/domain/entities/story_view.dart';

abstract class IStoryRepository {
  Future<Either<Failure, bool>> createStory(
      {required List<GalleryAsset> assets});
  Future<Either<Failure, bool>> updateStory(
      {required String userId, required List<GalleryAsset> assets});
  Either<Failure, Stream<QuerySnapshot<Map<String, dynamic>>>>
      delegateStoryStream(String userId);

  Future<Either<Failure, bool>> viewStory(
      {required String userId,
      required String storyId,
      required String contentId,
      required List<StoryContent> stories});

  Future<Either<Failure, StoryViewResponse>> getPaginatedStoryViewers(
      {required String userId,
      required String contentId,
      required int previousStoryViewerTimestamp});

  Future<Either<Failure, StoryViewResponse>> getStoryViewers({
    required String userId,
    required String contentId,
  });

  Future<Either<Failure, StoryResponse>> fetchStories(String userId);

  Future<Either<Failure, StoryResponse>> fetchPaginatedStories(
      String userId, Story story);
  Future<Either<Failure, bool>> deleteStory(
      {required bool isLast,
      required String userId,
      required List<StoryContent>? content});
}
