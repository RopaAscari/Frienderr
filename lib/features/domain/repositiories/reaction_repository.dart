import 'package:dartz/dartz.dart';
import 'package:frienderr/core/failure/failure.dart';

abstract class IReactionRepository {
  Future<Either<Failure, int>> getProfileReactions({required String uid});
}
