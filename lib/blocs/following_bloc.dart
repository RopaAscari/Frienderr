import 'package:bloc/bloc.dart';
import 'package:frienderr/events/following_event.dart';
import 'package:frienderr/state/following_state.dart';
import 'package:frienderr/repositories/user_repository.dart';

class FollowingBloc extends Bloc<FollowingEvent, FollowingState> {
  final UserRepository userRepository = new UserRepository();

  FollowingBloc() : super(FollowingState()) {
    on<GetFollowing>((event, emit) async {
      try {
        emit(FollowingLoading());

        final following = await userRepository.fetchFollowing(event.id);
        if (following.length == 0) {
          emit(FollowingEmpty(message: 'You are not following anyone'));
        } else {
          emit(FollowingLoaded(following: following));
        }
      } catch (e) {
        emit(FollowingError(error: 'Error retrieving friends'));
      }
    });
  }
}
