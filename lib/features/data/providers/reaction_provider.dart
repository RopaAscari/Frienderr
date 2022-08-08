import 'package:injectable/injectable.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

@LazySingleton(as: IReactionRemoteDataProvider)
class ReactionRemoteDataProvider implements IReactionRemoteDataProvider {
  final FirebaseFirestore firestoreInstance;

  const ReactionRemoteDataProvider(this.firestoreInstance);

  @override
  Future<QuerySnapshot<Map<String, dynamic>>> getProfileReactions(
      {required String uid}) async {
    return await firestoreInstance
        .collectionGroup("reactions")
        .where("uid", isEqualTo: uid)
        .get();
  }
}

abstract class IReactionRemoteDataProvider {
  Future<QuerySnapshot<Map<String, dynamic>>> getProfileReactions({
    required String uid,
  });
}
