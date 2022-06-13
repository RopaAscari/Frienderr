import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:frienderr/core/failure/failure.dart';
import 'package:frienderr/core/usecase/usecase.dart';
import 'package:frienderr/features/domain/entities/message.dart';
import 'package:frienderr/features/domain/repositiories/messaging_repository.dart';

@lazySingleton
class SendAudioMessageUseCase extends UseCase<bool, SendAudioMessageParams> {
  SendAudioMessageUseCase(this.repository);

  final IMessageRepository repository;

  @override
  Future<Either<Failure, bool>> call(SendAudioMessageParams params) {
    return repository.sendAudioMessage(
      pid: params.pid,
      file: params.file,
      chatId: params.chatId,
      message: params.message,
    );
  }
}

class SendAudioMessageParams {
  SendAudioMessageParams({
    required this.file,
    required this.pid,
    required this.chatId,
    required this.message,
  });

  final File file;
  final String pid;
  final String chatId;
  final ChatMessage message;
}
