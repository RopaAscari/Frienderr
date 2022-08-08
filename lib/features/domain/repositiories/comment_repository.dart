import 'package:dartz/dartz.dart';
import 'package:frienderr/core/enums/enums.dart';
import 'package:frienderr/core/failure/failure.dart';
import '../../data/models/comment/comment_model.dart';
import 'package:frienderr/features/domain/entities/comment.dart';
import 'package:frienderr/features/domain/entities/notification.dart';

abstract class ICommentRepository {
  Future<Either<Failure, List<Comment>>> getComments(
      {required String pid, required CommentType type});
  Future<Either<Failure, List<Comment>>> getPaginatedComments(
      {required Comment previousComment, required CommentType type});

  Future<Either<Failure, bool>> deleteComment(
      {required String id, required String postId, required CommentType type});
  Future<Either<Failure, Comment>> postComment({
    required CommentType type,
    required CommentDTO comment,
    required NotificationDTO? notification,
  });
}
