import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:frienderr/core/failure/failure.dart';
import 'package:frienderr/core/usecase/usecase.dart';
import 'package:frienderr/features/domain/entities/user.dart';
import 'package:frienderr/features/domain/repositiories/followers_repository.dart';

@lazySingleton
class GetAccountFollowersUseCase
    extends UseCase<List<String>, GetAccountFollowersParams> {
  GetAccountFollowersUseCase(this.repository);

  final IFollowersRepository repository;

  @override
  Future<Either<Failure, List<String>>> call(GetAccountFollowersParams params) {
    return repository.getFollowers(params.uid);
  }
}

class GetAccountFollowersParams {
  final String uid;

  GetAccountFollowersParams(this.uid);
}
