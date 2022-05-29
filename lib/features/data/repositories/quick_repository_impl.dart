import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:frienderr/features/domain/entities/media_asset.dart';

import 'package:injectable/injectable.dart';
import 'package:frienderr/core/failure/failure.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:frienderr/features/domain/entities/user.dart';
import 'package:frienderr/features/domain/entities/quick.dart';
import 'package:frienderr/features/data/providers/user_provider.dart';
import 'package:frienderr/features/data/providers/quick_provider.dart';
import 'package:frienderr/features/domain/repositiories/quick_repository.dart';

@LazySingleton(as: IQuickRepository)
class QuickRepository implements IQuickRepository {
  final IUserDataRemoteProvider _userRemoteDataProvider;
  final IQuickRemoteDataProvider _quickRemoteDataProvider;
  QuickRepository(this._quickRemoteDataProvider, this._userRemoteDataProvider);

  @override
  Future<Either<Failure, List<QuickEntity>>> getQuicks() async {
    try {
      final QuerySnapshot<Object?> rawQuicks =
          await _quickRemoteDataProvider.getQuicks();

      final QuerySnapshot<Object?> users =
          await _userRemoteDataProvider.getPlatformUsers();

      final List<QuickEntity> quicks = rawQuicks.docs.map((e) {
        final quickData = e.data() as Map<String, dynamic>;

        final UserEntity user =
            UserEntity.fromJson(users.docs.firstWhere((data) {
          return (data.data() as Map)['id'] == quickData['user']['id'];
        }).data() as Map<String, dynamic>);

        return QuickEntity(
          user: user,
          id: quickData['id'],
          url: quickData['url'],
          audio: quickData['audio'],
          caption: quickData['caption'],
          thumbnail: quickData['thumbnail'],
          dateCreated: quickData['dateCreated'],
          commentCount: quickData['commentCount'],
          likes: quickData['likes'].cast<String>(),
          shares: quickData['shares'].cast<String>(),
        );
      }).toList();

      return Right(quicks);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<QuickEntity>>> getUserSnaps({
    required String uid,
  }) async {
    try {
      final QuerySnapshot<Object?> rawQuicks =
          await _quickRemoteDataProvider.getUserSnaps(uid: uid);

      final List<QuickEntity> quicks = rawQuicks.docs.map((e) {
        final quickData = e.data() as Map<String, dynamic>;

        return QuickEntity(
          id: quickData['id'],
          url: quickData['url'],
          audio: quickData['audio'],
          user: UserEntity(id: uid),
          caption: quickData['caption'],
          thumbnail: quickData['thumbnail'],
          dateCreated: quickData['dateCreated'],
          commentCount: quickData['commentCount'],
          likes: quickData['likes'].cast<String>(),
          shares: quickData['shares'].cast<String>(),
        );
      }).toList();

      return Right(quicks);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> likeQuick({
    required String userId,
    required String quickId,
  }) async {
    try {
      return Right(await _quickRemoteDataProvider.likeQuick(
          quickId: quickId, userId: userId));
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> unLikeQuick({
    required String userId,
    required String quickId,
  }) async {
    try {
      return Right(await _quickRemoteDataProvider.unLikeQuick(
          quickId: quickId, userId: userId));
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> deleteQuick({
    required String quickId,
  }) async {
    try {
      return Right(
          await _quickRemoteDataProvider.deleteQuick(quickId: quickId));
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> createQuick({
    required String caption,
    required File file,
  }) async {
    try {
      return Right(await _quickRemoteDataProvider.createQuick(
          caption: caption, file: file));
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
