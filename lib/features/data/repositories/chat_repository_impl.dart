import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:frienderr/core/failure/failure.dart';
import 'package:frienderr/features/data/models/chat/messaging.dart';
import 'package:frienderr/features/data/models/chat/chat_model.dart';
import 'package:frienderr/features/data/providers/chat_provider.dart';
import 'package:frienderr/features/data/models/chat/latest_message.dart';
import 'package:frienderr/features/data/models/chat/chat_participant.dart';
import 'package:frienderr/features/domain/repositiories/chat_repository.dart';

@LazySingleton(as: IChatRepository)
class ChatRepository implements IChatRepository {
  final IChatRemoteDataProvider _chatProvider;

  ChatRepository(this._chatProvider);

  @override
  Future<Either<Failure, List<ChatModel>>> fetchChats(String id) async {
    final userChatList = await _chatProvider.fetchUserChats(id);

    if (userChatList.length == 0) {
      return Right([]);
    }

    return Right(await Stream.fromIterable(userChatList).asyncMap((item) async {
      final chat = await _chatProvider.fetchChat(item);
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
    }).toList());
  }

  openChat(MessagingMetaData metaData, context, chats, index) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Center() //Messaging(metaData: metaData),
            ));
  }
}
