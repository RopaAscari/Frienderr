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
  Future<Either<Failure, List<UserEntity>>> getFollowers(String postId) async {
    try {
      return Right(await _followersRemoteDataProvider.getFollowers(postId));
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
