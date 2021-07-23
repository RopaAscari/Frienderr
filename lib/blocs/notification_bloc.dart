import 'package:bloc/bloc.dart';
import 'package:frienderr/state/notification_state.dart';
import 'package:frienderr/events/notification_event.dart';
import 'package:frienderr/repositories/notification_repository.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  final NotificationRepository notificationRepository =
      new NotificationRepository();
  NotificationBloc() : super(NotificationState());

  @override
  Stream<NotificationState> mapEventToState(NotificationEvent event) async* {
    try {
      if (event is SendFollowNotification) {
        await notificationRepository.sendFollowNotification(event.notification);
      }
      if (event is SendLikeNotification) {
        await notificationRepository.sendLikeNotification(event.notification);
      }
      if (event is SendCommentNotification) {
        await notificationRepository
            .sendCommentNotification(event.notification);
      }
    } catch (e) {
      yield SendNotificationError(error: 'Something went wrong');
    }
  }
}
