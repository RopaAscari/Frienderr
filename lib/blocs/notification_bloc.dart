import 'package:bloc/bloc.dart';
import 'package:frienderr/state/notification_state.dart';
import 'package:frienderr/events/notification_event.dart';
import 'package:frienderr/repositories/notification_repository.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  final NotificationRepository notificationRepository =
      new NotificationRepository();
  NotificationBloc() : super(NotificationState()) {
    on<SendFollowNotification>((event, emit) async {
      try {
        await notificationRepository.sendFollowNotification(event.notification);
      } catch (e) {
        emit(SendNotificationError(error: 'Something went wrong'));
      }
    });

    on<SendLikeNotification>((event, emit) async {
      await notificationRepository.sendLikeNotification(event.notification);
    });

    on<SendCommentNotification>((event, emit) async {
      await notificationRepository.sendCommentNotification(event.notification);
    });
  }
}
