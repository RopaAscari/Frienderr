import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:frienderr/core/failure/failure.dart';
import 'package:frienderr/core/usecase/usecase.dart';
import 'package:frienderr/features/domain/repositiories/chat_repository.dart';
import 'package:frienderr/features/domain/repositiories/messaging_repository.dart';

@lazySingleton
class GetMessageStreamUsecase extends NoFuturisticUseCase<
    Stream<QuerySnapshot<Map<String, dynamic>>>, GetMessageStreamParams> {
  GetMessageStreamUsecase(this.repository);

  final IMessageRepository repository;

  @override
  Either<Failure, Stream<QuerySnapshot<Map<String, dynamic>>>> call(
      GetMessageStreamParams params) {
    return repository.delegateMessageStream(chatId: params.chatId);
  }
}

class GetMessageStreamParams {
  String chatId;
  GetMessageStreamParams({
    required this.chatId,
  });
}
