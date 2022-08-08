import 'package:dartz/dartz.dart';
import 'package:frienderr/core/enums/enums.dart';
import 'package:injectable/injectable.dart';
import 'package:frienderr/core/failure/failure.dart';
import 'package:frienderr/core/usecase/usecase.dart';
import 'package:frienderr/features/data/models/comment/comment_model.dart';
import 'package:frienderr/features/domain/repositiories/comment_repository.dart';

@lazySingleton
class DeleteCommentUseCase extends UseCase<bool, DeleteCommentParams> {
  DeleteCommentUseCase(this.repository);

  final ICommentRepository repository;

  @override
  Future<Either<Failure, bool>> call(DeleteCommentParams params) {
    return repository.deleteComment(
        id: params.id, postId: params.postId, type: params.type);
  }
}

class DeleteCommentParams {
  final String id;
  final String postId;
  final CommentType type;

  DeleteCommentParams(this.id, this.postId, this.type);
}
