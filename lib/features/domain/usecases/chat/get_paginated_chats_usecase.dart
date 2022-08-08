import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:frienderr/core/failure/failure.dart';
import 'package:frienderr/core/usecase/usecase.dart';
import 'package:frienderr/features/domain/entities/chat.dart';
import 'package:frienderr/features/data/models/chat/chat_model.dart';
import 'package:frienderr/features/domain/repositiories/chat_repository.dart';

@lazySingleton
class GetPaginatedChatsUseCase
    extends UseCase<List<ChatModel>, GetPaginatedChatParams> {
  GetPaginatedChatsUseCase(this.repository);

  final IChatRepository repository;

  @override
  Future<Either<Failure, List<ChatModel>>> call(GetPaginatedChatParams params) {
    return repository.getPaginatedChats(
        uid: params.uid, previousChat: params.previousChat);
  }
}

class GetPaginatedChatParams {
  GetPaginatedChatParams({
    required this.uid,
    required this.previousChat,
  });

  final String uid;
  final ChatModel previousChat;
}
