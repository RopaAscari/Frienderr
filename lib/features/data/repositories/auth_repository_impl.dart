import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:frienderr/core/failure/failure.dart';
import 'package:frienderr/core/exceptions/exceptions.dart';
import 'package:frienderr/features/data/models/auth/auth_model.dart';
import 'package:frienderr/features/data/providers/auth_provider.dart';
import 'package:frienderr/features/domain/repositiories/auth_repository.dart';

@LazySingleton(as: IAuthRepository)
class AuthRepository implements IAuthRepository {
  final IAuthRemoteDataProvider authProvider;

  const AuthRepository(this.authProvider);

  @override
  Future<Either<Failure, AuthResponse>> recoverPassword(
      {required String email}) async {
    try {
      final AuthResponse authResponse =
          await authProvider.recoverPassword(email: email);

      if (authResponse.hasError) {
        return Left(Failure(message: authResponse.error));
      }

      return Right(authResponse);
    } on FirebaseAuthException catch (e) {
      return Left(Failure(message: Errors.generic));
    }
  }

  @override
  Future<Either<Failure, AuthResponse>> createUserAccount(
      {required String email, required String password}) async {
    try {
      final AuthResponse authResponse = await authProvider.createUserAccount(
          password: password, email: email);

      if (authResponse.hasError) {
        return Left(Failure(message: authResponse.error));
      }

      return Right(authResponse);
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'weak-password':
          return Left(Failure(message: Errors.signUpPassword));
        case 'email-already-in-use':
          return Left(Failure(message: Errors.signUpEmail));
        default:
          return Left(Failure(message: Errors.generic));
      }
    }
  }

  @override
  Future<Either<Failure, AuthResponse>> authenticateUser({
    required String email,
    required String password,
  }) async {
    try {
      final AuthResponse authResponse =
          await authProvider.authenticateUser(password: password, email: email);

      if (authResponse.hasError) {
        return Left(Failure(message: authResponse.error));
      }
      return Right(authResponse);
    } on FirebaseAuthException catch (e) {
      return Left(Failure(message: Errors.login));
    }
  }

  @override
  Future<Either<Failure, bool>> verfyAndUpdateUsername(
      String userId, String username) async {
    try {
      final bool authResponse =
          await authProvider.verfyAndUpdateUsername(userId, username);

      if (!authResponse) {
        return Left(Failure(message: 'Username is aready selected'));
      }

      return Right(authResponse);
    } catch (e) {
      return Right(false);
    }
  }

  @override
  Future<Either<Failure, void>> signOut(
      {required Function onComplete, required Function onFailure}) async {
    try {
      return Right(
          authProvider.signOut(onComplete: onComplete, onFailure: onFailure));
    } on FirebaseAuthException catch (e) {
      onFailure(e);
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> isAuthenticated() async {
    return Right(await authProvider.isAuthenticated());
  }

  @override
  Future<Either<Failure, bool>> isUsernameSelected() async {
    try {
      return Right(await authProvider.isUsernameSelected());
    } catch (e) {
      return Right(false);
    }
  }

  @override
  Future<Either<Failure, String>> getUserId() async {
    return Right(await authProvider.getUserId());
  }
}
