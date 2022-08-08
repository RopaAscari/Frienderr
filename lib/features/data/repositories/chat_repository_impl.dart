import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:automap/automap.dart';
import 'package:frienderr/core/constants/constants.dart';

import 'package:injectable/injectable.dart';
import 'package:collection/collection.dart';
import 'package:frienderr/core/failure/failure.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:frienderr/features/domain/entities/user.dart';
import 'package:frienderr/features/domain/entities/chat.dart';
import 'package:frienderr/features/data/models/chat/chat_model.dart';
import 'package:frienderr/features/data/providers/chat_provider.dart';
import 'package:frienderr/features/data/providers/user_provider.dart';
import 'package:frienderr/features/domain/repositiories/chat_repository.dart';

@LazySingleton(as: IChatRepository)
class ChatRepository implements IChatRepository {
  final IChatRemoteDataProvider _chatProvider;
  final IUserDataRemoteProvider _userRemoteDataProvider;
  ChatRepository(this._chatProvider, this._userRemoteDataProvider);

  @override
  Future<Either<Failure, bool>> instantiateChat({required ChatDTO chat}) async {
    try {
      return Right(await _chatProvider.instantiateChat(chat: chat));
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> startTyping(
      {required String uid, required String chatId}) async {
    try {
      return Right(await _chatProvider.startTyping(chatId: chatId, uid: uid));
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> stopTyping(
      {required String uid, required String chatId}) async {
    try {
      return Right(await _chatProvider.stopTyping(chatId: chatId, uid: uid));
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ChatModel>>> getChats(
      {required String uid}) async {
    try {
      final QuerySnapshot<ChatDTO> chatsQuery =
          await _chatProvider.getChats(uid: uid);

      List<String> userIds = chatsQuery.docs
          .map((p) {
            return p.data().participants.firstWhere((x) => x != uid).toString();
          })
          .toSet()
          .cast<String>()
          .toList();

      if (userIds.isEmpty) {
        return const Right([]);
      }

      userIds.add(uid);

      final QuerySnapshot<UserDTO> userQuery =
          await _userRemoteDataProvider.getUsersByIds(userIds: userIds);

      final _chatsDto =
          _handleDTOMapping(chats: chatsQuery, users: userQuery, uid: uid);

      final _chats = AutoMapper.I.map<List<ChatDTO>, List<ChatModel>>(
        _chatsDto,
      );

      return Right(_chats);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ChatModel>>> getPaginatedChats(
      {required String uid, required ChatModel previousChat}) async {
    try {
      final QuerySnapshot<ChatDTO> chatsQuery = await _chatProvider
          .getPaginatedChats(uid: uid, previousChat: previousChat);

      List<String> userIds = chatsQuery.docs
          .map((p) => p.data().participants.firstWhere((x) => x != uid))
          .toSet()
          .cast<String>()
          .toList();
      if (userIds.isEmpty) {
        return const Right([]);
      }

      userIds.add(uid);

      final QuerySnapshot<UserDTO> userQuery =
          await _userRemoteDataProvider.getUsersByIds(userIds: userIds);

      final _chatsDto =
          _handleDTOMapping(chats: chatsQuery, users: userQuery, uid: uid);

      final _chats = AutoMapper.I.map<List<ChatDTO>, List<ChatModel>>(
        _chatsDto,
      );

      return Right(_chats);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Either<Failure, Stream<QuerySnapshot<Map<String, dynamic>>>>
      delegateChatStream() {
    try {
      return Right(_chatProvider.delegateChatStream());
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> deleteChat({required String uid}) async {
    try {
      return Right(await _chatProvider.deleteChat(uid: uid));
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  List<ChatDTO> _handleDTOMapping({
    required String uid,
    required QuerySnapshot<ChatDTO> chats,
    required QuerySnapshot<UserDTO> users,
  }) {
    List<ChatDTO> result = [];

    for (var document in chats.docs) {
      List participants = [];
      ChatDTO post = document.data();

      final user = users.docs.firstWhere((x) => x.data().id == uid).data();

      final participantId = post.participants.firstWhere((x) => x != uid);

      final response = users.docs.firstWhereOrNull((x) {
        return x.data().id == participantId;
      })?.data();

      final participant = response ??
          UserDTO(
              id: "0000000000",
              username: "Unknown User",
              profilePic: Constants.defaultProfilePic);

      participants.addAll([user, participant]);

      post.participants = participants;

      result.add(post);
    }

    return result;
  }
}
