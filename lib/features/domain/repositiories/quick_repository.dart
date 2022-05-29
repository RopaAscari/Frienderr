import 'dart:io';

import 'package:frienderr/core/failure/failure.dart';
import 'package:frienderr/features/domain/entities/media_asset.dart';
import 'package:frienderr/features/domain/entities/quick.dart';

import 'package:dartz/dartz.dart';

abstract class IQuickRepository {
  Future<Either<Failure, List<QuickEntity>>> getQuicks();
  Future<Either<Failure, bool>> likeQuick({
    required String userId,
    required String quickId,
  });

  Future<Either<Failure, bool>> createQuick({
    required String caption,
    required File file,
  });
  Future<Either<Failure, bool>> deleteQuick({
    required String quickId,
  });
  Future<Either<Failure, bool>> unLikeQuick({
    required String userId,
    required String quickId,
  });

  Future<Either<Failure, List<QuickEntity>>> getUserSnaps({
    required String uid,
  });
}
