import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:frienderr/features/data/models/snap/snap_model.dart';
import 'package:frienderr/features/domain/usecases/user/update_cover_photo_usecase.dart';
import 'package:frienderr/features/domain/usecases/user/update_profile_photo_usecase.dart';
import 'package:frienderr/features/domain/usecases/user/update_profile_usecase.dart';
import 'package:frienderr/features/presentation/blocs/user/user_bloc.dart';

import 'package:injectable/injectable.dart';
import 'package:frienderr/core/failure/failure.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frienderr/features/data/models/user/user_model.dart';
import 'package:frienderr/features/data/models/post/post_model.dart';

import 'package:frienderr/features/domain/usecases/quick/get_user_snaps.dart';
import 'package:frienderr/features/domain/usecases/user/get_user_usecase.dart';
import 'package:frienderr/features/domain/usecases/post/get_user_posts_usecase.dart';
import 'package:frienderr/features/domain/usecases/reaction/get_profile_reactions.dart';
import 'package:frienderr/features/domain/usecases/following/get_following_usercase.dart';
import 'package:frienderr/features/domain/usecases/followers/get_profile_followers_list.dart';
import 'package:frienderr/features/domain/usecases/following/get_following_status_usecase.dart';
import 'package:frienderr/features/domain/usecases/followers/get_account_followers_usecase.dart';

import '../../../../domain/entities/update_profile.dart';

part 'user_account_state.dart';
part 'user_account_event.dart';
part 'user_account_bloc.freezed.dart';

@injectable
class UserAccountBloc extends Bloc<UserAccountEvent, UserAccountState> {
  final GetUserUseCase _getUserUseCase;
  final GetUserSnapsUseCase _getSnapsUseCase;
  final GetUserPostsUseCase _getPostsUseCase;
  final GetFollowingUseCase _getFollowingUseCase;
  final UpdateProfileUseCase _updateProfileUseCase;
  final GetAccountFollowersUseCase _getFollowersUseCase;
  final UpdateCoverPhotoUseCase _updateCoverPhotoUseCase;
  final UpdateProfilePhotoUseCase _updateProfilePhotoUseCase;
  final GetFollowingStatusUseCase _getFollowingStatusUseCase;
  final GetProfileReactionsUseCase _getProfileReactionsUseCase;
  final GetProfileFollowersListUseCase _getProfileFollowersListUseCase;

  UserAccountBloc(
    this._getUserUseCase,
    this._getSnapsUseCase,
    this._getPostsUseCase,
    this._getFollowersUseCase,
    this._getFollowingUseCase,
    this._getFollowingStatusUseCase,
    this._getProfileReactionsUseCase,
    this._getProfileFollowersListUseCase,
    this._updateProfileUseCase,
    this._updateCoverPhotoUseCase,
    this._updateProfilePhotoUseCase,
  ) : super(const UserAccountState(user: UserModel(id: ""))) {
    on<_UpdateProfile>(_updateProfile);
    on<_UpdateCoverPhoto>(_updateCoverPhoto);
    on<_UpdateProfilePhoto>(_updateProfilePhoto);
    on<_GetUser>(_getUser, transformer: concurrent());
    on<_GetPosts>(_getPosts, transformer: concurrent());
    on<_GetSnaps>(_getSnaps, transformer: concurrent());
    on<_GetFollowers>(_getFollowers, transformer: concurrent());
    on<_GetFollowing>(_getFollowing, transformer: concurrent());
    on<_GetReactions>(_getReactions, transformer: concurrent());
    on<_GetFollowingList>(_getFollowingList, transformer: concurrent());
  }

  Future<void> _getReactions(
      _GetReactions event, Emitter<UserAccountState> emit) async {
    emit(state.copyWith(userState: AccountUserStatus.loading));
    final Either<Failure, int> _etiherAccountUser =
        await _getProfileReactionsUseCase(
            GetProfileReactionsParams(uid: event.uid));

    _etiherAccountUser.fold((error) {
      emit(state.copyWith(
          userState: AccountUserStatus.error, error: error.message));
    }, (reactions) {
      emit(state.copyWith(
          userState: AccountUserStatus.loaded, reactions: reactions));
    });
  }

