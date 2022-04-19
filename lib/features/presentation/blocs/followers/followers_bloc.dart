import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:frienderr/core/failure/failure.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frienderr/features/domain/entities/user.dart';
import 'package:frienderr/features/domain/usecases/followers/get_followers_usercase.dart';

part 'followers_event.dart';
part 'followers_state.dart';
part 'followers_bloc.freezed.dart';

@injectable
class FollowersBloc extends Bloc<FollowersEvent, FollowersState> {
  final GetFollowersUseCase _getFollowersUseCase;
  FollowersBloc(this._getFollowersUseCase)
      : super(FollowersState(followers: [])) {
    on<_GetFollowers>(_getFollowers);
  }

  Future<void> _getFollowers(
      _GetFollowers event, Emitter<FollowersState> emit) async {
    emit(state.copyWith(currentState: FollowerStatus.Loaded));
    final Either<Failure, List<UserEntity>> _either =
        await _getFollowersUseCase(GetFollowersParams(event.userId));
    return _either.fold((error) {
      emit(state.copyWith(
          currentState: FollowerStatus.Faliure, error: error.message));
    },
        (List<UserEntity> followers) => emit(state.copyWith(
            currentState: FollowerStatus.Faliure, followers: followers)));
  }
}
