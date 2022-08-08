import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:frienderr/core/enums/enums.dart';
import 'package:frienderr/core/failure/failure.dart';
import 'package:frienderr/core/usecase/usecase.dart';
import 'package:frienderr/features/domain/entities/comment.dart';
import 'package:frienderr/features/domain/entities/notification.dart';
import 'package:frienderr/features/data/models/comment/comment_model.dart';
import 'package:frienderr/features/domain/repositiories/comment_repository.dart';

@lazySingleton
class PostCommentUseCase extends UseCase<Comment, PostCommentUseCaseParams> {
  PostCommentUseCase(this.repository);

  final ICommentRepository repository;

  @override
  Future<Either<Failure, Comment>> call(PostCommentUseCaseParams params) {
    return repository.postComment(
      type: params.type,
      comment: params.comment,
      notification: params.notification,
    );
  }
}

class PostCommentUseCaseParams {
  final CommentType type;
  final CommentDTO comment;
  final NotificationDTO? notification;

  PostCommentUseCaseParams({
    required this.type,
    required this.comment,
    required this.notification,
  });
}
