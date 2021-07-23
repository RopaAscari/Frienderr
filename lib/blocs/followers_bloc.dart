import 'package:bloc/bloc.dart';
import 'package:frienderr/state/followers_state.dart';
import 'package:frienderr/events/followers_event.dart';
import 'package:frienderr/repositories/user_repository.dart';

class FollowersBloc extends Bloc<FollowerEvent, FollowerState> {
  FollowersBloc() : super(FollowerState());
  final UserRepository userRepository = new UserRepository();

  @override
  Stream<FollowerState> mapEventToState(FollowerEvent event) async* {
    if (event is GetFollowers) {
      try {
        yield FollowersLoading();

        final followers = await userRepository.fetchFollowers(event.id);
        if (followers.length == 0) {
          yield FollowersEmpty(message: 'You have no followers');
        } else {
          yield FollowerLoaded(followers: followers);
        }
      } catch (e) {
        yield FollowersError(error: 'Error retrieving followers');
      }
    }
  }
}
