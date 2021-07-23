import 'package:equatable/equatable.dart';

class NotificationState extends Equatable {
  NotificationState([List props = const []]) : super();

  List<Object> get props => [];
}

class SendNotificationState extends NotificationState {}

class SendNotificationError extends NotificationState {
  final String error;

  SendNotificationError({required this.error});
  @override
  List<Object> get props => [error];

  @override
  String toString() => 'Register Username Faliure : { error: $error }';
}
