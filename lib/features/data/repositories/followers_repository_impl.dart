import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:frienderr/core/failure/failure.dart';
import 'package:frienderr/features/data/providers/followers_provider.dart';
import 'package:frienderr/features/domain/entities/user.dart';
import 'package:frienderr/features/domain/repositiories/followers_repository.dart';

@LazySingleton(as: IFollowersRepository)
class FollowersRepository implements IFollowersRepository {
  final IFollowersRemoteDataProvider _followersRemoteDataProvider;

  FollowersRepository(this._followersRemoteDataProvider);

  @override
  Future<Either<Failure, List<String>>> getFollowers(String uid) async {
    final rawFollowers = await _followersRemoteDataProvider.getFollowers(uid);

    final followers =
        rawFollowers.docs.map((e) => e.data()['id']).cast<String>().toList();
    try {
      return Right(followers);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> registerFollwoing(
      {required String uid, required String fid}) async {
    try {
      return Right(await _followersRemoteDataProvider.registerFollowing(
          uid: uid, fid: fid));
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
