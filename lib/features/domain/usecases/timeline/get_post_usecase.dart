import 'package:dartz/dartz.dart';
import 'package:frienderr/features/data/models/post/post_model.dart';
import 'package:injectable/injectable.dart';

import 'package:frienderr/core/failure/failure.dart';
import 'package:frienderr/core/usecase/usecase.dart';
import 'package:frienderr/features/domain/entities/post.dart';
import 'package:frienderr/features/domain/repositiories/post_repository.dart';

@lazySingleton
class GetPostUseCase extends UseCase<Post, GetPostParams> {
  GetPostUseCase(this.repository);

  final IPostRepository repository;

  @override
  Future<Either<Failure, Post>> call(GetPostParams params) {
    return repository.getPost(postId: params.postId);
  }
}

class GetPostParams {
  final String postId;
  GetPostParams({
    required this.postId,
  });
}
