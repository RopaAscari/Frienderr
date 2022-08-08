// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'snap_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Snap _$SnapFromJson(Map<String, dynamic> json) {
  return _Snap.fromJson(json);
}

/// @nodoc
class _$SnapTearOff {
  const _$SnapTearOff();

  _Snap call(
      {int saves = 0,
      int likes = 0,
      int shares = 0,
      String id = '',
      String url = '',
      required UserModel user,
      int comments = 0,
      String audio = '',
      int dateCreated = 0,
      String caption = '',
      bool isLiked = false,
      String thumbnail = ''}) {
    return _Snap(
      saves: saves,
      likes: likes,
      shares: shares,
      id: id,
      url: url,
      user: user,
      comments: comments,
      audio: audio,
      dateCreated: dateCreated,
      caption: caption,
      isLiked: isLiked,
      thumbnail: thumbnail,
    );
  }

  Snap fromJson(Map<String, Object?> json) {
    return Snap.fromJson(json);
  }
}

/// @nodoc
const $Snap = _$SnapTearOff();

/// @nodoc
mixin _$Snap {
  int get saves => throw _privateConstructorUsedError;
  int get likes => throw _privateConstructorUsedError;
  int get shares => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  UserModel get user => throw _privateConstructorUsedError;
  int get comments => throw _privateConstructorUsedError;
  String get audio => throw _privateConstructorUsedError;
  int get dateCreated => throw _privateConstructorUsedError;
  String get caption => throw _privateConstructorUsedError;
  bool get isLiked => throw _privateConstructorUsedError;
  String get thumbnail => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SnapCopyWith<Snap> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SnapCopyWith<$Res> {
  factory $SnapCopyWith(Snap value, $Res Function(Snap) then) =
      _$SnapCopyWithImpl<$Res>;
  $Res call(
      {int saves,
      int likes,
      int shares,
      String id,
      String url,
      UserModel user,
      int comments,
      String audio,
      int dateCreated,
      String caption,
      bool isLiked,
      String thumbnail});

  $UserModelCopyWith<$Res> get user;
}

/// @nodoc
class _$SnapCopyWithImpl<$Res> implements $SnapCopyWith<$Res> {
  _$SnapCopyWithImpl(this._value, this._then);

  final Snap _value;
  // ignore: unused_field
  final $Res Function(Snap) _then;

  @override
  $Res call({
    Object? saves = freezed,
    Object? likes = freezed,
    Object? shares = freezed,
    Object? id = freezed,
    Object? url = freezed,
    Object? user = freezed,
    Object? comments = freezed,
    Object? audio = freezed,
    Object? dateCreated = freezed,
    Object? caption = freezed,
    Object? isLiked = freezed,
    Object? thumbnail = freezed,
  }) {
    return _then(_value.copyWith(
      saves: saves == freezed
          ? _value.saves
          : saves // ignore: cast_nullable_to_non_nullable
              as int,
      likes: likes == freezed
          ? _value.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as int,
      shares: shares == freezed
          ? _value.shares
          : shares // ignore: cast_nullable_to_non_nullable
              as int,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel,
      comments: comments == freezed
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as int,
      audio: audio == freezed
          ? _value.audio
          : audio // ignore: cast_nullable_to_non_nullable
              as String,
      dateCreated: dateCreated == freezed
          ? _value.dateCreated
          : dateCreated // ignore: cast_nullable_to_non_nullable
              as int,
      caption: caption == freezed
          ? _value.caption
          : caption // ignore: cast_nullable_to_non_nullable
              as String,
      isLiked: isLiked == freezed
          ? _value.isLiked
          : isLiked // ignore: cast_nullable_to_non_nullable
              as bool,
      thumbnail: thumbnail == freezed
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String,
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
abstract class _$SnapCopyWith<$Res> implements $SnapCopyWith<$Res> {
  factory _$SnapCopyWith(_Snap value, $Res Function(_Snap) then) =
      __$SnapCopyWithImpl<$Res>;
  @override
  $Res call(
      {int saves,
      int likes,
      int shares,
      String id,
      String url,
      UserModel user,
      int comments,
      String audio,
      int dateCreated,
      String caption,
      bool isLiked,
      String thumbnail});

  @override
  $UserModelCopyWith<$Res> get user;
}

/// @nodoc
class __$SnapCopyWithImpl<$Res> extends _$SnapCopyWithImpl<$Res>
    implements _$SnapCopyWith<$Res> {
  __$SnapCopyWithImpl(_Snap _value, $Res Function(_Snap) _then)
      : super(_value, (v) => _then(v as _Snap));

  @override
  _Snap get _value => super._value as _Snap;

  @override
  $Res call({
    Object? saves = freezed,
    Object? likes = freezed,
    Object? shares = freezed,
    Object? id = freezed,
    Object? url = freezed,
    Object? user = freezed,
    Object? comments = freezed,
    Object? audio = freezed,
    Object? dateCreated = freezed,
    Object? caption = freezed,
    Object? isLiked = freezed,
    Object? thumbnail = freezed,
  }) {
    return _then(_Snap(
      saves: saves == freezed
          ? _value.saves
          : saves // ignore: cast_nullable_to_non_nullable
              as int,
      likes: likes == freezed
          ? _value.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as int,
      shares: shares == freezed
          ? _value.shares
          : shares // ignore: cast_nullable_to_non_nullable
              as int,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel,
      comments: comments == freezed
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as int,
      audio: audio == freezed
          ? _value.audio
          : audio // ignore: cast_nullable_to_non_nullable
              as String,
      dateCreated: dateCreated == freezed
          ? _value.dateCreated
          : dateCreated // ignore: cast_nullable_to_non_nullable
              as int,
      caption: caption == freezed
          ? _value.caption
          : caption // ignore: cast_nullable_to_non_nullable
              as String,
      isLiked: isLiked == freezed
          ? _value.isLiked
          : isLiked // ignore: cast_nullable_to_non_nullable
              as bool,
      thumbnail: thumbnail == freezed
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Snap implements _Snap {
  const _$_Snap(
      {this.saves = 0,
      this.likes = 0,
      this.shares = 0,
      this.id = '',
      this.url = '',
      required this.user,
      this.comments = 0,
      this.audio = '',
      this.dateCreated = 0,
      this.caption = '',
      this.isLiked = false,
      this.thumbnail = ''});

  factory _$_Snap.fromJson(Map<String, dynamic> json) => _$$_SnapFromJson(json);

  @JsonKey()
  @override
  final int saves;
  @JsonKey()
  @override
  final int likes;
  @JsonKey()
  @override
  final int shares;
  @JsonKey()
  @override
  final String id;
  @JsonKey()
  @override
  final String url;
  @override
  final UserModel user;
  @JsonKey()
  @override
  final int comments;
  @JsonKey()
  @override
  final String audio;
  @JsonKey()
  @override
  final int dateCreated;
  @JsonKey()
  @override
  final String caption;
  @JsonKey()
  @override
  final bool isLiked;
  @JsonKey()
  @override
  final String thumbnail;

  @override
  String toString() {
    return 'Snap(saves: $saves, likes: $likes, shares: $shares, id: $id, url: $url, user: $user, comments: $comments, audio: $audio, dateCreated: $dateCreated, caption: $caption, isLiked: $isLiked, thumbnail: $thumbnail)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Snap &&
            const DeepCollectionEquality().equals(other.saves, saves) &&
            const DeepCollectionEquality().equals(other.likes, likes) &&
            const DeepCollectionEquality().equals(other.shares, shares) &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.url, url) &&
            const DeepCollectionEquality().equals(other.user, user) &&
            const DeepCollectionEquality().equals(other.comments, comments) &&
            const DeepCollectionEquality().equals(other.audio, audio) &&
            const DeepCollectionEquality()
                .equals(other.dateCreated, dateCreated) &&
            const DeepCollectionEquality().equals(other.caption, caption) &&
            const DeepCollectionEquality().equals(other.isLiked, isLiked) &&
            const DeepCollectionEquality().equals(other.thumbnail, thumbnail));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(saves),
      const DeepCollectionEquality().hash(likes),
      const DeepCollectionEquality().hash(shares),
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(url),
      const DeepCollectionEquality().hash(user),
      const DeepCollectionEquality().hash(comments),
      const DeepCollectionEquality().hash(audio),
      const DeepCollectionEquality().hash(dateCreated),
      const DeepCollectionEquality().hash(caption),
      const DeepCollectionEquality().hash(isLiked),
      const DeepCollectionEquality().hash(thumbnail));

  @JsonKey(ignore: true)
  @override
  _$SnapCopyWith<_Snap> get copyWith =>
      __$SnapCopyWithImpl<_Snap>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SnapToJson(this);
  }
}

abstract class _Snap implements Snap {
  const factory _Snap(
      {int saves,
      int likes,
      int shares,
      String id,
      String url,
      required UserModel user,
      int comments,
      String audio,
      int dateCreated,
      String caption,
      bool isLiked,
      String thumbnail}) = _$_Snap;

  factory _Snap.fromJson(Map<String, dynamic> json) = _$_Snap.fromJson;

  @override
  int get saves;
  @override
  int get likes;
  @override
  int get shares;
  @override
  String get id;
  @override
  String get url;
  @override
  UserModel get user;
  @override
  int get comments;
  @override
  String get audio;
  @override
  int get dateCreated;
  @override
  String get caption;
  @override
  bool get isLiked;
  @override
  String get thumbnail;
  @override
  @JsonKey(ignore: true)
  _$SnapCopyWith<_Snap> get copyWith => throw _privateConstructorUsedError;
}
