import 'package:dartz/dartz.dart';
import 'package:frienderr/features/domain/entities/comment.dart';
import 'package:frienderr/features/domain/entities/user.dart';
import 'package:frienderr/features/domain/repositiories/followers_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:frienderr/core/failure/failure.dart';
import 'package:frienderr/core/usecase/usecase.dart';
import 'package:frienderr/features/domain/repositiories/comment_repository.dart';

@lazySingleton
class GetFollowersUseCase
    extends UseCase<List<UserEntity>, GetFollowersParams> {
  GetFollowersUseCase(this.repository);

  final IFollowersRepository repository;

  @override
  Future<Either<Failure, List<UserEntity>>> call(GetFollowersParams params) {
    return repository.getFollowers(params.id);
  }
}

class GetFollowersParams {
  final String id;

  GetFollowersParams(this.id);
}
