import 'package:injectable/injectable.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

@LazySingleton(as: IUserDataRemoteProvider)
class UserDataRemoteProvider implements IUserDataRemoteProvider {
  final FirebaseFirestore firestoreInstance;
  UserDataRemoteProvider(this.firestoreInstance);

  @override
  Future<QuerySnapshot<Map<String, dynamic>>> getPlatformUsers() async {
    return await FirebaseFirestore.instance.collection('users').get();
  }
}

abstract class IUserDataRemoteProvider {
  Future<QuerySnapshot<Map<String, dynamic>>> getPlatformUsers();
}
