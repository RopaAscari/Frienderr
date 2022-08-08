// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'profile_account_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ProfileAccountStateTearOff {
  const _$ProfileAccountStateTearOff();

  _ProfileAccountState call(
      {required UserModel user,
      int following = 0,
      int followers = 0,
      int reactions = 0,
      String? error = null,
      List<Post> posts = const [],
      List<Snap> snaps = const [],
      bool isFollowing = false,
      List<UserModel> followersList = const [],
      ProfileAccountPostStatus postState = ProfileAccountPostStatus.idle,
      ProfileAccountSnapStatus snapState = ProfileAccountSnapStatus.idle,
      ProfileAccountUserStatus userState = ProfileAccountUserStatus.idle,
      ProfileAccountFollowersStatus followerState =
          ProfileAccountFollowersStatus.idle,
      ProfileAccountFollowingStatus followingState =
          ProfileAccountFollowingStatus.idle,
      ProfileAccountListenableAction action =
          ProfileAccountListenableAction.idle}) {
    return _ProfileAccountState(
      user: user,
      following: following,
      followers: followers,
      reactions: reactions,
      error: error,
      posts: posts,
      snaps: snaps,
      isFollowing: isFollowing,
      followersList: followersList,
      postState: postState,
      snapState: snapState,
      userState: userState,
      followerState: followerState,
      followingState: followingState,
      action: action,
    );
  }
}

/// @nodoc
const $ProfileAccountState = _$ProfileAccountStateTearOff();

/// @nodoc
mixin _$ProfileAccountState {
  UserModel get user => throw _privateConstructorUsedError;
  int get following => throw _privateConstructorUsedError;
  int get followers => throw _privateConstructorUsedError;
  int get reactions => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  List<Post> get posts => throw _privateConstructorUsedError;
  List<Snap> get snaps => throw _privateConstructorUsedError;
  bool get isFollowing => throw _privateConstructorUsedError;
  List<UserModel> get followersList => throw _privateConstructorUsedError;
  ProfileAccountPostStatus get postState => throw _privateConstructorUsedError;
  ProfileAccountSnapStatus get snapState => throw _privateConstructorUsedError;
  ProfileAccountUserStatus get userState => throw _privateConstructorUsedError;
  ProfileAccountFollowersStatus get followerState =>
      throw _privateConstructorUsedError;
  ProfileAccountFollowingStatus get followingState =>
      throw _privateConstructorUsedError;
  ProfileAccountListenableAction get action =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProfileAccountStateCopyWith<ProfileAccountState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileAccountStateCopyWith<$Res> {
  factory $ProfileAccountStateCopyWith(
          ProfileAccountState value, $Res Function(ProfileAccountState) then) =
      _$ProfileAccountStateCopyWithImpl<$Res>;
  $Res call(
      {UserModel user,
      int following,
      int followers,
      int reactions,
      String? error,
      List<Post> posts,
      List<Snap> snaps,
      bool isFollowing,
      List<UserModel> followersList,
      ProfileAccountPostStatus postState,
      ProfileAccountSnapStatus snapState,
      ProfileAccountUserStatus userState,
      ProfileAccountFollowersStatus followerState,
      ProfileAccountFollowingStatus followingState,
      ProfileAccountListenableAction action});

  $UserModelCopyWith<$Res> get user;
}

/// @nodoc
class _$ProfileAccountStateCopyWithImpl<$Res>
    implements $ProfileAccountStateCopyWith<$Res> {
  _$ProfileAccountStateCopyWithImpl(this._value, this._then);

  final ProfileAccountState _value;
  // ignore: unused_field
  final $Res Function(ProfileAccountState) _then;

  @override
  $Res call({
    Object? user = freezed,
    Object? following = freezed,
    Object? followers = freezed,
    Object? reactions = freezed,
    Object? error = freezed,
    Object? posts = freezed,
    Object? snaps = freezed,
    Object? isFollowing = freezed,
    Object? followersList = freezed,
    Object? postState = freezed,
    Object? snapState = freezed,
    Object? userState = freezed,
    Object? followerState = freezed,
    Object? followingState = freezed,
    Object? action = freezed,
  }) {
    return _then(_value.copyWith(
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel,
      following: following == freezed
          ? _value.following
          : following // ignore: cast_nullable_to_non_nullable
              as int,
      followers: followers == freezed
          ? _value.followers
          : followers // ignore: cast_nullable_to_non_nullable
              as int,
      reactions: reactions == freezed
          ? _value.reactions
          : reactions // ignore: cast_nullable_to_non_nullable
              as int,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      posts: posts == freezed
          ? _value.posts
          : posts // ignore: cast_nullable_to_non_nullable
              as List<Post>,
      snaps: snaps == freezed
          ? _value.snaps
          : snaps // ignore: cast_nullable_to_non_nullable
              as List<Snap>,
      isFollowing: isFollowing == freezed
          ? _value.isFollowing
          : isFollowing // ignore: cast_nullable_to_non_nullable
              as bool,
      followersList: followersList == freezed
          ? _value.followersList
          : followersList // ignore: cast_nullable_to_non_nullable
              as List<UserModel>,
      postState: postState == freezed
          ? _value.postState
          : postState // ignore: cast_nullable_to_non_nullable
              as ProfileAccountPostStatus,
      snapState: snapState == freezed
          ? _value.snapState
          : snapState // ignore: cast_nullable_to_non_nullable
              as ProfileAccountSnapStatus,
      userState: userState == freezed
          ? _value.userState
          : userState // ignore: cast_nullable_to_non_nullable
              as ProfileAccountUserStatus,
      followerState: followerState == freezed
          ? _value.followerState
          : followerState // ignore: cast_nullable_to_non_nullable
              as ProfileAccountFollowersStatus,
      followingState: followingState == freezed
          ? _value.followingState
          : followingState // ignore: cast_nullable_to_non_nullable
              as ProfileAccountFollowingStatus,
      action: action == freezed
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as ProfileAccountListenableAction,
    ));
  }

  @override
  $UserModelCopyWith<$Res> get user {
    return $UserModelCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc
abstract class _$ProfileAccountStateCopyWith<$Res>
    implements $ProfileAccountStateCopyWith<$Res> {
  factory _$ProfileAccountStateCopyWith(_ProfileAccountState value,
          $Res Function(_ProfileAccountState) then) =
      __$ProfileAccountStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {UserModel user,
      int following,
      int followers,
      int reactions,
      String? error,
      List<Post> posts,
      List<Snap> snaps,
      bool isFollowing,
      List<UserModel> followersList,
      ProfileAccountPostStatus postState,
      ProfileAccountSnapStatus snapState,
      ProfileAccountUserStatus userState,
      ProfileAccountFollowersStatus followerState,
      ProfileAccountFollowingStatus followingState,
      ProfileAccountListenableAction action});

  @override
  $UserModelCopyWith<$Res> get user;
}

/// @nodoc
class __$ProfileAccountStateCopyWithImpl<$Res>
    extends _$ProfileAccountStateCopyWithImpl<$Res>
    implements _$ProfileAccountStateCopyWith<$Res> {
  __$ProfileAccountStateCopyWithImpl(
      _ProfileAccountState _value, $Res Function(_ProfileAccountState) _then)
      : super(_value, (v) => _then(v as _ProfileAccountState));

  @override
  _ProfileAccountState get _value => super._value as _ProfileAccountState;

  @override
  $Res call({
    Object? user = freezed,
    Object? following = freezed,
    Object? followers = freezed,
    Object? reactions = freezed,
    Object? error = freezed,
    Object? posts = freezed,
    Object? snaps = freezed,
    Object? isFollowing = freezed,
    Object? followersList = freezed,
    Object? postState = freezed,
    Object? snapState = freezed,
    Object? userState = freezed,
    Object? followerState = freezed,
    Object? followingState = freezed,
    Object? action = freezed,
  }) {
    return _then(_ProfileAccountState(
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel,
      following: following == freezed
          ? _value.following
          : following // ignore: cast_nullable_to_non_nullable
              as int,
      followers: followers == freezed
          ? _value.followers
          : followers // ignore: cast_nullable_to_non_nullable
              as int,
      reactions: reactions == freezed
          ? _value.reactions
          : reactions // ignore: cast_nullable_to_non_nullable
              as int,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      posts: posts == freezed
          ? _value.posts
          : posts // ignore: cast_nullable_to_non_nullable
              as List<Post>,
      snaps: snaps == freezed
          ? _value.snaps
          : snaps // ignore: cast_nullable_to_non_nullable
              as List<Snap>,
      isFollowing: isFollowing == freezed
          ? _value.isFollowing
          : isFollowing // ignore: cast_nullable_to_non_nullable
              as bool,
      followersList: followersList == freezed
          ? _value.followersList
          : followersList // ignore: cast_nullable_to_non_nullable
              as List<UserModel>,
      postState: postState == freezed
          ? _value.postState
          : postState // ignore: cast_nullable_to_non_nullable
              as ProfileAccountPostStatus,
      snapState: snapState == freezed
          ? _value.snapState
          : snapState // ignore: cast_nullable_to_non_nullable
              as ProfileAccountSnapStatus,
      userState: userState == freezed
          ? _value.userState
          : userState // ignore: cast_nullable_to_non_nullable
              as ProfileAccountUserStatus,
      followerState: followerState == freezed
          ? _value.followerState
          : followerState // ignore: cast_nullable_to_non_nullable
              as ProfileAccountFollowersStatus,
      followingState: followingState == freezed
          ? _value.followingState
          : followingState // ignore: cast_nullable_to_non_nullable
              as ProfileAccountFollowingStatus,
      action: action == freezed
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as ProfileAccountListenableAction,
    ));
  }
}

/// @nodoc

class _$_ProfileAccountState implements _ProfileAccountState {
  const _$_ProfileAccountState(
      {required this.user,
      this.following = 0,
      this.followers = 0,
      this.reactions = 0,
      this.error = null,
      this.posts = const [],
      this.snaps = const [],
      this.isFollowing = false,
      this.followersList = const [],
      this.postState = ProfileAccountPostStatus.idle,
      this.snapState = ProfileAccountSnapStatus.idle,
      this.userState = ProfileAccountUserStatus.idle,
      this.followerState = ProfileAccountFollowersStatus.idle,
      this.followingState = ProfileAccountFollowingStatus.idle,
      this.action = ProfileAccountListenableAction.idle});

  @override
  final UserModel user;
  @JsonKey()
  @override
  final int following;
  @JsonKey()
  @override
  final int followers;
  @JsonKey()
  @override
  final int reactions;
  @JsonKey()
  @override
  final String? error;
  @JsonKey()
  @override
  final List<Post> posts;
  @JsonKey()
  @override
  final List<Snap> snaps;
  @JsonKey()
  @override
  final bool isFollowing;
  @JsonKey()
  @override
  final List<UserModel> followersList;
  @JsonKey()
  @override
  final ProfileAccountPostStatus postState;
  @JsonKey()
  @override
  final ProfileAccountSnapStatus snapState;
  @JsonKey()
  @override
  final ProfileAccountUserStatus userState;
  @JsonKey()
  @override
  final ProfileAccountFollowersStatus followerState;
  @JsonKey()
  @override
  final ProfileAccountFollowingStatus followingState;
  @JsonKey()
  @override
  final ProfileAccountListenableAction action;

  @override
  String toString() {
    return 'ProfileAccountState(user: $user, following: $following, followers: $followers, reactions: $reactions, error: $error, posts: $posts, snaps: $snaps, isFollowing: $isFollowing, followersList: $followersList, postState: $postState, snapState: $snapState, userState: $userState, followerState: $followerState, followingState: $followingState, action: $action)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProfileAccountState &&
            const DeepCollectionEquality().equals(other.user, user) &&
            const DeepCollectionEquality().equals(other.following, following) &&
            const DeepCollectionEquality().equals(other.followers, followers) &&
            const DeepCollectionEquality().equals(other.reactions, reactions) &&
            const DeepCollectionEquality().equals(other.error, error) &&
            const DeepCollectionEquality().equals(other.posts, posts) &&
            const DeepCollectionEquality().equals(other.snaps, snaps) &&
            const DeepCollectionEquality()
                .equals(other.isFollowing, isFollowing) &&
            const DeepCollectionEquality()
                .equals(other.followersList, followersList) &&
            const DeepCollectionEquality().equals(other.postState, postState) &&
            const DeepCollectionEquality().equals(other.snapState, snapState) &&
            const DeepCollectionEquality().equals(other.userState, userState) &&
            const DeepCollectionEquality()
                .equals(other.followerState, followerState) &&
            const DeepCollectionEquality()
                .equals(other.followingState, followingState) &&
            const DeepCollectionEquality().equals(other.action, action));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(user),
      const DeepCollectionEquality().hash(following),
      const DeepCollectionEquality().hash(followers),
      const DeepCollectionEquality().hash(reactions),
      const DeepCollectionEquality().hash(error),
      const DeepCollectionEquality().hash(posts),
      const DeepCollectionEquality().hash(snaps),
      const DeepCollectionEquality().hash(isFollowing),
      const DeepCollectionEquality().hash(followersList),
      const DeepCollectionEquality().hash(postState),
      const DeepCollectionEquality().hash(snapState),
      const DeepCollectionEquality().hash(userState),
      const DeepCollectionEquality().hash(followerState),
      const DeepCollectionEquality().hash(followingState),
      const DeepCollectionEquality().hash(action));

  @JsonKey(ignore: true)
  @override
  _$ProfileAccountStateCopyWith<_ProfileAccountState> get copyWith =>
      __$ProfileAccountStateCopyWithImpl<_ProfileAccountState>(
          this, _$identity);
}

abstract class _ProfileAccountState implements ProfileAccountState {
  const factory _ProfileAccountState(
      {required UserModel user,
      int following,
      int followers,
      int reactions,
      String? error,
      List<Post> posts,
      List<Snap> snaps,
      bool isFollowing,
      List<UserModel> followersList,
      ProfileAccountPostStatus postState,
      ProfileAccountSnapStatus snapState,
      ProfileAccountUserStatus userState,
      ProfileAccountFollowersStatus followerState,
      ProfileAccountFollowingStatus followingState,
      ProfileAccountListenableAction action}) = _$_ProfileAccountState;

  @override
  UserModel get user;
  @override
  int get following;
  @override
  int get followers;
  @override
  int get reactions;
  @override
  String? get error;
  @override
  List<Post> get posts;
  @override
  List<Snap> get snaps;
  @override
  bool get isFollowing;
  @override
  List<UserModel> get followersList;
  @override
  ProfileAccountPostStatus get postState;
  @override
  ProfileAccountSnapStatus get snapState;
  @override
  ProfileAccountUserStatus get userState;
  @override
  ProfileAccountFollowersStatus get followerState;
  @override
  ProfileAccountFollowingStatus get followingState;
  @override
  ProfileAccountListenableAction get action;
  @override
  @JsonKey(ignore: true)
  _$ProfileAccountStateCopyWith<_ProfileAccountState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$ProfileAccountEventTearOff {
  const _$ProfileAccountEventTearOff();

  _GetUser getUser({required String uid}) {
    return _GetUser(
      uid: uid,
    );
  }

  _GetFollowers getFollowers({required String uid}) {
    return _GetFollowers(
      uid: uid,
    );
  }

  _GetFollowing getFollowing({required String uid}) {
    return _GetFollowing(
      uid: uid,
    );
  }

  _GetPosts getPosts({required String uid}) {
    return _GetPosts(
      uid: uid,
    );
  }

  _GetSnaps getSnaps({required String uid}) {
    return _GetSnaps(
      uid: uid,
    );
  }

  _GetReactions getReactions({required String uid}) {
    return _GetReactions(
      uid: uid,
    );
  }

  _GetFollowingList getFollowingList({required String uid}) {
    return _GetFollowingList(
      uid: uid,
    );
  }

  _GetFollowingStatus getFollowingStatus({required String uid}) {
    return _GetFollowingStatus(
      uid: uid,
    );
  }

  _UpdateProfilePhoto updateProfilePhoto(
      {required File file, required String uid, required UserBloc userBloc}) {
    return _UpdateProfilePhoto(
      file: file,
      uid: uid,
      userBloc: userBloc,
    );
  }

  _UpdateCoverPhoto updateCoverPhoto(
      {required File file, required String uid, required UserBloc userBloc}) {
    return _UpdateCoverPhoto(
      file: file,
      uid: uid,
      userBloc: userBloc,
    );
  }

  _UpdateProfile updateProfile(
      {required String uid,
      required UserBloc userBloc,
      required UpdateProfile profile}) {
    return _UpdateProfile(
      uid: uid,
      userBloc: userBloc,
      profile: profile,
    );
  }
}

/// @nodoc
const $ProfileAccountEvent = _$ProfileAccountEventTearOff();

/// @nodoc
mixin _$ProfileAccountEvent {
  String get uid => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String uid) getUser,
    required TResult Function(String uid) getFollowers,
    required TResult Function(String uid) getFollowing,
    required TResult Function(String uid) getPosts,
    required TResult Function(String uid) getSnaps,
    required TResult Function(String uid) getReactions,
    required TResult Function(String uid) getFollowingList,
    required TResult Function(String uid) getFollowingStatus,
    required TResult Function(File file, String uid, UserBloc userBloc)
        updateProfilePhoto,
    required TResult Function(File file, String uid, UserBloc userBloc)
        updateCoverPhoto,
    required TResult Function(
            String uid, UserBloc userBloc, UpdateProfile profile)
        updateProfile,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String uid)? getUser,
    TResult Function(String uid)? getFollowers,
    TResult Function(String uid)? getFollowing,
    TResult Function(String uid)? getPosts,
    TResult Function(String uid)? getSnaps,
    TResult Function(String uid)? getReactions,
    TResult Function(String uid)? getFollowingList,
    TResult Function(String uid)? getFollowingStatus,
    TResult Function(File file, String uid, UserBloc userBloc)?
        updateProfilePhoto,
    TResult Function(File file, String uid, UserBloc userBloc)?
        updateCoverPhoto,
    TResult Function(String uid, UserBloc userBloc, UpdateProfile profile)?
        updateProfile,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String uid)? getUser,
    TResult Function(String uid)? getFollowers,
    TResult Function(String uid)? getFollowing,
    TResult Function(String uid)? getPosts,
    TResult Function(String uid)? getSnaps,
    TResult Function(String uid)? getReactions,
    TResult Function(String uid)? getFollowingList,
    TResult Function(String uid)? getFollowingStatus,
    TResult Function(File file, String uid, UserBloc userBloc)?
        updateProfilePhoto,
    TResult Function(File file, String uid, UserBloc userBloc)?
        updateCoverPhoto,
    TResult Function(String uid, UserBloc userBloc, UpdateProfile profile)?
        updateProfile,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetUser value) getUser,
    required TResult Function(_GetFollowers value) getFollowers,
    required TResult Function(_GetFollowing value) getFollowing,
    required TResult Function(_GetPosts value) getPosts,
    required TResult Function(_GetSnaps value) getSnaps,
    required TResult Function(_GetReactions value) getReactions,
    required TResult Function(_GetFollowingList value) getFollowingList,
    required TResult Function(_GetFollowingStatus value) getFollowingStatus,
    required TResult Function(_UpdateProfilePhoto value) updateProfilePhoto,
    required TResult Function(_UpdateCoverPhoto value) updateCoverPhoto,
    required TResult Function(_UpdateProfile value) updateProfile,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetUser value)? getUser,
    TResult Function(_GetFollowers value)? getFollowers,
    TResult Function(_GetFollowing value)? getFollowing,
    TResult Function(_GetPosts value)? getPosts,
    TResult Function(_GetSnaps value)? getSnaps,
    TResult Function(_GetReactions value)? getReactions,
    TResult Function(_GetFollowingList value)? getFollowingList,
    TResult Function(_GetFollowingStatus value)? getFollowingStatus,
    TResult Function(_UpdateProfilePhoto value)? updateProfilePhoto,
    TResult Function(_UpdateCoverPhoto value)? updateCoverPhoto,
    TResult Function(_UpdateProfile value)? updateProfile,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetUser value)? getUser,
    TResult Function(_GetFollowers value)? getFollowers,
    TResult Function(_GetFollowing value)? getFollowing,
    TResult Function(_GetPosts value)? getPosts,
    TResult Function(_GetSnaps value)? getSnaps,
    TResult Function(_GetReactions value)? getReactions,
    TResult Function(_GetFollowingList value)? getFollowingList,
    TResult Function(_GetFollowingStatus value)? getFollowingStatus,
    TResult Function(_UpdateProfilePhoto value)? updateProfilePhoto,
    TResult Function(_UpdateCoverPhoto value)? updateCoverPhoto,
    TResult Function(_UpdateProfile value)? updateProfile,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProfileAccountEventCopyWith<ProfileAccountEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileAccountEventCopyWith<$Res> {
  factory $ProfileAccountEventCopyWith(
          ProfileAccountEvent value, $Res Function(ProfileAccountEvent) then) =
      _$ProfileAccountEventCopyWithImpl<$Res>;
  $Res call({String uid});
}

