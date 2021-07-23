import 'dart:async';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:frienderr/models/chat/chat_model.dart';
import 'package:frienderr/models/user/user_model.dart';
//import 'package:frienderr/screens/messaging/messaging.dart';
import 'package:frienderr/models/messaging/messaging.dart';

class ChatRepository {
  final CollectionReference chats =
      FirebaseFirestore.instance.collection('chats');

  final CollectionReference users =
      FirebaseFirestore.instance.collection('users');

  Future<List<ChatModel>> fetchChats(String id) async {
    final user = await users.where('id', isEqualTo: id).get();
    final userChatList = user.docs[0]['chats'];

    if (userChatList.length == 0) {
      return [];
    }

    return await Stream.fromIterable(userChatList).asyncMap((item) async {
      final chat = await chats.doc(item).get();
      final data = chat.data() as dynamic;
      return new ChatModel(
          id: data['id'],
          latestMessage: new LatestMessage(
              date: 0, count: 0, message: data['latestMessage']['message']),
          participants: data['participants'].map((p) {
            return new ChatParticipant(
                id: p['id'],
                username: p['username'],
                profilePic: p['profilePic']);
          }).toList());
    }).toList();
  }

  openChat(MessagingMetaData metaData, context, chats, index) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Center() //Messaging(metaData: metaData),
            ));
  }
}
