import 'package:frienderr/events/friends_event.dart';
import 'package:frienderr/repositories/user_repository.dart';
import 'package:frienderr/state/following_state.dart';
import 'package:frienderr/state/friends_state.dart';
import 'package:bloc/bloc.dart';

class FriendsBloc extends Bloc<FriendsEvent, FriendsState> {
  FriendsBloc() : super(FriendsState());
  final UserRepository userRepository = new UserRepository();

  @override
  Stream<FriendsState> mapEventToState(FriendsEvent event) async* {}
}
