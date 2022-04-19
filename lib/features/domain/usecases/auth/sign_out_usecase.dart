import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:frienderr/core/failure/failure.dart';
import 'package:frienderr/core/usecase/usecase.dart';
import 'package:frienderr/features/domain/repositiories/auth_repository.dart';

@lazySingleton
class SignOutUseCase extends UseCase<void, SignOutParams> {
  SignOutUseCase(this.repository);

  final IAuthRepository repository;

  @override
  Future<Either<Failure, void>> call(SignOutParams params) {
    return repository.signOut(
        onComplete: params.onComplete, onFailure: params.onFailure);
  }
}

class SignOutParams {
  Function onComplete;
  Function onFailure;
  SignOutParams({required this.onComplete, required this.onFailure});
}
