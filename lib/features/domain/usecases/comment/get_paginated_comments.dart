import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:frienderr/core/enums/enums.dart';
import 'package:frienderr/core/failure/failure.dart';
import 'package:frienderr/core/usecase/usecase.dart';
import 'package:frienderr/features/data/models/comment/comment_model.dart';
import 'package:frienderr/features/domain/repositiories/comment_repository.dart';

@lazySingleton
class GetPaginatedCommentsUseCase
    extends UseCase<List<Comment>, GetPaginatedCommentsParams> {
  GetPaginatedCommentsUseCase(this.repository);

  final ICommentRepository repository;

  @override
  Future<Either<Failure, List<Comment>>> call(
      GetPaginatedCommentsParams params) {
    return repository.getPaginatedComments(
        previousComment: params.previousComment, type: params.type);
  }
}

class GetPaginatedCommentsParams {
  final CommentType type;
  final Comment previousComment;

  GetPaginatedCommentsParams(
      {required this.type, required this.previousComment});
}
