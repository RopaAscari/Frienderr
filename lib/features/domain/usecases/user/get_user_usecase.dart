import 'package:dartz/dartz.dart';
import 'package:frienderr/features/data/models/user/user_model.dart';
import 'package:injectable/injectable.dart';
import 'package:frienderr/core/failure/failure.dart';
import 'package:frienderr/core/usecase/usecase.dart';
import 'package:frienderr/features/domain/entities/user.dart';
import 'package:frienderr/features/domain/repositiories/user_repository.dart';

@lazySingleton
class GetUserUseCase extends UseCase<UserModel, GetUserParams> {
  GetUserUseCase(this.repository);

  final IUserRepository repository;

  @override
  Future<Either<Failure, UserModel>> call(GetUserParams params) {
    return repository.getUser(uid: params.uid);
  }
}

class GetUserParams {
  String uid;
  GetUserParams({
    required this.uid,
  });
}
