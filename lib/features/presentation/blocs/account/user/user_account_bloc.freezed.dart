// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_account_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$UserAccountStateTearOff {
  const _$UserAccountStateTearOff();

  _UserAccountState call(
      {required UserEntity user,
      String? error = null,
      List<String> following = const [],
      List<String> followers = const [],
      List<PostEntity> posts = const [],
      List<QuickEntity> snaps = const [],
      AccountPostStatus postState = AccountPostStatus.idle,
      AccountSnapStatus snapState = AccountSnapStatus.idle,
      AccountUserStatus userState = AccountUserStatus.idle,
      AccountFollowersStatus followerState = AccountFollowersStatus.idle,
      AccountFollowingStatus followingState = AccountFollowingStatus.idle,
      UserAccountListenableAction action = UserAccountListenableAction.idle}) {
    return _UserAccountState(
      user: user,
      error: error,
      following: following,
      followers: followers,
      posts: posts,
      snaps: snaps,
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
const $UserAccountState = _$UserAccountStateTearOff();

/// @nodoc
mixin _$UserAccountState {
  UserEntity get user => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  List<String> get following => throw _privateConstructorUsedError;
  List<String> get followers => throw _privateConstructorUsedError;
  List<PostEntity> get posts => throw _privateConstructorUsedError;
  List<QuickEntity> get snaps => throw _privateConstructorUsedError;
  AccountPostStatus get postState => throw _privateConstructorUsedError;
  AccountSnapStatus get snapState => throw _privateConstructorUsedError;
  AccountUserStatus get userState => throw _privateConstructorUsedError;
  AccountFollowersStatus get followerState =>
      throw _privateConstructorUsedError;
  AccountFollowingStatus get followingState =>
      throw _privateConstructorUsedError;
  UserAccountListenableAction get action => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserAccountStateCopyWith<UserAccountState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserAccountStateCopyWith<$Res> {
  factory $UserAccountStateCopyWith(
          UserAccountState value, $Res Function(UserAccountState) then) =
      _$UserAccountStateCopyWithImpl<$Res>;
  $Res call(
      {UserEntity user,
      String? error,
      List<String> following,
      List<String> followers,
      List<PostEntity> posts,
      List<QuickEntity> snaps,
      AccountPostStatus postState,
      AccountSnapStatus snapState,
      AccountUserStatus userState,
      AccountFollowersStatus followerState,
      AccountFollowingStatus followingState,
      UserAccountListenableAction action});
}

/// @nodoc
class _$UserAccountStateCopyWithImpl<$Res>
    implements $UserAccountStateCopyWith<$Res> {
  _$UserAccountStateCopyWithImpl(this._value, this._then);

  final UserAccountState _value;
  // ignore: unused_field
  final $Res Function(UserAccountState) _then;

  @override
  $Res call({
    Object? user = freezed,
    Object? error = freezed,
    Object? following = freezed,
    Object? followers = freezed,
    Object? posts = freezed,
    Object? snaps = freezed,
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
              as UserEntity,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      following: following == freezed
          ? _value.following
          : following // ignore: cast_nullable_to_non_nullable
              as List<String>,
      followers: followers == freezed
          ? _value.followers
          : followers // ignore: cast_nullable_to_non_nullable
              as List<String>,
      posts: posts == freezed
          ? _value.posts
          : posts // ignore: cast_nullable_to_non_nullable
              as List<PostEntity>,
      snaps: snaps == freezed
          ? _value.snaps
          : snaps // ignore: cast_nullable_to_non_nullable
              as List<QuickEntity>,
      postState: postState == freezed
          ? _value.postState
          : postState // ignore: cast_nullable_to_non_nullable
              as AccountPostStatus,
      snapState: snapState == freezed
          ? _value.snapState
          : snapState // ignore: cast_nullable_to_non_nullable
              as AccountSnapStatus,
      userState: userState == freezed
          ? _value.userState
          : userState // ignore: cast_nullable_to_non_nullable
              as AccountUserStatus,
      followerState: followerState == freezed
          ? _value.followerState
          : followerState // ignore: cast_nullable_to_non_nullable
              as AccountFollowersStatus,
      followingState: followingState == freezed
          ? _value.followingState
          : followingState // ignore: cast_nullable_to_non_nullable
              as AccountFollowingStatus,
      action: action == freezed
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as UserAccountListenableAction,
    ));
  }
}

/// @nodoc
abstract class _$UserAccountStateCopyWith<$Res>
    implements $UserAccountStateCopyWith<$Res> {
  factory _$UserAccountStateCopyWith(
          _UserAccountState value, $Res Function(_UserAccountState) then) =
      __$UserAccountStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {UserEntity user,
      String? error,
      List<String> following,
      List<String> followers,
      List<PostEntity> posts,
      List<QuickEntity> snaps,
      AccountPostStatus postState,
      AccountSnapStatus snapState,
      AccountUserStatus userState,
      AccountFollowersStatus followerState,
      AccountFollowingStatus followingState,
      UserAccountListenableAction action});
}

/// @nodoc
class __$UserAccountStateCopyWithImpl<$Res>
    extends _$UserAccountStateCopyWithImpl<$Res>
    implements _$UserAccountStateCopyWith<$Res> {
  __$UserAccountStateCopyWithImpl(
      _UserAccountState _value, $Res Function(_UserAccountState) _then)
      : super(_value, (v) => _then(v as _UserAccountState));

  @override
  _UserAccountState get _value => super._value as _UserAccountState;

  @override
  $Res call({
    Object? user = freezed,
    Object? error = freezed,
    Object? following = freezed,
    Object? followers = freezed,
    Object? posts = freezed,
    Object? snaps = freezed,
    Object? postState = freezed,
    Object? snapState = freezed,
    Object? userState = freezed,
    Object? followerState = freezed,
    Object? followingState = freezed,
    Object? action = freezed,
  }) {
    return _then(_UserAccountState(
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserEntity,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      following: following == freezed
          ? _value.following
          : following // ignore: cast_nullable_to_non_nullable
              as List<String>,
      followers: followers == freezed
          ? _value.followers
          : followers // ignore: cast_nullable_to_non_nullable
              as List<String>,
      posts: posts == freezed
          ? _value.posts
          : posts // ignore: cast_nullable_to_non_nullable
              as List<PostEntity>,
      snaps: snaps == freezed
          ? _value.snaps
          : snaps // ignore: cast_nullable_to_non_nullable
              as List<QuickEntity>,
      postState: postState == freezed
          ? _value.postState
          : postState // ignore: cast_nullable_to_non_nullable
              as AccountPostStatus,
      snapState: snapState == freezed
          ? _value.snapState
          : snapState // ignore: cast_nullable_to_non_nullable
              as AccountSnapStatus,
      userState: userState == freezed
          ? _value.userState
          : userState // ignore: cast_nullable_to_non_nullable
              as AccountUserStatus,
      followerState: followerState == freezed
          ? _value.followerState
          : followerState // ignore: cast_nullable_to_non_nullable
              as AccountFollowersStatus,
      followingState: followingState == freezed
          ? _value.followingState
          : followingState // ignore: cast_nullable_to_non_nullable
              as AccountFollowingStatus,
      action: action == freezed
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as UserAccountListenableAction,
    ));
  }
}

/// @nodoc

class _$_UserAccountState implements _UserAccountState {
  const _$_UserAccountState(
      {required this.user,
      this.error = null,
      this.following = const [],
      this.followers = const [],
      this.posts = const [],
      this.snaps = const [],
      this.postState = AccountPostStatus.idle,
      this.snapState = AccountSnapStatus.idle,
      this.userState = AccountUserStatus.idle,
      this.followerState = AccountFollowersStatus.idle,
      this.followingState = AccountFollowingStatus.idle,
      this.action = UserAccountListenableAction.idle});

  @override
  final UserEntity user;
  @JsonKey()
  @override
  final String? error;
  @JsonKey()
  @override
  final List<String> following;
  @JsonKey()
  @override
  final List<String> followers;
  @JsonKey()
  @override
  final List<PostEntity> posts;
  @JsonKey()
  @override
  final List<QuickEntity> snaps;
  @JsonKey()
  @override
  final AccountPostStatus postState;
  @JsonKey()
  @override
  final AccountSnapStatus snapState;
  @JsonKey()
  @override
  final AccountUserStatus userState;
  @JsonKey()
  @override
  final AccountFollowersStatus followerState;
  @JsonKey()
  @override
  final AccountFollowingStatus followingState;
  @JsonKey()
  @override
  final UserAccountListenableAction action;

  @override
  String toString() {
    return 'UserAccountState(user: $user, error: $error, following: $following, followers: $followers, posts: $posts, snaps: $snaps, postState: $postState, snapState: $snapState, userState: $userState, followerState: $followerState, followingState: $followingState, action: $action)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserAccountState &&
            const DeepCollectionEquality().equals(other.user, user) &&
            const DeepCollectionEquality().equals(other.error, error) &&
            const DeepCollectionEquality().equals(other.following, following) &&
            const DeepCollectionEquality().equals(other.followers, followers) &&
            const DeepCollectionEquality().equals(other.posts, posts) &&
            const DeepCollectionEquality().equals(other.snaps, snaps) &&
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
      const DeepCollectionEquality().hash(error),
      const DeepCollectionEquality().hash(following),
      const DeepCollectionEquality().hash(followers),
      const DeepCollectionEquality().hash(posts),
      const DeepCollectionEquality().hash(snaps),
      const DeepCollectionEquality().hash(postState),
      const DeepCollectionEquality().hash(snapState),
      const DeepCollectionEquality().hash(userState),
      const DeepCollectionEquality().hash(followerState),
      const DeepCollectionEquality().hash(followingState),
      const DeepCollectionEquality().hash(action));

  @JsonKey(ignore: true)
  @override
  _$UserAccountStateCopyWith<_UserAccountState> get copyWith =>
      __$UserAccountStateCopyWithImpl<_UserAccountState>(this, _$identity);
}

abstract class _UserAccountState implements UserAccountState {
  const factory _UserAccountState(
      {required UserEntity user,
      String? error,
      List<String> following,
      List<String> followers,
      List<PostEntity> posts,
      List<QuickEntity> snaps,
      AccountPostStatus postState,
      AccountSnapStatus snapState,
      AccountUserStatus userState,
      AccountFollowersStatus followerState,
      AccountFollowingStatus followingState,
      UserAccountListenableAction action}) = _$_UserAccountState;

  @override
  UserEntity get user;
  @override
  String? get error;
  @override
  List<String> get following;
  @override
  List<String> get followers;
  @override
  List<PostEntity> get posts;
  @override
  List<QuickEntity> get snaps;
  @override
  AccountPostStatus get postState;
  @override
  AccountSnapStatus get snapState;
  @override
  AccountUserStatus get userState;
  @override
  AccountFollowersStatus get followerState;
  @override
  AccountFollowingStatus get followingState;
  @override
  UserAccountListenableAction get action;
  @override
  @JsonKey(ignore: true)
  _$UserAccountStateCopyWith<_UserAccountState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$UserAccountEventTearOff {
  const _$UserAccountEventTearOff();

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
}

/// @nodoc
const $UserAccountEvent = _$UserAccountEventTearOff();

/// @nodoc
mixin _$UserAccountEvent {
  String get uid => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String uid) getUser,
    required TResult Function(String uid) getFollowers,
    required TResult Function(String uid) getFollowing,
    required TResult Function(String uid) getPosts,
    required TResult Function(String uid) getSnaps,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String uid)? getUser,
    TResult Function(String uid)? getFollowers,
    TResult Function(String uid)? getFollowing,
    TResult Function(String uid)? getPosts,
    TResult Function(String uid)? getSnaps,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String uid)? getUser,
    TResult Function(String uid)? getFollowers,
    TResult Function(String uid)? getFollowing,
    TResult Function(String uid)? getPosts,
    TResult Function(String uid)? getSnaps,
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
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetUser value)? getUser,
    TResult Function(_GetFollowers value)? getFollowers,
    TResult Function(_GetFollowing value)? getFollowing,
    TResult Function(_GetPosts value)? getPosts,
    TResult Function(_GetSnaps value)? getSnaps,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetUser value)? getUser,
    TResult Function(_GetFollowers value)? getFollowers,
    TResult Function(_GetFollowing value)? getFollowing,
    TResult Function(_GetPosts value)? getPosts,
    TResult Function(_GetSnaps value)? getSnaps,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserAccountEventCopyWith<UserAccountEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserAccountEventCopyWith<$Res> {
  factory $UserAccountEventCopyWith(
          UserAccountEvent value, $Res Function(UserAccountEvent) then) =
      _$UserAccountEventCopyWithImpl<$Res>;
  $Res call({String uid});
}

