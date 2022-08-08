import 'package:dartz/dartz.dart';
import 'package:frienderr/core/enums/enums.dart';
import 'package:injectable/injectable.dart';
import 'package:frienderr/core/failure/failure.dart';
import 'package:frienderr/core/usecase/usecase.dart';
import 'package:frienderr/features/data/models/comment/comment_model.dart';
import 'package:frienderr/features/domain/repositiories/comment_repository.dart';

@lazySingleton
class GetCommentsUseCase extends UseCase<List<Comment>, GetCommentsParams> {
  GetCommentsUseCase(this.repository);

  final ICommentRepository repository;

  @override
  Future<Either<Failure, List<Comment>>> call(GetCommentsParams params) {
    return repository.getComments(pid: params.pid, type: params.type);
  }
}

class GetCommentsParams {
  final String pid;
  final CommentType type;

  GetCommentsParams(this.pid, this.type);
}
