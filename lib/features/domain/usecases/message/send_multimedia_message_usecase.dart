import 'package:dartz/dartz.dart';

import 'package:injectable/injectable.dart';
import 'package:frienderr/core/failure/failure.dart';
import 'package:frienderr/core/usecase/usecase.dart';

import 'package:frienderr/features/domain/entities/message.dart';
import 'package:frienderr/features/domain/repositiories/messaging_repository.dart';

@lazySingleton
class SendMultimediaMessageUseCase
    extends UseCase<bool, SendMultimediaMessageParams> {
  SendMultimediaMessageUseCase(this.repository);

  final IMessageRepository repository;

  @override
  Future<Either<Failure, bool>> call(SendMultimediaMessageParams params) {
    return repository.sendMultimediaMessages(
        pid: params.pid, chatId: params.chatId, messages: params.messages);
  }
}

class SendMultimediaMessageParams {
  SendMultimediaMessageParams({
    required this.pid,
    required this.chatId,
    required this.messages,
  });
  final String pid;
  final String chatId;
  final List<MultimediaMessage> messages;
}
