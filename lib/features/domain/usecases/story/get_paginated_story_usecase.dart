import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:frienderr/core/failure/failure.dart';
import 'package:frienderr/core/usecase/usecase.dart';
import 'package:frienderr/features/domain/entities/story.dart';
import 'package:frienderr/features/data/models/story/story_model.dart';
import 'package:frienderr/features/domain/repositiories/story_repository.dart';

@lazySingleton
class GetPaginatedStoryUseCase
    extends UseCase<StoryResponse, GetPaginatedStoryParams> {
  GetPaginatedStoryUseCase(this.repository);

  final IStoryRepository repository;

  @override
  Future<Either<Failure, StoryResponse>> call(GetPaginatedStoryParams params) {
    return repository.fetchPaginatedStories(
        params.userId, params.previousStory);
  }
}

class GetPaginatedStoryParams {
  final String userId;
  final Story previousStory;
  GetPaginatedStoryParams(this.userId, this.previousStory);
}