/// @nodoc
class _$ProfileAccountEventCopyWithImpl<$Res>
    implements $ProfileAccountEventCopyWith<$Res> {
  _$ProfileAccountEventCopyWithImpl(this._value, this._then);

  final ProfileAccountEvent _value;
  // ignore: unused_field
  final $Res Function(ProfileAccountEvent) _then;

  @override
  $Res call({
    Object? uid = freezed,
  }) {
    return _then(_value.copyWith(
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$GetUserCopyWith<$Res>
    implements $ProfileAccountEventCopyWith<$Res> {
  factory _$GetUserCopyWith(_GetUser value, $Res Function(_GetUser) then) =
      __$GetUserCopyWithImpl<$Res>;
  @override
  $Res call({String uid});
}

/// @nodoc
class __$GetUserCopyWithImpl<$Res>
    extends _$ProfileAccountEventCopyWithImpl<$Res>
    implements _$GetUserCopyWith<$Res> {
  __$GetUserCopyWithImpl(_GetUser _value, $Res Function(_GetUser) _then)
      : super(_value, (v) => _then(v as _GetUser));

  @override
  _GetUser get _value => super._value as _GetUser;

  @override
  $Res call({
    Object? uid = freezed,
  }) {
    return _then(_GetUser(
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_GetUser implements _GetUser {
  const _$_GetUser({required this.uid});

  @override
  final String uid;

  @override
  String toString() {
    return 'ProfileAccountEvent.getUser(uid: $uid)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GetUser &&
            const DeepCollectionEquality().equals(other.uid, uid));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(uid));

  @JsonKey(ignore: true)
  @override
  _$GetUserCopyWith<_GetUser> get copyWith =>
      __$GetUserCopyWithImpl<_GetUser>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String uid) getUser,
    required TResult Function(String uid) getFollowers,
    required TResult Function(String uid) getFollowing,
    required TResult Function(String uid) getPosts,
    required TResult Function(String uid) getSnaps,
    required TResult Function(String uid) getReactions,
    required TResult Function(String uid) getFollowingList,
    required TResult Function(String uid) getFollowingStatus,
    required TResult Function(File file, String uid, UserBloc userBloc)
        updateProfilePhoto,
    required TResult Function(File file, String uid, UserBloc userBloc)
        updateCoverPhoto,
    required TResult Function(
            String uid, UserBloc userBloc, UpdateProfile profile)
        updateProfile,
  }) {
    return getUser(uid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String uid)? getUser,
    TResult Function(String uid)? getFollowers,
    TResult Function(String uid)? getFollowing,
    TResult Function(String uid)? getPosts,
    TResult Function(String uid)? getSnaps,
    TResult Function(String uid)? getReactions,
    TResult Function(String uid)? getFollowingList,
    TResult Function(String uid)? getFollowingStatus,
    TResult Function(File file, String uid, UserBloc userBloc)?
        updateProfilePhoto,
    TResult Function(File file, String uid, UserBloc userBloc)?
        updateCoverPhoto,
    TResult Function(String uid, UserBloc userBloc, UpdateProfile profile)?
        updateProfile,
  }) {
    return getUser?.call(uid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String uid)? getUser,
    TResult Function(String uid)? getFollowers,
    TResult Function(String uid)? getFollowing,
    TResult Function(String uid)? getPosts,
    TResult Function(String uid)? getSnaps,
    TResult Function(String uid)? getReactions,
    TResult Function(String uid)? getFollowingList,
    TResult Function(String uid)? getFollowingStatus,
    TResult Function(File file, String uid, UserBloc userBloc)?
        updateProfilePhoto,
    TResult Function(File file, String uid, UserBloc userBloc)?
        updateCoverPhoto,
    TResult Function(String uid, UserBloc userBloc, UpdateProfile profile)?
        updateProfile,
    required TResult orElse(),
  }) {
    if (getUser != null) {
      return getUser(uid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetUser value) getUser,
    required TResult Function(_GetFollowers value) getFollowers,
    required TResult Function(_GetFollowing value) getFollowing,
    required TResult Function(_GetPosts value) getPosts,
    required TResult Function(_GetSnaps value) getSnaps,
    required TResult Function(_GetReactions value) getReactions,
    required TResult Function(_GetFollowingList value) getFollowingList,
    required TResult Function(_GetFollowingStatus value) getFollowingStatus,
    required TResult Function(_UpdateProfilePhoto value) updateProfilePhoto,
    required TResult Function(_UpdateCoverPhoto value) updateCoverPhoto,
    required TResult Function(_UpdateProfile value) updateProfile,
  }) {
    return getUser(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetUser value)? getUser,
    TResult Function(_GetFollowers value)? getFollowers,
    TResult Function(_GetFollowing value)? getFollowing,
    TResult Function(_GetPosts value)? getPosts,
    TResult Function(_GetSnaps value)? getSnaps,
    TResult Function(_GetReactions value)? getReactions,
    TResult Function(_GetFollowingList value)? getFollowingList,
    TResult Function(_GetFollowingStatus value)? getFollowingStatus,
    TResult Function(_UpdateProfilePhoto value)? updateProfilePhoto,
    TResult Function(_UpdateCoverPhoto value)? updateCoverPhoto,
    TResult Function(_UpdateProfile value)? updateProfile,
  }) {
    return getUser?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetUser value)? getUser,
    TResult Function(_GetFollowers value)? getFollowers,
    TResult Function(_GetFollowing value)? getFollowing,
    TResult Function(_GetPosts value)? getPosts,
    TResult Function(_GetSnaps value)? getSnaps,
    TResult Function(_GetReactions value)? getReactions,
    TResult Function(_GetFollowingList value)? getFollowingList,
    TResult Function(_GetFollowingStatus value)? getFollowingStatus,
    TResult Function(_UpdateProfilePhoto value)? updateProfilePhoto,
    TResult Function(_UpdateCoverPhoto value)? updateCoverPhoto,
    TResult Function(_UpdateProfile value)? updateProfile,
    required TResult orElse(),
  }) {
    if (getUser != null) {
      return getUser(this);
    }
    return orElse();
  }
}

