part of 'notification_bloc.dart';

@freezed
class NotificationEvent with _$NotificationEvent {
  const factory NotificationEvent.sendLikeNotification(
      {required NotificationDTO notification}) = _SendLikeNotification;

  const factory NotificationEvent.sendCommentNotification(
      {required NotificationDTO notification}) = _SendCommentNotification;

  const factory NotificationEvent.sendFollowNotification(
      {required NotificationDTO notification}) = _SendFollowNotification;

  const factory NotificationEvent.getNotifications({required String uid}) =
      _GetNotifications;

  const factory NotificationEvent.getPaginatedNotifications(
      {required String uid}) = _GetPaginatedNotifications;
}
