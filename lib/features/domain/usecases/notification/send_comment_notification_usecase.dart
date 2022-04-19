import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:frienderr/core/failure/failure.dart';
import 'package:frienderr/core/usecase/usecase.dart';
import 'package:frienderr/features/domain/entities/notification.dart';
import 'package:frienderr/features/domain/repositiories/notification_repository.dart';

@lazySingleton
class SendCommentNotificationUseCase
    extends UseCase<bool, SendCommentNotificationParams> {
  SendCommentNotificationUseCase(this.repository);
  final INotificationRepository repository;
  @override
  Future<Either<Failure, bool>> call(SendCommentNotificationParams params) {
    return repository.sendCommentNotification(params.notification);
  }
}

class SendCommentNotificationParams {
  final CommentNotificationEntity notification;

  const SendCommentNotificationParams(this.notification);
}
