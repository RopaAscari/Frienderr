import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:frienderr/core/failure/failure.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:frienderr/features/domain/entities/message.dart';

abstract class IMessageRepository {
  Future<Either<Failure, bool>> seenMessage(
      {required String chatId, required String messageId});

  Future<Either<Failure, bool>> sendMessage(
      {required String pid,
      required String chatId,
      required ChatMessage message});

  Future<Either<Failure, bool>> sendAudioMessage({
    required File file,
    required String pid,
    required String chatId,
    required ChatMessage message,
  });

  Future<Either<Failure, bool>> sendMultimediaMessages({
    required String pid,
    required String chatId,
    required List<MultimediaMessage> messages,
  });

  Future<Either<Failure, bool>> updateLastMessage(
      {required String chatId, required previousId});

  Future<Either<Failure, bool>> deleteMessage(
      {required String chatId, required String messageId});

  Either<Failure, Stream<QuerySnapshot<Map<String, dynamic>>>>
      delegateMessageStream({required String chatId});
}
