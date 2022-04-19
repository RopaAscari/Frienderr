import 'package:dartz/dartz.dart';
import 'package:frienderr/core/failure/failure.dart';
import 'package:frienderr/features/data/providers/user_provider.dart';
import 'package:frienderr/features/data/providers/user_provider.dart';
import 'package:frienderr/features/domain/entities/user.dart';
import 'package:injectable/injectable.dart';
import 'package:frienderr/core/services/helpers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:frienderr/features/data/models/user/user_model.dart';
import 'package:frienderr/features/domain/repositiories/user_repository.dart';

@LazySingleton(as: IUserRepository)
class UserRepository implements IUserRepository {
  final IUserDataRemoteProvider _userDataRemoteProvider;

  UserRepository(this._userDataRemoteProvider);

  @override
  Future<Either<Failure, List<UserEntity>>> getPlatformUsers() async {
    try {
      final platformUsers = await _userDataRemoteProvider.getPlatformUsers();

      final List<UserEntity> users = platformUsers.docs.map((platformUser) {
        final data = platformUser.data();
        return UserEntity(
            id: data['id'],
            username: data['username'],
            profilePic: data['profilePic']);
      }).toList();

      return Right(users);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
