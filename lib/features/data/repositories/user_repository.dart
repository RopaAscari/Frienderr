import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:automap/automap.dart';

import 'package:injectable/injectable.dart';
import 'package:frienderr/core/failure/failure.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:frienderr/features/domain/entities/user.dart';
import 'package:frienderr/features/data/models/user/user_model.dart';
import 'package:frienderr/features/data/providers/user_provider.dart';
import 'package:frienderr/features/domain/entities/update_profile.dart';
import 'package:frienderr/features/domain/repositiories/user_repository.dart';

@LazySingleton(as: IUserRepository)
class UserRepository implements IUserRepository {
  final IUserDataRemoteProvider _userDataRemoteProvider;

  UserRepository(this._userDataRemoteProvider);

  @override
  Future<Either<Failure, List<UserDTO>>> getPlatformUsers() async {
    try {
      final platformUsers = await _userDataRemoteProvider.getPlatformUsers();

      final List<UserDTO> users = platformUsers.docs.map((platformUser) {
        final data = platformUser.data();
        return UserDTO(
            id: data.id, username: data.username, profilePic: data.profilePic);
      }).toList();

      return Right(users);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> updateProfile(
      {required UpdateProfile profile, required String uid}) async {
    try {
      final result = await _userDataRemoteProvider.updateProfile(
          profile: profile, uid: uid);

      return Right(result);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserModel>> getUser({required String uid}) async {
    try {
      final DocumentSnapshot<UserDTO> userSnapshot =
          await _userDataRemoteProvider.getUser(uid: uid);

      if (userSnapshot.data() == null) {
        return const Left(Failure(message: "User not found"));
      }

      final user = AutoMapper.I.map<UserDTO, UserModel>(
        userSnapshot.data()!,
      );

      return Right(user);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> updateProfilePhoto(
      {required String uid, required File file}) async {
    try {
      final String coverPhoto = await _userDataRemoteProvider
          .updateProfilePhoto(uid: uid, file: file);

      return Right(coverPhoto);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> updateCoverPhoto(
      {required String uid, required File file}) async {
    try {
      final String coverPhoto =
          await _userDataRemoteProvider.updateCoverPhoto(uid: uid, file: file);

      return Right(coverPhoto);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
