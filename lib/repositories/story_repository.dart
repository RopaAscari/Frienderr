import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class StoryRepository {
  User? user = FirebaseAuth.instance.currentUser;

  Stream<QuerySnapshot<Map<String, dynamic>>> delegateStoryStream() {
    return FirebaseFirestore.instance
        .collection('stories')
        .where('id', isNotEqualTo: user?.uid)
        .orderBy('id', descending: true)
        .snapshots();
  }
}
