import 'package:dartz/dartz.dart';
import 'package:frienderr/core/failure/failure.dart';

abstract class IFollowingRepository {
  Future<Either<Failure, int>> getFollowingCount(String userId);

  Future<Either<Failure, bool>> followUser(
      {required String uid, required String fid});

  Future<Either<Failure, bool>> unfollowUser(
      {required String uid, required String fid});

  Future<Either<Failure, List<String>>> getFollowing({
    required String uid,
  });
  Future<Either<Failure, bool>> getFollowingStatus({required String uid});
}
