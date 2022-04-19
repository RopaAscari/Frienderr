import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:frienderr/core/failure/failure.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frienderr/features/domain/entities/notification.dart';
import 'package:frienderr/features/domain/usecases/notification/send_like_notification_usecase.dart';
import 'package:frienderr/features/domain/usecases/notification/send_comment_notification_usecase.dart';
import 'package:frienderr/features/domain/usecases/notification/send_follow_notification_usecase.dart';

part 'notification_event.dart';
part 'notification_state.dart';
part 'notification_bloc.freezed.dart';

@injectable
class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  final SendLikeNotificationUseCase _sendLikeNotificationUseCase;
  final SendFollowNotificationUseCase _sendFollowNotificationUseCase;
  final SendCommentNotificationUseCase _sendCommentNotificationUseCase;

  NotificationBloc(this._sendLikeNotificationUseCase,
      this._sendCommentNotificationUseCase, this._sendFollowNotificationUseCase)
      : super(NotificationState()) {
    on<_SendLikeNotification>(_sendLikeNotification);

    on<_SendCommentNotification>(_sendCommentNotification);

    on<_SendFollowNotification>(_sendFollowNotification);
  }

  Future<void> _sendFollowNotification(
      _SendFollowNotification event, Emitter<NotificationState> emit) async {
    final Either<Failure, bool> either = await _sendFollowNotificationUseCase(
        SendFollowNotificationParams(event.notification));
    either.fold((error) {
      emit(state.copyWith(currentState: NotificationStatus.Failure));
    }, (reult) {
      emit(state.copyWith(
          currentState: NotificationStatus.SendLikeNotificationSuccess));
    });
  }

  Future<void> _sendCommentNotification(
      _SendCommentNotification event, Emitter<NotificationState> emit) async {
    final Either<Failure, bool> either = await _sendCommentNotificationUseCase(
        SendCommentNotificationParams(event.notification));
    either.fold((error) {
      emit(state.copyWith(currentState: NotificationStatus.Failure));
    }, (reult) {
      emit(state.copyWith(
          currentState: NotificationStatus.SendLikeNotificationSuccess));
    });
  }

  Future<void> _sendLikeNotification(
      _SendLikeNotification event, Emitter<NotificationState> emit) async {
    final Either<Failure, bool> either = await _sendLikeNotificationUseCase(
        SendLikeNotificationParams(event.notification));
    either.fold((error) {
      emit(state.copyWith(currentState: NotificationStatus.Failure));
    }, (reult) {
      emit(state.copyWith(
          currentState: NotificationStatus.SendLikeNotificationSuccess));
    });
  }
}
