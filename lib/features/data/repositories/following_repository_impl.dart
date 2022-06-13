import 'package:dartz/dartz.dart';
import 'package:frienderr/features/data/providers/followers_provider.dart';
import 'package:injectable/injectable.dart';
import 'package:frienderr/core/failure/failure.dart';
import 'package:frienderr/features/domain/entities/user.dart';
import 'package:frienderr/features/data/providers/following_provider.dart';
import 'package:frienderr/features/domain/repositiories/following_repository.dart';

@LazySingleton(as: IFollowingRepository)
class FollowingRepository implements IFollowingRepository {
  final IFollowingRemoteDataProvider _followingRemoteDataProvider;
  final IFollowersRemoteDataProvider _followersRemoteDataProvider;
  FollowingRepository(
      this._followingRemoteDataProvider, this._followersRemoteDataProvider);

  @override
  Future<Either<Failure, List<String>>> getFollowing(String uid) async {
    final rawFollowing = await _followingRemoteDataProvider.getFollowing(uid);

    final following =
        rawFollowing.docs.map((e) => e.data()['id']).cast<String>().toList();
    try {
      return Right(following);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> followUser(
      {required String uid, required String fid}) async {
    final _followSuccess =
        await _followingRemoteDataProvider.followUser(uid: uid, fid: fid);

    final _registerSuccess = await _followersRemoteDataProvider
        .registerFollowing(uid: uid, fid: fid);
    try {
      return Right(_followSuccess && _registerSuccess);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> unfollowUser(
      {required String uid, required String fid}) async {
    final _followSuccess =
        await _followingRemoteDataProvider.unfollowUser(uid: uid, fid: fid);

    final _registerSuccess = await _followersRemoteDataProvider
        .registerUnFollowing(uid: uid, fid: fid);
    try {
      return Right(_followSuccess && _registerSuccess);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
