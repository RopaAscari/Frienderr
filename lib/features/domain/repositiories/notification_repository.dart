import 'package:dartz/dartz.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:frienderr/core/failure/failure.dart';
import 'package:frienderr/features/data/models/notification/notification_model.dart';
import 'package:frienderr/features/domain/entities/notification.dart';

abstract class INotificationRepository {
  Future<Either<Failure, bool>> sendLikeNotification(
      {required NotificationDTO notification});

  Future<Either<Failure, bool>> sendFollowNotification(
      {required NotificationDTO notification});

  Future<Either<Failure, bool>> sendCommentNotification(
      {required NotificationDTO notification});

  Future<Either<Failure, List<NotificationModel>>> getNotifications(
      {required String uid});

  Future<Either<Failure, List<NotificationModel>>> getPaginatedNotifications(
      {required String uid, required NotificationModel previousNotification});

  Either<Failure, Stream<QuerySnapshot<Map<String, dynamic>>>>
      delegateNotificationStream();
}
