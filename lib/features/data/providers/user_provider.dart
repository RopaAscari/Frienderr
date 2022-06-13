import 'package:injectable/injectable.dart';
import 'package:frienderr/core/enums/enums.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:frienderr/core/constants/constants.dart';

@LazySingleton(as: IUserDataRemoteProvider)
class UserDataRemoteProvider implements IUserDataRemoteProvider {
  final FirebaseFirestore firestoreInstance;
  UserDataRemoteProvider(this.firestoreInstance);

  @override
  Future<QuerySnapshot<Map<String, dynamic>>> getPlatformUsers() async {
    return await FirebaseFirestore.instance
        .collection(Collections.users.name)
        .get();
  }

  @override
  Future<DocumentSnapshot<Map<String, dynamic>>> getUser(
      {required String uid}) async {
    return await FirebaseFirestore.instance
        .collection(Collections.users.name)
        .doc(uid)
        .get();
  }
}

abstract class IUserDataRemoteProvider {
  Future<QuerySnapshot<Map<String, dynamic>>> getPlatformUsers();

  Future<DocumentSnapshot<Map<String, dynamic>>> getUser({required String uid});
}
