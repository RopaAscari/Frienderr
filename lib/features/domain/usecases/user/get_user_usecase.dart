import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:frienderr/core/failure/failure.dart';
import 'package:frienderr/core/usecase/usecase.dart';
import 'package:frienderr/features/domain/entities/user.dart';
import 'package:frienderr/features/domain/repositiories/user_repository.dart';

@lazySingleton
class GetUserUseCase extends UseCase<UserEntity, GetUserParams> {
  GetUserUseCase(this.repository);

  final IUserRepository repository;

  @override
  Future<Either<Failure, UserEntity>> call(GetUserParams params) {
    return repository.getUser(uid: params.uid);
  }
}

class GetUserParams {
  String uid;
  GetUserParams({
    required this.uid,
  });
}
