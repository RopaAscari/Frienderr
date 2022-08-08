import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:frienderr/core/failure/failure.dart';
import 'package:frienderr/core/usecase/usecase.dart';
import 'package:frienderr/features/data/models/post/post_reaction_model.dart';
import 'package:frienderr/features/domain/repositiories/post_repository.dart';

@lazySingleton
class UpdatePostReactionUseCase
    extends UseCase<bool, UpdatePostReactionParams> {
  UpdatePostReactionUseCase(this.repository);

  final IPostRepository repository;

  @override
  Future<Either<Failure, bool>> call(UpdatePostReactionParams params) {
    return repository.updatePostReaction(
        reaction: params.reaction, latestReactions: params.latestReactions);
  }
}

class UpdatePostReactionParams {
  final PostReaction reaction;
  final List<PostReaction> latestReactions;
  UpdatePostReactionParams(this.reaction, this.latestReactions);
}
