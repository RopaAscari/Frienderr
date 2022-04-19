import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:frienderr/core/failure/failure.dart';
import 'package:frienderr/core/usecase/usecase.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:frienderr/features/domain/entities/quick.dart';
import 'package:frienderr/features/domain/repositiories/quick_repository.dart';
import 'package:frienderr/features/domain/repositiories/story_repository.dart';

@lazySingleton
class GetStoryStreamUseCase extends NoFuturisticUseCase<
    Stream<QuerySnapshot<Map<String, dynamic>>>, GetStoryStreamParams> {
  GetStoryStreamUseCase(this.repository);

  final IStoryRepository repository;

  @override
  Either<Failure, Stream<QuerySnapshot<Map<String, dynamic>>>> call(
      GetStoryStreamParams params) {
    return repository.delegateStoryStream(params.userId);
  }
}

class GetStoryStreamParams {
  final String userId;
  GetStoryStreamParams(this.userId);
}
