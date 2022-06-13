import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:frienderr/core/failure/failure.dart';
import 'package:frienderr/core/usecase/usecase.dart';
import 'package:frienderr/features/domain/entities/user.dart';
import 'package:frienderr/features/domain/repositiories/following_repository.dart';
import 'package:frienderr/features/domain/repositiories/followers_repository.dart';

@lazySingleton
class UnFollowUserUseCase extends UseCase<bool, UnFollowUserParams> {
  UnFollowUserUseCase(this.repository);

  final IFollowingRepository repository;

  @override
  Future<Either<Failure, bool>> call(UnFollowUserParams params) {
    return repository.unfollowUser(uid: params.uid, fid: params.fid);
  }
}

class UnFollowUserParams {
  final String uid;
  final String fid;

  UnFollowUserParams(this.uid, this.fid);
}
