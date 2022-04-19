import 'package:injectable/injectable.dart';
import 'package:frienderr/core/enums/enums.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:frienderr/core/constants/constants.dart';
import 'package:frienderr/features/data/models/user/user_model.dart';

@LazySingleton(as: IFollowingRemoteDataProvider)
class FollowingRemoteDataProvider implements IFollowingRemoteDataProvider {
  final FirebaseFirestore firestoreInstance;

  const FollowingRemoteDataProvider(this.firestoreInstance);

  @override
  Future<List<UserModel>> getFollowing(String id) async {
    final user = await firestoreInstance
        .collection(Constants.collections[Collections.Users]!)
        .where('id', isEqualTo: id)
        .get();
    final userFriendList = user.docs[0]['following'];

    if (userFriendList.length == 0) {
      return [];
    }

    return await Stream.fromIterable(userFriendList).asyncMap((item) async {
      final follower = await firestoreInstance
          .collection(Constants.collections[Collections.Users]!)
          .where('id', isEqualTo: item)
          .get();

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
}

abstract class IFollowingRemoteDataProvider {
  Future<List<UserModel>> getFollowing(String id);
}
