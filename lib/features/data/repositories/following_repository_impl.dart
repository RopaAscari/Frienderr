import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:frienderr/core/failure/failure.dart';
import 'package:frienderr/features/domain/entities/user.dart';
import 'package:frienderr/features/data/providers/following_provider.dart';
import 'package:frienderr/features/domain/repositiories/following_repository.dart';

@LazySingleton(as: IFollowingRepository)
class FollowingRepository implements IFollowingRepository {
  final IFollowingRemoteDataProvider _followingRemoteDataProvider;

  FollowingRepository(this._followingRemoteDataProvider);

  @override
  Future<Either<Failure, List<UserEntity>>> getFollowing(String postId) async {
    try {
      return Right(await _followingRemoteDataProvider.getFollowing(postId));
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
