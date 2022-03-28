import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:frienderr/models/quicks/quicks.dart';

class QuickRepository {
  final CollectionReference quicksCollection =
      FirebaseFirestore.instance.collection('quicks');
  Future<List<Quicks>> getSnaps() async {
    final quicks = await quicksCollection.get();

    return quicks.docs.map((e) => Quicks(url: e['url'])).toList();
  }
}
