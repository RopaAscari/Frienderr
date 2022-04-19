part of 'notification_bloc.dart';

@freezed
class NotificationEvent with _$NotificationEvent {
  const factory NotificationEvent.sendLikeNotification(
      {required LikeNotificationEntity notification}) = _SendLikeNotification;

  const factory NotificationEvent.sendCommentNotification(
          {required CommentNotificationEntity notification}) =
      _SendCommentNotification;

  const factory NotificationEvent.sendFollowNotification(
          {required FollowNotificationEntity notification}) =
      _SendFollowNotification;
}
