import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:frienderr/core/failure/failure.dart';
import 'package:frienderr/core/usecase/usecase.dart';
import 'package:frienderr/features/domain/entities/media_asset.dart';
import 'package:frienderr/features/domain/repositiories/post_repository.dart';

@lazySingleton
class CreatePostUseCase extends UseCase<bool, CreatePostParams> {
  CreatePostUseCase(this.repository);

  final IPostRepository repository;

  @override
  Future<Either<Failure, bool>> call(CreatePostParams params) {
    return repository.createPost(
        caption: params.caption, assets: params.assets);
  }
}

class CreatePostParams {
  final String caption;
  final List<GalleryAsset> assets;

  CreatePostParams({
    required this.caption,
    required this.assets,
  });
}
