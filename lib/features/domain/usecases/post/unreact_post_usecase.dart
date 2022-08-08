import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:frienderr/core/failure/failure.dart';
import 'package:frienderr/core/usecase/usecase.dart';
import 'package:frienderr/features/data/models/post/post_reaction_model.dart';
import 'package:frienderr/features/domain/repositiories/post_repository.dart';

@lazySingleton
class UnReactToPostUseCase extends UseCase<bool, UnReactToPostParams> {
  UnReactToPostUseCase(this.repository);

  final IPostRepository repository;

  @override
  Future<Either<Failure, bool>> call(UnReactToPostParams params) {
    return repository.unReactToPost(
        reaction: params.reaction, latestReactions: params.latestReactions);
  }
}

class UnReactToPostParams {
  final PostReaction reaction;
  final List<PostReaction> latestReactions;
  UnReactToPostParams(this.reaction, this.latestReactions);
}