abstract class _GetUser implements ProfileAccountEvent {
  const factory _GetUser({required String uid}) = _$_GetUser;

  @override
  String get uid;
  @override
  @JsonKey(ignore: true)
  _$GetUserCopyWith<_GetUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$GetFollowersCopyWith<$Res>
    implements $ProfileAccountEventCopyWith<$Res> {
  factory _$GetFollowersCopyWith(
          _GetFollowers value, $Res Function(_GetFollowers) then) =
      __$GetFollowersCopyWithImpl<$Res>;
  @override
  $Res call({String uid});
}

/// @nodoc
class __$GetFollowersCopyWithImpl<$Res>
    extends _$ProfileAccountEventCopyWithImpl<$Res>
    implements _$GetFollowersCopyWith<$Res> {
  __$GetFollowersCopyWithImpl(
      _GetFollowers _value, $Res Function(_GetFollowers) _then)
      : super(_value, (v) => _then(v as _GetFollowers));

  @override
  _GetFollowers get _value => super._value as _GetFollowers;

  @override
  $Res call({
    Object? uid = freezed,
  }) {
    return _then(_GetFollowers(
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_GetFollowers implements _GetFollowers {
  const _$_GetFollowers({required this.uid});

  @override
  final String uid;

  @override
  String toString() {
    return 'ProfileAccountEvent.getFollowers(uid: $uid)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GetFollowers &&
            const DeepCollectionEquality().equals(other.uid, uid));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(uid));

  @JsonKey(ignore: true)
  @override
  _$GetFollowersCopyWith<_GetFollowers> get copyWith =>
      __$GetFollowersCopyWithImpl<_GetFollowers>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String uid) getUser,
    required TResult Function(String uid) getFollowers,
    required TResult Function(String uid) getFollowing,
    required TResult Function(String uid) getPosts,
    required TResult Function(String uid) getSnaps,
    required TResult Function(String uid) getReactions,
    required TResult Function(String uid) getFollowingList,
    required TResult Function(String uid) getFollowingStatus,
    required TResult Function(File file, String uid, UserBloc userBloc)
        updateProfilePhoto,
    required TResult Function(File file, String uid, UserBloc userBloc)
        updateCoverPhoto,
    required TResult Function(
            String uid, UserBloc userBloc, UpdateProfile profile)
        updateProfile,
  }) {
    return getFollowers(uid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String uid)? getUser,
    TResult Function(String uid)? getFollowers,
    TResult Function(String uid)? getFollowing,
    TResult Function(String uid)? getPosts,
    TResult Function(String uid)? getSnaps,
    TResult Function(String uid)? getReactions,
    TResult Function(String uid)? getFollowingList,
    TResult Function(String uid)? getFollowingStatus,
    TResult Function(File file, String uid, UserBloc userBloc)?
        updateProfilePhoto,
    TResult Function(File file, String uid, UserBloc userBloc)?
        updateCoverPhoto,
    TResult Function(String uid, UserBloc userBloc, UpdateProfile profile)?
        updateProfile,
  }) {
    return getFollowers?.call(uid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String uid)? getUser,
    TResult Function(String uid)? getFollowers,
    TResult Function(String uid)? getFollowing,
    TResult Function(String uid)? getPosts,
    TResult Function(String uid)? getSnaps,
    TResult Function(String uid)? getReactions,
    TResult Function(String uid)? getFollowingList,
    TResult Function(String uid)? getFollowingStatus,
    TResult Function(File file, String uid, UserBloc userBloc)?
        updateProfilePhoto,
    TResult Function(File file, String uid, UserBloc userBloc)?
        updateCoverPhoto,
    TResult Function(String uid, UserBloc userBloc, UpdateProfile profile)?
        updateProfile,
    required TResult orElse(),
  }) {
    if (getFollowers != null) {
      return getFollowers(uid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetUser value) getUser,
    required TResult Function(_GetFollowers value) getFollowers,
    required TResult Function(_GetFollowing value) getFollowing,
    required TResult Function(_GetPosts value) getPosts,
    required TResult Function(_GetSnaps value) getSnaps,
    required TResult Function(_GetReactions value) getReactions,
    required TResult Function(_GetFollowingList value) getFollowingList,
    required TResult Function(_GetFollowingStatus value) getFollowingStatus,
    required TResult Function(_UpdateProfilePhoto value) updateProfilePhoto,
    required TResult Function(_UpdateCoverPhoto value) updateCoverPhoto,
    required TResult Function(_UpdateProfile value) updateProfile,
  }) {
    return getFollowers(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetUser value)? getUser,
    TResult Function(_GetFollowers value)? getFollowers,
    TResult Function(_GetFollowing value)? getFollowing,
    TResult Function(_GetPosts value)? getPosts,
    TResult Function(_GetSnaps value)? getSnaps,
    TResult Function(_GetReactions value)? getReactions,
    TResult Function(_GetFollowingList value)? getFollowingList,
    TResult Function(_GetFollowingStatus value)? getFollowingStatus,
    TResult Function(_UpdateProfilePhoto value)? updateProfilePhoto,
    TResult Function(_UpdateCoverPhoto value)? updateCoverPhoto,
    TResult Function(_UpdateProfile value)? updateProfile,
  }) {
    return getFollowers?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetUser value)? getUser,
    TResult Function(_GetFollowers value)? getFollowers,
    TResult Function(_GetFollowing value)? getFollowing,
    TResult Function(_GetPosts value)? getPosts,
    TResult Function(_GetSnaps value)? getSnaps,
    TResult Function(_GetReactions value)? getReactions,
    TResult Function(_GetFollowingList value)? getFollowingList,
    TResult Function(_GetFollowingStatus value)? getFollowingStatus,
    TResult Function(_UpdateProfilePhoto value)? updateProfilePhoto,
    TResult Function(_UpdateCoverPhoto value)? updateCoverPhoto,
    TResult Function(_UpdateProfile value)? updateProfile,
    required TResult orElse(),
  }) {
    if (getFollowers != null) {
      return getFollowers(this);
    }
    return orElse();
  }
}

abstract class _GetFollowers implements ProfileAccountEvent {
  const factory _GetFollowers({required String uid}) = _$_GetFollowers;

