import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:frienderr/core/failure/failure.dart';
import 'package:frienderr/core/usecase/usecase.dart';
import 'package:frienderr/features/domain/entities/chat.dart';
import 'package:frienderr/features/data/models/chat/chat_model.dart';
import 'package:frienderr/features/domain/repositiories/chat_repository.dart';

@lazySingleton
class InstantiateChatUseCase extends UseCase<bool, InstantiateChatParams> {
  InstantiateChatUseCase(this.repository);

  final IChatRepository repository;

  @override
  Future<Either<Failure, bool>> call(InstantiateChatParams params) {
    return repository.instantiateChat(chat: params.chat);
  }
}

class InstantiateChatParams {
  InstantiateChatParams({
    required this.chat,
  });

  final ChatEntity chat;
}
