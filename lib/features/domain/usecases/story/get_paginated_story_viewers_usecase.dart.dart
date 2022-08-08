import 'package:dartz/dartz.dart';
import 'package:frienderr/features/data/models/user/user_model.dart';
import 'package:frienderr/features/domain/entities/story_view.dart';
import 'package:injectable/injectable.dart';
import 'package:frienderr/core/failure/failure.dart';
import 'package:frienderr/core/usecase/usecase.dart';
import 'package:frienderr/features/domain/entities/story.dart';
import 'package:frienderr/features/data/models/story/story_model.dart';
import 'package:frienderr/features/domain/repositiories/story_repository.dart';

@lazySingleton
class GetPaginatedStoryViewersUseCase
    extends UseCase<StoryViewResponse, GetPaginatedStoryViewersParams> {
  GetPaginatedStoryViewersUseCase(this.repository);

  final IStoryRepository repository;

  @override
  Future<Either<Failure, StoryViewResponse>> call(
      GetPaginatedStoryViewersParams params) {
    return repository.getPaginatedStoryViewers(
        userId: params.userId,
        contentId: params.contentId,
        previousStoryViewerTimestamp: params.previousStoryViewerTimestamp);
  }
}

class GetPaginatedStoryViewersParams {
  final String userId;
  final String contentId;
  final int previousStoryViewerTimestamp;
  GetPaginatedStoryViewersParams(
      this.userId, this.contentId, this.previousStoryViewerTimestamp);
}