  @override
  String get uid;
  @override
  @JsonKey(ignore: true)
  _$GetFollowersCopyWith<_GetFollowers> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$GetFollowingCopyWith<$Res>
    implements $ProfileAccountEventCopyWith<$Res> {
  factory _$GetFollowingCopyWith(
          _GetFollowing value, $Res Function(_GetFollowing) then) =
      __$GetFollowingCopyWithImpl<$Res>;
  @override
  $Res call({String uid});
}

/// @nodoc
class __$GetFollowingCopyWithImpl<$Res>
    extends _$ProfileAccountEventCopyWithImpl<$Res>
    implements _$GetFollowingCopyWith<$Res> {
  __$GetFollowingCopyWithImpl(
      _GetFollowing _value, $Res Function(_GetFollowing) _then)
      : super(_value, (v) => _then(v as _GetFollowing));

  @override
  _GetFollowing get _value => super._value as _GetFollowing;

  @override
  $Res call({
    Object? uid = freezed,
  }) {
    return _then(_GetFollowing(
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_GetFollowing implements _GetFollowing {
  const _$_GetFollowing({required this.uid});

  @override
  final String uid;

  @override
  String toString() {
    return 'ProfileAccountEvent.getFollowing(uid: $uid)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GetFollowing &&
            const DeepCollectionEquality().equals(other.uid, uid));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(uid));

  @JsonKey(ignore: true)
  @override
  _$GetFollowingCopyWith<_GetFollowing> get copyWith =>
      __$GetFollowingCopyWithImpl<_GetFollowing>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String uid) getUser,
    required TResult Function(String uid) getFollowers,
    required TResult Function(String uid) getFollowing,
    required TResult Function(String uid) getPosts,
    required TResult Function(String uid) getSnaps,
    required TResult Function(String uid) getReactions,
    required TResult Function(String uid) getFollowingList,
    required TResult Function(String uid) getFollowingStatus,
    required TResult Function(File file, String uid, UserBloc userBloc)
        updateProfilePhoto,
    required TResult Function(File file, String uid, UserBloc userBloc)
        updateCoverPhoto,
    required TResult Function(
            String uid, UserBloc userBloc, UpdateProfile profile)
        updateProfile,
  }) {
    return getFollowing(uid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String uid)? getUser,
    TResult Function(String uid)? getFollowers,
    TResult Function(String uid)? getFollowing,
    TResult Function(String uid)? getPosts,
    TResult Function(String uid)? getSnaps,
    TResult Function(String uid)? getReactions,
    TResult Function(String uid)? getFollowingList,
    TResult Function(String uid)? getFollowingStatus,
    TResult Function(File file, String uid, UserBloc userBloc)?
        updateProfilePhoto,
    TResult Function(File file, String uid, UserBloc userBloc)?
        updateCoverPhoto,
    TResult Function(String uid, UserBloc userBloc, UpdateProfile profile)?
        updateProfile,
  }) {
    return getFollowing?.call(uid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String uid)? getUser,
    TResult Function(String uid)? getFollowers,
    TResult Function(String uid)? getFollowing,
    TResult Function(String uid)? getPosts,
    TResult Function(String uid)? getSnaps,
    TResult Function(String uid)? getReactions,
    TResult Function(String uid)? getFollowingList,
    TResult Function(String uid)? getFollowingStatus,
    TResult Function(File file, String uid, UserBloc userBloc)?
        updateProfilePhoto,
    TResult Function(File file, String uid, UserBloc userBloc)?
        updateCoverPhoto,
    TResult Function(String uid, UserBloc userBloc, UpdateProfile profile)?
        updateProfile,
    required TResult orElse(),
  }) {
    if (getFollowing != null) {
      return getFollowing(uid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetUser value) getUser,
    required TResult Function(_GetFollowers value) getFollowers,
    required TResult Function(_GetFollowing value) getFollowing,
    required TResult Function(_GetPosts value) getPosts,
    required TResult Function(_GetSnaps value) getSnaps,
    required TResult Function(_GetReactions value) getReactions,
    required TResult Function(_GetFollowingList value) getFollowingList,
    required TResult Function(_GetFollowingStatus value) getFollowingStatus,
    required TResult Function(_UpdateProfilePhoto value) updateProfilePhoto,
    required TResult Function(_UpdateCoverPhoto value) updateCoverPhoto,
    required TResult Function(_UpdateProfile value) updateProfile,
  }) {
    return getFollowing(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetUser value)? getUser,
    TResult Function(_GetFollowers value)? getFollowers,
    TResult Function(_GetFollowing value)? getFollowing,
    TResult Function(_GetPosts value)? getPosts,
    TResult Function(_GetSnaps value)? getSnaps,
    TResult Function(_GetReactions value)? getReactions,
    TResult Function(_GetFollowingList value)? getFollowingList,
    TResult Function(_GetFollowingStatus value)? getFollowingStatus,
    TResult Function(_UpdateProfilePhoto value)? updateProfilePhoto,
    TResult Function(_UpdateCoverPhoto value)? updateCoverPhoto,
    TResult Function(_UpdateProfile value)? updateProfile,
  }) {
    return getFollowing?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetUser value)? getUser,
    TResult Function(_GetFollowers value)? getFollowers,
    TResult Function(_GetFollowing value)? getFollowing,
    TResult Function(_GetPosts value)? getPosts,
    TResult Function(_GetSnaps value)? getSnaps,
    TResult Function(_GetReactions value)? getReactions,
    TResult Function(_GetFollowingList value)? getFollowingList,
    TResult Function(_GetFollowingStatus value)? getFollowingStatus,
    TResult Function(_UpdateProfilePhoto value)? updateProfilePhoto,
    TResult Function(_UpdateCoverPhoto value)? updateCoverPhoto,
    TResult Function(_UpdateProfile value)? updateProfile,
    required TResult orElse(),
  }) {
    if (getFollowing != null) {
      return getFollowing(this);
    }
    return orElse();
  }
}

abstract class _GetFollowing implements ProfileAccountEvent {
  const factory _GetFollowing({required String uid}) = _$_GetFollowing;

  @override
  String get uid;
  @override
  @JsonKey(ignore: true)
  _$GetFollowingCopyWith<_GetFollowing> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$GetPostsCopyWith<$Res>
    implements $ProfileAccountEventCopyWith<$Res> {
  factory _$GetPostsCopyWith(_GetPosts value, $Res Function(_GetPosts) then) =
      __$GetPostsCopyWithImpl<$Res>;
  @override
  $Res call({String uid});
}

/// @nodoc
class __$GetPostsCopyWithImpl<$Res>
    extends _$ProfileAccountEventCopyWithImpl<$Res>
    implements _$GetPostsCopyWith<$Res> {
  __$GetPostsCopyWithImpl(_GetPosts _value, $Res Function(_GetPosts) _then)
      : super(_value, (v) => _then(v as _GetPosts));

  @override
  _GetPosts get _value => super._value as _GetPosts;

  @override
  $Res call({
    Object? uid = freezed,
  }) {
    return _then(_GetPosts(
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_GetPosts implements _GetPosts {
  const _$_GetPosts({required this.uid});

  @override
  final String uid;

  @override
  String toString() {
    return 'ProfileAccountEvent.getPosts(uid: $uid)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GetPosts &&
            const DeepCollectionEquality().equals(other.uid, uid));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(uid));

  @JsonKey(ignore: true)
  @override
  _$GetPostsCopyWith<_GetPosts> get copyWith =>
      __$GetPostsCopyWithImpl<_GetPosts>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String uid) getUser,
    required TResult Function(String uid) getFollowers,
    required TResult Function(String uid) getFollowing,
    required TResult Function(String uid) getPosts,
    required TResult Function(String uid) getSnaps,
    required TResult Function(String uid) getReactions,
    required TResult Function(String uid) getFollowingList,
    required TResult Function(String uid) getFollowingStatus,
    required TResult Function(File file, String uid, UserBloc userBloc)
        updateProfilePhoto,
    required TResult Function(File file, String uid, UserBloc userBloc)
        updateCoverPhoto,
    required TResult Function(
            String uid, UserBloc userBloc, UpdateProfile profile)
        updateProfile,
  }) {
    return getPosts(uid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String uid)? getUser,
    TResult Function(String uid)? getFollowers,
    TResult Function(String uid)? getFollowing,
    TResult Function(String uid)? getPosts,
    TResult Function(String uid)? getSnaps,
    TResult Function(String uid)? getReactions,
    TResult Function(String uid)? getFollowingList,
    TResult Function(String uid)? getFollowingStatus,
    TResult Function(File file, String uid, UserBloc userBloc)?
        updateProfilePhoto,
    TResult Function(File file, String uid, UserBloc userBloc)?
        updateCoverPhoto,
    TResult Function(String uid, UserBloc userBloc, UpdateProfile profile)?
        updateProfile,
  }) {
    return getPosts?.call(uid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String uid)? getUser,
    TResult Function(String uid)? getFollowers,
    TResult Function(String uid)? getFollowing,
    TResult Function(String uid)? getPosts,
    TResult Function(String uid)? getSnaps,
    TResult Function(String uid)? getReactions,
    TResult Function(String uid)? getFollowingList,
    TResult Function(String uid)? getFollowingStatus,
    TResult Function(File file, String uid, UserBloc userBloc)?
        updateProfilePhoto,
    TResult Function(File file, String uid, UserBloc userBloc)?
        updateCoverPhoto,
    TResult Function(String uid, UserBloc userBloc, UpdateProfile profile)?
        updateProfile,
    required TResult orElse(),
  }) {
    if (getPosts != null) {
      return getPosts(uid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetUser value) getUser,
    required TResult Function(_GetFollowers value) getFollowers,
    required TResult Function(_GetFollowing value) getFollowing,
    required TResult Function(_GetPosts value) getPosts,
    required TResult Function(_GetSnaps value) getSnaps,
    required TResult Function(_GetReactions value) getReactions,
    required TResult Function(_GetFollowingList value) getFollowingList,
    required TResult Function(_GetFollowingStatus value) getFollowingStatus,
    required TResult Function(_UpdateProfilePhoto value) updateProfilePhoto,
    required TResult Function(_UpdateCoverPhoto value) updateCoverPhoto,
    required TResult Function(_UpdateProfile value) updateProfile,
  }) {
    return getPosts(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetUser value)? getUser,
    TResult Function(_GetFollowers value)? getFollowers,
    TResult Function(_GetFollowing value)? getFollowing,
    TResult Function(_GetPosts value)? getPosts,
    TResult Function(_GetSnaps value)? getSnaps,
    TResult Function(_GetReactions value)? getReactions,
    TResult Function(_GetFollowingList value)? getFollowingList,
    TResult Function(_GetFollowingStatus value)? getFollowingStatus,
    TResult Function(_UpdateProfilePhoto value)? updateProfilePhoto,
    TResult Function(_UpdateCoverPhoto value)? updateCoverPhoto,
    TResult Function(_UpdateProfile value)? updateProfile,
  }) {
    return getPosts?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetUser value)? getUser,
    TResult Function(_GetFollowers value)? getFollowers,
    TResult Function(_GetFollowing value)? getFollowing,
    TResult Function(_GetPosts value)? getPosts,
    TResult Function(_GetSnaps value)? getSnaps,
    TResult Function(_GetReactions value)? getReactions,
    TResult Function(_GetFollowingList value)? getFollowingList,
    TResult Function(_GetFollowingStatus value)? getFollowingStatus,
    TResult Function(_UpdateProfilePhoto value)? updateProfilePhoto,
    TResult Function(_UpdateCoverPhoto value)? updateCoverPhoto,
    TResult Function(_UpdateProfile value)? updateProfile,
    required TResult orElse(),
  }) {
    if (getPosts != null) {
      return getPosts(this);
    }
    return orElse();
  }
}

abstract class _GetPosts implements ProfileAccountEvent {
  const factory _GetPosts({required String uid}) = _$_GetPosts;

