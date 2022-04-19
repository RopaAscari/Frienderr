import 'package:dartz/dartz.dart';
import 'package:frienderr/core/failure/failure.dart';
import 'package:frienderr/features/domain/entities/notification.dart';

abstract class INotificationRepository {
  Future<Either<Failure, bool>> sendLikeNotification(
      LikeNotificationEntity notification);

  Future<Either<Failure, bool>> sendFollowNotification(
      FollowNotificationEntity notification);

  Future<Either<Failure, bool>> sendCommentNotification(
      CommentNotificationEntity notification);
}
