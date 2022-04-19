import 'package:dartz/dartz.dart';
import 'package:frienderr/core/failure/failure.dart';
import 'package:frienderr/features/data/models/chat/chat_model.dart';

abstract class IChatRepository {
  Future<Either<Failure, List<ChatModel>>> fetchChats(String id);
}
