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
  Future<QuerySnapshot<Map<String, dynamic>>> getFollowersCount(
      String uid) async {
    return await firestoreInstance
        .collection(Collections.follower)
        .doc(uid)
        .collection(Collections.records)
        .get();
  }

  @override
  Future<QuerySnapshot<Map<String, dynamic>>> getProfileFollowersList(
      String uid) async {
    return await firestoreInstance
        .collection(Collections.follower)
        .doc(uid)
        .collection(Collections.records)
        .limit(10)
        .get();
  }

  @override
  Future<bool> registerFollowing(
      {required String uid, required String fid}) async {
    try {
      await firestoreInstance
          .collection(Collections.follower)
          .doc(fid)
          .collection(Collections.records)
          .doc(fid)
          .set({'id': uid});

      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> registerUnFollowing(
      {required String uid, required String fid}) async {
    try {
      await firestoreInstance
          .collection(Collections.follower)
          .doc(fid)
          .collection(Collections.records)
          .doc(fid)
          .delete();

      return true;
    } catch (e) {
      return false;
    }
  }
}

abstract class IFollowersRemoteDataProvider {
  Future<QuerySnapshot<Map<String, dynamic>>> getFollowersCount(String id);
  Future<QuerySnapshot<Map<String, dynamic>>> getProfileFollowersList(
      String id);
  Future<bool> registerFollowing({required String uid, required String fid});
  Future<bool> registerUnFollowing({required String uid, required String fid});
}
