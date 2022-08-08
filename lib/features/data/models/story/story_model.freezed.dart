// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'story_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Story _$StoryFromJson(Map<String, dynamic> json) {
  return _Story.fromJson(json);
}

/// @nodoc
class _$StoryTearOff {
  const _$StoryTearOff();

  _Story call(
      {String id = '',
      int dateUpdated = 0,
      bool? isPersitent = false,
      List<StoryContent> content = const [],
      UserModel user = const UserModel(id: '')}) {
    return _Story(
      id: id,
      dateUpdated: dateUpdated,
      isPersitent: isPersitent,
      content: content,
      user: user,
    );
  }

  Story fromJson(Map<String, Object?> json) {
    return Story.fromJson(json);
  }
}

/// @nodoc
const $Story = _$StoryTearOff();

/// @nodoc
mixin _$Story {
  String get id => throw _privateConstructorUsedError;
  int get dateUpdated => throw _privateConstructorUsedError;
  bool? get isPersitent => throw _privateConstructorUsedError;
  List<StoryContent> get content => throw _privateConstructorUsedError;
  UserModel get user => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StoryCopyWith<Story> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoryCopyWith<$Res> {
  factory $StoryCopyWith(Story value, $Res Function(Story) then) =
      _$StoryCopyWithImpl<$Res>;
  $Res call(
      {String id,
      int dateUpdated,
      bool? isPersitent,
      List<StoryContent> content,
      UserModel user});

  $UserModelCopyWith<$Res> get user;
}

/// @nodoc
class _$StoryCopyWithImpl<$Res> implements $StoryCopyWith<$Res> {
  _$StoryCopyWithImpl(this._value, this._then);

  final Story _value;
  // ignore: unused_field
  final $Res Function(Story) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? dateUpdated = freezed,
    Object? isPersitent = freezed,
    Object? content = freezed,
    Object? user = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      dateUpdated: dateUpdated == freezed
          ? _value.dateUpdated
          : dateUpdated // ignore: cast_nullable_to_non_nullable
              as int,
      isPersitent: isPersitent == freezed
          ? _value.isPersitent
          : isPersitent // ignore: cast_nullable_to_non_nullable
              as bool?,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as List<StoryContent>,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel,
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
abstract class _$StoryCopyWith<$Res> implements $StoryCopyWith<$Res> {
  factory _$StoryCopyWith(_Story value, $Res Function(_Story) then) =
      __$StoryCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      int dateUpdated,
      bool? isPersitent,
      List<StoryContent> content,
      UserModel user});

  @override
  $UserModelCopyWith<$Res> get user;
}

/// @nodoc
class __$StoryCopyWithImpl<$Res> extends _$StoryCopyWithImpl<$Res>
    implements _$StoryCopyWith<$Res> {
  __$StoryCopyWithImpl(_Story _value, $Res Function(_Story) _then)
      : super(_value, (v) => _then(v as _Story));

  @override
  _Story get _value => super._value as _Story;

  @override
  $Res call({
    Object? id = freezed,
    Object? dateUpdated = freezed,
    Object? isPersitent = freezed,
    Object? content = freezed,
    Object? user = freezed,
  }) {
    return _then(_Story(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      dateUpdated: dateUpdated == freezed
          ? _value.dateUpdated
          : dateUpdated // ignore: cast_nullable_to_non_nullable
              as int,
      isPersitent: isPersitent == freezed
          ? _value.isPersitent
          : isPersitent // ignore: cast_nullable_to_non_nullable
              as bool?,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as List<StoryContent>,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Story implements _Story {
  const _$_Story(
      {this.id = '',
      this.dateUpdated = 0,
      this.isPersitent = false,
      this.content = const [],
      this.user = const UserModel(id: '')});

  factory _$_Story.fromJson(Map<String, dynamic> json) =>
      _$$_StoryFromJson(json);

  @JsonKey()
  @override
  final String id;
  @JsonKey()
  @override
  final int dateUpdated;
  @JsonKey()
  @override
  final bool? isPersitent;
  @JsonKey()
  @override
  final List<StoryContent> content;
  @JsonKey()
  @override
  final UserModel user;

  @override
  String toString() {
    return 'Story(id: $id, dateUpdated: $dateUpdated, isPersitent: $isPersitent, content: $content, user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Story &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality()
                .equals(other.dateUpdated, dateUpdated) &&
            const DeepCollectionEquality()
                .equals(other.isPersitent, isPersitent) &&
            const DeepCollectionEquality().equals(other.content, content) &&
            const DeepCollectionEquality().equals(other.user, user));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(dateUpdated),
      const DeepCollectionEquality().hash(isPersitent),
      const DeepCollectionEquality().hash(content),
      const DeepCollectionEquality().hash(user));

  @JsonKey(ignore: true)
  @override
  _$StoryCopyWith<_Story> get copyWith =>
      __$StoryCopyWithImpl<_Story>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StoryToJson(this);
  }
}

abstract class _Story implements Story {
  const factory _Story(
      {String id,
      int dateUpdated,
      bool? isPersitent,
      List<StoryContent> content,
      UserModel user}) = _$_Story;

  factory _Story.fromJson(Map<String, dynamic> json) = _$_Story.fromJson;

  @override
  String get id;
  @override
  int get dateUpdated;
  @override
  bool? get isPersitent;
  @override
  List<StoryContent> get content;
  @override
  UserModel get user;
  @override
  @JsonKey(ignore: true)
  _$StoryCopyWith<_Story> get copyWith => throw _privateConstructorUsedError;
}
