import 'package:frienderr/models/user/user_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class UserEvent extends Equatable {
  UserEvent([List props = const <dynamic>[]]) : super();
}

class GetUser extends UserEvent {
  @override
  List<Object> get props => [];
}

class SetUser extends UserEvent {
  final UserModel user;

  SetUser({
    required this.user,
  }) : super([user]);

  @override
  List<Object> get props => [user];
}
