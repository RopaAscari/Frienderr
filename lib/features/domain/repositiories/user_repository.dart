import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:frienderr/core/failure/failure.dart';
import 'package:frienderr/features/domain/entities/user.dart';
import 'package:frienderr/features/data/models/user/user_model.dart';
import 'package:frienderr/features/domain/entities/update_profile.dart';

abstract class IUserRepository {
  Future<Either<Failure, List<UserDTO>>> getPlatformUsers();
  Future<Either<Failure, UserModel>> getUser({required String uid});
  Future<Either<Failure, bool>> updateProfile(
      {required UpdateProfile profile, required String uid});

  Future<Either<Failure, String>> updateCoverPhoto(
      {required String uid, required File file});
  Future<Either<Failure, String>> updateProfilePhoto(
      {required String uid, required File file});
}
