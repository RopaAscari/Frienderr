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
  Future<QuerySnapshot<Map<String, dynamic>>> getFollowers(String uid) async {
    return await firestoreInstance
        .collection('followers')
        .doc(uid)
        .collection('list')
        .get();
  }
}

abstract class IFollowersRemoteDataProvider {
  Future<QuerySnapshot<Map<String, dynamic>>> getFollowers(String id);
}
