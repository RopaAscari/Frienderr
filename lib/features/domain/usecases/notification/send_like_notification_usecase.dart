import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:frienderr/core/failure/failure.dart';
import 'package:frienderr/core/usecase/usecase.dart';
import 'package:frienderr/features/domain/entities/notification.dart';
import 'package:frienderr/features/domain/repositiories/notification_repository.dart';

@lazySingleton
class SendLikeNotificationUseCase
    extends UseCase<bool, SendLikeNotificationParams> {
  SendLikeNotificationUseCase(this.repository);
  final INotificationRepository repository;
  @override
  Future<Either<Failure, bool>> call(SendLikeNotificationParams params) {
    return repository.sendLikeNotification(notification: params.notification);
  }
}

class SendLikeNotificationParams {
  final NotificationDTO notification;

  const SendLikeNotificationParams(this.notification);
}
