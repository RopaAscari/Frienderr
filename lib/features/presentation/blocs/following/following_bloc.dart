import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:frienderr/core/failure/failure.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frienderr/features/domain/entities/user.dart';
import 'package:frienderr/features/domain/usecases/following/get_following_usercase.dart';

part 'following_event.dart';
part 'following_state.dart';
part 'following_bloc.freezed.dart';

@injectable
class FollowingBloc extends Bloc<FollowingEvent, FollowingState> {
  final GetFollowingUseCase _getFollowingUseCase;
  FollowingBloc(this._getFollowingUseCase)
      : super(FollowingState(following: [])) {
    on<_GetFollowing>(_getFollowing);
  }

  Future<void> _getFollowing(
      _GetFollowing event, Emitter<FollowingState> emit) async {
    /*emit(state.copyWith(currentState: FollowingStatus.Loaded));
    final Either<Failure, List<UserDTO>> _either =
        await _getFollowingUseCase(GetFollowingParams(event.userId));
    return _either.fold((error) {
      emit(state.copyWith(
          currentState: FollowingStatus.Faliure, error: error.message));
    },
        (List<UserDTO> followers) => emit(state.copyWith(
            currentState: FollowingStatus.Faliure, following: followers)));
  }*/
  }
}
