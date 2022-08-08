import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:frienderr/core/failure/failure.dart';
import 'package:frienderr/features/data/models/snap/snap_model.dart';

abstract class ISnapRepository {
  Future<Either<Failure, List<Snap>>> getSnaps();
  Future<Either<Failure, bool>> likeSnap({
    required String userId,
    required String snapId,
  });

  Future<Either<Failure, bool>> createSnap({
    required String caption,
    required File file,
  });
  Future<Either<Failure, bool>> deleteSnap({
    required String snapId,
  });
  Future<Either<Failure, bool>> unLikeSnap({
    required String userId,
    required String snapId,
  });

  Future<Either<Failure, List<Snap>>> getPaginatedSnaps(
      {required Snap prevSnap});
  Future<Either<Failure, List<Snap>>> getUserSnaps({
    required String uid,
  });
}
