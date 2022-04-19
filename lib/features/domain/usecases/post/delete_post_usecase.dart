import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:frienderr/core/failure/failure.dart';
import 'package:frienderr/core/usecase/usecase.dart';
import 'package:frienderr/features/domain/repositiories/post_repository.dart';

@lazySingleton
class DeletePostUseCase extends UseCase<bool, DeletePostParams> {
  DeletePostUseCase(this.repository);

  final IPostRepository repository;

  @override
  Future<Either<Failure, bool>> call(DeletePostParams params) {
    return repository.deletePost(params.postId);
  }
}

class DeletePostParams {
  final String postId;

  DeletePostParams(
    this.postId,
  );
}
