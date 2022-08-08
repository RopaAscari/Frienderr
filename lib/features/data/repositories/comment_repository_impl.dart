import 'package:dartz/dartz.dart';
import 'package:automap/automap.dart';
import 'package:frienderr/core/enums/enums.dart';
import 'package:injectable/injectable.dart';
import 'package:frienderr/core/failure/failure.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:frienderr/core/services/helpers.dart';
import 'package:frienderr/features/domain/entities/post.dart';
import 'package:frienderr/features/domain/entities/user.dart';
import 'package:frienderr/features/domain/entities/comment.dart';
import 'package:frienderr/features/data/models/post/post_model.dart';
import 'package:frienderr/features/data/models/user/user_model.dart';
import 'package:frienderr/features/domain/entities/notification.dart';
import 'package:frienderr/features/data/providers/user_provider.dart';
import 'package:frienderr/features/data/providers/comment_provider.dart';
import 'package:frienderr/features/data/models/comment/comment_model.dart';
import 'package:frienderr/features/domain/repositiories/comment_repository.dart';
import 'package:frienderr/features/domain/repositiories/notification_repository.dart';

@LazySingleton(as: ICommentRepository)
class CommentRepository implements ICommentRepository {
  final INotificationRepository _notificationRepository;
  final IUserDataRemoteProvider _userRemoteDataProvider;
  final ICommentRemoteDataProvider _commentRemoteDataProvider;

  CommentRepository(this._commentRemoteDataProvider,
      this._userRemoteDataProvider, this._notificationRepository);

  @override
  Future<Either<Failure, List<Comment>>> getComments(
      {required String pid, required CommentType type}) async {
    try {
      final QuerySnapshot<CommentDTO> commentQuery =
          await _commentRemoteDataProvider.getComments(pid: pid, type: type);

      List<String> userIds = commentQuery.docs
          .map((p) => p.data().user.id)
          .toSet()
          .cast<String>()
          .toList();
      if (userIds.isEmpty) {
        return const Right([]);
      }

      final QuerySnapshot<UserDTO> userQuery =
          await _userRemoteDataProvider.getUsersByIds(userIds: userIds);

      final _commentsDto =
          _handleDTOMapping(comments: commentQuery, users: userQuery);

      final comments = AutoMapper.I.map<List<CommentDTO>, List<Comment>>(
        _commentsDto,
      );

      return Right(comments);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Comment>>> getPaginatedComments(
      {required Comment previousComment, required CommentType type}) async {
    try {
      final QuerySnapshot<CommentDTO> commentQuery =
          await _commentRemoteDataProvider.getPaginatedComments(
              previousComment: previousComment, type: type);

      List<String> userIds = commentQuery.docs
          .map((p) => p.data().user.id)
          .toSet()
          .cast<String>()
          .toList();
      if (userIds.isEmpty) {
        return const Right([]);
      }

      final QuerySnapshot<UserDTO> userQuery =
          await _userRemoteDataProvider.getUsersByIds(userIds: userIds);

      final _commentsDto =
          _handleDTOMapping(comments: commentQuery, users: userQuery);

      final comments = AutoMapper.I.map<List<CommentDTO>, List<Comment>>(
        _commentsDto,
      );

      return Right(comments);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Comment>> postComment({
    required CommentType type,
    required CommentDTO comment,
    required NotificationDTO? notification,
  }) async {
    try {
      final _result = await _commentRemoteDataProvider.postComment(
          comment: comment, type: type);

      /* if (_result && notification != null) {
        await _notificationRepository.sendLikeNotification(
            notification: notification);
      }*/

      final _commentModel = AutoMapper.I.map<CommentDTO, Comment>(
        comment,
      );

      return Right(_commentModel);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> deleteComment(
      {required String id,
      required String postId,
      required CommentType type}) async {
    try {
      final bool result = await _commentRemoteDataProvider.deleteComment(
          id: id, postId: postId, type: type);
      return Right(result);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  List<CommentDTO> _handleDTOMapping({
    required QuerySnapshot<CommentDTO> comments,
    required QuerySnapshot<UserDTO> users,
  }) {
    List<CommentDTO> result = [];

    for (var document in comments.docs) {
      CommentDTO comment = document.data();

      comment.user = users.docs.firstWhere((x) {
        return x.data().id == document.data().user.id;
      }).data();

      result.add(comment);
    }

    return result;
  }
}
