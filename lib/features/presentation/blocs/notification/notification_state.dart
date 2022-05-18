part of 'notification_bloc.dart';

enum NotificationStatus {
  idle,
  loaded,
  loading,
  error,
}

enum NotificationListenableAction {
  idle,
  sendLikeNotificationSuccess,
  sendFollowNotificationSuccess,
  sendCommentNotificationSuccess,

  sendLikeNotificationFailure,
  sendFollowNotificationFailure,
  sendCommentNotificationFailure,
}

@freezed
class NotificationState with _$NotificationState {
  const factory NotificationState({
    @Default('') String error,
    @Default([]) List<NotificationEntity> notifications,
    @Default(NotificationStatus.idle) NotificationStatus currentState,
    @Default(NotificationListenableAction.idle)
        NotificationListenableAction action,
  }) = _NotificationState;
}
