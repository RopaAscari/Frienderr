import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import 'package:frienderr/core/failure/failure.dart';
import 'package:frienderr/core/usecase/usecase.dart';
import 'package:frienderr/features/domain/repositiories/chat_repository.dart';

@lazySingleton
class DeleteChatUseCase extends UseCase<bool, DeleteChatParams> {
  DeleteChatUseCase(this.repository);

  final IChatRepository repository;

  @override
  Future<Either<Failure, bool>> call(DeleteChatParams params) {
    return repository.deleteChat(uid: params.uid);
  }
}

class DeleteChatParams {
  final String uid;
  DeleteChatParams({
    required this.uid,
  });
}
