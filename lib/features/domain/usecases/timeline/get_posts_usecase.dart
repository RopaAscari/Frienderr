import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:frienderr/core/failure/failure.dart';
import 'package:frienderr/core/usecase/usecase.dart';
import 'package:frienderr/features/domain/entities/post.dart';
import 'package:frienderr/features/domain/repositiories/post_repository.dart';

@lazySingleton
class GetPostsUseCase extends UseCase<Timeline, GetPostsParams> {
  GetPostsUseCase(this.repository);

  final IPostRepository repository;

  @override
  Future<Either<Failure, Timeline>> call(GetPostsParams params) {
    return repository.getPosts();
  }
}

class GetPostsParams {}
