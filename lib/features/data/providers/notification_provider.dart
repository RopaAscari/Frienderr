import 'package:frienderr/features/presentation/mixins/gql_mixin.dart';
import 'package:injectable/injectable.dart';
import 'package:frienderr/core/enums/enums.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:frienderr/core/constants/constants.dart';
import 'package:frienderr/features/domain/entities/notification.dart';

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
        .collection(Constants.collections[Collections.Activity]!)
        .doc(uid)
        .collection('notifications')
        .orderBy('dateCreated', descending: true)
        .snapshots();
  }

  @override
  Future<QuerySnapshot<Object?>> getNotifications({required String uid}) async {
    return firestoreInstance
        .collection(Constants.collections[Collections.Activity]!)
        .doc(uid)
        .collection('notifications')
        .orderBy('dateCreated', descending: true)
        .get();
  }

  @override
  Future<bool> sendFollowNotification(NotificationEntity notification) {
    return firestoreInstance
        .collection(Constants.collections[Collections.Activity]!)
        .doc(notification.recipientId)
        .collection('notifications')
        .add(notification.toJson())
        .then((value) => true)
        .catchError((error) => false);
  }

  @override
  Future<bool> sendLikeNotification(NotificationEntity notification) {
    return firestoreInstance
        .collection(Constants.collections[Collections.Activity]!)
        .doc(notification.recipientId)
        .collection('notifications')
        .add(notification.toJson())
        .then((value) => true)
        .catchError((error) => false);
  }

  @override
  Future<bool> sendCommentNotification(NotificationEntity notification) async {
    return firestoreInstance
        .collection(Constants.collections[Collections.Activity]!)
        .doc(notification.recipientId)
        .collection('notifications')
        .add(notification.toJson())
        .then((value) => true)
        .catchError((error) => false);
  }

  @override
  Future<bool> disptachPushNotification(NotificationEntity notification) async {
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
  Future<bool> sendLikeNotification(NotificationEntity notification);
  Future<bool> sendFollowNotification(NotificationEntity notification);
  Future<bool> sendCommentNotification(NotificationEntity notification);
  Future<bool> disptachPushNotification(NotificationEntity notification);
  Future<QuerySnapshot<Object?>> getNotifications({required String uid});
  Stream<QuerySnapshot<Map<String, dynamic>>> delegateNotificationStream();
}
