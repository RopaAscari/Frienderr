import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:frienderr/core/failure/failure.dart';
import 'package:frienderr/core/usecase/usecase.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:frienderr/features/domain/repositiories/chat_repository.dart';

@lazySingleton
class GetChatScreamUsecase extends NoFuturisticUseCase<
    Stream<QuerySnapshot<Map<String, dynamic>>>, GetChatStreamParams> {
  GetChatScreamUsecase(this.repository);

  final IChatRepository repository;

  @override
  Either<Failure, Stream<QuerySnapshot<Map<String, dynamic>>>> call(
      GetChatStreamParams params) {
    return repository.delegateChatStream();
  }
}

class GetChatStreamParams {}
