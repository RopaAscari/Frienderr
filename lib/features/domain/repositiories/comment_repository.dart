import 'package:dartz/dartz.dart';
import 'package:frienderr/core/failure/failure.dart';
import 'package:frienderr/features/domain/entities/comment.dart';
import 'package:frienderr/features/data/models/comment/comment_model.dart';

abstract class ICommentRepository {
  Future<Either<Failure, List<CommentEntity>>> getComments(String postId);
  Future<Either<Failure, bool>> postComment(
      CommentEntity comment, String postId);
}
