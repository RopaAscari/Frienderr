// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'post_reaction_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PostReaction _$PostReactionFromJson(Map<String, dynamic> json) {
  return _PostReaction.fromJson(json);
}

/// @nodoc
class _$PostReactionTearOff {
  const _$PostReactionTearOff();

  _PostReaction call({String? uid, String? postId, String? reaction}) {
    return _PostReaction(
      uid: uid,
      postId: postId,
      reaction: reaction,
    );
  }

  PostReaction fromJson(Map<String, Object?> json) {
    return PostReaction.fromJson(json);
  }
}

/// @nodoc
const $PostReaction = _$PostReactionTearOff();

/// @nodoc
mixin _$PostReaction {
  String? get uid => throw _privateConstructorUsedError;
  String? get postId => throw _privateConstructorUsedError;
  String? get reaction => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostReactionCopyWith<PostReaction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostReactionCopyWith<$Res> {
  factory $PostReactionCopyWith(
          PostReaction value, $Res Function(PostReaction) then) =
      _$PostReactionCopyWithImpl<$Res>;
  $Res call({String? uid, String? postId, String? reaction});
}

/// @nodoc
class _$PostReactionCopyWithImpl<$Res> implements $PostReactionCopyWith<$Res> {
  _$PostReactionCopyWithImpl(this._value, this._then);

  final PostReaction _value;
  // ignore: unused_field
  final $Res Function(PostReaction) _then;

  @override
  $Res call({
    Object? uid = freezed,
    Object? postId = freezed,
    Object? reaction = freezed,
  }) {
    return _then(_value.copyWith(
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
      postId: postId == freezed
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String?,
      reaction: reaction == freezed
          ? _value.reaction
          : reaction // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$PostReactionCopyWith<$Res>
    implements $PostReactionCopyWith<$Res> {
  factory _$PostReactionCopyWith(
          _PostReaction value, $Res Function(_PostReaction) then) =
      __$PostReactionCopyWithImpl<$Res>;
  @override
  $Res call({String? uid, String? postId, String? reaction});
}

/// @nodoc
class __$PostReactionCopyWithImpl<$Res> extends _$PostReactionCopyWithImpl<$Res>
    implements _$PostReactionCopyWith<$Res> {
  __$PostReactionCopyWithImpl(
      _PostReaction _value, $Res Function(_PostReaction) _then)
      : super(_value, (v) => _then(v as _PostReaction));

  @override
  _PostReaction get _value => super._value as _PostReaction;

  @override
  $Res call({
    Object? uid = freezed,
    Object? postId = freezed,
    Object? reaction = freezed,
  }) {
    return _then(_PostReaction(
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
      postId: postId == freezed
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String?,
      reaction: reaction == freezed
          ? _value.reaction
          : reaction // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PostReaction implements _PostReaction {
  const _$_PostReaction({this.uid, this.postId, this.reaction});

  factory _$_PostReaction.fromJson(Map<String, dynamic> json) =>
      _$$_PostReactionFromJson(json);

  @override
  final String? uid;
  @override
  final String? postId;
  @override
  final String? reaction;

  @override
  String toString() {
    return 'PostReaction(uid: $uid, postId: $postId, reaction: $reaction)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PostReaction &&
            const DeepCollectionEquality().equals(other.uid, uid) &&
            const DeepCollectionEquality().equals(other.postId, postId) &&
            const DeepCollectionEquality().equals(other.reaction, reaction));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(uid),
      const DeepCollectionEquality().hash(postId),
      const DeepCollectionEquality().hash(reaction));

  @JsonKey(ignore: true)
  @override
  _$PostReactionCopyWith<_PostReaction> get copyWith =>
      __$PostReactionCopyWithImpl<_PostReaction>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PostReactionToJson(this);
  }
}

abstract class _PostReaction implements PostReaction {
  const factory _PostReaction({String? uid, String? postId, String? reaction}) =
      _$_PostReaction;

  factory _PostReaction.fromJson(Map<String, dynamic> json) =
      _$_PostReaction.fromJson;

  @override
  String? get uid;
  @override
  String? get postId;
  @override
  String? get reaction;
  @override
  @JsonKey(ignore: true)
  _$PostReactionCopyWith<_PostReaction> get copyWith =>
      throw _privateConstructorUsedError;
}
