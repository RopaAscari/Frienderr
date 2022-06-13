import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:frienderr/core/failure/failure.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:frienderr/core/services/helpers.dart';
import 'package:frienderr/features/domain/entities/post.dart';
import 'package:frienderr/features/domain/entities/user.dart';
import 'package:frienderr/features/domain/entities/comment.dart';
import 'package:frienderr/features/domain/entities/notification.dart';
import 'package:frienderr/features/data/providers/user_provider.dart';
import 'package:frienderr/features/data/providers/comment_provider.dart';
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

        return CommentEntity.fromJson(combinedComment);
      }).toList());
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> postComment(
      CommentEntity comment, PostEntity post, UserEntity user) async {
    try {
      final _result =
          await _commentRemoteDataProvider.postComment(post.id, comment);

      if (post.user.id != user.id) {
        late final String display;

        if (post.content.first.type == 'video') {
          display = post.content.first.metadata.thumbnail as String;
        } else {
          display = post.content.first.media;
        }

        final NotificationEntity notification = NotificationEntity(
          type: 2,
          mediaType: 1,
          recipientId: post.user.id,
          id: Helpers.generateId(25),
          metadata: NotificationMetadataEntity(),
          dateCreated: DateTime.now().microsecondsSinceEpoch,
          post: PartialPostEntity(id: post.id, display: display),
          user: UserEntity(id: user.id, username: user.username),
        );

        await _notificationRepository.sendLikeNotification(
            notification: notification);
      }
      return Right(_result);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
