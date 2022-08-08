import 'package:dartz/dartz.dart';
import 'package:frienderr/features/data/models/story/story_content.dart';
import 'package:injectable/injectable.dart';
import 'package:frienderr/core/failure/failure.dart';
import 'package:frienderr/core/usecase/usecase.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:frienderr/features/domain/entities/story.dart';
import 'package:frienderr/features/domain/entities/media_asset.dart';
import 'package:frienderr/features/domain/repositiories/story_repository.dart';

@lazySingleton
class DeleteStoryUseCase extends UseCase<bool, DeleteStoryParams> {
  DeleteStoryUseCase(this.repository);

  final IStoryRepository repository;

  @override
  Future<Either<Failure, bool>> call(DeleteStoryParams params) {
    return repository.deleteStory(
        userId: params.userId, isLast: params.isLast, content: params.content);
  }
}

class DeleteStoryParams {
  final bool isLast;
  final String userId;
  final List<StoryContent>? content;
  DeleteStoryParams(this.isLast, this.userId, this.content);
}
