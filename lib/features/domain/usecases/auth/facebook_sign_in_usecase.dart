import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:frienderr/core/failure/failure.dart';
import 'package:frienderr/core/usecase/usecase.dart';
import 'package:frienderr/features/data/models/auth/auth_model.dart';
import 'package:frienderr/features/domain/repositiories/auth_repository.dart';

@lazySingleton
class FacebookSignInUseCase
    extends UseCase<AuthResponse, FacebookSignInParams> {
  FacebookSignInUseCase(this.repository);

  final IAuthRepository repository;

  @override
  Future<Either<Failure, AuthResponse>> call(FacebookSignInParams params) {
    return repository.facebookProviderSignIn();
  }
}

class FacebookSignInParams {}
