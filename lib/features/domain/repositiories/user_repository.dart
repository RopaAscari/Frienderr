import 'package:frienderr/core/failure/failure.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:dartz/dartz.dart';
import 'package:frienderr/features/domain/entities/user.dart';

abstract class IUserRepository {
  Future<Either<Failure, List<UserEntity>>> getPlatformUsers();
}
