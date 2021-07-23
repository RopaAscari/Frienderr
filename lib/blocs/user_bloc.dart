import 'dart:async';
import '../models/user/user_model.dart';
import 'package:frienderr/state/user_state.dart';
import 'package:frienderr/events/user_event.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:frienderr/repositories/user_repository.dart';

class UserBloc extends HydratedBloc<UserEvent, UserState> {
  final UserRepository userRepository = new UserRepository();
  UserBloc() : super(UserState({}));

  UserState get initialState {
    return UserState({});
  }

  @override
  UserState fromJson(Map<String, dynamic> json) {
    try {
      final user = UserModel.fromJson(json);
      return UserLoaded(user);
    } catch (_) {
      return null as UserState;
    }
  }

  @override
  Map<String, dynamic> toJson(UserState state) {
    if (state is UserLoaded) {
      return state.user.toJson();
    } else {
      return null as Map<String, dynamic>;
    }
  }

  @override
  Stream<UserState> mapEventToState(
    UserEvent event,
  ) async* {
    if (event is SetUser) {
      yield UserLoaded(event.user);
    }
  }
}
