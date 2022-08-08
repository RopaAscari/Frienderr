import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:automap/automap.dart';
import 'package:injectable/injectable.dart';
import 'package:collection/collection.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:frienderr/core/failure/failure.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:frienderr/features/domain/entities/user.dart';
import 'package:frienderr/features/domain/entities/quick.dart';
import 'package:frienderr/features/domain/entities/like_snap.dart';
import 'package:frienderr/features/data/models/snap/snap_model.dart';
import 'package:frienderr/features/data/providers/user_provider.dart';
import 'package:frienderr/features/data/providers/snap_provider.dart';
import 'package:frienderr/features/domain/repositiories/snap_repository.dart';

@LazySingleton(as: ISnapRepository)
class SnapRepository implements ISnapRepository {
  final FirebaseAuth _auth;
  final IUserDataRemoteProvider _userRemoteDataProvider;
  final ISnapRemoteDataProvider _snapRemoteDataProvider;
  SnapRepository(
      this._snapRemoteDataProvider, this._userRemoteDataProvider, this._auth);

  @override
  Future<Either<Failure, List<Snap>>> getSnaps() async {
    try {
      final QuerySnapshot<SnapDTO> snapQuery =
          await _snapRemoteDataProvider.getSnaps();

      List<String> userIds =
          snapQuery.docs.map((p) => p.data().user.id).toSet().toList();
      if (userIds.isEmpty) {
        return const Right([]);
      }

      final QuerySnapshot<UserDTO> userQuery =
          await _userRemoteDataProvider.getUsersByIds(userIds: userIds);

      List<String> snapIds =
          snapQuery.docs.map((p) => p.data().id).toSet().toList();

      if (snapIds.isEmpty) {
        return const Right([]);
      }
      final QuerySnapshot<SnapLikeDTO> likeQuery = await _snapRemoteDataProvider
          .getUserSnapLikes(snapIds: snapIds, userId: _auth.currentUser!.uid);

      final _snapDto = _handleDTOMapping(
        snaps: snapQuery,
        users: userQuery,
        likes: likeQuery,
      );

      List<Snap> _snaps = AutoMapper.I.map<List<SnapDTO>, List<Snap>>(
        _snapDto,
      );

      return Right(_snaps);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Snap>>> getPaginatedSnaps(
      {required Snap prevSnap}) async {
    try {
      final QuerySnapshot<SnapDTO> snapQuery =
          await _snapRemoteDataProvider.getPaginatedSnaps(prevSnap: prevSnap);

      List<String> userIds =
          snapQuery.docs.map((p) => p.data().user.id).toSet().toList();
      if (userIds.isEmpty) {
        return const Right([]);
      }

      final QuerySnapshot<UserDTO> userQuery =
          await _userRemoteDataProvider.getUsersByIds(userIds: userIds);

      List<String> snapIds =
          snapQuery.docs.map((p) => p.data().id).toSet().toList();

      if (snapIds.isEmpty) {
        return const Right([]);
      }
      final QuerySnapshot<SnapLikeDTO> likeQuery = await _snapRemoteDataProvider
          .getUserSnapLikes(snapIds: snapIds, userId: _auth.currentUser!.uid);

      final _snapDto = _handleDTOMapping(
        snaps: snapQuery,
        users: userQuery,
        likes: likeQuery,
      );

      List<Snap> _snaps = AutoMapper.I.map<List<SnapDTO>, List<Snap>>(
        _snapDto,
      );

      return Right(_snaps);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Snap>>> getUserSnaps({
    required String uid,
  }) async {
    try {
      final QuerySnapshot<SnapDTO> rawQuicks =
          await _snapRemoteDataProvider.getUserSnaps(uid: uid);

      List<SnapDTO> _quickDto = rawQuicks.docs.map((x) => x.data()).toList();

      List<Snap> _quicks = AutoMapper.I.map<List<SnapDTO>, List<Snap>>(
        _quickDto,
      );

      return Right(_quicks);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> likeSnap({
    required String userId,
    required String snapId,
  }) async {
    try {
      return Right(await _snapRemoteDataProvider.likeSnap(
          snapId: snapId, userId: userId));
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> unLikeSnap({
    required String userId,
    required String snapId,
  }) async {
    try {
      return Right(await _snapRemoteDataProvider.unLikeSnap(
          snapId: snapId, userId: userId));
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> deleteSnap({
    required String snapId,
  }) async {
    try {
      return Right(await _snapRemoteDataProvider.deleteSnap(snapId: snapId));
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> createSnap({
    required String caption,
    required File file,
  }) async {
    try {
      return Right(await _snapRemoteDataProvider.createSnap(
          caption: caption, file: file));
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  List<SnapDTO> _handleDTOMapping({
    required QuerySnapshot<UserDTO> users,
    required QuerySnapshot<SnapDTO> snaps,
    required QuerySnapshot<SnapLikeDTO> likes,
  }) {
    List<SnapDTO> result = [];

    for (var document in snaps.docs) {
      SnapDTO snap = document.data();

      snap.user = users.docs.firstWhere((x) {
        return x.data().id == document.data().user.id;
      }).data();

      final snapLikeDTO = likes.docs.firstWhereOrNull((r) {
        return r.data().snapId == snap.id;
      })?.data();

      snap.isLiked = snapLikeDTO != null;

      result.add(snap);
    }

    return result;
  }
}
