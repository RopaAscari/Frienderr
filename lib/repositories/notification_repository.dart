import 'package:frienderr/models/notification/notification_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

CollectionReference activity =
    FirebaseFirestore.instance.collection('activity');

class NotificationRepository {
  sendFollowNotification(FollowNotificationModel notification) {
    activity
        .doc(notification.recipient)
        .collection('notifications')
        .add(notification.toJson());
  }

  sendLikeNotification(LikeNotificationModel notification) {
    activity
        .doc(notification.recipient)
        .collection('notifications')
        .add(notification.toJson());
  }

  sendCommentNotification(CommentNotificationModel notification) {
    activity
        .doc(notification.recipient)
        .collection('notifications')
        .add(notification.toJson());
  }
}
