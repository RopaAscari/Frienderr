import 'package:injectable/injectable.dart';
import 'package:frienderr/core/enums/enums.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:frienderr/core/constants/constants.dart';

@LazySingleton(as: IChatRemoteDataProvider)
class ChatRemoteDataProvider implements IChatRemoteDataProvider {
  final FirebaseFirestore firestoreInstance;

  const ChatRemoteDataProvider(this.firestoreInstance);
  @override
  Future<dynamic> fetchUserChats(String id) async {
    final user = await firestoreInstance
        .collection(Constants.collections[Collections.Users]!)
        .where('id', isEqualTo: id)
        .get();
    return user.docs[0]['chats'];
  }

  @override
  Future<dynamic> fetchChat(dynamic item) async {
    return await firestoreInstance
        .collection(Constants.collections[Collections.Chats]!)
        .doc(item)
        .get();
  }
}

abstract class IChatRemoteDataProvider {
  Future<dynamic> fetchChat(dynamic item);
  Future<dynamic> fetchUserChats(String id);
}
