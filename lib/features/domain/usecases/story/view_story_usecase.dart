import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:frienderr/core/failure/failure.dart';
import 'package:frienderr/core/usecase/usecase.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:frienderr/features/domain/entities/media_asset.dart';
import 'package:frienderr/features/data/models/story/story_content.dart';
import 'package:frienderr/features/domain/repositiories/story_repository.dart';

@lazySingleton
class ViewStoryUseCase extends UseCase<bool, ViewStoryParams> {
  ViewStoryUseCase(this.repository);

  final IStoryRepository repository;

  @override
  Future<Either<Failure, bool>> call(ViewStoryParams params) {
    return repository.viewStory(
        userId: params.userId,
        storyId: params.storyId,
        stories: params.stories);
  }
}

class ViewStoryParams {
  final String userId;
  final String storyId;
  final List<StoryContent> stories;
  ViewStoryParams(this.userId, this.storyId, this.stories);
}
