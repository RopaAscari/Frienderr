import 'package:frienderr/features/domain/entities/quick.dart';
import 'package:injectable/injectable.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

@LazySingleton(as: IQuickRemoteDataProvider)
class QuickRemoteDataProvider implements IQuickRemoteDataProvider {
  FirebaseFirestore firestoreInstance;
  QuickRemoteDataProvider(this.firestoreInstance);
  Future<List<QuickEntity>> getQuicks() async {
    final QuerySnapshot<Map<String, dynamic>> response =
        await firestoreInstance.collection('quicks').get();

    return response.docs.map((doc) => QuickEntity(url: doc['url'])).toList();
  }
}

abstract class IQuickRemoteDataProvider {
  Future<List<QuickEntity>> getQuicks();
}
