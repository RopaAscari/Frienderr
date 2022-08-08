import 'dart:developer';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:frienderr/core/enums/enums.dart';
import 'package:frienderr/core/injection/injection.dart';
import 'package:frienderr/features/domain/entities/update_profile.dart';
import 'package:frienderr/features/domain/usecases/user/update_profile_usecase.dart';
import 'package:frienderr/features/presentation/blocs/user/user_bloc.dart';
import 'package:frienderr/features/presentation/navigation/app_router.dart';

import 'package:injectable/injectable.dart';
import 'package:frienderr/core/failure/failure.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frienderr/features/data/models/post/post_model.dart';
import 'package:frienderr/features/data/models/user/user_model.dart';
import 'package:frienderr/features/data/models/snap/snap_model.dart';
import '../../../../domain/usecases/user/update_profile_photo_usecase.dart';
import 'package:frienderr/features/domain/usecases/quick/get_user_snaps.dart';
import 'package:frienderr/features/domain/usecases/user/get_user_usecase.dart';
import 'package:frienderr/features/domain/usecases/post/get_user_posts_usecase.dart';
import 'package:frienderr/features/domain/usecases/reaction/get_profile_reactions.dart';
import 'package:frienderr/features/domain/usecases/user/update_cover_photo_usecase.dart';
import 'package:frienderr/features/domain/usecases/following/get_following_usercase.dart';
import 'package:frienderr/features/domain/usecases/followers/get_profile_followers_list.dart';
import 'package:frienderr/features/domain/usecases/following/get_following_status_usecase.dart';
import 'package:frienderr/features/domain/usecases/followers/get_account_followers_usecase.dart';

part 'profile_account_state.dart';
part 'profile_account_event.dart';
part 'profile_account_bloc.freezed.dart';

