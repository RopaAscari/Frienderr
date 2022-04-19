import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:frienderr/core/failure/failure.dart';
import 'package:frienderr/core/usecase/usecase.dart';
import 'package:frienderr/features/data/models/auth/auth_model.dart';
import 'package:frienderr/features/domain/repositiories/auth_repository.dart';

@lazySingleton
class RecoverPasswordUseCase
    extends UseCase<AuthResponse, RecoverPasswordParams> {
  RecoverPasswordUseCase(this.repository);

  final IAuthRepository repository;

  @override
  Future<Either<Failure, AuthResponse>> call(RecoverPasswordParams params) {
    return repository.recoverPassword(email: params.email);
  }
}

class RecoverPasswordParams {
  RecoverPasswordParams(this.email);

  final String email;
}
