import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:frienderr/core/failure/failure.dart';
import 'package:frienderr/core/usecase/usecase.dart';
import 'package:frienderr/features/domain/entities/quick.dart';
import 'package:frienderr/features/domain/repositiories/quick_repository.dart';

@lazySingleton
class GetQuickUseCase extends UseCase<List<QuickEntity>, GetQuicksParams> {
  GetQuickUseCase(this.repository);

  final IQuickRepository repository;

  @override
  Future<Either<Failure, List<QuickEntity>>> call(GetQuicksParams params) {
    return repository.getQuicks();
  }
}

class GetQuicksParams {}
