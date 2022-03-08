import 'package:frienderr/blocs/notification_bloc.dart';
import 'package:frienderr/events/notification_event.dart';
import 'package:frienderr/models/user/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:frienderr/models/notification/notification_model.dart';

class PostRepository {
  NotificationBloc notificationBloc = new NotificationBloc();

  final CollectionReference postCollection =
      FirebaseFirestore.instance.collection('posts');

  Future<bool> likePost(dynamic post, UserModel user) async {
    final userId = user.id;
    final postId = post['id'];

    try {
      await postCollection.doc(postId).update({
        'likes': FieldValue.increment(1),
        'userLikes': FieldValue.arrayUnion([userId])
      });

      final postUserId = post['user']['id'];

      if (userId != postUserId) {
        final senderUsername = user.username;
        final senderProfilePic = user.profilePic;
        final media = post['content'][0]['media'];
        final mediaType = post['content'][0]['type'];

        final notification = new LikeNotificationModel(
          type: 'Like',
          postId: postId,
          senderId: userId,
          mediaType: mediaType,
          postThumbnail: media,
          recipient: postUserId,
          senderUsername: senderUsername,
          senderProfilePic: senderProfilePic,
          dateCreated: DateTime.now().microsecondsSinceEpoch,
        );

        notificationBloc.add(SendLikeNotification(notification: notification));
      }
      return true;
    } catch (err) {
      return false;
    }
  }

  Future<bool> unLikePost(String postId, String userId) async {
    try {
      await postCollection.doc(postId).update({
        'likes': FieldValue.increment(-1),
        'userLikes': FieldValue.arrayRemove([userId])
      });
      return true;
    } catch (err) {
      return false;
    }
  }

  Future<bool> deletePost(String postId) async {
    try {
      await postCollection.doc(postId).delete();
      return true;
    } catch (error) {
      return false;
    }
  }
}
