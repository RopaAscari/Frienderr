import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:frienderr/core/failure/failure.dart';
import 'package:frienderr/core/usecase/usecase.dart';
import 'package:frienderr/features/domain/repositiories/auth_repository.dart';

@lazySingleton
class VerifyAuthenticationUseCase
    extends UseCase<dynamic, VerifyAuthenticationParams> {
  VerifyAuthenticationUseCase(this.repository);

  final IAuthRepository repository;

  @override
  Future<Either<Failure, dynamic>> call(VerifyAuthenticationParams params) {
    return repository.isAuthenticated();
  }
}

class VerifyAuthenticationParams {}
