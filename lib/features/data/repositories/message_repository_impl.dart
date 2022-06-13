import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:frienderr/core/failure/failure.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:frienderr/features/domain/entities/chat.dart';
import 'package:frienderr/features/domain/entities/message.dart';
import 'package:frienderr/features/data/providers/chat_provider.dart';
import 'package:frienderr/features/data/providers/message_provider.dart';
import 'package:frienderr/features/domain/repositiories/messaging_repository.dart';

@LazySingleton(as: IMessageRepository)
class MessageRepository implements IMessageRepository {
  final IChatRemoteDataProvider _chatRemoteDataProvider;
  final IMessageRemoteDataProvider _messageRemoteDataProvider;

  MessageRepository(
      this._messageRemoteDataProvider, this._chatRemoteDataProvider);

  @override
  Either<Failure, Stream<QuerySnapshot<Map<String, dynamic>>>>
      delegateMessageStream({required String chatId}) {
    try {
      return Right(
          _messageRemoteDataProvider.delegateMessageStream(chatId: chatId));
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> sendMessage(
      {required String pid,
      required String chatId,
      required ChatMessage message}) async {
    try {
      final _message = await _messageRemoteDataProvider.sendMessage(
          chatId: chatId, message: message);

      LatestMessageEntity lastMessage = LatestMessageEntity(
          message: _message, date: DateTime.now().microsecondsSinceEpoch);
      bool _updateLatestMessageSuccess =
          await _chatRemoteDataProvider.updateLastMessage(
              pid: pid, chatId: chatId, lastMessage: lastMessage);

      return Right(_message != null && _updateLatestMessageSuccess);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> updateLastMessage(
      {required String chatId, required previousId}) async {
    try {
      final _success = await _messageRemoteDataProvider.updateLastMessage(
          chatId: chatId, previousId: previousId);

      return Right(_success);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> sendMultimediaMessages({
    required String pid,
    required String chatId,
    required List<MultimediaMessage> messages,
  }) async {
    try {
      ChatMessage? _message = await _messageRemoteDataProvider
          .sendMultimediaMessages(chatId: chatId, messages: messages);

      LatestMessageEntity lastMessage = LatestMessageEntity(
          message: _message, date: DateTime.now().microsecondsSinceEpoch);
      bool _updateLatestMessageSuccess =
          await _chatRemoteDataProvider.updateLastMessage(
              pid: pid, chatId: chatId, lastMessage: lastMessage);
      return Right(_message != null);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> sendAudioMessage({
    required File file,
    required String pid,
    required String chatId,
    required ChatMessage message,
  }) async {
    try {
      ChatMessage? _message = await _messageRemoteDataProvider.sendAudioMessage(
          chatId: chatId, message: message, file: file);

      LatestMessageEntity lastMessage = LatestMessageEntity(
          message: _message, date: DateTime.now().microsecondsSinceEpoch);
      bool _updateLatestMessageSuccess =
          await _chatRemoteDataProvider.updateLastMessage(
              pid: pid, chatId: chatId, lastMessage: lastMessage);
      return Right(_message != null);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> seenMessage(
      {required String chatId, required String messageId}) async {
    try {
      return Right(await _messageRemoteDataProvider.seenMessage(
          chatId: chatId, messageId: messageId));
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> deleteMessage(
      {required String chatId, required String messageId}) async {
    try {
      return Right(await _messageRemoteDataProvider.deleteMessage(
          chatId: chatId, messageId: messageId));
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
