import 'package:bloc/bloc.dart';
import 'package:frienderr/events/following_event.dart';
import 'package:frienderr/state/following_state.dart';
import 'package:frienderr/repositories/user_repository.dart';

class FollowingBloc extends Bloc<FollowingEvent, FollowingState> {
  FollowingBloc() : super(FollowingState());
  final UserRepository userRepository = new UserRepository();

  @override
  Stream<FollowingState> mapEventToState(FollowingEvent event) async* {
    if (event is GetFollowing) {
      try {
        yield FollowingLoading();

        final following = await userRepository.fetchFollowing(event.id);
        if (following.length == 0) {
          yield FollowingEmpty(message: 'You are not following anyone');
        } else {
          yield FollowingLoaded(following: following);
        }
      } catch (e) {
        yield FollowingError(error: 'Error retrieving friends');
      }
    }
  }
}