/// @nodoc
class _$UserAccountEventCopyWithImpl<$Res>
    implements $UserAccountEventCopyWith<$Res> {
  _$UserAccountEventCopyWithImpl(this._value, this._then);

  final UserAccountEvent _value;
  // ignore: unused_field
  final $Res Function(UserAccountEvent) _then;

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
    implements $UserAccountEventCopyWith<$Res> {
  factory _$GetUserCopyWith(_GetUser value, $Res Function(_GetUser) then) =
      __$GetUserCopyWithImpl<$Res>;
  @override
  $Res call({String uid});
}

/// @nodoc
class __$GetUserCopyWithImpl<$Res> extends _$UserAccountEventCopyWithImpl<$Res>
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
    return 'UserAccountEvent.getUser(uid: $uid)';
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
    required TResult orElse(),
  }) {
    if (getUser != null) {
      return getUser(this);
    }
    return orElse();
  }
}

abstract class _GetUser implements UserAccountEvent {
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
    implements $UserAccountEventCopyWith<$Res> {
  factory _$GetFollowersCopyWith(
          _GetFollowers value, $Res Function(_GetFollowers) then) =
      __$GetFollowersCopyWithImpl<$Res>;
  @override
  $Res call({String uid});
}

/// @nodoc
class __$GetFollowersCopyWithImpl<$Res>
    extends _$UserAccountEventCopyWithImpl<$Res>
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
    return 'UserAccountEvent.getFollowers(uid: $uid)';
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
    required TResult orElse(),
  }) {
    if (getFollowers != null) {
      return getFollowers(this);
    }
    return orElse();
  }
}

