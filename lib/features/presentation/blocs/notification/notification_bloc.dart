import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:frienderr/core/failure/failure.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frienderr/features/domain/entities/notification.dart';
import 'package:frienderr/features/domain/usecases/notification/get_notifications_usecase.dart';
import 'package:frienderr/features/domain/usecases/notification/send_like_notification_usecase.dart';
import 'package:frienderr/features/domain/usecases/notification/get_notification_stream_usecase.dart';
import 'package:frienderr/features/domain/usecases/notification/send_comment_notification_usecase.dart';
import 'package:frienderr/features/domain/usecases/notification/send_follow_notification_usecase.dart';

part 'notification_event.dart';
part 'notification_state.dart';
part 'notification_bloc.freezed.dart';

@injectable
class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  final GetNotificationUseCase _getNotificationsUseCase;
  final SendLikeNotificationUseCase _sendLikeNotificationUseCase;
  final SendFollowNotificationUseCase _sendFollowNotificationUseCase;
  final SendCommentNotificationUseCase _sendCommentNotificationUseCase;
  final GetNotificationStreamUseCase _getNotificationStreamUseCase;

  NotificationBloc(
    this._getNotificationsUseCase,
    this._sendLikeNotificationUseCase,
    this._getNotificationStreamUseCase,
    this._sendCommentNotificationUseCase,
    this._sendFollowNotificationUseCase,
  ) : super(const NotificationState()) {
    on<_GetNotifications>(_getNotifications);

    on<_SendLikeNotification>(_sendLikeNotification);

    on<_SendCommentNotification>(_sendCommentNotification);

    on<_SendFollowNotification>(_sendFollowNotification);
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> get notificationStream {
    final either = _getNotificationStreamUseCase(GetNotificationStreamParams());
    return either.fold(
        (l) => defaultStream(const Duration(seconds: 5), 10), (r) => r);
  }

  Future<void> _getNotifications(
      _GetNotifications event, Emitter<NotificationState> emit) async {
    emit(state.copyWith(currentState: NotificationStatus.loading));
    final Either<Failure, List<NotificationEntity>> either =
        await _getNotificationsUseCase(GetNotificationParams(event.uid));
    either.fold((error) {
      emit(state.copyWith(
          error: error.message, currentState: NotificationStatus.error));
    }, (notifications) {
      emit(state.copyWith(
          notifications: notifications,
          currentState: NotificationStatus.loaded));
    });
  }

  Future<void> _sendFollowNotification(
      _SendFollowNotification event, Emitter<NotificationState> emit) async {
    final Either<Failure, bool> either = await _sendFollowNotificationUseCase(
        SendFollowNotificationParams(event.notification));
    either.fold((error) {
      emit(state.copyWith(
          action: NotificationListenableAction.sendFollowNotificationFailure));
    }, (reult) {
      emit(state.copyWith(
          action: NotificationListenableAction.sendFollowNotificationSuccess));
    });
  }

  Future<void> _sendCommentNotification(
      _SendCommentNotification event, Emitter<NotificationState> emit) async {
    final Either<Failure, bool> either = await _sendCommentNotificationUseCase(
        SendCommentNotificationParams(event.notification));
    either.fold((error) {
      emit(state.copyWith(
          action: NotificationListenableAction.sendCommentNotificationFailure));
    }, (reult) {
      emit(state.copyWith(
          action: NotificationListenableAction.sendCommentNotificationSuccess));
    });
  }

  Future<void> _sendLikeNotification(
      _SendLikeNotification event, Emitter<NotificationState> emit) async {
    final Either<Failure, bool> either = await _sendLikeNotificationUseCase(
        SendLikeNotificationParams(event.notification));
    either.fold((error) {
      emit(state.copyWith(
          action: NotificationListenableAction.sendLikeNotificationFailure));
    }, (reult) {
      emit(state.copyWith(
          action: NotificationListenableAction.sendLikeNotificationSuccess));
    });
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> defaultStream(Duration interval,
      [int? maxCount]) async* {
    int i = 0;
    while (true) {
      await Future.delayed(interval);
      i++;
      yield {} as QuerySnapshot<Map<String, dynamic>>;
      if (i == maxCount) break;
    }
  }
}
