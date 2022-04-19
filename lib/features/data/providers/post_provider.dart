import 'dart:convert';
import 'package:injectable/injectable.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:frienderr/features/domain/entities/user.dart';
import 'package:frienderr/features/data/models/post/post_model.dart';

@LazySingleton(as: IPostRemoteDataProvider)
class PostRemoteDataProvider implements IPostRemoteDataProvider {
  FirebaseFirestore firestoreInstance;
  PostRemoteDataProvider(this.firestoreInstance);

  @override
  Future<QuerySnapshot<Object?>> getPosts() async {
    return await firestoreInstance
        .collection('posts')
        .orderBy('dateCreated', descending: true)
        .limit(10)
        .get();
  }

  @override
  Stream<QuerySnapshot<Map<String, dynamic>>> delegateTimelineStream() {
    return firestoreInstance
        .collection('posts')
        .snapshots(includeMetadataChanges: true);
  }

  @override
  Future<QuerySnapshot<Object?>> getPaginatedPosts(
      Map<dynamic, dynamic> posts) async {
    return await firestoreInstance
        .collection('posts')
        .orderBy('dateCreated', descending: true)
        .startAfter([posts[posts.length - 1]['dateCreated']])
        .limit(10)
        .get();
  }

  @override
  Future<DocumentSnapshot<Map<String, dynamic>>>
      fetchTimelinelinePostCount() async {
    return await FirebaseFirestore.instance
        .collection('postCount')
        .doc('count')
        .get();
  }

  @override
  Future<bool> likePost(dynamic post, UserEntity user) async {
    final userId = user.id;
    final postId = post['id'];

    try {
      await firestoreInstance.collection('posts').doc(postId).update({
        'likes': FieldValue.increment(1),
        'userLikes': FieldValue.arrayUnion([userId])
      });

      final postUserId = post['user']['id'];

      if (userId != postUserId) {
        final senderUsername = user.username;
        final senderProfilePic = user.profilePic;
        final media = post['content'][0]['media'];
        final mediaType = post['content'][0]['type'];

        /* final notification = new LikeNotificationModel(
          type: 'Like',
          postId: postId,
          senderId: userId,
          mediaType: mediaType,
          postThumbnail: media,
          recipient: postUserId,
          senderUsername: senderUsername,
          senderProfilePic: senderProfilePic as String,
          dateCreated: DateTime.now().microsecondsSinceEpoch,
        );

        notificationBloc.add(SendLikeNotification(notification: notification));*/
      }
      return true;
    } catch (err) {
      return false;
    }
  }

  @override
  Future<bool> unLikePost(String postId, String userId) async {
    try {
      await firestoreInstance.collection('posts').doc(postId).update({
        'likes': FieldValue.increment(-1),
        'userLikes': FieldValue.arrayRemove([userId])
      });
      return true;
    } catch (err) {
      return false;
    }
  }

  @override
  Future<bool> deletePost(String postId) async {
    try {
      await firestoreInstance.collection('posts').doc(postId).delete();
      return true;
    } catch (error) {
      return false;
    }
  }
}

abstract class IPostRemoteDataProvider {
  Future<bool> deletePost(String postId);

  Future<QuerySnapshot<Object?>> getPosts();

  Future<bool> likePost(dynamic post, UserEntity user);

  Future<bool> unLikePost(String postId, String userId);

  Stream<QuerySnapshot<Map<String, dynamic>>> delegateTimelineStream();

  Future<QuerySnapshot<Object?>> getPaginatedPosts(Map<dynamic, dynamic> posts);

  Future<DocumentSnapshot<Map<String, dynamic>>> fetchTimelinelinePostCount();
}
