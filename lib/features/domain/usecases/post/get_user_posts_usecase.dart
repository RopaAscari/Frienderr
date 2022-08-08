import 'package:dartz/dartz.dart';
import 'package:frienderr/features/data/models/post/post_model.dart';
import 'package:frienderr/features/domain/entities/post.dart';
import 'package:injectable/injectable.dart';
import 'package:frienderr/core/failure/failure.dart';
import 'package:frienderr/core/usecase/usecase.dart';
import 'package:frienderr/features/domain/repositiories/post_repository.dart';

@lazySingleton
class GetUserPostsUseCase extends UseCase<List<Post>, GetUserPostsParams> {
  GetUserPostsUseCase(this.repository);

  final IPostRepository repository;

  @override
  Future<Either<Failure, List<Post>>> call(GetUserPostsParams params) {
    return repository.getUserPosts(uid: params.uid);
  }
}

class GetUserPostsParams {
  final String uid;

  GetUserPostsParams(
    this.uid,
  );
}