  @override
  String get uid;
  @override
  @JsonKey(ignore: true)
  _$GetPostsCopyWith<_GetPosts> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$GetSnapsCopyWith<$Res>
    implements $ProfileAccountEventCopyWith<$Res> {
  factory _$GetSnapsCopyWith(_GetSnaps value, $Res Function(_GetSnaps) then) =
      __$GetSnapsCopyWithImpl<$Res>;
  @override
  $Res call({String uid});
}

/// @nodoc
class __$GetSnapsCopyWithImpl<$Res>
    extends _$ProfileAccountEventCopyWithImpl<$Res>
    implements _$GetSnapsCopyWith<$Res> {
  __$GetSnapsCopyWithImpl(_GetSnaps _value, $Res Function(_GetSnaps) _then)
      : super(_value, (v) => _then(v as _GetSnaps));

  @override
  _GetSnaps get _value => super._value as _GetSnaps;

  @override
  $Res call({
    Object? uid = freezed,
  }) {
    return _then(_GetSnaps(
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_GetSnaps implements _GetSnaps {
  const _$_GetSnaps({required this.uid});

  @override
  final String uid;

  @override
  String toString() {
    return 'ProfileAccountEvent.getSnaps(uid: $uid)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GetSnaps &&
            const DeepCollectionEquality().equals(other.uid, uid));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(uid));

  @JsonKey(ignore: true)
  @override
  _$GetSnapsCopyWith<_GetSnaps> get copyWith =>
      __$GetSnapsCopyWithImpl<_GetSnaps>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String uid) getUser,
    required TResult Function(String uid) getFollowers,
    required TResult Function(String uid) getFollowing,
    required TResult Function(String uid) getPosts,
    required TResult Function(String uid) getSnaps,
    required TResult Function(String uid) getReactions,
    required TResult Function(String uid) getFollowingList,
    required TResult Function(String uid) getFollowingStatus,
    required TResult Function(File file, String uid, UserBloc userBloc)
        updateProfilePhoto,
    required TResult Function(File file, String uid, UserBloc userBloc)
        updateCoverPhoto,
    required TResult Function(
            String uid, UserBloc userBloc, UpdateProfile profile)
        updateProfile,
  }) {
    return getSnaps(uid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String uid)? getUser,
    TResult Function(String uid)? getFollowers,
    TResult Function(String uid)? getFollowing,
    TResult Function(String uid)? getPosts,
    TResult Function(String uid)? getSnaps,
    TResult Function(String uid)? getReactions,
    TResult Function(String uid)? getFollowingList,
    TResult Function(String uid)? getFollowingStatus,
    TResult Function(File file, String uid, UserBloc userBloc)?
        updateProfilePhoto,
    TResult Function(File file, String uid, UserBloc userBloc)?
        updateCoverPhoto,
    TResult Function(String uid, UserBloc userBloc, UpdateProfile profile)?
        updateProfile,
  }) {
    return getSnaps?.call(uid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String uid)? getUser,
    TResult Function(String uid)? getFollowers,
    TResult Function(String uid)? getFollowing,
    TResult Function(String uid)? getPosts,
    TResult Function(String uid)? getSnaps,
    TResult Function(String uid)? getReactions,
    TResult Function(String uid)? getFollowingList,
    TResult Function(String uid)? getFollowingStatus,
    TResult Function(File file, String uid, UserBloc userBloc)?
        updateProfilePhoto,
    TResult Function(File file, String uid, UserBloc userBloc)?
        updateCoverPhoto,
    TResult Function(String uid, UserBloc userBloc, UpdateProfile profile)?
        updateProfile,
    required TResult orElse(),
  }) {
    if (getSnaps != null) {
      return getSnaps(uid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetUser value) getUser,
    required TResult Function(_GetFollowers value) getFollowers,
    required TResult Function(_GetFollowing value) getFollowing,
    required TResult Function(_GetPosts value) getPosts,
    required TResult Function(_GetSnaps value) getSnaps,
    required TResult Function(_GetReactions value) getReactions,
    required TResult Function(_GetFollowingList value) getFollowingList,
    required TResult Function(_GetFollowingStatus value) getFollowingStatus,
    required TResult Function(_UpdateProfilePhoto value) updateProfilePhoto,
    required TResult Function(_UpdateCoverPhoto value) updateCoverPhoto,
    required TResult Function(_UpdateProfile value) updateProfile,
  }) {
    return getSnaps(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetUser value)? getUser,
    TResult Function(_GetFollowers value)? getFollowers,
    TResult Function(_GetFollowing value)? getFollowing,
    TResult Function(_GetPosts value)? getPosts,
    TResult Function(_GetSnaps value)? getSnaps,
    TResult Function(_GetReactions value)? getReactions,
    TResult Function(_GetFollowingList value)? getFollowingList,
    TResult Function(_GetFollowingStatus value)? getFollowingStatus,
    TResult Function(_UpdateProfilePhoto value)? updateProfilePhoto,
    TResult Function(_UpdateCoverPhoto value)? updateCoverPhoto,
    TResult Function(_UpdateProfile value)? updateProfile,
  }) {
    return getSnaps?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetUser value)? getUser,
    TResult Function(_GetFollowers value)? getFollowers,
    TResult Function(_GetFollowing value)? getFollowing,
    TResult Function(_GetPosts value)? getPosts,
    TResult Function(_GetSnaps value)? getSnaps,
    TResult Function(_GetReactions value)? getReactions,
    TResult Function(_GetFollowingList value)? getFollowingList,
    TResult Function(_GetFollowingStatus value)? getFollowingStatus,
    TResult Function(_UpdateProfilePhoto value)? updateProfilePhoto,
    TResult Function(_UpdateCoverPhoto value)? updateCoverPhoto,
    TResult Function(_UpdateProfile value)? updateProfile,
    required TResult orElse(),
  }) {
    if (getSnaps != null) {
      return getSnaps(this);
    }
    return orElse();
  }
}

abstract class _GetSnaps implements ProfileAccountEvent {
  const factory _GetSnaps({required String uid}) = _$_GetSnaps;

  @override
  String get uid;
  @override
  @JsonKey(ignore: true)
  _$GetSnapsCopyWith<_GetSnaps> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$GetReactionsCopyWith<$Res>
    implements $ProfileAccountEventCopyWith<$Res> {
  factory _$GetReactionsCopyWith(
          _GetReactions value, $Res Function(_GetReactions) then) =
      __$GetReactionsCopyWithImpl<$Res>;
  @override
  $Res call({String uid});
}

/// @nodoc
class __$GetReactionsCopyWithImpl<$Res>
    extends _$ProfileAccountEventCopyWithImpl<$Res>
    implements _$GetReactionsCopyWith<$Res> {
  __$GetReactionsCopyWithImpl(
      _GetReactions _value, $Res Function(_GetReactions) _then)
      : super(_value, (v) => _then(v as _GetReactions));

  @override
  _GetReactions get _value => super._value as _GetReactions;

  @override
  $Res call({
    Object? uid = freezed,
  }) {
    return _then(_GetReactions(
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_GetReactions implements _GetReactions {
  const _$_GetReactions({required this.uid});

  @override
  final String uid;

  @override
  String toString() {
    return 'ProfileAccountEvent.getReactions(uid: $uid)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GetReactions &&
            const DeepCollectionEquality().equals(other.uid, uid));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(uid));

  @JsonKey(ignore: true)
  @override
  _$GetReactionsCopyWith<_GetReactions> get copyWith =>
      __$GetReactionsCopyWithImpl<_GetReactions>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String uid) getUser,
    required TResult Function(String uid) getFollowers,
    required TResult Function(String uid) getFollowing,
    required TResult Function(String uid) getPosts,
    required TResult Function(String uid) getSnaps,
    required TResult Function(String uid) getReactions,
    required TResult Function(String uid) getFollowingList,
    required TResult Function(String uid) getFollowingStatus,
    required TResult Function(File file, String uid, UserBloc userBloc)
        updateProfilePhoto,
    required TResult Function(File file, String uid, UserBloc userBloc)
        updateCoverPhoto,
    required TResult Function(
            String uid, UserBloc userBloc, UpdateProfile profile)
        updateProfile,
  }) {
    return getReactions(uid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String uid)? getUser,
    TResult Function(String uid)? getFollowers,
    TResult Function(String uid)? getFollowing,
    TResult Function(String uid)? getPosts,
    TResult Function(String uid)? getSnaps,
    TResult Function(String uid)? getReactions,
    TResult Function(String uid)? getFollowingList,
    TResult Function(String uid)? getFollowingStatus,
    TResult Function(File file, String uid, UserBloc userBloc)?
        updateProfilePhoto,
    TResult Function(File file, String uid, UserBloc userBloc)?
        updateCoverPhoto,
    TResult Function(String uid, UserBloc userBloc, UpdateProfile profile)?
        updateProfile,
  }) {
    return getReactions?.call(uid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String uid)? getUser,
    TResult Function(String uid)? getFollowers,
    TResult Function(String uid)? getFollowing,
    TResult Function(String uid)? getPosts,
    TResult Function(String uid)? getSnaps,
    TResult Function(String uid)? getReactions,
    TResult Function(String uid)? getFollowingList,
    TResult Function(String uid)? getFollowingStatus,
    TResult Function(File file, String uid, UserBloc userBloc)?
        updateProfilePhoto,
    TResult Function(File file, String uid, UserBloc userBloc)?
        updateCoverPhoto,
    TResult Function(String uid, UserBloc userBloc, UpdateProfile profile)?
        updateProfile,
    required TResult orElse(),
  }) {
    if (getReactions != null) {
      return getReactions(uid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetUser value) getUser,
    required TResult Function(_GetFollowers value) getFollowers,
    required TResult Function(_GetFollowing value) getFollowing,
    required TResult Function(_GetPosts value) getPosts,
    required TResult Function(_GetSnaps value) getSnaps,
    required TResult Function(_GetReactions value) getReactions,
    required TResult Function(_GetFollowingList value) getFollowingList,
    required TResult Function(_GetFollowingStatus value) getFollowingStatus,
    required TResult Function(_UpdateProfilePhoto value) updateProfilePhoto,
    required TResult Function(_UpdateCoverPhoto value) updateCoverPhoto,
    required TResult Function(_UpdateProfile value) updateProfile,
  }) {
    return getReactions(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetUser value)? getUser,
    TResult Function(_GetFollowers value)? getFollowers,
    TResult Function(_GetFollowing value)? getFollowing,
    TResult Function(_GetPosts value)? getPosts,
    TResult Function(_GetSnaps value)? getSnaps,
    TResult Function(_GetReactions value)? getReactions,
    TResult Function(_GetFollowingList value)? getFollowingList,
    TResult Function(_GetFollowingStatus value)? getFollowingStatus,
    TResult Function(_UpdateProfilePhoto value)? updateProfilePhoto,
    TResult Function(_UpdateCoverPhoto value)? updateCoverPhoto,
    TResult Function(_UpdateProfile value)? updateProfile,
  }) {
    return getReactions?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetUser value)? getUser,
    TResult Function(_GetFollowers value)? getFollowers,
    TResult Function(_GetFollowing value)? getFollowing,
    TResult Function(_GetPosts value)? getPosts,
    TResult Function(_GetSnaps value)? getSnaps,
    TResult Function(_GetReactions value)? getReactions,
    TResult Function(_GetFollowingList value)? getFollowingList,
    TResult Function(_GetFollowingStatus value)? getFollowingStatus,
    TResult Function(_UpdateProfilePhoto value)? updateProfilePhoto,
    TResult Function(_UpdateCoverPhoto value)? updateCoverPhoto,
    TResult Function(_UpdateProfile value)? updateProfile,
    required TResult orElse(),
  }) {
    if (getReactions != null) {
      return getReactions(this);
    }
    return orElse();
  }
}