@injectable
class ProfileAccountBloc
    extends Bloc<ProfileAccountEvent, ProfileAccountState> {
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

  ProfileAccountBloc(
    this._getUserUseCase,
    this._getSnapsUseCase,
    this._getPostsUseCase,
    this._getFollowingUseCase,
    this._getFollowersUseCase,
    this._updateProfileUseCase,
    this._updateCoverPhotoUseCase,
    this._updateProfilePhotoUseCase,
    this._getFollowingStatusUseCase,
    this._getProfileReactionsUseCase,
    this._getProfileFollowersListUseCase,
  ) : super(const ProfileAccountState(user: UserModel(id: ""))) {
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
    on<_GetFollowingStatus>(_getFollowingStatus, transformer: concurrent());
  }

  Future<void> _getUser(
      _GetUser event, Emitter<ProfileAccountState> emit) async {
    emit(state.copyWith(userState: ProfileAccountUserStatus.loading));
    final Either<Failure, UserModel> _etiherAccountUser =
        await _getUserUseCase(GetUserParams(uid: event.uid));

    _etiherAccountUser.fold((error) {
      emit(state.copyWith(
          userState: ProfileAccountUserStatus.error, error: error.message));
    }, (user) {
      emit(state.copyWith(
          userState: ProfileAccountUserStatus.loaded, user: user));
    });
  }

  Future<void> _updateCoverPhoto(
      _UpdateCoverPhoto event, Emitter<ProfileAccountState> emit) async {
    //emit(state.copyWith(userState: ProfileAccountUserStatus.loading));

    // print("COVER PHOTO $coverPhoto");
    final Either<Failure, String> _etiher = await _updateCoverPhotoUseCase(
        UpdateCoverPhotoParams(file: event.file, uid: event.uid));

    _etiher.fold((error) {
      emit(state.copyWith(
        action: ProfileAccountListenableAction.coverPhotoUpdateFailed,
      ));
    }, (coverPhoto) {
      final user = event.userBloc.state.user.copyWith(coverPhoto: coverPhoto);
      event.userBloc.add(UserEvent.setUser(user));

      emit(state.copyWith(
        user: user,
        action: ProfileAccountListenableAction.coverPhotoUpdated,
      ));
    });
  }

  Future<void> _updateProfilePhoto(
      _UpdateProfilePhoto event, Emitter<ProfileAccountState> emit) async {
    //emit(state.copyWith(userState: ProfileAccountUserStatus.loading));
    final Either<Failure, String> _etiher = await _updateProfilePhotoUseCase(
        UpdateProfilePhotoParams(file: event.file, uid: event.uid));

    _etiher.fold((error) {
      emit(state.copyWith(
        action: ProfileAccountListenableAction.profilePhotoUpdateFailed,
      ));
    }, (profilePic) {
      final user = event.userBloc.state.user.copyWith(profilePic: profilePic);
      event.userBloc.add(UserEvent.setUser(user));

      emit(state.copyWith(
        user: user,
        action: ProfileAccountListenableAction.profilePhotoUpdated,
      ));
    });
  }

  Future<void> _getFollowingStatus(
      _GetFollowingStatus event, Emitter<ProfileAccountState> emit) async {
    emit(state.copyWith(userState: ProfileAccountUserStatus.loading));
    final Either<Failure, bool> _etiherAccountUser =
        await _getFollowingStatusUseCase(GetFollowingStatusParams(event.uid));

    _etiherAccountUser.fold((error) {
      emit(state.copyWith(
          userState: ProfileAccountUserStatus.error, error: error.message));
    }, (isFollowing) {
      emit(state.copyWith(
          userState: ProfileAccountUserStatus.loaded,
          isFollowing: isFollowing));
    });
  }

  Future<void> _updateProfile(
      _UpdateProfile event, Emitter<ProfileAccountState> emit) async {
    emit(state.copyWith(
        action: ProfileAccountListenableAction.profileUpdateLoading));
    final Either<Failure, bool> _etiherAccountUser =
        await _updateProfileUseCase(
            UpdateProfileParams(uid: event.uid, profile: event.profile));

    _etiherAccountUser.fold((error) {
      emit(state.copyWith(
          action: ProfileAccountListenableAction.profileUpdateError));
    }, (success) {
      if (!success) {
        emit(state.copyWith(
            action: ProfileAccountListenableAction.profileUpdateError));
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
        action: ProfileAccountListenableAction.profileUpdateSuccess,
      ));
    });
  }

  Future<void> _getReactions(
      _GetReactions event, Emitter<ProfileAccountState> emit) async {
    emit(state.copyWith(userState: ProfileAccountUserStatus.loading));
    final Either<Failure, int> _etiherAccountUser =
        await _getProfileReactionsUseCase(
            GetProfileReactionsParams(uid: event.uid));

    _etiherAccountUser.fold((error) {
      emit(state.copyWith(
          userState: ProfileAccountUserStatus.error, error: error.message));
    }, (reactions) {
      emit(state.copyWith(
          userState: ProfileAccountUserStatus.loaded, reactions: reactions));
    });
  }

  Future<void> _getFollowingList(
      _GetFollowingList event, Emitter<ProfileAccountState> emit) async {
    emit(state.copyWith(userState: ProfileAccountUserStatus.loading));
    final Either<Failure, List<UserModel>> _etiherAccountUser =
        await _getProfileFollowersListUseCase(
            GetProfileFollowersListParams(event.uid));

    _etiherAccountUser.fold((error) {
      emit(state.copyWith(
          userState: ProfileAccountUserStatus.error, error: error.message));
    }, (followersList) {
      emit(state.copyWith(
          userState: ProfileAccountUserStatus.loaded,
          followersList: followersList));
    });
  }

  Future<void> _getFollowers(
      _GetFollowers event, Emitter<ProfileAccountState> emit) async {
    emit(state.copyWith(followerState: ProfileAccountFollowersStatus.loading));
    final Either<Failure, int> _etiherFollowers =
        await _getFollowersUseCase(GetAccountFollowersParams(event.uid));

    _etiherFollowers.fold((error) {
      emit(state.copyWith(
          followerState: ProfileAccountFollowersStatus.error,
          error: error.message));
    }, (followers) {
      emit(state.copyWith(
          followerState: ProfileAccountFollowersStatus.loaded,
          followers: followers));
    });
  }

  Future<void> _getFollowing(
      _GetFollowing event, Emitter<ProfileAccountState> emit) async {
    emit(state.copyWith(followingState: ProfileAccountFollowingStatus.loading));
    final Either<Failure, int> _etiherFollowing =
        await _getFollowingUseCase(GetFollowingParams(event.uid));

    _etiherFollowing.fold((error) {
      emit(state.copyWith(
          followingState: ProfileAccountFollowingStatus.error,
          error: error.message));
    }, (following) {
      emit(state.copyWith(
          followingState: ProfileAccountFollowingStatus.loaded,
          following: following));
    });
  }

  Future<void> _getPosts(
      _GetPosts event, Emitter<ProfileAccountState> emit) async {
    emit(state.copyWith(postState: ProfileAccountPostStatus.loading));
    final Either<Failure, List<Post>> _etiherPosts =
        await _getPostsUseCase(GetUserPostsParams(event.uid));

    _etiherPosts.fold((error) {
      emit(state.copyWith(
          postState: ProfileAccountPostStatus.error, error: error.message));
    }, (posts) {
      final _posts =
          posts.map((post) => post.copyWith(user: state.user)).toList();
      emit(state.copyWith(
          postState: ProfileAccountPostStatus.loaded, posts: _posts));
    });
  }

  Future<void> _getSnaps(
      _GetSnaps event, Emitter<ProfileAccountState> emit) async {
    log('snaps');
    emit(state.copyWith(snapState: ProfileAccountSnapStatus.loading));
    final Either<Failure, List<Snap>> _etiherSnaps =
        await _getSnapsUseCase(GetUserSnapsParams(uid: event.uid));

    _etiherSnaps.fold((error) {
      log(error.message);
      emit(state.copyWith(
          snapState: ProfileAccountSnapStatus.error, error: error.message));
    }, (snaps) {
      print(snaps);
      final _snaps =
          snaps.map((snap) => snap.copyWith(user: state.user)).toList();
      emit(state.copyWith(
          snapState: ProfileAccountSnapStatus.loaded, snaps: _snaps));
    });
  }
}
