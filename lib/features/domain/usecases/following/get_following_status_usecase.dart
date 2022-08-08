import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:frienderr/core/failure/failure.dart';
import 'package:frienderr/core/usecase/usecase.dart';
import 'package:frienderr/features/domain/entities/user.dart';
import 'package:frienderr/features/domain/repositiories/following_repository.dart';

@lazySingleton
class GetFollowingStatusUseCase
    extends UseCase<bool, GetFollowingStatusParams> {
  GetFollowingStatusUseCase(this.repository);

  final IFollowingRepository repository;

  @override
  Future<Either<Failure, bool>> call(GetFollowingStatusParams params) {
    return repository.getFollowingStatus(uid: params.id);
  }
}

class GetFollowingStatusParams {
  final String id;

  GetFollowingStatusParams(this.id);
}
