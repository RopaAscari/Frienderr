import 'package:injectable/injectable.dart';
import 'package:frienderr/core/enums/enums.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:frienderr/core/constants/constants.dart';
import 'package:frienderr/features/data/models/user/user_model.dart';

@LazySingleton(as: IFollowersRemoteDataProvider)
class FollowersRemoteDataProvider implements IFollowersRemoteDataProvider {
  final FirebaseFirestore firestoreInstance;

  const FollowersRemoteDataProvider(this.firestoreInstance);

  @override
  Future<List<UserModel>> getFollowers(String id) async {
    final user = await firestoreInstance
        .collection(Constants.collections[Collections.Users]!)
        .where('id', isEqualTo: id)
        .get();
    final userFriendList = user.docs[0]['followers'];

    if (userFriendList.length == 0) {
      return [];
    }

    return await Stream.fromIterable(userFriendList).asyncMap((item) async {
      final following = await firestoreInstance
          .collection(Constants.collections[Collections.Users]!)
          .where('id', isEqualTo: item)
          .get();

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

abstract class IFollowersRemoteDataProvider {
  Future<List<UserModel>> getFollowers(String id);
}
