import 'package:injectable/injectable.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

@LazySingleton(as: IStoryDataRemoteProvider)
class StoryDataRemoteProvider implements IStoryDataRemoteProvider {
  final FirebaseFirestore firestoreInstance;
  StoryDataRemoteProvider(this.firestoreInstance);

  Stream<QuerySnapshot<Map<String, dynamic>>> delegateStoryStream(
      String userId) {
    return FirebaseFirestore.instance
        .collection('stories')
        .where('id', isNotEqualTo: userId)
        .orderBy('id', descending: true)
        .snapshots();
  }
}

abstract class IStoryDataRemoteProvider {
  Stream<QuerySnapshot<Map<String, dynamic>>> delegateStoryStream(
      String userId);
}
