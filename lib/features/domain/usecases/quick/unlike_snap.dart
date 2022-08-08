import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:frienderr/core/failure/failure.dart';
import 'package:frienderr/core/usecase/usecase.dart';
import 'package:frienderr/features/domain/repositiories/snap_repository.dart';

@lazySingleton
class UnLikeSnapUseCase extends UseCase<bool, UnLikeSnapsParams> {
  UnLikeSnapUseCase(this.repository);

  final ISnapRepository repository;

  @override
  Future<Either<Failure, bool>> call(UnLikeSnapsParams params) {
    return repository.unLikeSnap(snapId: params.quickId, userId: params.userId);
  }
}

class UnLikeSnapsParams {
  final String userId;
  final String quickId;

  UnLikeSnapsParams(this.userId, this.quickId);
}
