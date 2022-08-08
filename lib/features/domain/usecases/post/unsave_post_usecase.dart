import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:frienderr/core/failure/failure.dart';
import 'package:frienderr/core/usecase/usecase.dart';
import 'package:frienderr/features/domain/entities/save_post.dart';
import 'package:frienderr/features/domain/repositiories/post_repository.dart';

@lazySingleton
class UnSavePostUseCase extends UseCase<bool, UnSavePostParams> {
  UnSavePostUseCase(this.repository);

  final IPostRepository repository;

  @override
  Future<Either<Failure, bool>> call(UnSavePostParams params) {
    return repository.unSavePost(userId: params.userId, postId: params.postId);
  }
}

class UnSavePostParams {
  final String userId;
  final String postId;

  UnSavePostParams(this.userId, this.postId);
}
