import 'package:equatable/equatable.dart';

abstract class FollowerEvent extends Equatable {
  FollowerEvent();
}

class GetFollowers extends FollowerEvent {
  final String id;
  GetFollowers({required this.id});

  @override
  List<Object> get props => [id];
}
