import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:frienderr/core/failure/failure.dart';
import 'package:frienderr/core/usecase/usecase.dart';
import 'package:frienderr/features/domain/repositiories/chat_repository.dart';

@lazySingleton
class StartTypingUseCase extends UseCase<bool, StartTypingParams> {
  StartTypingUseCase(this.repository);

  final IChatRepository repository;

  @override
  Future<Either<Failure, bool>> call(StartTypingParams params) {
    return repository.startTyping(
      uid: params.uid,
      chatId: params.chatId,
    );
  }
}

class StartTypingParams {
  final String uid;
  final String chatId;
  StartTypingParams({
    required this.uid,
    required this.chatId,
  });
}
