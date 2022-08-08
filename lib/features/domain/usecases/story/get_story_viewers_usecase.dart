import 'package:dartz/dartz.dart';
import 'package:frienderr/features/domain/entities/story_view.dart';
import 'package:injectable/injectable.dart';
import 'package:frienderr/core/failure/failure.dart';
import 'package:frienderr/core/usecase/usecase.dart';
import 'package:frienderr/features/data/models/user/user_model.dart';
import 'package:frienderr/features/domain/repositiories/story_repository.dart';

@lazySingleton
class GetStoryViewersUseCase
    extends UseCase<StoryViewResponse, GetStoryViewersParams> {
  GetStoryViewersUseCase(this.repository);

  final IStoryRepository repository;

  @override
  Future<Either<Failure, StoryViewResponse>> call(
      GetStoryViewersParams params) {
    return repository.getStoryViewers(
        userId: params.userId, contentId: params.contentId);
  }
}

class GetStoryViewersParams {
  final String userId;
  final String contentId;
  GetStoryViewersParams(this.userId, this.contentId);
}
