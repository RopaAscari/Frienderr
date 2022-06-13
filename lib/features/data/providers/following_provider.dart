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
  Future<QuerySnapshot<Map<String, dynamic>>> getFollowing(String uid) async {
    return await firestoreInstance
        .collection(Collections.following.name)
        .doc(uid)
        .collection(Collections.records.name)
        .get();
  }

  @override
  Future<bool> followUser({required String uid, required String fid}) async {
    try {
      await firestoreInstance
          .collection(Collections.following.name)
          .doc(uid)
          .collection(Collections.records.name)
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
          .collection(Collections.following.name)
          .doc(uid)
          .collection(Collections.records.name)
          .doc(fid)
          .delete();

      return true;
    } catch (e) {
      return false;
    }
  }
}

abstract class IFollowingRemoteDataProvider {
  Future<QuerySnapshot<Map<String, dynamic>>> getFollowing(String uid);
  Future<bool> followUser({required String uid, required String fid});
  Future<bool> unfollowUser({required String uid, required String fid});
}
