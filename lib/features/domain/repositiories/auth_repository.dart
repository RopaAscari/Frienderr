import 'package:dartz/dartz.dart';
import 'package:frienderr/core/failure/failure.dart';
import 'package:frienderr/features/data/models/auth/auth_model.dart';

abstract class IAuthRepository {
  Future<Either<Failure, String>> getUserId();

  Future<Either<Failure, dynamic>> isAuthenticated();

  Future<Either<Failure, bool>> isUsernameSelected();

  Future<Either<Failure, void>> signOut(
      {required Function onComplete, required Function onFailure});

  Future<Either<Failure, bool>> verfyAndUpdateUsername(
      String userId, String username);

  Future<Either<Failure, AuthResponse>> authenticateUser(
      {required String email, required String password});

  Future<Either<Failure, AuthResponse>> createUserAccount(
      {required String email, required String password});

  Future<Either<Failure, AuthResponse>> recoverPassword(
      {required String email});
}