abstract class _GetReactions implements ProfileAccountEvent {
  const factory _GetReactions({required String uid}) = _$_GetReactions;

  @override
  String get uid;
  @override
  @JsonKey(ignore: true)
  _$GetReactionsCopyWith<_GetReactions> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$GetFollowingListCopyWith<$Res>
    implements $ProfileAccountEventCopyWith<$Res> {
  factory _$GetFollowingListCopyWith(
          _GetFollowingList value, $Res Function(_GetFollowingList) then) =
      __$GetFollowingListCopyWithImpl<$Res>;
  @override
  $Res call({String uid});
}

/// @nodoc
class __$GetFollowingListCopyWithImpl<$Res>
    extends _$ProfileAccountEventCopyWithImpl<$Res>
    implements _$GetFollowingListCopyWith<$Res> {
  __$GetFollowingListCopyWithImpl(
      _GetFollowingList _value, $Res Function(_GetFollowingList) _then)
      : super(_value, (v) => _then(v as _GetFollowingList));

  @override
  _GetFollowingList get _value => super._value as _GetFollowingList;

  @override
  $Res call({
    Object? uid = freezed,
  }) {
    return _then(_GetFollowingList(
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_GetFollowingList implements _GetFollowingList {
  const _$_GetFollowingList({required this.uid});

  @override
  final String uid;

  @override
  String toString() {
    return 'ProfileAccountEvent.getFollowingList(uid: $uid)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GetFollowingList &&
            const DeepCollectionEquality().equals(other.uid, uid));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(uid));

  @JsonKey(ignore: true)
  @override
  _$GetFollowingListCopyWith<_GetFollowingList> get copyWith =>
      __$GetFollowingListCopyWithImpl<_GetFollowingList>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String uid) getUser,
    required TResult Function(String uid) getFollowers,
    required TResult Function(String uid) getFollowing,
    required TResult Function(String uid) getPosts,
    required TResult Function(String uid) getSnaps,
    required TResult Function(String uid) getReactions,
    required TResult Function(String uid) getFollowingList,
    required TResult Function(String uid) getFollowingStatus,
    required TResult Function(File file, String uid, UserBloc userBloc)
        updateProfilePhoto,
    required TResult Function(File file, String uid, UserBloc userBloc)
        updateCoverPhoto,
    required TResult Function(
            String uid, UserBloc userBloc, UpdateProfile profile)
        updateProfile,
  }) {
    return getFollowingList(uid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String uid)? getUser,
    TResult Function(String uid)? getFollowers,
    TResult Function(String uid)? getFollowing,
    TResult Function(String uid)? getPosts,
    TResult Function(String uid)? getSnaps,
    TResult Function(String uid)? getReactions,
    TResult Function(String uid)? getFollowingList,
    TResult Function(String uid)? getFollowingStatus,
    TResult Function(File file, String uid, UserBloc userBloc)?
        updateProfilePhoto,
    TResult Function(File file, String uid, UserBloc userBloc)?
        updateCoverPhoto,
    TResult Function(String uid, UserBloc userBloc, UpdateProfile profile)?
        updateProfile,
  }) {
    return getFollowingList?.call(uid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String uid)? getUser,
    TResult Function(String uid)? getFollowers,
    TResult Function(String uid)? getFollowing,
    TResult Function(String uid)? getPosts,
    TResult Function(String uid)? getSnaps,
    TResult Function(String uid)? getReactions,
    TResult Function(String uid)? getFollowingList,
    TResult Function(String uid)? getFollowingStatus,
    TResult Function(File file, String uid, UserBloc userBloc)?
        updateProfilePhoto,
    TResult Function(File file, String uid, UserBloc userBloc)?
        updateCoverPhoto,
    TResult Function(String uid, UserBloc userBloc, UpdateProfile profile)?
        updateProfile,
    required TResult orElse(),
  }) {
    if (getFollowingList != null) {
      return getFollowingList(uid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetUser value) getUser,
    required TResult Function(_GetFollowers value) getFollowers,
    required TResult Function(_GetFollowing value) getFollowing,
    required TResult Function(_GetPosts value) getPosts,
    required TResult Function(_GetSnaps value) getSnaps,
    required TResult Function(_GetReactions value) getReactions,
    required TResult Function(_GetFollowingList value) getFollowingList,
    required TResult Function(_GetFollowingStatus value) getFollowingStatus,
    required TResult Function(_UpdateProfilePhoto value) updateProfilePhoto,
    required TResult Function(_UpdateCoverPhoto value) updateCoverPhoto,
    required TResult Function(_UpdateProfile value) updateProfile,
  }) {
    return getFollowingList(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetUser value)? getUser,
    TResult Function(_GetFollowers value)? getFollowers,
    TResult Function(_GetFollowing value)? getFollowing,
    TResult Function(_GetPosts value)? getPosts,
    TResult Function(_GetSnaps value)? getSnaps,
    TResult Function(_GetReactions value)? getReactions,
    TResult Function(_GetFollowingList value)? getFollowingList,
    TResult Function(_GetFollowingStatus value)? getFollowingStatus,
    TResult Function(_UpdateProfilePhoto value)? updateProfilePhoto,
    TResult Function(_UpdateCoverPhoto value)? updateCoverPhoto,
    TResult Function(_UpdateProfile value)? updateProfile,
  }) {
    return getFollowingList?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetUser value)? getUser,
    TResult Function(_GetFollowers value)? getFollowers,
    TResult Function(_GetFollowing value)? getFollowing,
    TResult Function(_GetPosts value)? getPosts,
    TResult Function(_GetSnaps value)? getSnaps,
    TResult Function(_GetReactions value)? getReactions,
    TResult Function(_GetFollowingList value)? getFollowingList,
    TResult Function(_GetFollowingStatus value)? getFollowingStatus,
    TResult Function(_UpdateProfilePhoto value)? updateProfilePhoto,
    TResult Function(_UpdateCoverPhoto value)? updateCoverPhoto,
    TResult Function(_UpdateProfile value)? updateProfile,
    required TResult orElse(),
  }) {
    if (getFollowingList != null) {
      return getFollowingList(this);
    }
    return orElse();
  }
}

abstract class _GetFollowingList implements ProfileAccountEvent {
  const factory _GetFollowingList({required String uid}) = _$_GetFollowingList;

  @override
  String get uid;
  @override
  @JsonKey(ignore: true)
  _$GetFollowingListCopyWith<_GetFollowingList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$GetFollowingStatusCopyWith<$Res>
    implements $ProfileAccountEventCopyWith<$Res> {
  factory _$GetFollowingStatusCopyWith(
          _GetFollowingStatus value, $Res Function(_GetFollowingStatus) then) =
      __$GetFollowingStatusCopyWithImpl<$Res>;
  @override
  $Res call({String uid});
}

/// @nodoc
class __$GetFollowingStatusCopyWithImpl<$Res>
    extends _$ProfileAccountEventCopyWithImpl<$Res>
    implements _$GetFollowingStatusCopyWith<$Res> {
  __$GetFollowingStatusCopyWithImpl(
      _GetFollowingStatus _value, $Res Function(_GetFollowingStatus) _then)
      : super(_value, (v) => _then(v as _GetFollowingStatus));

  @override
  _GetFollowingStatus get _value => super._value as _GetFollowingStatus;

  @override
  $Res call({
    Object? uid = freezed,
  }) {
    return _then(_GetFollowingStatus(
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_GetFollowingStatus implements _GetFollowingStatus {
  const _$_GetFollowingStatus({required this.uid});

  @override
  final String uid;

  @override
  String toString() {
    return 'ProfileAccountEvent.getFollowingStatus(uid: $uid)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GetFollowingStatus &&
            const DeepCollectionEquality().equals(other.uid, uid));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(uid));

  @JsonKey(ignore: true)
  @override
  _$GetFollowingStatusCopyWith<_GetFollowingStatus> get copyWith =>
      __$GetFollowingStatusCopyWithImpl<_GetFollowingStatus>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String uid) getUser,
    required TResult Function(String uid) getFollowers,
    required TResult Function(String uid) getFollowing,
    required TResult Function(String uid) getPosts,
    required TResult Function(String uid) getSnaps,
    required TResult Function(String uid) getReactions,
    required TResult Function(String uid) getFollowingList,
    required TResult Function(String uid) getFollowingStatus,
    required TResult Function(File file, String uid, UserBloc userBloc)
        updateProfilePhoto,
    required TResult Function(File file, String uid, UserBloc userBloc)
        updateCoverPhoto,
    required TResult Function(
            String uid, UserBloc userBloc, UpdateProfile profile)
        updateProfile,
  }) {
    return getFollowingStatus(uid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String uid)? getUser,
    TResult Function(String uid)? getFollowers,
    TResult Function(String uid)? getFollowing,
    TResult Function(String uid)? getPosts,
    TResult Function(String uid)? getSnaps,
    TResult Function(String uid)? getReactions,
    TResult Function(String uid)? getFollowingList,
    TResult Function(String uid)? getFollowingStatus,
    TResult Function(File file, String uid, UserBloc userBloc)?
        updateProfilePhoto,
    TResult Function(File file, String uid, UserBloc userBloc)?
        updateCoverPhoto,
    TResult Function(String uid, UserBloc userBloc, UpdateProfile profile)?
        updateProfile,
  }) {
    return getFollowingStatus?.call(uid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String uid)? getUser,
    TResult Function(String uid)? getFollowers,
    TResult Function(String uid)? getFollowing,
    TResult Function(String uid)? getPosts,
    TResult Function(String uid)? getSnaps,
    TResult Function(String uid)? getReactions,
    TResult Function(String uid)? getFollowingList,
    TResult Function(String uid)? getFollowingStatus,
    TResult Function(File file, String uid, UserBloc userBloc)?
        updateProfilePhoto,
    TResult Function(File file, String uid, UserBloc userBloc)?
        updateCoverPhoto,
    TResult Function(String uid, UserBloc userBloc, UpdateProfile profile)?
        updateProfile,
    required TResult orElse(),
  }) {
    if (getFollowingStatus != null) {
      return getFollowingStatus(uid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetUser value) getUser,
    required TResult Function(_GetFollowers value) getFollowers,
    required TResult Function(_GetFollowing value) getFollowing,
    required TResult Function(_GetPosts value) getPosts,
    required TResult Function(_GetSnaps value) getSnaps,
    required TResult Function(_GetReactions value) getReactions,
    required TResult Function(_GetFollowingList value) getFollowingList,
    required TResult Function(_GetFollowingStatus value) getFollowingStatus,
    required TResult Function(_UpdateProfilePhoto value) updateProfilePhoto,
    required TResult Function(_UpdateCoverPhoto value) updateCoverPhoto,
    required TResult Function(_UpdateProfile value) updateProfile,
  }) {
    return getFollowingStatus(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetUser value)? getUser,
    TResult Function(_GetFollowers value)? getFollowers,
    TResult Function(_GetFollowing value)? getFollowing,
    TResult Function(_GetPosts value)? getPosts,
    TResult Function(_GetSnaps value)? getSnaps,
    TResult Function(_GetReactions value)? getReactions,
    TResult Function(_GetFollowingList value)? getFollowingList,
    TResult Function(_GetFollowingStatus value)? getFollowingStatus,
    TResult Function(_UpdateProfilePhoto value)? updateProfilePhoto,
    TResult Function(_UpdateCoverPhoto value)? updateCoverPhoto,
    TResult Function(_UpdateProfile value)? updateProfile,
  }) {
    return getFollowingStatus?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetUser value)? getUser,
    TResult Function(_GetFollowers value)? getFollowers,
    TResult Function(_GetFollowing value)? getFollowing,
    TResult Function(_GetPosts value)? getPosts,
    TResult Function(_GetSnaps value)? getSnaps,
    TResult Function(_GetReactions value)? getReactions,
    TResult Function(_GetFollowingList value)? getFollowingList,
    TResult Function(_GetFollowingStatus value)? getFollowingStatus,
    TResult Function(_UpdateProfilePhoto value)? updateProfilePhoto,
    TResult Function(_UpdateCoverPhoto value)? updateCoverPhoto,
    TResult Function(_UpdateProfile value)? updateProfile,
    required TResult orElse(),
  }) {
    if (getFollowingStatus != null) {
      return getFollowingStatus(this);
    }
    return orElse();
  }
}

