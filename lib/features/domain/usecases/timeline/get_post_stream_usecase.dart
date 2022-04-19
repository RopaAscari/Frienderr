import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:frienderr/core/failure/failure.dart';
import 'package:frienderr/core/usecase/usecase.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:frienderr/features/domain/entities/post.dart';
import 'package:frienderr/features/domain/repositiories/post_repository.dart';

@lazySingleton
class GetPostsStreamUseCase extends NoFuturisticUseCase<
    Stream<QuerySnapshot<Map<String, dynamic>>>, GetTimelineStreamParams> {
  GetPostsStreamUseCase(this.repository);

  final IPostRepository repository;

  @override
  Either<Failure, Stream<QuerySnapshot<Map<String, dynamic>>>> call(
      GetTimelineStreamParams params) {
    return repository.delegateTimelineStream();
  }
}

class GetTimelineStreamParams {}
