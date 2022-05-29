import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:frienderr/core/failure/failure.dart';
import 'package:frienderr/core/usecase/usecase.dart';
import 'package:frienderr/features/domain/entities/user.dart';
import 'package:frienderr/features/domain/repositiories/following_repository.dart';

@lazySingleton
class GetFollowersUseCase extends UseCase<List<String>, GetFollowersParams> {
  GetFollowersUseCase(this.repository);

  final IFollowingRepository repository;

  @override
  Future<Either<Failure, List<String>>> call(GetFollowersParams params) {
    return repository.getFollowing(params.id);
  }
}

class GetFollowersParams {
  final String id;

  GetFollowersParams(this.id);
}
