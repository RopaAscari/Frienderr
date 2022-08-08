import 'package:dartz/dartz.dart';
import 'package:frienderr/core/failure/failure.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:frienderr/features/data/models/chat/chat_model.dart';
import 'package:frienderr/features/domain/entities/chat.dart';

abstract class IChatRepository {
  Future<Either<Failure, bool>> deleteChat({required String uid});
  Future<Either<Failure, bool>> instantiateChat({required ChatDTO chat});
  Future<Either<Failure, List<ChatModel>>> getChats({required String uid});
  Future<Either<Failure, List<ChatModel>>> getPaginatedChats(
      {required String uid, required ChatModel previousChat});
  Either<Failure, Stream<QuerySnapshot<Map<String, dynamic>>>>
      delegateChatStream();

  Future<Either<Failure, bool>> startTyping(
      {required String uid, required String chatId});
  Future<Either<Failure, bool>> stopTyping(
      {required String uid, required String chatId});
}
