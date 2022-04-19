import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:frienderr/core/failure/failure.dart';
import 'package:frienderr/features/domain/entities/notification.dart';
import 'package:frienderr/features/data/providers/notification_provider.dart';
import 'package:frienderr/features/domain/repositiories/notification_repository.dart';

@LazySingleton(as: INotificationRepository)
class NotificationRepository implements INotificationRepository {
  final INotificationRemoteDataProvider _notificationRemoteDataProvider;

  const NotificationRepository(this._notificationRemoteDataProvider);

  @override
  Future<Either<Failure, bool>> sendFollowNotification(
      FollowNotificationEntity notification) async {
    try {
      return Right(await _notificationRemoteDataProvider
          .sendFollowNotification(notification));
    } catch (error) {
      return Left(Failure(message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> sendLikeNotification(
      LikeNotificationEntity notification) async {
    try {
      return Right(await _notificationRemoteDataProvider
          .sendLikeNotification(notification));
    } catch (error) {
      return Left(Failure(message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> sendCommentNotification(
      CommentNotificationEntity notification) async {
    try {
      return Right(await _notificationRemoteDataProvider
          .sendCommentNotification(notification));
    } catch (error) {
      return Left(Failure(message: error.toString()));
    }
  }
}
