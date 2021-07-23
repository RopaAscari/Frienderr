import 'package:frienderr/util/helpers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:frienderr/models/user/user_model.dart';

class UserRepository {
  final Helpers helpers = new Helpers();
  final CollectionReference users =
      FirebaseFirestore.instance.collection('users');

  Future<List<UserModel>> fetchFollowing(String id) async {
    final user = await users.where('id', isEqualTo: id).get();
    final userFriendList = user.docs[0]['following'];

    if (userFriendList.length == 0) {
      return [];
    }

    return await Stream.fromIterable(userFriendList).asyncMap((item) async {
      final follower = await users.where('id', isEqualTo: item).get();

      return new UserModel(
          id: follower.docs[0]['id'],
          chats: follower.docs[0]['chats'],
          status: follower.docs[0]['status'],
          stories: follower.docs[0]['stories'],
          username: follower.docs[0]['username'],
          location: follower.docs[0]['location'],
          presence: follower.docs[0]['presence'],
          following: follower.docs[0]['following'],
          followers: follower.docs[0]['followers'],
          profilePic: follower.docs[0]['profilePic'],
          coverPhoto: follower.docs[0]['coverPhoto'],
          bitmapImage: follower.docs[0]['bitmapImage'],
          isLocationEnabled: follower.docs[0]['isLocationEnabled']);
    }).toList();
  }

  Future<List<UserModel>> fetchFollowers(String id) async {
    final user = await users.where('id', isEqualTo: id).get();
    final userFriendList = user.docs[0]['followers'];

    if (userFriendList.length == 0) {
      return [];
    }

    return await Stream.fromIterable(userFriendList).asyncMap((item) async {
      final following = await users.where('id', isEqualTo: item).get();

      return new UserModel(
        id: following.docs[0]['id'],
        chats: following.docs[0]['chats'],
        status: following.docs[0]['status'],
        stories: following.docs[0]['stories'],
        location: following.docs[0]['location'],
        presence: following.docs[0]['presence'],
        username: following.docs[0]['username'],
        following: following.docs[0]['following'],
        followers: following.docs[0]['followers'],
        profilePic: following.docs[0]['profilePic'],
        coverPhoto: following.docs[0]['coverPhoto'],
        bitmapImage: following.docs[0]['bitmapImage'],
        isLocationEnabled: following.docs[0]['isLocationEnabled'],
      );
    }).toList();
  }
}
