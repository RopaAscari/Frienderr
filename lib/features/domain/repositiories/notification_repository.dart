import 'package:dartz/dartz.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:frienderr/core/failure/failure.dart';
import 'package:frienderr/features/domain/entities/notification.dart';

abstract class INotificationRepository {
  Future<Either<Failure, bool>> sendLikeNotification(
      {required NotificationEntity notification});

  Future<Either<Failure, bool>> sendFollowNotification(
      {required NotificationEntity notification});

  Future<Either<Failure, bool>> sendCommentNotification(
      {required NotificationEntity notification});

  Future<Either<Failure, List<NotificationEntity>>> getNotifications(
      {required String uid});

  Either<Failure, Stream<QuerySnapshot<Map<String, dynamic>>>>
      delegateNotificationStream();
}
