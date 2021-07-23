import 'package:frienderr/enums/enums.dart';
//import 'package:frienderr/util/helpers.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:frienderr/constants/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:frienderr/models/comment/comment_model.dart';

class CommentRepository {
  // final Helpers helpers = new Helpers();

  CollectionReference comments = FirebaseFirestore.instance
      .collection(Constants.collections[Collections.Comments]!);

  CollectionReference posts = FirebaseFirestore.instance
      .collection(Constants.collections[Collections.Posts]!);

  Future<List<CommentModel>> getComments(String postId) async {
    final fetchedComments = await comments
        .doc(postId)
        .collection(Constants.collections[Collections.Comments]!)
        .get();
    return await Stream.fromIterable(fetchedComments.docs)
        .asyncMap((comment) async {
      return new CommentModel(
        id: comment['id'],
        userId: comment['userId'],
        comment: comment['comment'],
        username: comment['username'],
        profilePic: comment['profilePic'],
        dateCreated: comment['dateCreated'],
      );
    }).toList();
  }

  Future<List<CommentModel>> postComment(
      CommentModel comment, String postId) async {
    await comments
        .doc(postId)
        .collection(Constants.collections[Collections.Comments]!)
        .add({
      'id': comment.id,
      'userId': comment.userId,
      'comment': comment.comment,
      'username': comment.username,
      'profilePic': comment.profilePic,
      'dateCreated': comment.dateCreated
    });

    await posts.doc(postId).update({'commentCount': FieldValue.increment(1)});

    return this.getComments(postId);
  }
}
