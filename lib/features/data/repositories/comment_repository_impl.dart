import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:frienderr/core/failure/failure.dart';
import 'package:frienderr/features/domain/entities/comment.dart';
import 'package:frienderr/features/data/providers/comment_provider.dart';
import 'package:frienderr/features/domain/repositiories/comment_repository.dart';

@LazySingleton(as: ICommentRepository)
class CommentRepository implements ICommentRepository {
  final ICommentRemoteDataProvider _commentRemoteDataProvider;

  CommentRepository(this._commentRemoteDataProvider);

  @override
  Future<Either<Failure, List<CommentEntity>>> getComments(
      String postId) async {
    try {
      final fetchedComments =
          await _commentRemoteDataProvider.getComments(postId);

      return Right(await Stream.fromIterable(fetchedComments.docs)
          .asyncMap((comment) async {
        return new CommentEntity(
          id: comment['id'],
          userId: comment['userId'],
          comment: comment['comment'],
          username: comment['username'],
          profilePic: comment['profilePic'],
          dateCreated: comment['dateCreated'],
        );
      }).toList());
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> postComment(
      CommentEntity comment, String postId) async {
    try {
      return Right(
          await _commentRemoteDataProvider.postComment(postId, comment));
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
