import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import 'package:frienderr/core/failure/failure.dart';
import 'package:frienderr/core/usecase/usecase.dart';
import 'package:frienderr/features/data/models/post/post_model.dart';
import 'package:frienderr/features/domain/entities/post.dart';
import 'package:frienderr/features/domain/repositiories/post_repository.dart';

@lazySingleton
class GetPaginatedPostsUseCase
    extends UseCase<Timeline, GetPaginatedPostsParams> {
  GetPaginatedPostsUseCase(this.repository);

  final IPostRepository repository;

  @override
  Future<Either<Failure, Timeline>> call(GetPaginatedPostsParams params) {
    return repository.getPaginatedPosts(params.post);
  }
}

class GetPaginatedPostsParams {
  final Post post;
  GetPaginatedPostsParams({
    required this.post,
  });
}
