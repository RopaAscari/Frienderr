import 'package:dartz/dartz.dart';

import 'package:injectable/injectable.dart';
import 'package:frienderr/core/failure/failure.dart';
import 'package:frienderr/core/usecase/usecase.dart';
import 'package:frienderr/features/domain/entities/quick.dart';
import 'package:frienderr/features/domain/entities/media_asset.dart';
import 'package:frienderr/features/domain/repositiories/quick_repository.dart';

@lazySingleton
class LikeQuickUseCase extends UseCase<bool, LikeQuicksParams> {
  LikeQuickUseCase(this.repository);

  final IQuickRepository repository;

  @override
  Future<Either<Failure, bool>> call(LikeQuicksParams params) {
    return repository.likeQuick(quickId: params.quickId, userId: params.userId);
  }
}

class LikeQuicksParams {
  final String userId;
  final String quickId;

  LikeQuicksParams(this.userId, this.quickId);
}
