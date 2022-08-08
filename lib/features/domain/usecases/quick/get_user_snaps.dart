import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../data/models/snap/snap_model.dart';
import 'package:frienderr/core/failure/failure.dart';
import 'package:frienderr/core/usecase/usecase.dart';
import 'package:frienderr/features/domain/repositiories/snap_repository.dart';

@lazySingleton
class GetUserSnapsUseCase extends UseCase<List<Snap>, GetUserSnapsParams> {
  GetUserSnapsUseCase(this.repository);

  final ISnapRepository repository;

  @override
  Future<Either<Failure, List<Snap>>> call(GetUserSnapsParams params) {
    return repository.getUserSnaps(uid: params.uid);
  }
}

class GetUserSnapsParams {
  String uid;
  GetUserSnapsParams({
    required this.uid,
  });
}
