// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'post_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Post _$PostFromJson(Map<String, dynamic> json) {
  return _Post.fromJson(json);
}

/// @nodoc
class _$PostTearOff {
  const _$PostTearOff();

  _Post call(
      {String id = '',
      int saves = 0,
      int shares = 0,
      int comments = 0,
      int reactions = 0,
      String caption = '',
      int dateCreated = 0,
      bool? isSaved = false,
      required TimelinePostType type,
      List<Content> content = const [],
      PostReaction? userReaction = null,
      UserModel user = const UserModel(id: ''),
      List<PostReaction> latestReactions = const []}) {
    return _Post(
      id: id,
      saves: saves,
      shares: shares,
      comments: comments,
      reactions: reactions,
      caption: caption,
      dateCreated: dateCreated,
      isSaved: isSaved,
      type: type,
      content: content,
      userReaction: userReaction,
      user: user,
      latestReactions: latestReactions,
    );
  }

  Post fromJson(Map<String, Object?> json) {
    return Post.fromJson(json);
  }
}

/// @nodoc
const $Post = _$PostTearOff();

/// @nodoc
mixin _$Post {
  String get id => throw _privateConstructorUsedError;
  int get saves => throw _privateConstructorUsedError;
  int get shares => throw _privateConstructorUsedError;
  int get comments => throw _privateConstructorUsedError;
  int get reactions => throw _privateConstructorUsedError;
  String get caption => throw _privateConstructorUsedError;
  int get dateCreated => throw _privateConstructorUsedError;
  bool? get isSaved => throw _privateConstructorUsedError;
  TimelinePostType get type => throw _privateConstructorUsedError;
  List<Content> get content => throw _privateConstructorUsedError;
  PostReaction? get userReaction => throw _privateConstructorUsedError;
  UserModel get user => throw _privateConstructorUsedError;
  List<PostReaction> get latestReactions => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostCopyWith<Post> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostCopyWith<$Res> {
  factory $PostCopyWith(Post value, $Res Function(Post) then) =
      _$PostCopyWithImpl<$Res>;
  $Res call(
      {String id,
      int saves,
      int shares,
      int comments,
      int reactions,
      String caption,
      int dateCreated,
      bool? isSaved,
      TimelinePostType type,
      List<Content> content,
      PostReaction? userReaction,
      UserModel user,
      List<PostReaction> latestReactions});

  $PostReactionCopyWith<$Res>? get userReaction;
  $UserModelCopyWith<$Res> get user;
}

/// @nodoc
class _$PostCopyWithImpl<$Res> implements $PostCopyWith<$Res> {
  _$PostCopyWithImpl(this._value, this._then);

  final Post _value;
  // ignore: unused_field
  final $Res Function(Post) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? saves = freezed,
    Object? shares = freezed,
    Object? comments = freezed,
    Object? reactions = freezed,
    Object? caption = freezed,
    Object? dateCreated = freezed,
    Object? isSaved = freezed,
    Object? type = freezed,
    Object? content = freezed,
    Object? userReaction = freezed,
    Object? user = freezed,
    Object? latestReactions = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      saves: saves == freezed
          ? _value.saves
          : saves // ignore: cast_nullable_to_non_nullable
              as int,
      shares: shares == freezed
          ? _value.shares
          : shares // ignore: cast_nullable_to_non_nullable
              as int,
      comments: comments == freezed
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as int,
      reactions: reactions == freezed
          ? _value.reactions
          : reactions // ignore: cast_nullable_to_non_nullable
              as int,
      caption: caption == freezed
          ? _value.caption
          : caption // ignore: cast_nullable_to_non_nullable
              as String,
      dateCreated: dateCreated == freezed
          ? _value.dateCreated
          : dateCreated // ignore: cast_nullable_to_non_nullable
              as int,
      isSaved: isSaved == freezed
          ? _value.isSaved
          : isSaved // ignore: cast_nullable_to_non_nullable
              as bool?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TimelinePostType,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as List<Content>,
      userReaction: userReaction == freezed
          ? _value.userReaction
          : userReaction // ignore: cast_nullable_to_non_nullable
              as PostReaction?,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel,
      latestReactions: latestReactions == freezed
          ? _value.latestReactions
          : latestReactions // ignore: cast_nullable_to_non_nullable
              as List<PostReaction>,
    ));
  }

  @override
  $PostReactionCopyWith<$Res>? get userReaction {
    if (_value.userReaction == null) {
      return null;
    }

    return $PostReactionCopyWith<$Res>(_value.userReaction!, (value) {
      return _then(_value.copyWith(userReaction: value));
    });
  }

  @override
  $UserModelCopyWith<$Res> get user {
    return $UserModelCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc
abstract class _$PostCopyWith<$Res> implements $PostCopyWith<$Res> {
  factory _$PostCopyWith(_Post value, $Res Function(_Post) then) =
      __$PostCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      int saves,
      int shares,
      int comments,
      int reactions,
      String caption,
      int dateCreated,
      bool? isSaved,
      TimelinePostType type,
      List<Content> content,
      PostReaction? userReaction,
      UserModel user,
      List<PostReaction> latestReactions});

  @override
  $PostReactionCopyWith<$Res>? get userReaction;
  @override
  $UserModelCopyWith<$Res> get user;
}

