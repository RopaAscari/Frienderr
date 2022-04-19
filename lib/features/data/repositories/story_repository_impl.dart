import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:frienderr/core/failure/failure.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:frienderr/features/data/providers/story_provider.dart';
import 'package:frienderr/features/domain/repositiories/story_repository.dart';

@LazySingleton(as: IStoryRepository)
class StoryRepository implements IStoryRepository {
  final IStoryDataRemoteProvider _storyDataProvider;

  StoryRepository(this._storyDataProvider);

  Either<Failure, Stream<QuerySnapshot<Map<String, dynamic>>>>
      delegateStoryStream(String userId) {
    try {
      return Right(_storyDataProvider.delegateStoryStream(userId));
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
