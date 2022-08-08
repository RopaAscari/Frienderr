import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import 'package:frienderr/core/failure/failure.dart';
import 'package:frienderr/core/usecase/usecase.dart';
import 'package:frienderr/features/data/models/snap/snap_model.dart';
import 'package:frienderr/features/domain/entities/quick.dart';
import 'package:frienderr/features/domain/repositiories/snap_repository.dart';

@lazySingleton
class GetPaginatedSnapsUseCase
    extends UseCase<List<Snap>, GetPaginatedSnapsParams> {
  GetPaginatedSnapsUseCase(this.repository);

  final ISnapRepository repository;

  @override
  Future<Either<Failure, List<Snap>>> call(GetPaginatedSnapsParams params) {
    return repository.getPaginatedSnaps(prevSnap: params.prevSnap);
  }
}

class GetPaginatedSnapsParams {
  final Snap prevSnap;
  GetPaginatedSnapsParams(
    this.prevSnap,
  );
}
