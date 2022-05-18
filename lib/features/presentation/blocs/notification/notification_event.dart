part of 'notification_bloc.dart';

@freezed
class NotificationEvent with _$NotificationEvent {
  const factory NotificationEvent.sendLikeNotification(
      {required NotificationEntity notification}) = _SendLikeNotification;

  const factory NotificationEvent.sendCommentNotification(
      {required NotificationEntity notification}) = _SendCommentNotification;

  const factory NotificationEvent.sendFollowNotification(
      {required NotificationEntity notification}) = _SendFollowNotification;

  const factory NotificationEvent.getNotifications({required String uid}) =
      _GetNotifications;
}
