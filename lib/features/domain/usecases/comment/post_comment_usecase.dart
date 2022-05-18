import 'package:dartz/dartz.dart';

import 'package:injectable/injectable.dart';
import 'package:frienderr/core/failure/failure.dart';
import 'package:frienderr/core/usecase/usecase.dart';
import 'package:frienderr/features/domain/entities/post.dart';
import 'package:frienderr/features/domain/entities/user.dart';
import 'package:frienderr/features/domain/entities/comment.dart';
import 'package:frienderr/features/domain/repositiories/comment_repository.dart';

@lazySingleton
class PostCommentUseCase extends UseCase<bool, PostCommentUseCaseParams> {
  PostCommentUseCase(this.repository);

  final ICommentRepository repository;

  @override
  Future<Either<Failure, bool>> call(PostCommentUseCaseParams params) {
    return repository.postComment(params.comment, params.post, params.user);
  }
}

class PostCommentUseCaseParams {
  final UserEntity user;
  final PostEntity post;
  final CommentEntity comment;
  PostCommentUseCaseParams(this.comment, this.post, this.user);
}
