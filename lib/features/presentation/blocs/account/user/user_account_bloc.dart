import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:frienderr/core/failure/failure.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frienderr/features/domain/entities/user.dart';
import 'package:frienderr/features/domain/entities/post.dart';
import 'package:frienderr/features/domain/entities/quick.dart';
import 'package:frienderr/features/domain/entities/account.dart';
import 'package:frienderr/features/data/models/user/user_model.dart';
import 'package:frienderr/features/domain/usecases/quick/get_user_snaps.dart';
import 'package:frienderr/features/domain/usecases/user/get_user_usecase.dart';
import 'package:frienderr/features/presentation/screens/account/user/user_account.dart';
import 'package:frienderr/features/domain/usecases/post/get_user_posts_usecase.dart';
import 'package:frienderr/features/domain/usecases/following/get_following_usercase.dart';
import 'package:frienderr/features/domain/usecases/followers/get_account_followers_usecase.dart';

part 'user_account_state.dart';
part 'user_account_event.dart';
part 'user_account_bloc.freezed.dart';

@injectable
class UserAccountBloc extends Bloc<UserAccountEvent, UserAccountState> {
  final GetUserUseCase _getUserUseCase;
  final GetUserSnapsUseCase _getSnapsUseCase;
  final GetUserPostsUseCase _getPostsUseCase;
  final GetFollowingUseCase _getFollowingUseCase;
  final GetAccountFollowersUseCase _getFollowersUseCase;

  UserAccountBloc(this._getPostsUseCase, this._getFollowersUseCase,
      this._getFollowingUseCase, this._getSnapsUseCase, this._getUserUseCase)
      : super(UserAccountState(user: UserEntity(id: ""))) {
    on<_GetUser>(_getUser);
    on<_GetPosts>(_getPosts);
    on<_GetSnaps>(_getSnaps);
    on<_GetFollowers>(_getFollowers);
    on<_GetFollowing>(_getFollowing);
  }

  Future<void> _getUser(_GetUser event, Emitter<UserAccountState> emit) async {
    emit(state.copyWith(userState: AccountUserStatus.loading));
    final Either<Failure, UserEntity> _etiherAccountUser =
        await _getUserUseCase(GetUserParams(uid: event.uid));

    _etiherAccountUser.fold((error) {
      emit(state.copyWith(
          userState: AccountUserStatus.error, error: error.message));
    }, (user) {
      emit(state.copyWith(userState: AccountUserStatus.loaded, user: user));
    });
  }

  Future<void> _getFollowers(
      _GetFollowers event, Emitter<UserAccountState> emit) async {
    emit(state.copyWith(followerState: AccountFollowersStatus.loading));
    final Either<Failure, List<String>> _etiherFollowers =
        await _getFollowersUseCase(GetAccountFollowersParams(event.uid));

    _etiherFollowers.fold((error) {
      emit(state.copyWith(
          followerState: AccountFollowersStatus.error, error: error.message));
    }, (followers) {
      emit(state.copyWith(
          followerState: AccountFollowersStatus.loaded, followers: followers));
    });
  }

  Future<void> _getFollowing(
      _GetFollowing event, Emitter<UserAccountState> emit) async {
    emit(state.copyWith(followingState: AccountFollowingStatus.loading));
    final Either<Failure, List<String>> _etiherFollowing =
        await _getFollowingUseCase(GetFollowingParams(event.uid));

    _etiherFollowing.fold((error) {
      emit(state.copyWith(
          followingState: AccountFollowingStatus.error, error: error.message));
    }, (following) {
      emit(state.copyWith(
          followingState: AccountFollowingStatus.loaded, following: following));
    });
  }

  Future<void> _getPosts(
      _GetPosts event, Emitter<UserAccountState> emit) async {
    emit(state.copyWith(postState: AccountPostStatus.loading));
    final Either<Failure, List<PostEntity>> _etiherPosts =
        await _getPostsUseCase(GetUserPostsParams(event.uid));

    _etiherPosts.fold((error) {
      emit(state.copyWith(
          postState: AccountPostStatus.error, error: error.message));
    }, (posts) {
      final _posts =
          posts.map((post) => post.copyWith(user: state.user)).toList();
      emit(state.copyWith(postState: AccountPostStatus.loaded, posts: _posts));
    });
  }

  Future<void> _getSnaps(
      _GetSnaps event, Emitter<UserAccountState> emit) async {
    emit(state.copyWith(snapState: AccountSnapStatus.loading));
    final Either<Failure, List<QuickEntity>> _etiherSnaps =
        await _getSnapsUseCase(GetUserSnapsParams(uid: event.uid));

    _etiherSnaps.fold((error) {
      emit(state.copyWith(
          snapState: AccountSnapStatus.error, error: error.message));
    }, (snaps) {
      final _snaps =
          snaps.map((snap) => snap.copyWith(user: state.user)).toList();
      emit(state.copyWith(snapState: AccountSnapStatus.loaded, snaps: _snaps));
    });
  }
}
