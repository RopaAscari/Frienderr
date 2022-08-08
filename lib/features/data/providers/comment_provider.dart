import 'package:frienderr/core/api_result/api_result.dart';
import 'package:injectable/injectable.dart';
import 'package:frienderr/core/enums/enums.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:frienderr/core/constants/constants.dart';
import 'package:frienderr/features/domain/entities/comment.dart';
import 'package:frienderr/features/data/models/comment/comment_model.dart';

@LazySingleton(as: ICommentRemoteDataProvider)
class CommentRemoteDataProvider implements ICommentRemoteDataProvider {
  final FirebaseFirestore firestoreInstance;

  const CommentRemoteDataProvider(this.firestoreInstance);

  @override
  Future<bool> postComment(
      {required CommentDTO comment, required CommentType type}) async {
    try {
      String _collection = _buildCollectionReference(type: type);

      final batch = firestoreInstance.batch();

      var commentRef = firestoreInstance
          .collection(_collection)
          .doc(comment.postId)
          .collection(Collections.comments)
          .doc(comment.id);

      batch.set(commentRef, comment.toJson());

      var postRef =
          firestoreInstance.collection(_collection).doc(comment.postId);

      batch.update(postRef, {'comments': FieldValue.increment(1)});

      await batch.commit();

      return true;
    } catch (err) {
      return false;
    }
  }

  @override
  Future<bool> deleteComment(
      {required String id,
      required String postId,
      required CommentType type}) async {
    try {
      String _collection = _buildCollectionReference(type: type);

      final batch = firestoreInstance.batch();

      var commentRef = firestoreInstance
          .collection(_collection)
          .doc(postId)
          .collection(Collections.comments)
          .doc(id);

      batch.delete(commentRef);

      var postRef = firestoreInstance.collection(_collection).doc(postId);

      batch.update(postRef, {'comments': FieldValue.increment(-1)});

      await batch.commit();

      return true;
    } catch (err) {
      return false;
    }
  }

  @override
  Future<QuerySnapshot<CommentDTO>> getComments(
      {required String pid, required CommentType type}) async {
    String _collection = _buildCollectionReference(type: type);
    return await firestoreInstance
        .collection(_collection)
        .doc(pid)
        .collection(Collections.comments)
        .where('postId', isEqualTo: pid)
        .orderBy('dateCreated', descending: false)
        .withConverter<CommentDTO>(
          toFirestore: (snapshot, _) => snapshot.toJson(),
          fromFirestore: (snapshot, _) => CommentDTO.fromJson(snapshot.data()!),
        )
        .limit(Constants.pageSize)
        .get();
  }

  @override
  Future<QuerySnapshot<CommentDTO>> getPaginatedComments(
      {required Comment previousComment, required CommentType type}) async {
    String _collection = _buildCollectionReference(type: type);

    return await firestoreInstance
        .collection(_collection)
        .doc(previousComment.postId)
        .collection(Collections.comments)
        .where('postId', isEqualTo: previousComment.postId)
        .startAfter([previousComment.dateCreated])
        .orderBy('dateCreated', descending: false)
        .withConverter<CommentDTO>(
          toFirestore: (snapshot, _) => snapshot.toJson(),
          fromFirestore: (snapshot, _) => CommentDTO.fromJson(snapshot.data()!),
        )
        .limit(Constants.pageSize)
        .get();
  }

  String _buildCollectionReference({required CommentType type}) {
    late String _collection;

    if (type == CommentType.post) {
      _collection = Collections.posts;
    } else if (type == CommentType.snap) {
      _collection = Collections.snaps;
    }

    return _collection;
  }
}

abstract class ICommentRemoteDataProvider {
  Future<bool> postComment(
      {required CommentDTO comment, required CommentType type});
  Future<QuerySnapshot<CommentDTO>> getComments(
      {required String pid, required CommentType type});
  Future<bool> deleteComment(
      {required String id, required String postId, required CommentType type});

  Future<QuerySnapshot<CommentDTO>> getPaginatedComments(
      {required Comment previousComment, required CommentType type});
}