abstract class _GetFollowingStatus implements ProfileAccountEvent {
  const factory _GetFollowingStatus({required String uid}) =
      _$_GetFollowingStatus;

  @override
  String get uid;
  @override
  @JsonKey(ignore: true)
  _$GetFollowingStatusCopyWith<_GetFollowingStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$UpdateProfilePhotoCopyWith<$Res>
    implements $ProfileAccountEventCopyWith<$Res> {
  factory _$UpdateProfilePhotoCopyWith(
          _UpdateProfilePhoto value, $Res Function(_UpdateProfilePhoto) then) =
      __$UpdateProfilePhotoCopyWithImpl<$Res>;
  @override
  $Res call({File file, String uid, UserBloc userBloc});
}

/// @nodoc
class __$UpdateProfilePhotoCopyWithImpl<$Res>
    extends _$ProfileAccountEventCopyWithImpl<$Res>
    implements _$UpdateProfilePhotoCopyWith<$Res> {
  __$UpdateProfilePhotoCopyWithImpl(
      _UpdateProfilePhoto _value, $Res Function(_UpdateProfilePhoto) _then)
      : super(_value, (v) => _then(v as _UpdateProfilePhoto));

  @override
  _UpdateProfilePhoto get _value => super._value as _UpdateProfilePhoto;

  @override
  $Res call({
    Object? file = freezed,
    Object? uid = freezed,
    Object? userBloc = freezed,
  }) {
    return _then(_UpdateProfilePhoto(
      file: file == freezed
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as File,
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      userBloc: userBloc == freezed
          ? _value.userBloc
          : userBloc // ignore: cast_nullable_to_non_nullable
              as UserBloc,
    ));
  }
}

/// @nodoc

class _$_UpdateProfilePhoto implements _UpdateProfilePhoto {
  const _$_UpdateProfilePhoto(
      {required this.file, required this.uid, required this.userBloc});

  @override
  final File file;
  @override
  final String uid;
  @override
  final UserBloc userBloc;

  @override
  String toString() {
    return 'ProfileAccountEvent.updateProfilePhoto(file: $file, uid: $uid, userBloc: $userBloc)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UpdateProfilePhoto &&
            const DeepCollectionEquality().equals(other.file, file) &&
            const DeepCollectionEquality().equals(other.uid, uid) &&
            const DeepCollectionEquality().equals(other.userBloc, userBloc));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(file),
      const DeepCollectionEquality().hash(uid),
      const DeepCollectionEquality().hash(userBloc));

  @JsonKey(ignore: true)
  @override
  _$UpdateProfilePhotoCopyWith<_UpdateProfilePhoto> get copyWith =>
      __$UpdateProfilePhotoCopyWithImpl<_UpdateProfilePhoto>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String uid) getUser,
    required TResult Function(String uid) getFollowers,
    required TResult Function(String uid) getFollowing,
    required TResult Function(String uid) getPosts,
    required TResult Function(String uid) getSnaps,
    required TResult Function(String uid) getReactions,
    required TResult Function(String uid) getFollowingList,
    required TResult Function(String uid) getFollowingStatus,
    required TResult Function(File file, String uid, UserBloc userBloc)
        updateProfilePhoto,
    required TResult Function(File file, String uid, UserBloc userBloc)
        updateCoverPhoto,
    required TResult Function(
            String uid, UserBloc userBloc, UpdateProfile profile)
        updateProfile,
  }) {
    return updateProfilePhoto(file, uid, userBloc);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String uid)? getUser,
    TResult Function(String uid)? getFollowers,
    TResult Function(String uid)? getFollowing,
    TResult Function(String uid)? getPosts,
    TResult Function(String uid)? getSnaps,
    TResult Function(String uid)? getReactions,
    TResult Function(String uid)? getFollowingList,
    TResult Function(String uid)? getFollowingStatus,
    TResult Function(File file, String uid, UserBloc userBloc)?
        updateProfilePhoto,
    TResult Function(File file, String uid, UserBloc userBloc)?
        updateCoverPhoto,
    TResult Function(String uid, UserBloc userBloc, UpdateProfile profile)?
        updateProfile,
  }) {
    return updateProfilePhoto?.call(file, uid, userBloc);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String uid)? getUser,
    TResult Function(String uid)? getFollowers,
    TResult Function(String uid)? getFollowing,
    TResult Function(String uid)? getPosts,
    TResult Function(String uid)? getSnaps,
    TResult Function(String uid)? getReactions,
    TResult Function(String uid)? getFollowingList,
    TResult Function(String uid)? getFollowingStatus,
    TResult Function(File file, String uid, UserBloc userBloc)?
        updateProfilePhoto,
    TResult Function(File file, String uid, UserBloc userBloc)?
        updateCoverPhoto,
    TResult Function(String uid, UserBloc userBloc, UpdateProfile profile)?
        updateProfile,
    required TResult orElse(),
  }) {
    if (updateProfilePhoto != null) {
      return updateProfilePhoto(file, uid, userBloc);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetUser value) getUser,
    required TResult Function(_GetFollowers value) getFollowers,
    required TResult Function(_GetFollowing value) getFollowing,
    required TResult Function(_GetPosts value) getPosts,
    required TResult Function(_GetSnaps value) getSnaps,
    required TResult Function(_GetReactions value) getReactions,
    required TResult Function(_GetFollowingList value) getFollowingList,
    required TResult Function(_GetFollowingStatus value) getFollowingStatus,
    required TResult Function(_UpdateProfilePhoto value) updateProfilePhoto,
    required TResult Function(_UpdateCoverPhoto value) updateCoverPhoto,
    required TResult Function(_UpdateProfile value) updateProfile,
  }) {
    return updateProfilePhoto(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetUser value)? getUser,
    TResult Function(_GetFollowers value)? getFollowers,
    TResult Function(_GetFollowing value)? getFollowing,
    TResult Function(_GetPosts value)? getPosts,
    TResult Function(_GetSnaps value)? getSnaps,
    TResult Function(_GetReactions value)? getReactions,
    TResult Function(_GetFollowingList value)? getFollowingList,
    TResult Function(_GetFollowingStatus value)? getFollowingStatus,
    TResult Function(_UpdateProfilePhoto value)? updateProfilePhoto,
    TResult Function(_UpdateCoverPhoto value)? updateCoverPhoto,
    TResult Function(_UpdateProfile value)? updateProfile,
  }) {
    return updateProfilePhoto?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetUser value)? getUser,
    TResult Function(_GetFollowers value)? getFollowers,
    TResult Function(_GetFollowing value)? getFollowing,
    TResult Function(_GetPosts value)? getPosts,
    TResult Function(_GetSnaps value)? getSnaps,
    TResult Function(_GetReactions value)? getReactions,
    TResult Function(_GetFollowingList value)? getFollowingList,
    TResult Function(_GetFollowingStatus value)? getFollowingStatus,
    TResult Function(_UpdateProfilePhoto value)? updateProfilePhoto,
    TResult Function(_UpdateCoverPhoto value)? updateCoverPhoto,
    TResult Function(_UpdateProfile value)? updateProfile,
    required TResult orElse(),
  }) {
    if (updateProfilePhoto != null) {
      return updateProfilePhoto(this);
    }
    return orElse();
  }
}

abstract class _UpdateProfilePhoto implements ProfileAccountEvent {
  const factory _UpdateProfilePhoto(
      {required File file,
      required String uid,
      required UserBloc userBloc}) = _$_UpdateProfilePhoto;

  File get file;
  @override
  String get uid;
  UserBloc get userBloc;
  @override
  @JsonKey(ignore: true)
  _$UpdateProfilePhotoCopyWith<_UpdateProfilePhoto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$UpdateCoverPhotoCopyWith<$Res>
    implements $ProfileAccountEventCopyWith<$Res> {
  factory _$UpdateCoverPhotoCopyWith(
          _UpdateCoverPhoto value, $Res Function(_UpdateCoverPhoto) then) =
      __$UpdateCoverPhotoCopyWithImpl<$Res>;
  @override
  $Res call({File file, String uid, UserBloc userBloc});
}

/// @nodoc
class __$UpdateCoverPhotoCopyWithImpl<$Res>
    extends _$ProfileAccountEventCopyWithImpl<$Res>
    implements _$UpdateCoverPhotoCopyWith<$Res> {
  __$UpdateCoverPhotoCopyWithImpl(
      _UpdateCoverPhoto _value, $Res Function(_UpdateCoverPhoto) _then)
      : super(_value, (v) => _then(v as _UpdateCoverPhoto));

  @override
  _UpdateCoverPhoto get _value => super._value as _UpdateCoverPhoto;

  @override
  $Res call({
    Object? file = freezed,
    Object? uid = freezed,
    Object? userBloc = freezed,
  }) {
    return _then(_UpdateCoverPhoto(
      file: file == freezed
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as File,
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      userBloc: userBloc == freezed
          ? _value.userBloc
          : userBloc // ignore: cast_nullable_to_non_nullable
              as UserBloc,
    ));
  }
}

/// @nodoc

class _$_UpdateCoverPhoto implements _UpdateCoverPhoto {
  const _$_UpdateCoverPhoto(
      {required this.file, required this.uid, required this.userBloc});

  @override
  final File file;
  @override
  final String uid;
  @override
  final UserBloc userBloc;

  @override
  String toString() {
    return 'ProfileAccountEvent.updateCoverPhoto(file: $file, uid: $uid, userBloc: $userBloc)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UpdateCoverPhoto &&
            const DeepCollectionEquality().equals(other.file, file) &&
            const DeepCollectionEquality().equals(other.uid, uid) &&
            const DeepCollectionEquality().equals(other.userBloc, userBloc));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(file),
      const DeepCollectionEquality().hash(uid),
      const DeepCollectionEquality().hash(userBloc));

