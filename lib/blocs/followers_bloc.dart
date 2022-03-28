import 'package:bloc/bloc.dart';
import 'package:frienderr/models/user/user_model.dart';
import 'package:frienderr/state/followers_state.dart';
import 'package:frienderr/events/followers_event.dart';
import 'package:frienderr/repositories/user_repository.dart';

class FollowersBloc extends Bloc<FollowerEvent, FollowerState> {
  final UserRepository userRepository = new UserRepository();

  FollowersBloc() : super(FollowerState()) {
    on<GetFollowers>((event, emit) async {
      try {
        emit(FollowersLoading());

        final List<UserModel> followers =
            await userRepository.fetchFollowers(event.id);
        if (followers.length == 0) {
          emit(FollowersEmpty(message: 'You have no followers'));
        } else {
          emit(FollowerLoaded(followers: followers));
        }
      } catch (e) {
        emit(FollowersError(error: 'Error retrieving followers'));
      }
    });
  }
}
