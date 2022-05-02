import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:frienderr/core/failure/failure.dart';
import 'package:frienderr/core/usecase/usecase.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:frienderr/features/domain/entities/media_asset.dart';
import 'package:frienderr/features/domain/repositiories/story_repository.dart';

@lazySingleton
class CreateStoryUseCase extends UseCase<bool, CreateStoryParams> {
  CreateStoryUseCase(this.repository);

  final IStoryRepository repository;

  @override
  Future<Either<Failure, bool>> call(CreateStoryParams params) {
    return repository.createStory(assets: params.assets);
  }
}

class CreateStoryParams {
  final List<GalleryAsset> assets;
  CreateStoryParams(this.assets);
}
