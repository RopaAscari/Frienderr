import 'package:dartz/dartz.dart';
import 'package:frienderr/features/domain/entities/user.dart';
import 'package:injectable/injectable.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:frienderr/core/failure/failure.dart';
import 'package:frienderr/features/domain/entities/comment.dart';
import 'package:frienderr/features/data/providers/user_provider.dart';
import 'package:frienderr/features/data/providers/comment_provider.dart';
import 'package:frienderr/features/domain/repositiories/comment_repository.dart';

@LazySingleton(as: ICommentRepository)
class CommentRepository implements ICommentRepository {
  final IUserDataRemoteProvider _userRemoteDataProvider;
  final ICommentRemoteDataProvider _commentRemoteDataProvider;

  CommentRepository(
      this._commentRemoteDataProvider, this._userRemoteDataProvider);

  @override
  Future<Either<Failure, List<CommentEntity>>> getComments(
      String postId) async {
    try {
      final fetchedComments =
          await _commentRemoteDataProvider.getComments(postId);

      final QuerySnapshot<Object?> users =
          await _userRemoteDataProvider.getPlatformUsers();

      return Right(await Stream.fromIterable(fetchedComments.docs)
          .asyncMap((comment) async {
        final QueryDocumentSnapshot<Object?> user =
            users.docs.firstWhere((element) {
          return (element.data() as Map)['id'] == comment['user']['id'];
        });

        final Map<String, dynamic> combinedComment = comment.data();

        combinedComment['user'] = user.data() as Map<String, dynamic>;

        return new CommentEntity.fromJson(combinedComment);
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
