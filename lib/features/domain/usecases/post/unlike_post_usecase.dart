import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:frienderr/core/failure/failure.dart';
import 'package:frienderr/core/usecase/usecase.dart';
import 'package:frienderr/features/domain/repositiories/post_repository.dart';

@lazySingleton
class UnLikePostUseCase extends UseCase<bool, UnLikePostParams> {
  UnLikePostUseCase(this.repository);

  final IPostRepository repository;

  @override
  Future<Either<Failure, bool>> call(UnLikePostParams params) {
    return repository.unLikePost(params.postId, params.userId);
  }
}

class UnLikePostParams {
  final String postId;
  final String userId;
  UnLikePostParams(this.postId, this.userId);
}
