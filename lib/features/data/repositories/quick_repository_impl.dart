import 'package:dartz/dartz.dart';

import 'package:injectable/injectable.dart';
import 'package:frienderr/core/failure/failure.dart';
import 'package:frienderr/features/domain/entities/quick.dart';
import 'package:frienderr/features/data/providers/quick_provider.dart';
import 'package:frienderr/features/domain/repositiories/quick_repository.dart';

@LazySingleton(as: IQuickRepository)
class QuickRepository implements IQuickRepository {
  final IQuickRemoteDataProvider _quickRemoteDataProvider;

  QuickRepository(this._quickRemoteDataProvider);

  Future<Either<Failure, List<QuickEntity>>> getQuicks() async {
    try {
      return Right(await _quickRemoteDataProvider.getQuicks());
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
