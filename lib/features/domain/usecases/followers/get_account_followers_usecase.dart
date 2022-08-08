import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:frienderr/core/failure/failure.dart';
import 'package:frienderr/core/usecase/usecase.dart';
import 'package:frienderr/features/domain/entities/user.dart';
import 'package:frienderr/features/domain/repositiories/followers_repository.dart';

@lazySingleton
class GetAccountFollowersUseCase
    extends UseCase<int, GetAccountFollowersParams> {
  GetAccountFollowersUseCase(this.repository);

  final IFollowersRepository repository;

  @override
  Future<Either<Failure, int>> call(GetAccountFollowersParams params) {
    return repository.getFollowersCount(params.uid);
  }
}

class GetAccountFollowersParams {
  final String uid;

  GetAccountFollowersParams(this.uid);
}
