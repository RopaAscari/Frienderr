import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:frienderr/core/failure/failure.dart';
import 'package:frienderr/core/usecase/usecase.dart';
import 'package:frienderr/features/domain/entities/story.dart';
import 'package:frienderr/features/domain/repositiories/story_repository.dart';

@lazySingleton
class GetStoryUseCase extends UseCase<StoryResponse, GetStoryParams> {
  GetStoryUseCase(this.repository);

  final IStoryRepository repository;

  @override
  Future<Either<Failure, StoryResponse>> call(GetStoryParams params) {
    return repository.fetchStories(params.userId);
  }
}

class GetStoryParams {
  final String userId;
  GetStoryParams(this.userId);
}
