import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:frienderr/core/failure/failure.dart';
import 'package:frienderr/core/usecase/usecase.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:frienderr/features/domain/entities/media_asset.dart';
import 'package:frienderr/features/domain/repositiories/story_repository.dart';

@lazySingleton
class UpdateStoryUseCase extends UseCase<bool, UpdateStoryParams> {
  UpdateStoryUseCase(this.repository);

  final IStoryRepository repository;

  @override
  Future<Either<Failure, bool>> call(UpdateStoryParams params) {
    return repository.updateStory(assets: params.assets);
  }
}

class UpdateStoryParams {
  final List<GalleryAsset> assets;
  UpdateStoryParams(this.assets);
}
