import 'package:frienderr/core/failure/failure.dart';
import 'package:frienderr/features/domain/entities/quick.dart';

import 'package:dartz/dartz.dart';

abstract class IQuickRepository {
  Future<Either<Failure, List<QuickEntity>>> getQuicks();
}
