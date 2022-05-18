import 'package:dartz/dartz.dart';

import 'package:injectable/injectable.dart';
import 'package:frienderr/core/failure/failure.dart';
import 'package:frienderr/core/usecase/usecase.dart';
import 'package:frienderr/features/domain/entities/quick.dart';
import 'package:frienderr/features/domain/entities/media_asset.dart';
import 'package:frienderr/features/domain/repositiories/quick_repository.dart';

@lazySingleton
class UnLikeQuickUseCase extends UseCase<bool, UnLikeQuicksParams> {
  UnLikeQuickUseCase(this.repository);

  final IQuickRepository repository;

  @override
  Future<Either<Failure, bool>> call(UnLikeQuicksParams params) {
    return repository.unLikeQuick(
        quickId: params.quickId, userId: params.userId);
  }
}

class UnLikeQuicksParams {
  final String userId;
  final String quickId;

  UnLikeQuicksParams(this.userId, this.quickId);
}
