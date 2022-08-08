import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:frienderr/core/failure/failure.dart';
import 'package:frienderr/core/usecase/usecase.dart';
import 'package:frienderr/features/domain/repositiories/reaction_repository.dart';

@lazySingleton
class GetProfileReactionsUseCase
    extends UseCase<int, GetProfileReactionsParams> {
  GetProfileReactionsUseCase(this.repository);

  final IReactionRepository repository;

  @override
  Future<Either<Failure, int>> call(GetProfileReactionsParams params) {
    return repository.getProfileReactions(uid: params.uid);
  }
}

class GetProfileReactionsParams {
  String uid;
  GetProfileReactionsParams({
    required this.uid,
  });
}
