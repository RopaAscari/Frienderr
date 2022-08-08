import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:frienderr/core/failure/failure.dart';
import 'package:frienderr/core/usecase/usecase.dart';
import 'package:frienderr/features/domain/repositiories/snap_repository.dart';

@lazySingleton
class LikeSnapUseCase extends UseCase<bool, LikeSnapParams> {
  LikeSnapUseCase(this.repository);

  final ISnapRepository repository;

  @override
  Future<Either<Failure, bool>> call(LikeSnapParams params) {
    return repository.likeSnap(snapId: params.quickId, userId: params.userId);
  }
}

class LikeSnapParams {
  final String userId;
  final String quickId;

  LikeSnapParams(this.userId, this.quickId);
}
