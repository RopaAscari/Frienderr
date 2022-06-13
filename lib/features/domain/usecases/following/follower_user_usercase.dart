import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:frienderr/core/failure/failure.dart';
import 'package:frienderr/core/usecase/usecase.dart';
import 'package:frienderr/features/domain/entities/user.dart';
import 'package:frienderr/features/domain/repositiories/following_repository.dart';
import 'package:frienderr/features/domain/repositiories/followers_repository.dart';

@lazySingleton
class FollowUserUseCase extends UseCase<bool, FollowUserParams> {
  FollowUserUseCase(this.repository);

  final IFollowingRepository repository;

  @override
  Future<Either<Failure, bool>> call(FollowUserParams params) {
    return repository.followUser(uid: params.uid, fid: params.fid);
  }
}

class FollowUserParams {
  final String uid;
  final String fid;

  FollowUserParams(this.uid, this.fid);
}
