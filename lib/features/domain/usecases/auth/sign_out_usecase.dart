import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:frienderr/core/failure/failure.dart';
import 'package:frienderr/core/usecase/usecase.dart';
import 'package:frienderr/features/domain/repositiories/auth_repository.dart';

@lazySingleton
class SignOutUseCase extends UseCase<bool, SignOutParams> {
  SignOutUseCase(this.repository);

  final IAuthRepository repository;

  @override
  Future<Either<Failure, bool>> call(SignOutParams params) {
    return repository.signOut();
  }
}

class SignOutParams {
  SignOutParams();
}
