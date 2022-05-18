import 'package:dartz/dartz.dart';

import 'package:injectable/injectable.dart';
import 'package:frienderr/core/failure/failure.dart';
import 'package:frienderr/core/usecase/usecase.dart';
import 'package:frienderr/features/domain/entities/quick.dart';
import 'package:frienderr/features/domain/entities/media_asset.dart';
import 'package:frienderr/features/domain/repositiories/quick_repository.dart';

@lazySingleton
class DeleteQuickUseCase extends UseCase<bool, DeleteQuicksParams> {
  DeleteQuickUseCase(this.repository);

  final IQuickRepository repository;

  @override
  Future<Either<Failure, bool>> call(DeleteQuicksParams params) {
    return repository.deleteQuick(quickId: params.quickId);
  }
}

class DeleteQuicksParams {
  final String quickId;

  DeleteQuicksParams(this.quickId);
}
