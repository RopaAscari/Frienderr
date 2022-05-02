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
    extends UseCase<TimelineResponse, GetPaginatedPostsParams> {
  GetPaginatedPostsUseCase(this.repository);

  final IPostRepository repository;

  @override
  Future<Either<Failure, TimelineResponse>> call(
      GetPaginatedPostsParams params) {
    return repository.getPaginatedPosts(params.posts);
  }
}

class GetPaginatedPostsParams {
  final List<Map<String, dynamic>> posts;
  GetPaginatedPostsParams({
    required this.posts,
  });
}
