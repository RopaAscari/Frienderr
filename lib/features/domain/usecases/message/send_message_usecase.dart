import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:frienderr/core/failure/failure.dart';
import 'package:frienderr/core/usecase/usecase.dart';
import 'package:frienderr/features/domain/entities/media_asset.dart';
import 'package:frienderr/features/domain/repositiories/messaging_repository.dart';

@lazySingleton
class SendMessageUseCase extends UseCase<bool, SendMessageParams> {
  SendMessageUseCase(this.repository);

  final IMessageRepository repository;

  @override
  Future<Either<Failure, bool>> call(SendMessageParams params) {
    return repository.sendMessage(
        pid: params.pid, chatId: params.chatId, message: params.message);
  }
}

class SendMessageParams {
  SendMessageParams({
    required this.pid,
    required this.chatId,
    required this.message,
  });
  final String pid;
  final String chatId;
  final ChatMessage message;
}
