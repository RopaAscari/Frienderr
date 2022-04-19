import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:frienderr/core/failure/failure.dart';
import 'package:frienderr/core/usecase/usecase.dart';
import 'package:frienderr/features/domain/repositiories/auth_repository.dart';

@lazySingleton
class GetUserIdUseCase extends UseCase<String, GetUserIdParams> {
  GetUserIdUseCase(this.repository);

  final IAuthRepository repository;

  @override
  Future<Either<Failure, String>> call(GetUserIdParams params) {
    return repository.getUserId();
  }
}

class GetUserIdParams {}
