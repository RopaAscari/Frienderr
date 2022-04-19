import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:frienderr/core/failure/failure.dart';
import 'package:frienderr/core/usecase/usecase.dart';
import 'package:frienderr/features/data/models/auth/auth_model.dart';
import 'package:frienderr/features/domain/repositiories/auth_repository.dart';

@lazySingleton
class AuthenticateUseCase extends UseCase<AuthResponse, AuthenticateParams> {
  AuthenticateUseCase(this.repository);

  final IAuthRepository repository;

  @override
  Future<Either<Failure, AuthResponse>> call(AuthenticateParams params) {
    return repository.authenticateUser(
        email: params.email, password: params.password);
  }
}

class AuthenticateParams {
  AuthenticateParams({required this.email, required this.password});

  final String email;
  final String password;
}
