import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:frienderr/core/failure/failure.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frienderr/features/domain/entities/user.dart';
import 'package:frienderr/features/domain/usecases/following/unfollow_user_usecase.dart';
import 'package:frienderr/features/domain/usecases/following/follower_user_usercase.dart';
import 'package:frienderr/features/domain/usecases/followers/get_followers_usercase.dart';

part 'followers_event.dart';
part 'followers_state.dart';
part 'followers_bloc.freezed.dart';

@injectable
class FollowersBloc extends Bloc<FollowersEvent, FollowersState> {
  final FollowUserUseCase _followUserUseCase;
  final UnFollowUserUseCase _unfollowUserUseCase;
  final GetFollowersUseCase _getFollowersUseCase;

  FollowersBloc(this._getFollowersUseCase, this._followUserUseCase,
      this._unfollowUserUseCase)
      : super(const FollowersState(followers: [])) {
    on<_Reset>(_reset);
    on<_FollowUser>(_followUser);
    on<_GetFollowers>(_getFollowers);
    on<_UnFollowUser>(_unfollowUser);
  }
  Future<void> _reset(_Reset event, Emitter<FollowersState> emit) async {
    emit(state.copyWith(action: FollowerListenableAction.idle));
  }

  Future<void> _getFollowers(
      _GetFollowers event, Emitter<FollowersState> emit) async {}

  Future<void> _followUser(
      _FollowUser event, Emitter<FollowersState> emit) async {
    final either =
        await _followUserUseCase(FollowUserParams(event.uid, event.fid));

    either.fold((l) {
      emit(state.copyWith(action: FollowerListenableAction.followFailure));
    }, (success) {
      if (!success) {
        emit(state.copyWith(action: FollowerListenableAction.followFailure));
        return;
      }
      emit(state.copyWith(action: FollowerListenableAction.followSuccess));
    });
  }

  Future<void> _unfollowUser(
      _UnFollowUser event, Emitter<FollowersState> emit) async {
    final either =
        await _unfollowUserUseCase(UnFollowUserParams(event.uid, event.fid));

    either.fold((l) {
      emit(state.copyWith(action: FollowerListenableAction.unfollowFailure));
    }, (success) {
      if (!success) {
        emit(state.copyWith(action: FollowerListenableAction.unfollowFailure));
        return;
      }
      emit(state.copyWith(action: FollowerListenableAction.unfollowSuccess));
    });
  }
}
