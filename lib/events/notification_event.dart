import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:frienderr/models/notification/notification_model.dart';

@immutable
abstract class NotificationEvent extends Equatable {
  // Passing class fields in a list to the Equatable super class
  NotificationEvent([List props = const []]) : super();
}

class SendFollowNotification extends NotificationEvent {
  final FollowNotificationModel notification;

  SendFollowNotification({
    required this.notification,
  }) : super([notification]);

  @override
  List<Object> get props => [notification];
}

class SendLikeNotification extends NotificationEvent {
  final LikeNotificationModel notification;

  SendLikeNotification({
    required this.notification,
  }) : super([notification]);

  @override
  List<Object> get props => [notification];
}

class SendCommentNotification extends NotificationEvent {
  final CommentNotificationModel notification;

  SendCommentNotification({
    required this.notification,
  }) : super([notification]);

  @override
  List<Object> get props => [notification];
}