abstract class _GetFollowers implements UserAccountEvent {
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
    implements $UserAccountEventCopyWith<$Res> {
  factory _$GetFollowingCopyWith(
          _GetFollowing value, $Res Function(_GetFollowing) then) =
      __$GetFollowingCopyWithImpl<$Res>;
  @override
  $Res call({String uid});
}

/// @nodoc
class __$GetFollowingCopyWithImpl<$Res>
    extends _$UserAccountEventCopyWithImpl<$Res>
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
    return 'UserAccountEvent.getFollowing(uid: $uid)';
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
    required TResult orElse(),
  }) {
    if (getFollowing != null) {
      return getFollowing(this);
    }
    return orElse();
  }
}

abstract class _GetFollowing implements UserAccountEvent {
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
    implements $UserAccountEventCopyWith<$Res> {
  factory _$GetPostsCopyWith(_GetPosts value, $Res Function(_GetPosts) then) =
      __$GetPostsCopyWithImpl<$Res>;
  @override
  $Res call({String uid});
}

/// @nodoc
class __$GetPostsCopyWithImpl<$Res> extends _$UserAccountEventCopyWithImpl<$Res>
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
    return 'UserAccountEvent.getPosts(uid: $uid)';
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
    required TResult orElse(),
  }) {
    if (getPosts != null) {
      return getPosts(this);
    }
    return orElse();
  }
}

abstract class _GetPosts implements UserAccountEvent {
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
    implements $UserAccountEventCopyWith<$Res> {
  factory _$GetSnapsCopyWith(_GetSnaps value, $Res Function(_GetSnaps) then) =
      __$GetSnapsCopyWithImpl<$Res>;
  @override
  $Res call({String uid});
}

/// @nodoc
class __$GetSnapsCopyWithImpl<$Res> extends _$UserAccountEventCopyWithImpl<$Res>
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
    return 'UserAccountEvent.getSnaps(uid: $uid)';
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
    required TResult orElse(),
  }) {
    if (getSnaps != null) {
      return getSnaps(this);
    }
    return orElse();
  }
}

abstract class _GetSnaps implements UserAccountEvent {
  const factory _GetSnaps({required String uid}) = _$_GetSnaps;

  @override
  String get uid;
  @override
  @JsonKey(ignore: true)
  _$GetSnapsCopyWith<_GetSnaps> get copyWith =>
      throw _privateConstructorUsedError;
}
