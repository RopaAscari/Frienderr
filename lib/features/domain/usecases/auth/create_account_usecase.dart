import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:frienderr/core/failure/failure.dart';
import 'package:frienderr/core/usecase/usecase.dart';
import 'package:frienderr/features/data/models/auth/auth_model.dart';
import 'package:frienderr/features/domain/repositiories/auth_repository.dart';

@lazySingleton
class CreateAccountUseCase extends UseCase<AuthResponse, CreateAccountParams> {
  CreateAccountUseCase(this.repository);

  final IAuthRepository repository;

  @override
  Future<Either<Failure, AuthResponse>> call(CreateAccountParams params) {
    return repository.createUserAccount(
        email: params.email, password: params.password);
  }
}

class CreateAccountParams {
  CreateAccountParams({required this.email, required this.password});

  final String email;
  final String password;
}
