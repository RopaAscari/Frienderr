import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:frienderr/core/failure/failure.dart';
import 'package:frienderr/core/usecase/usecase.dart';
import 'package:frienderr/features/domain/entities/notification.dart';
import 'package:frienderr/features/domain/repositiories/notification_repository.dart';

@lazySingleton
class SendFollowNotificationUseCase
    extends UseCase<bool, SendFollowNotificationParams> {
  SendFollowNotificationUseCase(this.repository);
  final INotificationRepository repository;
  @override
  Future<Either<Failure, bool>> call(SendFollowNotificationParams params) {
    return repository.sendFollowNotification(params.notification);
  }
}

class SendFollowNotificationParams {
  final FollowNotificationEntity notification;

  const SendFollowNotificationParams(this.notification);
}
