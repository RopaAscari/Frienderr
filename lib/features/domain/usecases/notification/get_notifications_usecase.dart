import 'package:dartz/dartz.dart';
import 'package:frienderr/features/data/models/notification/notification_model.dart';
import 'package:injectable/injectable.dart';
import 'package:frienderr/core/failure/failure.dart';
import 'package:frienderr/core/usecase/usecase.dart';
import 'package:frienderr/features/domain/entities/notification.dart';
import 'package:frienderr/features/domain/repositiories/notification_repository.dart';

@lazySingleton
class GetNotificationUseCase
    extends UseCase<List<NotificationModel>, GetNotificationParams> {
  GetNotificationUseCase(this.repository);
  final INotificationRepository repository;
  @override
  Future<Either<Failure, List<NotificationModel>>> call(
      GetNotificationParams params) {
    return repository.getNotifications(uid: params.uid);
  }
}

class GetNotificationParams {
  final String uid;

  const GetNotificationParams(this.uid);
}
