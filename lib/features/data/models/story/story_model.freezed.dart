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

StoryModel _$StoryModelFromJson(Map<String, dynamic> json) {
  return _StoryModel.fromJson(json);
}

/// @nodoc
class _$StoryModelTearOff {
  const _$StoryModelTearOff();

  _StoryModel call(
      {String id = '',
      int dateUpdated = 0,
      List<StoryContent> content = const [],
      UserModel user = const UserModel(id: '')}) {
    return _StoryModel(
      id: id,
      dateUpdated: dateUpdated,
      content: content,
      user: user,
    );
  }

  StoryModel fromJson(Map<String, Object?> json) {
    return StoryModel.fromJson(json);
  }
}

/// @nodoc
const $StoryModel = _$StoryModelTearOff();

/// @nodoc
mixin _$StoryModel {
  String get id => throw _privateConstructorUsedError;
  int get dateUpdated => throw _privateConstructorUsedError;
  List<StoryContent> get content => throw _privateConstructorUsedError;
  UserModel get user => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StoryModelCopyWith<StoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoryModelCopyWith<$Res> {
  factory $StoryModelCopyWith(
          StoryModel value, $Res Function(StoryModel) then) =
      _$StoryModelCopyWithImpl<$Res>;
  $Res call(
      {String id, int dateUpdated, List<StoryContent> content, UserModel user});

  $UserModelCopyWith<$Res> get user;
}

/// @nodoc
class _$StoryModelCopyWithImpl<$Res> implements $StoryModelCopyWith<$Res> {
  _$StoryModelCopyWithImpl(this._value, this._then);

  final StoryModel _value;
  // ignore: unused_field
  final $Res Function(StoryModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? dateUpdated = freezed,
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
abstract class _$StoryModelCopyWith<$Res> implements $StoryModelCopyWith<$Res> {
  factory _$StoryModelCopyWith(
          _StoryModel value, $Res Function(_StoryModel) then) =
      __$StoryModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id, int dateUpdated, List<StoryContent> content, UserModel user});

  @override
  $UserModelCopyWith<$Res> get user;
}

/// @nodoc
class __$StoryModelCopyWithImpl<$Res> extends _$StoryModelCopyWithImpl<$Res>
    implements _$StoryModelCopyWith<$Res> {
  __$StoryModelCopyWithImpl(
      _StoryModel _value, $Res Function(_StoryModel) _then)
      : super(_value, (v) => _then(v as _StoryModel));

  @override
  _StoryModel get _value => super._value as _StoryModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? dateUpdated = freezed,
    Object? content = freezed,
    Object? user = freezed,
  }) {
    return _then(_StoryModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      dateUpdated: dateUpdated == freezed
          ? _value.dateUpdated
          : dateUpdated // ignore: cast_nullable_to_non_nullable
              as int,
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
class _$_StoryModel implements _StoryModel {
  const _$_StoryModel(
      {this.id = '',
      this.dateUpdated = 0,
      this.content = const [],
      this.user = const UserModel(id: '')});

  factory _$_StoryModel.fromJson(Map<String, dynamic> json) =>
      _$$_StoryModelFromJson(json);

  @JsonKey()
  @override
  final String id;
  @JsonKey()
  @override
  final int dateUpdated;
  @JsonKey()
  @override
  final List<StoryContent> content;
  @JsonKey()
  @override
  final UserModel user;

  @override
  String toString() {
    return 'StoryModel(id: $id, dateUpdated: $dateUpdated, content: $content, user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _StoryModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality()
                .equals(other.dateUpdated, dateUpdated) &&
            const DeepCollectionEquality().equals(other.content, content) &&
            const DeepCollectionEquality().equals(other.user, user));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(dateUpdated),
      const DeepCollectionEquality().hash(content),
      const DeepCollectionEquality().hash(user));

  @JsonKey(ignore: true)
  @override
  _$StoryModelCopyWith<_StoryModel> get copyWith =>
      __$StoryModelCopyWithImpl<_StoryModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StoryModelToJson(this);
  }
}

abstract class _StoryModel implements StoryModel {
  const factory _StoryModel(
      {String id,
      int dateUpdated,
      List<StoryContent> content,
      UserModel user}) = _$_StoryModel;

  factory _StoryModel.fromJson(Map<String, dynamic> json) =
      _$_StoryModel.fromJson;

  @override
  String get id;
  @override
  int get dateUpdated;
  @override
  List<StoryContent> get content;
  @override
  UserModel get user;
  @override
  @JsonKey(ignore: true)
  _$StoryModelCopyWith<_StoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}
