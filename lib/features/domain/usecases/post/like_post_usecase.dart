import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:frienderr/core/failure/failure.dart';
import 'package:frienderr/core/usecase/usecase.dart';
import 'package:frienderr/features/domain/entities/post.dart';
import 'package:frienderr/features/domain/entities/user.dart';
import 'package:frienderr/features/data/models/user/user_model.dart';
import 'package:frienderr/features/domain/repositiories/post_repository.dart';

@lazySingleton
class LikePostUseCase extends UseCase<bool, LikePostParams> {
  LikePostUseCase(this.repository);

  final IPostRepository repository;

  @override
  Future<Either<Failure, bool>> call(LikePostParams params) {
    return repository.likePost(params.post, params.user);
  }
}

class LikePostParams {
  final PostEntity post;
  final UserEntity user;
  LikePostParams(this.post, this.user);
}
