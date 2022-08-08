import 'package:dartz/dartz.dart';
import 'package:frienderr/core/failure/failure.dart';
import 'package:frienderr/features/data/models/user/user_model.dart';

abstract class IFollowersRepository {
  Future<Either<Failure, int>> getFollowersCount(String userId);
  Future<Either<Failure, bool>> registerFollowing(
      {required String uid, required String fid});
  Future<Either<Failure, List<UserModel>>> getProfileFollowersList(
      String userId);
}
