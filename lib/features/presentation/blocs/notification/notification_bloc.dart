import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:frienderr/core/constants/constants.dart';
import 'package:frienderr/features/domain/usecases/notification/get_paginated_notifications_usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:frienderr/core/failure/failure.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frienderr/features/domain/entities/notification.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:frienderr/features/presentation/extensions/paging_controller.dart';
import 'package:frienderr/features/data/models/notification/notification_model.dart';
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
  final GetNotificationStreamUseCase _getNotificationStreamUseCase;
  final SendFollowNotificationUseCase _sendFollowNotificationUseCase;
  final SendCommentNotificationUseCase _sendCommentNotificationUseCase;
  final GetPaginatedNotificationUseCase _getPaginatedNotificationsUseCase;

  NotificationBloc(
      this._getNotificationsUseCase,
      this._sendLikeNotificationUseCase,
      this._getNotificationStreamUseCase,
      this._sendCommentNotificationUseCase,
      this._sendFollowNotificationUseCase,
      this._getPaginatedNotificationsUseCase)
      : super(NotificationState(
          reachedMaximumThreshold: false,
          paginationController:
              PagingController(firstPageKey: 0, invisibleItemsThreshold: 1),
        )) {
    on<_GetNotifications>(_getNotifications);
    on<_SendLikeNotification>(_sendLikeNotification);
    on<_SendFollowNotification>(_sendFollowNotification);
    on<_SendCommentNotification>(_sendCommentNotification);
    on<_GetPaginatedNotifications>(_getPaginatedNotifications);
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> get notificationStream {
    final either = _getNotificationStreamUseCase(GetNotificationStreamParams());
    return either.fold(
        (l) => defaultStream(const Duration(seconds: 5), 10), (r) => r);
  }

  Future<void> _getNotifications(
      _GetNotifications event, Emitter<NotificationState> emit) async {
    final Either<Failure, List<NotificationModel>> either =
        await _getNotificationsUseCase(GetNotificationParams(event.uid));

    return either.fold((error) {
      print("ERROR ${error.message}");
      state.paginationController.error = error.message;
    }, (List<NotificationModel> notifications) {
      if (state.paginationController.itemList != null &&
          state.paginationController.itemList!.isNotEmpty) {
        state.paginationController.reset();
      }

      if (notifications.length < Constants.pageSize ||
          notifications.length == 1) {
        state.paginationController.appendLastPage(notifications);
        emit(state.copyWith(reachedMaximumThreshold: true));
      } else {
        int nextPageKey = state.paginationController.nextPageKey ?? 0;
        nextPageKey++;

        state.paginationController.appendPage(notifications, nextPageKey);
      }
    });
  }

  Future<void> _getPaginatedNotifications(
      _GetPaginatedNotifications event, Emitter<NotificationState> emit) async {
    final previousNotification = state.paginationController
        .itemList![state.paginationController.itemList!.length - 1];

    final Either<Failure, List<NotificationModel>> either =
        await _getPaginatedNotificationsUseCase(
            GetPaginatedNotificationParams(event.uid, previousNotification));

    return either.fold((error) {
      print("ERROR ${error.message}");
      state.paginationController.error = error.message;
    }, (List<NotificationModel> notifications) {
      if (notifications.length < Constants.pageSize ||
          notifications.length == 1) {
        state.paginationController.appendLastPage(notifications);
        emit(state.copyWith(reachedMaximumThreshold: true));
      } else {
        int nextPageKey = state.paginationController.nextPageKey ?? 0;
        nextPageKey++;

        state.paginationController.appendPage(notifications, nextPageKey);
      }
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