  Future<void> _updateProfile(
      _UpdateProfile event, Emitter<UserAccountState> emit) async {
    emit(state.copyWith(
        action: UserAccountListenableAction.profileUpdateLoading));
    final Either<Failure, bool> _etiherAccountUser =
        await _updateProfileUseCase(
            UpdateProfileParams(uid: event.uid, profile: event.profile));

    _etiherAccountUser.fold((error) {
      emit(state.copyWith(
          action: UserAccountListenableAction.profileUpdateError));
    }, (success) {
      if (!success) {
        emit(state.copyWith(
            action: UserAccountListenableAction.profileUpdateError));
        return;
      }
      final user = event.userBloc.state.user.copyWith(
        email: event.profile.email,
        status: event.profile.status,
        username: event.profile.username,
      );
      event.userBloc.add(UserEvent.setUser(user));

      emit(state.copyWith(
        user: user,
        action: UserAccountListenableAction.profileUpdateSuccess,
      ));
    });
  }

  Future<void> _updateCoverPhoto(
      _UpdateCoverPhoto event, Emitter<UserAccountState> emit) async {
    emit(state.copyWith(
      action: UserAccountListenableAction.idle,
    ));
    //emit(state.copyWith(userState: ProfileAccountUserStatus.loading));

    // print("COVER PHOTO $coverPhoto");
    final Either<Failure, String> _etiher = await _updateCoverPhotoUseCase(
        UpdateCoverPhotoParams(file: event.file, uid: event.uid));

    _etiher.fold((error) {
      emit(state.copyWith(
        action: UserAccountListenableAction.coverPhotoUpdateFailed,
      ));
    }, (coverPhoto) {
      final user = event.userBloc.state.user.copyWith(coverPhoto: coverPhoto);
      event.userBloc.add(UserEvent.setUser(user));

      emit(state.copyWith(
        user: user,
        action: UserAccountListenableAction.coverPhotoUpdated,
      ));
    });
  }

  Future<void> _updateProfilePhoto(
      _UpdateProfilePhoto event, Emitter<UserAccountState> emit) async {
    emit(state.copyWith(
      action: UserAccountListenableAction.idle,
    ));
    //emit(state.copyWith(userState: ProfileAccountUserStatus.loading));
    final Either<Failure, String> _etiher = await _updateProfilePhotoUseCase(
        UpdateProfilePhotoParams(file: event.file, uid: event.uid));

    _etiher.fold((error) {
      emit(state.copyWith(
        action: UserAccountListenableAction.profilePhotoUpdateFailed,
      ));
    }, (profilePic) {
      final user = event.userBloc.state.user.copyWith(profilePic: profilePic);
      event.userBloc.add(UserEvent.setUser(user));

      emit(state.copyWith(
        user: user,
        action: UserAccountListenableAction.profilePhotoUpdated,
      ));
    });
  }

  Future<void> _getFollowingList(
      _GetFollowingList event, Emitter<UserAccountState> emit) async {
    emit(state.copyWith(userState: AccountUserStatus.loading));
    final Either<Failure, List<UserModel>> _etiherAccountUser =
        await _getProfileFollowersListUseCase(
            GetProfileFollowersListParams(event.uid));

    _etiherAccountUser.fold((error) {
      emit(state.copyWith(
          userState: AccountUserStatus.error, error: error.message));
    }, (followersList) {
      emit(state.copyWith(
          userState: AccountUserStatus.loaded, followersList: followersList));
    });
  }

  Future<void> _getUser(_GetUser event, Emitter<UserAccountState> emit) async {
    emit(state.copyWith(userState: AccountUserStatus.loading));
    final Either<Failure, UserModel> _etiherAccountUser =
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
    final Either<Failure, int> _etiherFollowers =
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
    final Either<Failure, int> _etiherFollowing =
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
    print("exe bloc");
    emit(state.copyWith(postState: AccountPostStatus.loading));
    final Either<Failure, List<Post>> _etiherPosts =
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
    log('exe');
    emit(state.copyWith(snapState: AccountSnapStatus.loading));
    final Either<Failure, List<Snap>> _etiherSnaps =
        await _getSnapsUseCase(GetUserSnapsParams(uid: event.uid));

    _etiherSnaps.fold((error) {
      log(error.message);
      emit(state.copyWith(
          snapState: AccountSnapStatus.error, error: error.message));
    }, (snaps) {
      print(snaps);
      final _snaps =
          snaps.map((snap) => snap.copyWith(user: state.user)).toList();
      emit(state.copyWith(snapState: AccountSnapStatus.loaded, snaps: _snaps));
    });
  }
}
