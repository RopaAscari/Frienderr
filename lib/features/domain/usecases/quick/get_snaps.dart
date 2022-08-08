import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:frienderr/core/failure/failure.dart';
import 'package:frienderr/core/usecase/usecase.dart';
import 'package:frienderr/features/domain/entities/quick.dart';
import 'package:frienderr/features/data/models/snap/snap_model.dart';
import 'package:frienderr/features/domain/repositiories/snap_repository.dart';

@lazySingleton
class GetSnapUseCase extends UseCase<List<Snap>, GetSnapsParams> {
  GetSnapUseCase(this.repository);

  final ISnapRepository repository;

  @override
  Future<Either<Failure, List<Snap>>> call(GetSnapsParams params) {
    return repository.getSnaps();
  }
}

class GetSnapsParams {}
