import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:frienderr/core/failure/failure.dart';
import 'package:frienderr/core/usecase/usecase.dart';
import 'package:frienderr/features/domain/repositiories/chat_repository.dart';

@lazySingleton
class StopTypingUseCase extends UseCase<bool, StopTypingParams> {
  StopTypingUseCase(this.repository);

  final IChatRepository repository;

  @override
  Future<Either<Failure, bool>> call(StopTypingParams params) {
    return repository.stopTyping(
      uid: params.uid,
      chatId: params.chatId,
    );
  }
}

class StopTypingParams {
  final String uid;
  final String chatId;
  StopTypingParams({
    required this.uid,
    required this.chatId,
  });
}