  @JsonKey(ignore: true)
  @override
  _$UpdateCoverPhotoCopyWith<_UpdateCoverPhoto> get copyWith =>
      __$UpdateCoverPhotoCopyWithImpl<_UpdateCoverPhoto>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String uid) getUser,
    required TResult Function(String uid) getFollowers,
    required TResult Function(String uid) getFollowing,
    required TResult Function(String uid) getPosts,
    required TResult Function(String uid) getSnaps,
    required TResult Function(String uid) getReactions,
    required TResult Function(String uid) getFollowingList,
    required TResult Function(String uid) getFollowingStatus,
    required TResult Function(File file, String uid, UserBloc userBloc)
        updateProfilePhoto,
    required TResult Function(File file, String uid, UserBloc userBloc)
        updateCoverPhoto,
    required TResult Function(
            String uid, UserBloc userBloc, UpdateProfile profile)
        updateProfile,
  }) {
    return updateCoverPhoto(file, uid, userBloc);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String uid)? getUser,
    TResult Function(String uid)? getFollowers,
    TResult Function(String uid)? getFollowing,
    TResult Function(String uid)? getPosts,
    TResult Function(String uid)? getSnaps,
    TResult Function(String uid)? getReactions,
    TResult Function(String uid)? getFollowingList,
    TResult Function(String uid)? getFollowingStatus,
    TResult Function(File file, String uid, UserBloc userBloc)?
        updateProfilePhoto,
    TResult Function(File file, String uid, UserBloc userBloc)?
        updateCoverPhoto,
    TResult Function(String uid, UserBloc userBloc, UpdateProfile profile)?
        updateProfile,
  }) {
    return updateCoverPhoto?.call(file, uid, userBloc);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String uid)? getUser,
    TResult Function(String uid)? getFollowers,
    TResult Function(String uid)? getFollowing,
    TResult Function(String uid)? getPosts,
    TResult Function(String uid)? getSnaps,
    TResult Function(String uid)? getReactions,
    TResult Function(String uid)? getFollowingList,
    TResult Function(String uid)? getFollowingStatus,
    TResult Function(File file, String uid, UserBloc userBloc)?
        updateProfilePhoto,
    TResult Function(File file, String uid, UserBloc userBloc)?
        updateCoverPhoto,
    TResult Function(String uid, UserBloc userBloc, UpdateProfile profile)?
        updateProfile,
    required TResult orElse(),
  }) {
    if (updateCoverPhoto != null) {
      return updateCoverPhoto(file, uid, userBloc);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetUser value) getUser,
    required TResult Function(_GetFollowers value) getFollowers,
    required TResult Function(_GetFollowing value) getFollowing,
    required TResult Function(_GetPosts value) getPosts,
    required TResult Function(_GetSnaps value) getSnaps,
    required TResult Function(_GetReactions value) getReactions,
    required TResult Function(_GetFollowingList value) getFollowingList,
    required TResult Function(_GetFollowingStatus value) getFollowingStatus,
    required TResult Function(_UpdateProfilePhoto value) updateProfilePhoto,
    required TResult Function(_UpdateCoverPhoto value) updateCoverPhoto,
    required TResult Function(_UpdateProfile value) updateProfile,
  }) {
    return updateCoverPhoto(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetUser value)? getUser,
    TResult Function(_GetFollowers value)? getFollowers,
    TResult Function(_GetFollowing value)? getFollowing,
    TResult Function(_GetPosts value)? getPosts,
    TResult Function(_GetSnaps value)? getSnaps,
    TResult Function(_GetReactions value)? getReactions,
    TResult Function(_GetFollowingList value)? getFollowingList,
    TResult Function(_GetFollowingStatus value)? getFollowingStatus,
    TResult Function(_UpdateProfilePhoto value)? updateProfilePhoto,
    TResult Function(_UpdateCoverPhoto value)? updateCoverPhoto,
    TResult Function(_UpdateProfile value)? updateProfile,
  }) {
    return updateCoverPhoto?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetUser value)? getUser,
    TResult Function(_GetFollowers value)? getFollowers,
    TResult Function(_GetFollowing value)? getFollowing,
    TResult Function(_GetPosts value)? getPosts,
    TResult Function(_GetSnaps value)? getSnaps,
    TResult Function(_GetReactions value)? getReactions,
    TResult Function(_GetFollowingList value)? getFollowingList,
    TResult Function(_GetFollowingStatus value)? getFollowingStatus,
    TResult Function(_UpdateProfilePhoto value)? updateProfilePhoto,
    TResult Function(_UpdateCoverPhoto value)? updateCoverPhoto,
    TResult Function(_UpdateProfile value)? updateProfile,
    required TResult orElse(),
  }) {
    if (updateCoverPhoto != null) {
      return updateCoverPhoto(this);
    }
    return orElse();
  }
}

abstract class _UpdateCoverPhoto implements ProfileAccountEvent {
  const factory _UpdateCoverPhoto(
      {required File file,
      required String uid,
      required UserBloc userBloc}) = _$_UpdateCoverPhoto;

  File get file;
  @override
  String get uid;
  UserBloc get userBloc;
  @override
  @JsonKey(ignore: true)
  _$UpdateCoverPhotoCopyWith<_UpdateCoverPhoto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$UpdateProfileCopyWith<$Res>
    implements $ProfileAccountEventCopyWith<$Res> {
  factory _$UpdateProfileCopyWith(
          _UpdateProfile value, $Res Function(_UpdateProfile) then) =
      __$UpdateProfileCopyWithImpl<$Res>;
  @override
  $Res call({String uid, UserBloc userBloc, UpdateProfile profile});
}

/// @nodoc
class __$UpdateProfileCopyWithImpl<$Res>
    extends _$ProfileAccountEventCopyWithImpl<$Res>
    implements _$UpdateProfileCopyWith<$Res> {
  __$UpdateProfileCopyWithImpl(
      _UpdateProfile _value, $Res Function(_UpdateProfile) _then)
      : super(_value, (v) => _then(v as _UpdateProfile));

  @override
  _UpdateProfile get _value => super._value as _UpdateProfile;

  @override
  $Res call({
    Object? uid = freezed,
    Object? userBloc = freezed,
    Object? profile = freezed,
  }) {
    return _then(_UpdateProfile(
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      userBloc: userBloc == freezed
          ? _value.userBloc
          : userBloc // ignore: cast_nullable_to_non_nullable
              as UserBloc,
      profile: profile == freezed
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as UpdateProfile,
    ));
  }
}

/// @nodoc

class _$_UpdateProfile implements _UpdateProfile {
  const _$_UpdateProfile(
      {required this.uid, required this.userBloc, required this.profile});

  @override
  final String uid;
  @override
  final UserBloc userBloc;
  @override
  final UpdateProfile profile;

  @override
  String toString() {
    return 'ProfileAccountEvent.updateProfile(uid: $uid, userBloc: $userBloc, profile: $profile)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UpdateProfile &&
            const DeepCollectionEquality().equals(other.uid, uid) &&
            const DeepCollectionEquality().equals(other.userBloc, userBloc) &&
            const DeepCollectionEquality().equals(other.profile, profile));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(uid),
      const DeepCollectionEquality().hash(userBloc),
      const DeepCollectionEquality().hash(profile));

  @JsonKey(ignore: true)
  @override
  _$UpdateProfileCopyWith<_UpdateProfile> get copyWith =>
      __$UpdateProfileCopyWithImpl<_UpdateProfile>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String uid) getUser,
    required TResult Function(String uid) getFollowers,
    required TResult Function(String uid) getFollowing,
    required TResult Function(String uid) getPosts,
    required TResult Function(String uid) getSnaps,
    required TResult Function(String uid) getReactions,
    required TResult Function(String uid) getFollowingList,
    required TResult Function(String uid) getFollowingStatus,
    required TResult Function(File file, String uid, UserBloc userBloc)
        updateProfilePhoto,
    required TResult Function(File file, String uid, UserBloc userBloc)
        updateCoverPhoto,
    required TResult Function(
            String uid, UserBloc userBloc, UpdateProfile profile)
        updateProfile,
  }) {
    return updateProfile(uid, userBloc, profile);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String uid)? getUser,
    TResult Function(String uid)? getFollowers,
    TResult Function(String uid)? getFollowing,
    TResult Function(String uid)? getPosts,
    TResult Function(String uid)? getSnaps,
    TResult Function(String uid)? getReactions,
    TResult Function(String uid)? getFollowingList,
    TResult Function(String uid)? getFollowingStatus,
    TResult Function(File file, String uid, UserBloc userBloc)?
        updateProfilePhoto,
    TResult Function(File file, String uid, UserBloc userBloc)?
        updateCoverPhoto,
    TResult Function(String uid, UserBloc userBloc, UpdateProfile profile)?
        updateProfile,
  }) {
    return updateProfile?.call(uid, userBloc, profile);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String uid)? getUser,
    TResult Function(String uid)? getFollowers,
    TResult Function(String uid)? getFollowing,
    TResult Function(String uid)? getPosts,
    TResult Function(String uid)? getSnaps,
    TResult Function(String uid)? getReactions,
    TResult Function(String uid)? getFollowingList,
    TResult Function(String uid)? getFollowingStatus,
    TResult Function(File file, String uid, UserBloc userBloc)?
        updateProfilePhoto,
    TResult Function(File file, String uid, UserBloc userBloc)?
        updateCoverPhoto,
    TResult Function(String uid, UserBloc userBloc, UpdateProfile profile)?
        updateProfile,
    required TResult orElse(),
  }) {
    if (updateProfile != null) {
      return updateProfile(uid, userBloc, profile);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetUser value) getUser,
    required TResult Function(_GetFollowers value) getFollowers,
    required TResult Function(_GetFollowing value) getFollowing,
    required TResult Function(_GetPosts value) getPosts,
    required TResult Function(_GetSnaps value) getSnaps,
    required TResult Function(_GetReactions value) getReactions,
    required TResult Function(_GetFollowingList value) getFollowingList,
    required TResult Function(_GetFollowingStatus value) getFollowingStatus,
    required TResult Function(_UpdateProfilePhoto value) updateProfilePhoto,
    required TResult Function(_UpdateCoverPhoto value) updateCoverPhoto,
    required TResult Function(_UpdateProfile value) updateProfile,
  }) {
    return updateProfile(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetUser value)? getUser,
    TResult Function(_GetFollowers value)? getFollowers,
    TResult Function(_GetFollowing value)? getFollowing,
    TResult Function(_GetPosts value)? getPosts,
    TResult Function(_GetSnaps value)? getSnaps,
    TResult Function(_GetReactions value)? getReactions,
    TResult Function(_GetFollowingList value)? getFollowingList,
    TResult Function(_GetFollowingStatus value)? getFollowingStatus,
    TResult Function(_UpdateProfilePhoto value)? updateProfilePhoto,
    TResult Function(_UpdateCoverPhoto value)? updateCoverPhoto,
    TResult Function(_UpdateProfile value)? updateProfile,
  }) {
    return updateProfile?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetUser value)? getUser,
    TResult Function(_GetFollowers value)? getFollowers,
    TResult Function(_GetFollowing value)? getFollowing,
    TResult Function(_GetPosts value)? getPosts,
    TResult Function(_GetSnaps value)? getSnaps,
    TResult Function(_GetReactions value)? getReactions,
    TResult Function(_GetFollowingList value)? getFollowingList,
    TResult Function(_GetFollowingStatus value)? getFollowingStatus,
    TResult Function(_UpdateProfilePhoto value)? updateProfilePhoto,
    TResult Function(_UpdateCoverPhoto value)? updateCoverPhoto,
    TResult Function(_UpdateProfile value)? updateProfile,
    required TResult orElse(),
  }) {
    if (updateProfile != null) {
      return updateProfile(this);
    }
    return orElse();
  }
}

abstract class _UpdateProfile implements ProfileAccountEvent {
  const factory _UpdateProfile(
      {required String uid,
      required UserBloc userBloc,
      required UpdateProfile profile}) = _$_UpdateProfile;

  @override
  String get uid;
  UserBloc get userBloc;
  UpdateProfile get profile;
  @override
  @JsonKey(ignore: true)
  _$UpdateProfileCopyWith<_UpdateProfile> get copyWith =>
      throw _privateConstructorUsedError;
}
