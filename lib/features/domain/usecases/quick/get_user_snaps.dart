import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:frienderr/core/failure/failure.dart';
import 'package:frienderr/core/usecase/usecase.dart';
import 'package:frienderr/features/domain/entities/quick.dart';
import 'package:frienderr/features/domain/repositiories/quick_repository.dart';

@lazySingleton
class GetUserSnapsUseCase
    extends UseCase<List<QuickEntity>, GetUserSnapsParams> {
  GetUserSnapsUseCase(this.repository);

  final IQuickRepository repository;

  @override
  Future<Either<Failure, List<QuickEntity>>> call(GetUserSnapsParams params) {
    return repository.getUserSnaps(uid: params.uid);
  }
}

class GetUserSnapsParams {
  String uid;
  GetUserSnapsParams({
    required this.uid,
  });
}
