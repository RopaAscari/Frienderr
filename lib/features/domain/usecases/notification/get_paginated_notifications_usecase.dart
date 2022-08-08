import 'package:dartz/dartz.dart';
import 'package:frienderr/features/data/models/notification/notification_model.dart';
import 'package:injectable/injectable.dart';
import 'package:frienderr/core/failure/failure.dart';
import 'package:frienderr/core/usecase/usecase.dart';
import 'package:frienderr/features/domain/entities/notification.dart';
import 'package:frienderr/features/domain/repositiories/notification_repository.dart';

@lazySingleton
class GetPaginatedNotificationUseCase
    extends UseCase<List<NotificationModel>, GetPaginatedNotificationParams> {
  GetPaginatedNotificationUseCase(this.repository);
  final INotificationRepository repository;
  @override
  Future<Either<Failure, List<NotificationModel>>> call(
      GetPaginatedNotificationParams params) {
    return repository.getPaginatedNotifications(
        uid: params.uid, previousNotification: params.previousNotification);
  }
}

class GetPaginatedNotificationParams {
  final String uid;
  final NotificationModel previousNotification;

  const GetPaginatedNotificationParams(this.uid, this.previousNotification);
}
