import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:frienderr/core/failure/failure.dart';
import 'package:frienderr/core/usecase/usecase.dart';
import 'package:frienderr/features/domain/entities/user.dart';
import 'package:frienderr/features/domain/repositiories/following_repository.dart';

@lazySingleton
class GetFollowingUseCase extends UseCase<List<String>, GetFollowingParams> {
  GetFollowingUseCase(this.repository);

  final IFollowingRepository repository;

  @override
  Future<Either<Failure, List<String>>> call(GetFollowingParams params) {
    return repository.getFollowing(params.id);
  }
}

class GetFollowingParams {
  final String id;

  GetFollowingParams(this.id);
}
