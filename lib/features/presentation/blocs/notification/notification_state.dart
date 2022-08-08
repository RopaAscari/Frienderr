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
    @Default(false) final bool reachedMaximumThreshold,
    required final PagingController<int, NotificationModel>
        paginationController,
    @Default(NotificationListenableAction.idle)
        NotificationListenableAction action,
  }) = _NotificationState;
}
