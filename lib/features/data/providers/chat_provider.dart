import 'package:frienderr/features/domain/entities/chat.dart';
import 'package:injectable/injectable.dart';
import 'package:frienderr/core/enums/enums.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

@LazySingleton(as: IChatRemoteDataProvider)
class ChatRemoteDataProvider implements IChatRemoteDataProvider {
  final FirebaseAuth auth;
  final FirebaseFirestore firestoreInstance;

  const ChatRemoteDataProvider(this.auth, this.firestoreInstance);

  @override
  Future<bool> instantiateChat({required ChatEntity chat}) async {
    DocumentSnapshot<Map<String, dynamic>> response = await firestoreInstance
        .collection(Collections.chats.name)
        .doc(chat.id)
        .get();

    if (response.exists) {
      await firestoreInstance
          .collection(Collections.chats.name)
          .doc(chat.id)
          .update({
        'unread.${chat.participants.first}': 0,
      });
      return true;
    } else {
      try {
        await firestoreInstance
            .collection(Collections.chats.name)
            .doc(chat.id)
            .set(chat.toJson());
        return true;
      } catch (e) {
        return false;
      }
    }
  }

  @override
  Future<bool> startTyping(
      {required String uid, required String chatId}) async {
    try {
      await firestoreInstance
          .collection(Collections.chats.name)
          .doc(chatId)
          .update({
        'typing': FieldValue.arrayUnion([uid])
      });
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> stopTyping({required String uid, required String chatId}) async {
    try {
      await firestoreInstance
          .collection(Collections.chats.name)
          .doc(chatId)
          .update({
        'typing': FieldValue.arrayRemove([uid])
      });
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Stream<QuerySnapshot<Map<String, dynamic>>> delegateChatStream() {
    final uid = auth.currentUser!.uid;
    return firestoreInstance
        .collection(Collections.chats.name)
        .where('participants', arrayContains: uid)
        .orderBy('dateUpdated', descending: false)
        .snapshots();
  }

  @override
  Future<QuerySnapshot<Map<String, dynamic>>> getChats(
      {required String uid}) async {
    return await firestoreInstance
        .collection(Collections.chats.name)
        .where('participants', arrayContains: uid)
        .orderBy('dateUpdated', descending: true)
        .get();
  }

  @override
  Future<bool> updateLastMessage(
      {required String pid,
      required String chatId,
      required LatestMessageEntity lastMessage}) async {
    try {
      await firestoreInstance
          .collection(Collections.chats.name)
          .doc(chatId)
          .update({
        'latestMessage': lastMessage.toJson(),
        'unread.$pid': FieldValue.increment(1),
        'dateUpdated': DateTime.now().millisecondsSinceEpoch,
      });
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> deleteChat({required String uid}) async {
    try {
      await firestoreInstance
          .collection(Collections.chats.name)
          .doc(uid)
          .delete();
      return true;
    } catch (err) {
      return false;
    }
  }
}

abstract class IChatRemoteDataProvider {
  Future<bool> deleteChat({required String uid});
  Future<bool> instantiateChat({required ChatEntity chat});
  Future<bool> updateLastMessage(
      {required String pid,
      required String chatId,
      required LatestMessageEntity lastMessage});
  Future<QuerySnapshot<Map<String, dynamic>>> getChats({required String uid});
  Stream<QuerySnapshot<Map<String, dynamic>>> delegateChatStream();
  Future<bool> startTyping({required String uid, required String chatId});
  Future<bool> stopTyping({required String uid, required String chatId});
}
