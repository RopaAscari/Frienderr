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
        .collection('following')
        .doc(uid)
        .collection('list')
        .get();
  }
}

abstract class IFollowingRemoteDataProvider {
  Future<QuerySnapshot<Map<String, dynamic>>> getFollowing(String uid);
}
