import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:frienderr/core/failure/failure.dart';
import 'package:frienderr/core/usecase/usecase.dart';
import 'package:frienderr/features/data/models/user/user_model.dart';
import 'package:frienderr/features/domain/repositiories/followers_repository.dart';

@lazySingleton
class GetProfileFollowersListUseCase
    extends UseCase<List<UserModel>, GetProfileFollowersListParams> {
  GetProfileFollowersListUseCase(this.repository);

  final IFollowersRepository repository;

  @override
  Future<Either<Failure, List<UserModel>>> call(
      GetProfileFollowersListParams params) {
    return repository.getProfileFollowersList(params.uid);
  }
}

class GetProfileFollowersListParams {
  final String uid;

  GetProfileFollowersListParams(this.uid);
}
