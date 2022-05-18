import 'package:dartz/dartz.dart';

import 'package:injectable/injectable.dart';
import 'package:frienderr/core/failure/failure.dart';
import 'package:frienderr/core/usecase/usecase.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:frienderr/features/domain/entities/post.dart';
import 'package:frienderr/features/domain/repositiories/post_repository.dart';
import 'package:frienderr/features/domain/repositiories/notification_repository.dart';

@lazySingleton
class GetNotificationStreamUseCase extends NoFuturisticUseCase<
    Stream<QuerySnapshot<Map<String, dynamic>>>, GetNotificationStreamParams> {
  GetNotificationStreamUseCase(this.repository);

  final INotificationRepository repository;

  @override
  Either<Failure, Stream<QuerySnapshot<Map<String, dynamic>>>> call(
      GetNotificationStreamParams params) {
    return repository.delegateNotificationStream();
  }
}

class GetNotificationStreamParams {}
