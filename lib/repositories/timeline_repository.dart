import 'package:cloud_firestore/cloud_firestore.dart';

class TimelineRepository {
  final CollectionReference postCollection =
      FirebaseFirestore.instance.collection('posts');

  Future<QuerySnapshot<Object?>> fetchTimelinelinePosts() async {
    return await postCollection
        .orderBy('dateCreated', descending: true)
        .limit(10)
        .get();
  }

  Future<DocumentSnapshot<Map<String, dynamic>>>
      fetchTimelinelinePostCount() async {
    return await FirebaseFirestore.instance
        .collection('postCount')
        .doc('count')
        .get();
  }
}
