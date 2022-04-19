import 'package:dartz/dartz.dart';
import 'package:frienderr/features/domain/entities/user.dart';
import 'package:frienderr/features/domain/repositiories/user_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:frienderr/core/failure/failure.dart';
import 'package:frienderr/core/usecase/usecase.dart';
import 'package:frienderr/features/data/models/post/post_model.dart';
import 'package:frienderr/features/domain/repositiories/post_repository.dart';

@lazySingleton
class GetPlatformUsersUseCase
    extends UseCase<List<UserEntity>, GetPlatformUsersParams> {
  GetPlatformUsersUseCase(this.repository);

  final IUserRepository repository;

  @override
  Future<Either<Failure, List<UserEntity>>> call(
      GetPlatformUsersParams params) {
    return repository.getPlatformUsers();
  }
}

class GetPlatformUsersParams {}
