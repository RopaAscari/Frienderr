import 'package:dartz/dartz.dart';
import 'package:frienderr/core/failure/failure.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

abstract class NoFuturisticUseCase<Type, Params> {
  Either<Failure, Type> call(Params params);
}
