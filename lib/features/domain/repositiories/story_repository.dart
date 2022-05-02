import 'package:dartz/dartz.dart';
import 'package:frienderr/core/failure/failure.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:frienderr/features/domain/entities/story.dart';
import 'package:frienderr/features/domain/entities/media_asset.dart';

abstract class IStoryRepository {
  Future<Either<Failure, bool>> createStory(
      {required List<GalleryAsset> assets});
  Future<Either<Failure, bool>> updateStory(
      {required List<GalleryAsset> assets});
  Either<Failure, Stream<QuerySnapshot<Map<String, dynamic>>>>
      delegateStoryStream(String userId);

  Future<Either<Failure, StoryResponse>> fetchStories(String userId);
}
