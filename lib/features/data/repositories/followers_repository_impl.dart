import 'package:dartz/dartz.dart';
import 'package:automap/automap.dart';
import 'package:injectable/injectable.dart';
import 'package:frienderr/core/failure/failure.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:frienderr/features/domain/entities/user.dart';
import 'package:frienderr/features/data/models/user/user_model.dart';
import 'package:frienderr/features/data/providers/user_provider.dart';
import 'package:frienderr/features/data/providers/followers_provider.dart';
import 'package:frienderr/features/domain/repositiories/followers_repository.dart';

@LazySingleton(as: IFollowersRepository)
class FollowersRepository implements IFollowersRepository {
  final IUserDataRemoteProvider _userRemoteDataProvider;
  final IFollowersRemoteDataProvider _followersRemoteDataProvider;

  FollowersRepository(
      this._followersRemoteDataProvider, this._userRemoteDataProvider);

  @override
  Future<Either<Failure, int>> getFollowersCount(String uid) async {
    final _followers =
        await _followersRemoteDataProvider.getFollowersCount(uid);

    try {
      return Right(_followers.docs.length);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<UserModel>>> getProfileFollowersList(
      String userId) async {
    try {
      final rawFollowers =
          await _followersRemoteDataProvider.getProfileFollowersList(userId);

      final followers =
          rawFollowers.docs.map((e) => e.data()['id']).cast<String>().toList();

      final QuerySnapshot<UserDTO> userQuery =
          await _userRemoteDataProvider.getUsersByIds(userIds: followers);

      final _userDTO = userQuery.docs.map((x) => x.data()).toList();
      final _users = AutoMapper.I.map<List<UserDTO>, List<UserModel>>(
        _userDTO,
      );
      print(_users);
      return Right(_users);
    } catch (e) {
      print(e.toString());
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> registerFollowing(
      {required String uid, required String fid}) async {
    try {
      return Right(await _followersRemoteDataProvider.registerFollowing(
          uid: uid, fid: fid));
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
