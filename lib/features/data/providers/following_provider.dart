import 'package:injectable/injectable.dart';
import 'package:frienderr/core/enums/enums.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

@LazySingleton(as: IFollowingRemoteDataProvider)
class FollowingRemoteDataProvider implements IFollowingRemoteDataProvider {
  final FirebaseAuth auth;
  final FirebaseFirestore firestoreInstance;
  const FollowingRemoteDataProvider(this.firestoreInstance, this.auth);

  @override
  Future<QuerySnapshot<Map<String, dynamic>>> getFollowing(String uid) async {
    return await firestoreInstance
        .collection(Collections.following)
        .doc(uid)
        .collection(Collections.records)
        .get();
  }

  @override
  Future<QuerySnapshot<Map<String, dynamic>>> getFollowingStatus(
      {required String uid}) async {
    return await firestoreInstance
        .collection(Collections.following)
        .doc(uid)
        .collection(Collections.records)
        .where("id", isEqualTo: auth.currentUser!.uid)
        .get();
  }

  @override
  Future<bool> followUser({required String uid, required String fid}) async {
    try {
      await firestoreInstance
          .collection(Collections.following)
          .doc(uid)
          .collection(Collections.records)
          .doc(fid)
          .set({'id': fid});

      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> unfollowUser({required String uid, required String fid}) async {
    try {
      await firestoreInstance
          .collection(Collections.following)
          .doc(uid)
          .collection(Collections.records)
          .doc(fid)
          .delete();

      return true;
    } catch (e) {
      return false;
    }
  }
}

abstract class IFollowingRemoteDataProvider {
  Future<bool> followUser({required String uid, required String fid});
  Future<QuerySnapshot<Map<String, dynamic>>> getFollowing(String uid);
  Future<bool> unfollowUser({required String uid, required String fid});
  Future<QuerySnapshot<Map<String, dynamic>>> getFollowingStatus(
      {required String uid});
}
