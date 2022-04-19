import 'package:frienderr/core/constants/constants.dart';
import 'package:frienderr/core/enums/enums.dart';
import 'package:frienderr/features/domain/entities/notification.dart';
import 'package:injectable/injectable.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:frienderr/features/data/models/notification/like_notification_model.dart';
import 'package:frienderr/features/data/models/notification/follow_notification_model.dart';
import 'package:frienderr/features/data/models/notification/comment_notification_model.dart';

@LazySingleton(as: INotificationRemoteDataProvider)
class NotificationRemoteDataProvider
    implements INotificationRemoteDataProvider {
  final FirebaseFirestore firestoreInstance;

  const NotificationRemoteDataProvider(this.firestoreInstance);
  @override
  Future<bool> sendFollowNotification(FollowNotificationEntity notification) {
    return firestoreInstance
        .collection(Constants.collections[Collections.Activity]!)
        .doc(notification.recipient)
        .collection('notifications')
        .add({} //notification.toJson()
            )
        .then((value) => true)
        .catchError((error) => false);
  }

  @override
  Future<bool> sendLikeNotification(LikeNotificationEntity notification) {
    return firestoreInstance
        .collection(Constants.collections[Collections.Activity]!)
        .doc(notification.recipient)
        .collection('notifications')
        .add({} //notification.toJson()
            )
        .then((value) => true)
        .catchError((error) => false);
  }

  @override
  Future<bool> sendCommentNotification(
      CommentNotificationEntity notification) async {
    return firestoreInstance
        .collection(Constants.collections[Collections.Activity]!)
        .doc(notification.recipient)
        .collection('notifications')
        .add({} //notification.toJson()
            )
        .then((value) => true)
        .catchError((error) => false);
  }
}

abstract class INotificationRemoteDataProvider {
  Future<bool> sendLikeNotification(LikeNotificationEntity notification);
  Future<bool> sendFollowNotification(FollowNotificationEntity notification);
  Future<bool> sendCommentNotification(CommentNotificationEntity notification);
}
