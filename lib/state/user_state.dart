import 'package:meta/meta.dart';
import '../models/user/user_model.dart';
import 'package:equatable/equatable.dart';

@immutable
class UserState extends Equatable {
  final dynamic user;

  UserState(this.user) : super();

  @override
  List<Object> get props => [user];
}

class UserLoaded extends UserState {
  final dynamic user;

  UserLoaded(this.user) : super(user);

  @override
  List<Object> get props => [user];
}
