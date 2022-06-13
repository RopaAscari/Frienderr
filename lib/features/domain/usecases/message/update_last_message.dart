import 'package:dartz/dartz.dart';

import 'package:injectable/injectable.dart';
import 'package:frienderr/core/failure/failure.dart';
import 'package:frienderr/core/usecase/usecase.dart';

import 'package:frienderr/features/domain/entities/message.dart';
import 'package:frienderr/features/domain/repositiories/messaging_repository.dart';

@lazySingleton
class UpdatePreviousMessageUseCase
    extends UseCase<bool, UpdatePreviousMessageParams> {
  UpdatePreviousMessageUseCase(this.repository);

  final IMessageRepository repository;

  @override
  Future<Either<Failure, bool>> call(UpdatePreviousMessageParams params) {
    return repository.updateLastMessage(
        chatId: params.chatId, previousId: params.previousId);
  }
}

class UpdatePreviousMessageParams {
  UpdatePreviousMessageParams({
    required this.chatId,
    required this.previousId,
  });

  final String chatId;
  final String previousId;
}
