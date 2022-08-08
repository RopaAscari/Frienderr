import 'package:frienderr/core/constants/constants.dart';
import 'package:frienderr/features/data/models/notification/notification_model.dart';
import 'package:injectable/injectable.dart';
import 'package:frienderr/core/enums/enums.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:frienderr/features/presentation/mixins/gql_mixin.dart';
import 'package:frienderr/features/domain/entities/notification.dart';
import 'package:frienderr/core/enums/collections/notifications/order_fields.dart';

@LazySingleton(as: INotificationRemoteDataProvider)
class NotificationRemoteDataProvider
    implements INotificationRemoteDataProvider {
  final FirebaseAuth auth;
  final GraphQLClient client;
  final FirebaseFirestore firestoreInstance;

  const NotificationRemoteDataProvider(
    this.auth,
    this.client,
    this.firestoreInstance,
  );

  @override
  Stream<QuerySnapshot<Map<String, dynamic>>> delegateNotificationStream() {
    final uid = auth.currentUser!.uid;
    return firestoreInstance
        .collection(Collections.activity)
        .doc(uid)
        .collection(Collections.notifications)
        .orderBy(NotificationOrderFields.dateCreated.name, descending: true)
        .snapshots();
  }

  @override
  Future<QuerySnapshot<NotificationDTO>> getNotifications(
      {required String uid}) async {
    return firestoreInstance
        .collection(Collections.activity)
        .doc(uid)
        .collection(Collections.notifications)
        .orderBy(NotificationOrderFields.dateCreated.name, descending: true)
        .withConverter<NotificationDTO>(
          toFirestore: (snapshot, _) => snapshot.toJson(),
          fromFirestore: (snapshot, _) {
            return NotificationDTO.fromJson(snapshot.data()!);
          },
        )
        .limit(Constants.pageSize)
        .get();
  }

  @override
  Future<QuerySnapshot<NotificationDTO>> getPaginatedNotifications(
      {required String uid,
      required NotificationModel previousNotification}) async {
    return await firestoreInstance
        .collection(Collections.activity)
        .doc(uid)
        .collection(Collections.notifications)
        .startAfter([previousNotification.dateCreated])
        .orderBy(NotificationOrderFields.dateCreated.name, descending: true)
        .withConverter<NotificationDTO>(
          toFirestore: (snapshot, _) => snapshot.toJson(),
          fromFirestore: (snapshot, _) =>
              NotificationDTO.fromJson(snapshot.data()!),
        )
        .limit(Constants.pageSize)
        .get();
  }

  @override
  Future<bool> sendFollowNotification(NotificationDTO notification) {
    return firestoreInstance
        .collection(Collections.activity)
        .doc(notification.recipientId)
        .collection(Collections.notifications)
        .add(notification.toJson())
        .then((value) => true)
        .catchError((error) => false);
  }

  @override
  Future<bool> sendLikeNotification(NotificationDTO notification) {
    return firestoreInstance
        .collection(Collections.activity)
        .doc(notification.recipientId)
        .collection(Collections.notifications)
        .add(notification.toJson())
        .then((value) => true)
        .catchError((error) => false);
  }

  @override
  Future<bool> sendCommentNotification(NotificationDTO notification) async {
    return firestoreInstance
        .collection(Collections.activity)
        .doc(notification.recipientId)
        .collection(Collections.notifications)
        .add(notification.toJson())
        .then((value) => true)
        .catchError((error) => false);
  }

  @override
  Future<bool> disptachPushNotification(NotificationDTO notification) async {
    try {
      final variables = PushNotificationEntity(
        type: notification.type,
        senderId: notification.user.id,
        recipientId: notification.recipientId,
        senderUsername: notification.user.username ?? '',
      ).toJson();

      final response = await client.mutate(MutationOptions(
          onError: ((error) {
            print(error);
          }),
          document: gql(Queries.dispatchPushNotificatonRequest),
          variables: variables));

      print('RESPONSE ${response.data}');
      return true;
    } catch (e) {
      return false;
    }
  }
}

abstract class INotificationRemoteDataProvider {
  Future<bool> sendLikeNotification(NotificationDTO notification);
  Future<bool> sendFollowNotification(NotificationDTO notification);
  Future<bool> sendCommentNotification(NotificationDTO notification);
  Future<bool> disptachPushNotification(NotificationDTO notification);
  Future<QuerySnapshot<NotificationDTO>> getNotifications(
      {required String uid});
  Future<QuerySnapshot<NotificationDTO>> getPaginatedNotifications(
      {required String uid, required NotificationModel previousNotification});
  Stream<QuerySnapshot<Map<String, dynamic>>> delegateNotificationStream();
}
