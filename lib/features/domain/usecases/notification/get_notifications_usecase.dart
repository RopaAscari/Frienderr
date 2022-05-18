import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:frienderr/core/failure/failure.dart';
import 'package:frienderr/core/usecase/usecase.dart';
import 'package:frienderr/features/domain/entities/notification.dart';
import 'package:frienderr/features/domain/repositiories/notification_repository.dart';

@lazySingleton
class GetNotificationUseCase
    extends UseCase<List<NotificationEntity>, GetNotificationParams> {
  GetNotificationUseCase(this.repository);
  final INotificationRepository repository;
  @override
  Future<Either<Failure, List<NotificationEntity>>> call(
      GetNotificationParams params) {
    return repository.getNotifications(uid: params.uid);
  }
}

class GetNotificationParams {
  final String uid;

  const GetNotificationParams(this.uid);
}
