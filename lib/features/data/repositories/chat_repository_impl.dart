import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:frienderr/features/domain/entities/user.dart';
import 'package:injectable/injectable.dart';
import 'package:frienderr/core/failure/failure.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
  Future<Either<Failure, bool>> instantiateChat(
      {required ChatEntity chat}) async {
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
  Future<Either<Failure, List<ChatEntity>>> getChats(
      {required String uid}) async {
    try {
      final QuerySnapshot<Object?> _rawChats =
          await _chatProvider.getChats(uid: uid);

      final QuerySnapshot<Object?> _rawUsers =
          await _userRemoteDataProvider.getPlatformUsers();

      final List<Map<String, dynamic>> _usersMap =
          _rawUsers.docs.map((e) => e.data() as Map<String, dynamic>).toList();

      List<Map<String, dynamic>> _chatsMap =
          _rawChats.docs.map((e) => e.data() as Map<String, dynamic>).toList();

      final _chatEntities = _chatsMap
          .map((chat) {
            final participants = chat['participants']
                .map((participant) => UserEntity.fromJson(
                    _usersMap.firstWhere((user) => user['id'] == participant)))
                .toList();

            chat['participants'] = participants;

            return ChatModel.fromJson(chat);
          })
          .cast<ChatEntity>()
          .toList();

      return Right(_chatEntities);
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
}
