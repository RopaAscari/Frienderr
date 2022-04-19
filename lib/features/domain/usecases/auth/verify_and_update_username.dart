import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:frienderr/core/failure/failure.dart';
import 'package:frienderr/core/usecase/usecase.dart';
import 'package:frienderr/features/domain/repositiories/auth_repository.dart';

@lazySingleton
class VerifyAndUpdateUsernameUseCase
    extends UseCase<bool, VerifyUsernameUseCaseParams> {
  VerifyAndUpdateUsernameUseCase(this.repository);

  final IAuthRepository repository;

  @override
  Future<Either<Failure, bool>> call(VerifyUsernameUseCaseParams params) {
    return repository.verfyAndUpdateUsername(params.userId, params.username);
  }
}

class VerifyUsernameUseCaseParams {
  VerifyUsernameUseCaseParams(this.userId, this.username);

  final String userId;
  final String username;
}
