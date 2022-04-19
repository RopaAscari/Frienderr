import 'package:dartz/dartz.dart';
import 'package:frienderr/features/domain/entities/comment.dart';
import 'package:injectable/injectable.dart';
import 'package:frienderr/core/failure/failure.dart';
import 'package:frienderr/core/usecase/usecase.dart';
import 'package:frienderr/features/domain/repositiories/comment_repository.dart';

@lazySingleton
class GetCommentsUseCase
    extends UseCase<List<CommentEntity>, GetCommentsParams> {
  GetCommentsUseCase(this.repository);

  final ICommentRepository repository;

  @override
  Future<Either<Failure, List<CommentEntity>>> call(GetCommentsParams params) {
    return repository.getComments(params.id);
  }
}

class GetCommentsParams {
  final String id;

  GetCommentsParams(this.id);
}
