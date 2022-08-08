import 'package:dartz/dartz.dart';
import 'package:automap/automap.dart';
import 'package:injectable/injectable.dart';
import 'package:collection/collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:frienderr/core/failure/failure.dart';
import 'package:frienderr/core/mappers/mapping_profile.dart';
import 'package:frienderr/features/domain/entities/user.dart';
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
    this._userRemoteDataProvider,
    this._notificationRemoteDataProvider,
  );

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
      {required NotificationDTO notification}) async {
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
      {required NotificationDTO notification}) async {
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
      {required NotificationDTO notification}) async {
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
  Future<Either<Failure, List<NotificationModel>>> getNotifications(
      {required String uid}) async {
    try {
      final QuerySnapshot<NotificationDTO> _notificationQuery =
          await _notificationRemoteDataProvider.getNotifications(uid: uid);

      List<String> userIds =
          _notificationQuery.docs.map((p) => p.data().user.id).toSet().toList();

      if (userIds.isEmpty) {
        return const Right([]);
      }

      final QuerySnapshot<UserDTO> _userQuery =
          await _userRemoteDataProvider.getUsersByIds(userIds: userIds);

      final _notificationDTO = _handleDTOMapping(
        users: _userQuery,
        notifications: _notificationQuery,
      );

      final notifcations =
          AutoMapper.I.map<List<NotificationDTO>, List<NotificationModel>>(
        _notificationDTO as List<NotificationDTO>,
      );
      return Right(notifcations);
    } catch (error) {
      return Left(Failure(message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, List<NotificationModel>>> getPaginatedNotifications(
      {required String uid,
      required NotificationModel previousNotification}) async {
    try {
      final QuerySnapshot<NotificationDTO> _notificationQuery =
          await _notificationRemoteDataProvider.getPaginatedNotifications(
              uid: uid, previousNotification: previousNotification);
      List<String> userIds =
          _notificationQuery.docs.map((p) => p.data().user.id).toSet().toList();

      if (userIds.isEmpty) {
        return const Right([]);
      }

      final QuerySnapshot<UserDTO> _userQuery =
          await _userRemoteDataProvider.getUsersByIds(userIds: userIds);
      final _notificationDTO = _handleDTOMapping(
        notifications: _notificationQuery,
        users: _userQuery,
      );

      final notifcations =
          AutoMapper.I.map<List<NotificationDTO>, List<NotificationModel>>(
        _notificationDTO as List<NotificationDTO>,
      );
      return Right(notifcations);
    } catch (error) {
      return Left(Failure(message: error.toString()));
    }
  }

  List<NotificationDTO> _handleDTOMapping({
    required QuerySnapshot<UserDTO> users,
    required QuerySnapshot<NotificationDTO> notifications,
  }) {
    List<NotificationDTO> result = [];

    for (var document in notifications.docs) {
      NotificationDTO notification = document.data();

      final response = users.docs.firstWhereOrNull((x) {
        return x.data().id == notification.user.id;
      })?.data();

      notification.user =
          response ?? UserDTO(id: '0000000000000', username: "Unknown");

      result.add(notification);
    }
    return result;
  }
}
