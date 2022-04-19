import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:frienderr/core/failure/failure.dart';
import 'package:frienderr/core/usecase/usecase.dart';
import 'package:frienderr/features/data/models/chat/chat_model.dart';
import 'package:frienderr/features/domain/repositiories/chat_repository.dart';

@lazySingleton
class GetChatsUsecase extends UseCase<List<ChatModel>, GetChatParams> {
  GetChatsUsecase(this.repository);

  final IChatRepository repository;

  @override
  Future<Either<Failure, List<ChatModel>>> call(GetChatParams params) {
    return repository.fetchChats(params.id);
  }
}

class GetChatParams {
  GetChatParams({
    required this.id,
  });

  final String id;
}
