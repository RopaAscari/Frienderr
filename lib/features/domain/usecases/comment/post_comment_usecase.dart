import 'package:dartz/dartz.dart';
import 'package:frienderr/features/domain/entities/comment.dart';
import 'package:frienderr/features/domain/repositiories/comment_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:frienderr/core/failure/failure.dart';
import 'package:frienderr/core/usecase/usecase.dart';
import 'package:frienderr/features/domain/repositiories/auth_repository.dart';

@lazySingleton
class PostCommentUseCase extends UseCase<bool, PostCommentUseCaseParams> {
  PostCommentUseCase(this.repository);

  final ICommentRepository repository;

  @override
  Future<Either<Failure, bool>> call(PostCommentUseCaseParams params) {
    return repository.postComment(params.comment, params.postId);
  }
}

class PostCommentUseCaseParams {
  final String postId;
  final CommentEntity comment;
  PostCommentUseCaseParams(this.comment, this.postId);
}
