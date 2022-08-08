// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Profile _$ProfileFromJson(Map<String, dynamic> json) {
  return _Profile.fromJson(json);
}

/// @nodoc
class _$ProfileTearOff {
  const _$ProfileTearOff();

  _Profile call(
      {required UserModel user,
      int following = 0,
      int followers = 0,
      int reactions = 0,
      List<Post> posts = const [],
      List<Snap> snaps = const [],
      bool isFollowing = false,
      List<UserModel> followersList = const []}) {
    return _Profile(
      user: user,
      following: following,
      followers: followers,
      reactions: reactions,
      posts: posts,
      snaps: snaps,
      isFollowing: isFollowing,
      followersList: followersList,
    );
  }

  Profile fromJson(Map<String, Object?> json) {
    return Profile.fromJson(json);
  }
}

/// @nodoc
const $Profile = _$ProfileTearOff();

/// @nodoc
mixin _$Profile {
  UserModel get user => throw _privateConstructorUsedError;
  int get following => throw _privateConstructorUsedError;
  int get followers => throw _privateConstructorUsedError;
  int get reactions => throw _privateConstructorUsedError;
  List<Post> get posts => throw _privateConstructorUsedError;
  List<Snap> get snaps => throw _privateConstructorUsedError;
  bool get isFollowing => throw _privateConstructorUsedError;
  List<UserModel> get followersList => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProfileCopyWith<Profile> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileCopyWith<$Res> {
  factory $ProfileCopyWith(Profile value, $Res Function(Profile) then) =
      _$ProfileCopyWithImpl<$Res>;
  $Res call(
      {UserModel user,
      int following,
      int followers,
      int reactions,
      List<Post> posts,
      List<Snap> snaps,
      bool isFollowing,
      List<UserModel> followersList});

  $UserModelCopyWith<$Res> get user;
}

/// @nodoc
class _$ProfileCopyWithImpl<$Res> implements $ProfileCopyWith<$Res> {
  _$ProfileCopyWithImpl(this._value, this._then);

  final Profile _value;
  // ignore: unused_field
  final $Res Function(Profile) _then;

  @override
  $Res call({
    Object? user = freezed,
    Object? following = freezed,
    Object? followers = freezed,
    Object? reactions = freezed,
    Object? posts = freezed,
    Object? snaps = freezed,
    Object? isFollowing = freezed,
    Object? followersList = freezed,
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
abstract class _$ProfileCopyWith<$Res> implements $ProfileCopyWith<$Res> {
  factory _$ProfileCopyWith(_Profile value, $Res Function(_Profile) then) =
      __$ProfileCopyWithImpl<$Res>;
  @override
  $Res call(
      {UserModel user,
      int following,
      int followers,
      int reactions,
      List<Post> posts,
      List<Snap> snaps,
      bool isFollowing,
      List<UserModel> followersList});

  @override
  $UserModelCopyWith<$Res> get user;
}

/// @nodoc
class __$ProfileCopyWithImpl<$Res> extends _$ProfileCopyWithImpl<$Res>
    implements _$ProfileCopyWith<$Res> {
  __$ProfileCopyWithImpl(_Profile _value, $Res Function(_Profile) _then)
      : super(_value, (v) => _then(v as _Profile));

  @override
  _Profile get _value => super._value as _Profile;

  @override
  $Res call({
    Object? user = freezed,
    Object? following = freezed,
    Object? followers = freezed,
    Object? reactions = freezed,
    Object? posts = freezed,
    Object? snaps = freezed,
    Object? isFollowing = freezed,
    Object? followersList = freezed,
  }) {
    return _then(_Profile(
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Profile implements _Profile {
  const _$_Profile(
      {required this.user,
      this.following = 0,
      this.followers = 0,
      this.reactions = 0,
      this.posts = const [],
      this.snaps = const [],
      this.isFollowing = false,
      this.followersList = const []});

  factory _$_Profile.fromJson(Map<String, dynamic> json) =>
      _$$_ProfileFromJson(json);

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

  @override
  String toString() {
    return 'Profile(user: $user, following: $following, followers: $followers, reactions: $reactions, posts: $posts, snaps: $snaps, isFollowing: $isFollowing, followersList: $followersList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Profile &&
            const DeepCollectionEquality().equals(other.user, user) &&
            const DeepCollectionEquality().equals(other.following, following) &&
            const DeepCollectionEquality().equals(other.followers, followers) &&
            const DeepCollectionEquality().equals(other.reactions, reactions) &&
            const DeepCollectionEquality().equals(other.posts, posts) &&
            const DeepCollectionEquality().equals(other.snaps, snaps) &&
            const DeepCollectionEquality()
                .equals(other.isFollowing, isFollowing) &&
            const DeepCollectionEquality()
                .equals(other.followersList, followersList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(user),
      const DeepCollectionEquality().hash(following),
      const DeepCollectionEquality().hash(followers),
      const DeepCollectionEquality().hash(reactions),
      const DeepCollectionEquality().hash(posts),
      const DeepCollectionEquality().hash(snaps),
      const DeepCollectionEquality().hash(isFollowing),
      const DeepCollectionEquality().hash(followersList));

  @JsonKey(ignore: true)
  @override
  _$ProfileCopyWith<_Profile> get copyWith =>
      __$ProfileCopyWithImpl<_Profile>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProfileToJson(this);
  }
}

abstract class _Profile implements Profile {
  const factory _Profile(
      {required UserModel user,
      int following,
      int followers,
      int reactions,
      List<Post> posts,
      List<Snap> snaps,
      bool isFollowing,
      List<UserModel> followersList}) = _$_Profile;

  factory _Profile.fromJson(Map<String, dynamic> json) = _$_Profile.fromJson;

  @override
  UserModel get user;
  @override
  int get following;
  @override
  int get followers;
  @override
  int get reactions;
  @override
  List<Post> get posts;
  @override
  List<Snap> get snaps;
  @override
  bool get isFollowing;
  @override
  List<UserModel> get followersList;
  @override
  @JsonKey(ignore: true)
  _$ProfileCopyWith<_Profile> get copyWith =>
      throw _privateConstructorUsedError;
}
