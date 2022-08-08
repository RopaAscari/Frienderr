import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:frienderr/core/failure/failure.dart';
import 'package:frienderr/core/usecase/usecase.dart';
import 'package:frienderr/features/domain/repositiories/snap_repository.dart';

@lazySingleton
class DeleteSnapUseCase extends UseCase<bool, DeleteSnapParams> {
  DeleteSnapUseCase(this.repository);

  final ISnapRepository repository;

  @override
  Future<Either<Failure, bool>> call(DeleteSnapParams params) {
    return repository.deleteSnap(snapId: params.snapId);
  }
}

class DeleteSnapParams {
  final String snapId;

  DeleteSnapParams(this.snapId);
}
