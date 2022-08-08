import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:frienderr/core/failure/failure.dart';
import 'package:frienderr/features/data/providers/reaction_provider.dart';
import 'package:frienderr/features/domain/repositiories/reaction_repository.dart';

@LazySingleton(as: IReactionRepository)
class ReactionRepository implements IReactionRepository {
  final IReactionRemoteDataProvider _reactionRemoteDataProvider;

  ReactionRepository(this._reactionRemoteDataProvider);

  @override
  Future<Either<Failure, int>> getProfileReactions(
      {required String uid}) async {
    final reactions =
        await _reactionRemoteDataProvider.getProfileReactions(uid: uid);

    try {
      return Right(reactions.docs.length);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
