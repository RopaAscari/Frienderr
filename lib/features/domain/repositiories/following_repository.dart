import 'package:dartz/dartz.dart';
import 'package:frienderr/core/failure/failure.dart';
import 'package:frienderr/features/domain/entities/user.dart';

abstract class IFollowingRepository {
  Future<Either<Failure, List<String>>> getFollowing(String userId);
  Future<Either<Failure, bool>> followUser(
      {required String uid, required String fid});
  Future<Either<Failure, bool>> unfollowUser(
      {required String uid, required String fid});
}
