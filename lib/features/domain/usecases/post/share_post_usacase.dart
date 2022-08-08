import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:frienderr/core/failure/failure.dart';
import 'package:frienderr/core/usecase/usecase.dart';
import 'package:frienderr/features/domain/entities/save_post.dart';
import 'package:frienderr/features/domain/repositiories/post_repository.dart';

@lazySingleton
class SharePostUseCase extends UseCase<bool, SharePostParams> {
  SharePostUseCase(this.repository);

  final IPostRepository repository;

  @override
  Future<Either<Failure, bool>> call(SharePostParams params) {
    return repository.updatePostShares(postId: params.postId);
  }
}

class SharePostParams {
  final String postId;

  SharePostParams(this.postId);
}
