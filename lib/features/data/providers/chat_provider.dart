import 'package:frienderr/core/constants/constants.dart';
import 'package:frienderr/features/data/models/chat/chat_model.dart';
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
  Future<bool> instantiateChat({required ChatDTO chat}) async {
    DocumentSnapshot<Map<String, dynamic>> response = await firestoreInstance
        .collection(Collections.chats)
        .doc(chat.id)
        .get();

    if (response.exists) {
      await firestoreInstance
          .collection(Collections.chats)
          .doc(chat.id)
          .update({
        'unread.${chat.participants.first}': 0,
      });
      return true;
    } else {
      try {
        await firestoreInstance
            .collection(Collections.chats)
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
      await firestoreInstance.collection(Collections.chats).doc(chatId).update({
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
      await firestoreInstance.collection(Collections.chats).doc(chatId).update({
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
        .collection(Collections.chats)
        .where('participants', arrayContains: uid)
        .orderBy('dateUpdated', descending: false)
        .snapshots();
  }

  @override
  Future<QuerySnapshot<ChatDTO>> getChats({required String uid}) async {
    return await firestoreInstance
        .collection(Collections.chats)
        .where('participants', arrayContains: uid)
        .orderBy('dateUpdated', descending: true)
        .withConverter<ChatDTO>(
          toFirestore: (snapshot, _) => snapshot.toJson(),
          fromFirestore: (snapshot, _) => ChatDTO.fromJson(snapshot.data()!),
        )
        .limit(Constants.pageSize)
        .get();
  }

  @override
  Future<QuerySnapshot<ChatDTO>> getPaginatedChats(
      {required String uid, required ChatModel previousChat}) async {
    return await firestoreInstance
        .collection(Collections.chats)
        .where('participants', arrayContains: uid)
        .startAfter([previousChat.dateUpdated])
        .orderBy('dateUpdated', descending: true)
        .withConverter<ChatDTO>(
          toFirestore: (snapshot, _) => snapshot.toJson(),
          fromFirestore: (snapshot, _) => ChatDTO.fromJson(snapshot.data()!),
        )
        .limit(Constants.pageSize)
        .get();
  }

  @override
  Future<bool> updateLastMessage(
      {required String pid,
      required String chatId,
      required LatestMessageDTO lastMessage}) async {
    try {
      await firestoreInstance.collection(Collections.chats).doc(chatId).update({
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
      await firestoreInstance.collection(Collections.chats).doc(uid).delete();
      return true;
    } catch (err) {
      return false;
    }
  }
}

abstract class IChatRemoteDataProvider {
  Future<bool> deleteChat({required String uid});
  Future<bool> instantiateChat({required ChatDTO chat});
  Future<bool> updateLastMessage(
      {required String pid,
      required String chatId,
      required LatestMessageDTO lastMessage});
  Future<QuerySnapshot<ChatDTO>> getChats({required String uid});
  Future<QuerySnapshot<ChatDTO>> getPaginatedChats(
      {required String uid, required ChatModel previousChat});
  Stream<QuerySnapshot<Map<String, dynamic>>> delegateChatStream();
  Future<bool> startTyping({required String uid, required String chatId});
  Future<bool> stopTyping({required String uid, required String chatId});
}