/// @nodoc
class __$PostCopyWithImpl<$Res> extends _$PostCopyWithImpl<$Res>
    implements _$PostCopyWith<$Res> {
  __$PostCopyWithImpl(_Post _value, $Res Function(_Post) _then)
      : super(_value, (v) => _then(v as _Post));

  @override
  _Post get _value => super._value as _Post;

  @override
  $Res call({
    Object? id = freezed,
    Object? saves = freezed,
    Object? shares = freezed,
    Object? comments = freezed,
    Object? reactions = freezed,
    Object? caption = freezed,
    Object? dateCreated = freezed,
    Object? isSaved = freezed,
    Object? type = freezed,
    Object? content = freezed,
    Object? userReaction = freezed,
    Object? user = freezed,
    Object? latestReactions = freezed,
  }) {
    return _then(_Post(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      saves: saves == freezed
          ? _value.saves
          : saves // ignore: cast_nullable_to_non_nullable
              as int,
      shares: shares == freezed
          ? _value.shares
          : shares // ignore: cast_nullable_to_non_nullable
              as int,
      comments: comments == freezed
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as int,
      reactions: reactions == freezed
          ? _value.reactions
          : reactions // ignore: cast_nullable_to_non_nullable
              as int,
      caption: caption == freezed
          ? _value.caption
          : caption // ignore: cast_nullable_to_non_nullable
              as String,
      dateCreated: dateCreated == freezed
          ? _value.dateCreated
          : dateCreated // ignore: cast_nullable_to_non_nullable
              as int,
      isSaved: isSaved == freezed
          ? _value.isSaved
          : isSaved // ignore: cast_nullable_to_non_nullable
              as bool?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TimelinePostType,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as List<Content>,
      userReaction: userReaction == freezed
          ? _value.userReaction
          : userReaction // ignore: cast_nullable_to_non_nullable
              as PostReaction?,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel,
      latestReactions: latestReactions == freezed
          ? _value.latestReactions
          : latestReactions // ignore: cast_nullable_to_non_nullable
              as List<PostReaction>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Post implements _Post {
  const _$_Post(
      {this.id = '',
      this.saves = 0,
      this.shares = 0,
      this.comments = 0,
      this.reactions = 0,
      this.caption = '',
      this.dateCreated = 0,
      this.isSaved = false,
      required this.type,
      this.content = const [],
      this.userReaction = null,
      this.user = const UserModel(id: ''),
      this.latestReactions = const []});

  factory _$_Post.fromJson(Map<String, dynamic> json) => _$$_PostFromJson(json);

  @JsonKey()
  @override
  final String id;
  @JsonKey()
  @override
  final int saves;
  @JsonKey()
  @override
  final int shares;
  @JsonKey()
  @override
  final int comments;
  @JsonKey()
  @override
  final int reactions;
  @JsonKey()
  @override
  final String caption;
  @JsonKey()
  @override
  final int dateCreated;
  @JsonKey()
  @override
  final bool? isSaved;
  @override
  final TimelinePostType type;
  @JsonKey()
  @override
  final List<Content> content;
  @JsonKey()
  @override
  final PostReaction? userReaction;
  @JsonKey()
  @override
  final UserModel user;
  @JsonKey()
  @override
  final List<PostReaction> latestReactions;

  @override
  String toString() {
    return 'Post(id: $id, saves: $saves, shares: $shares, comments: $comments, reactions: $reactions, caption: $caption, dateCreated: $dateCreated, isSaved: $isSaved, type: $type, content: $content, userReaction: $userReaction, user: $user, latestReactions: $latestReactions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Post &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.saves, saves) &&
            const DeepCollectionEquality().equals(other.shares, shares) &&
            const DeepCollectionEquality().equals(other.comments, comments) &&
            const DeepCollectionEquality().equals(other.reactions, reactions) &&
            const DeepCollectionEquality().equals(other.caption, caption) &&
            const DeepCollectionEquality()
                .equals(other.dateCreated, dateCreated) &&
            const DeepCollectionEquality().equals(other.isSaved, isSaved) &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality().equals(other.content, content) &&
            const DeepCollectionEquality()
                .equals(other.userReaction, userReaction) &&
            const DeepCollectionEquality().equals(other.user, user) &&
            const DeepCollectionEquality()
                .equals(other.latestReactions, latestReactions));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(saves),
      const DeepCollectionEquality().hash(shares),
      const DeepCollectionEquality().hash(comments),
      const DeepCollectionEquality().hash(reactions),
      const DeepCollectionEquality().hash(caption),
      const DeepCollectionEquality().hash(dateCreated),
      const DeepCollectionEquality().hash(isSaved),
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(content),
      const DeepCollectionEquality().hash(userReaction),
      const DeepCollectionEquality().hash(user),
      const DeepCollectionEquality().hash(latestReactions));

  @JsonKey(ignore: true)
  @override
  _$PostCopyWith<_Post> get copyWith =>
      __$PostCopyWithImpl<_Post>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PostToJson(this);
  }
}

abstract class _Post implements Post {
  const factory _Post(
      {String id,
      int saves,
      int shares,
      int comments,
      int reactions,
      String caption,
      int dateCreated,
      bool? isSaved,
      required TimelinePostType type,
      List<Content> content,
      PostReaction? userReaction,
      UserModel user,
      List<PostReaction> latestReactions}) = _$_Post;

  factory _Post.fromJson(Map<String, dynamic> json) = _$_Post.fromJson;

  @override
  String get id;
  @override
  int get saves;
  @override
  int get shares;
  @override
  int get comments;
  @override
  int get reactions;
  @override
  String get caption;
  @override
  int get dateCreated;
  @override
  bool? get isSaved;
  @override
  TimelinePostType get type;
  @override
  List<Content> get content;
  @override
  PostReaction? get userReaction;
  @override
  UserModel get user;
  @override
  List<PostReaction> get latestReactions;
  @override
  @JsonKey(ignore: true)
  _$PostCopyWith<_Post> get copyWith => throw _privateConstructorUsedError;
}
