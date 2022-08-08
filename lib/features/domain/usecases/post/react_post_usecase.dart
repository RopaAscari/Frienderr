import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:frienderr/core/failure/failure.dart';
import 'package:frienderr/core/usecase/usecase.dart';
import '../../../data/models/post/post_reaction_model.dart';
import 'package:frienderr/features/data/models/post/post_model.dart';
import 'package:frienderr/features/data/models/user/user_model.dart';
import 'package:frienderr/features/domain/repositiories/post_repository.dart';

@lazySingleton
class ReactToPostUseCase extends UseCase<bool, ReactToPostParams> {
  ReactToPostUseCase(this.repository);

  final IPostRepository repository;

  @override
  Future<Either<Failure, bool>> call(ReactToPostParams params) {
    return repository.reactToPost(
        post: params.post,
        user: params.user,
        reaction: params.reaction,
        latestReactions: params.latestReactions);
  }
}

class ReactToPostParams {
  final Post post;
  final UserModel user;
  final PostReaction reaction;
  final List<PostReaction> latestReactions;
  ReactToPostParams(this.post, this.user, this.reaction, this.latestReactions);
}
