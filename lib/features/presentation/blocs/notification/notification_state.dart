part of 'notification_bloc.dart';

enum NotificationStatus {
  Initial,
  Failure,
  SendLikeNotificationSuccess,
  SendFollowNotificationSuccess,
  SendCommentNotificationSuccess,
}

@freezed
class NotificationState with _$NotificationState {
  const factory NotificationState({
    @Default('') String error,
    @Default(NotificationStatus.Initial) NotificationStatus currentState,
  }) = _NotificationState;
}
