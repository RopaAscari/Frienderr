import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:frienderr/core/failure/failure.dart';
import 'package:frienderr/features/domain/entities/notification.dart';
import 'package:frienderr/features/data/providers/user_provider.dart';
import 'package:frienderr/features/data/providers/notification_provider.dart';
import 'package:frienderr/features/data/models/notification/notification_model.dart';
import 'package:frienderr/features/domain/repositiories/notification_repository.dart';

@LazySingleton(as: INotificationRepository)
class NotificationRepository implements INotificationRepository {
  final IUserDataRemoteProvider _userRemoteDataProvider;
  final INotificationRemoteDataProvider _notificationRemoteDataProvider;

  const NotificationRepository(
      this._notificationRemoteDataProvider, this._userRemoteDataProvider);

  @override
  Either<Failure, Stream<QuerySnapshot<Map<String, dynamic>>>>
      delegateNotificationStream() {
    try {
      return Right(
          _notificationRemoteDataProvider.delegateNotificationStream());
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> sendFollowNotification(
      {required NotificationEntity notification}) async {
    try {
      final _result = await _notificationRemoteDataProvider
          .sendFollowNotification(notification);

      await _notificationRemoteDataProvider
          .disptachPushNotification(notification);

      return Right(_result);
    } catch (error) {
      return Left(Failure(message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> sendLikeNotification(
      {required NotificationEntity notification}) async {
    try {
      final _result = await _notificationRemoteDataProvider
          .sendLikeNotification(notification);

      await _notificationRemoteDataProvider
          .disptachPushNotification(notification);

      return Right(_result);
    } catch (error) {
      return Left(Failure(message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> sendCommentNotification(
      {required NotificationEntity notification}) async {
    try {
      final _result = await _notificationRemoteDataProvider
          .sendCommentNotification(notification);

      await _notificationRemoteDataProvider
          .disptachPushNotification(notification);

      return Right(_result);
    } catch (error) {
      return Left(Failure(message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, List<NotificationEntity>>> getNotifications(
      {required String uid}) async {
    try {
      final _rawNotifications =
          await _notificationRemoteDataProvider.getNotifications(uid: uid);

      final users = await _userRemoteDataProvider.getPlatformUsers();

      final _result = _rawNotifications.docs.map((notification) {
        Map<String, dynamic> data = notification.data() as Map<String, dynamic>;

        data['user'] = users.docs.firstWhere((user) {
          return user.data()['id'] == data['user']['id'];
        }).data();

        return NotificationModel.fromJson(data);
      }).toList();

      return Right(_result);
    } catch (error) {
      return Left(Failure(message: error.toString()));
    }
  }
}
