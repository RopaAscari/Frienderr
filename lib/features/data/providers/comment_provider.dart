import 'package:injectable/injectable.dart';
import 'package:frienderr/core/enums/enums.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:frienderr/core/constants/constants.dart';
import 'package:frienderr/features/domain/entities/comment.dart';

@LazySingleton(as: ICommentRemoteDataProvider)
class CommentRemoteDataProvider implements ICommentRemoteDataProvider {
  final FirebaseFirestore firestoreInstance;

  const CommentRemoteDataProvider(this.firestoreInstance);

  @override
  Future<bool> postComment(String postId, CommentEntity comment) async {
    await firestoreInstance
        .collection(Constants.collections[Collections.Posts]!)
        .doc(postId)
        .collection(Constants.collections[Collections.Comments]!);
    // .add(comment.toJson());

    await firestoreInstance
        .collection(Constants.collections[Collections.Posts]!)
        .doc(postId)
        .update({'commentCount': FieldValue.increment(1)});
    return true;
  }

  @override
  Future<QuerySnapshot<Map<String, dynamic>>> getComments(String postId) async {
    return await firestoreInstance
        .collection(Constants.collections[Collections.Posts]!)
        .doc(postId)
        .collection(Constants.collections[Collections.Comments]!)
        .get();
  }
}

abstract class ICommentRemoteDataProvider {
  Future<dynamic> getComments(String postId);
  Future<bool> postComment(String id, CommentEntity comment);
}
