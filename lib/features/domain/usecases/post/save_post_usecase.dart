import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:frienderr/core/failure/failure.dart';
import 'package:frienderr/core/usecase/usecase.dart';
import 'package:frienderr/features/domain/entities/save_post.dart';
import 'package:frienderr/features/domain/repositiories/post_repository.dart';

@lazySingleton
class SavePostUseCase extends UseCase<bool, SavePostParams> {
  SavePostUseCase(this.repository);

  final IPostRepository repository;

  @override
  Future<Either<Failure, bool>> call(SavePostParams params) {
    return repository.savePost(savedPost: params.savedPost);
  }
}

class SavePostParams {
  final SavedPostDTO savedPost;

  SavePostParams(
    this.savedPost,
  );
}
