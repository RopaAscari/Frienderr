import 'package:dartz/dartz.dart';
import 'package:frienderr/core/failure/failure.dart';
import 'package:frienderr/features/domain/entities/user.dart';

abstract class IFollowingRepository {
  Future<Either<Failure, List<UserEntity>>> getFollowing(String userId);
}
