import 'package:dartz/dartz.dart';

import 'package:injectable/injectable.dart';
import 'package:frienderr/core/failure/failure.dart';
import 'package:frienderr/core/usecase/usecase.dart';

import 'package:frienderr/features/domain/entities/message.dart';
import 'package:frienderr/features/domain/repositiories/messaging_repository.dart';

@lazySingleton
class SeenMessageUseCase extends UseCase<bool, SeenMessageParams> {
  SeenMessageUseCase(this.repository);

  final IMessageRepository repository;

  @override
  Future<Either<Failure, bool>> call(SeenMessageParams params) {
    return repository.seenMessage(
        chatId: params.chatId, messageId: params.messageId);
  }
}

class SeenMessageParams {
  SeenMessageParams({
    required this.chatId,
    required this.messageId,
  });

  final String chatId;
  final String messageId;
}
