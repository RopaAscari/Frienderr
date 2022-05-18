// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'notification_metadata.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NotificationMetadata _$NotificationMetadataFromJson(Map<String, dynamic> json) {
  return _NotificationMetadata.fromJson(json);
}

/// @nodoc
class _$NotificationMetadataTearOff {
  const _$NotificationMetadataTearOff();

  _NotificationMetadata call({String? comment = null}) {
    return _NotificationMetadata(
      comment: comment,
    );
  }

  NotificationMetadata fromJson(Map<String, Object?> json) {
    return NotificationMetadata.fromJson(json);
  }
}

/// @nodoc
const $NotificationMetadata = _$NotificationMetadataTearOff();

/// @nodoc
mixin _$NotificationMetadata {
  String? get comment => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotificationMetadataCopyWith<NotificationMetadata> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationMetadataCopyWith<$Res> {
  factory $NotificationMetadataCopyWith(NotificationMetadata value,
          $Res Function(NotificationMetadata) then) =
      _$NotificationMetadataCopyWithImpl<$Res>;
  $Res call({String? comment});
}

/// @nodoc
class _$NotificationMetadataCopyWithImpl<$Res>
    implements $NotificationMetadataCopyWith<$Res> {
  _$NotificationMetadataCopyWithImpl(this._value, this._then);

  final NotificationMetadata _value;
  // ignore: unused_field
  final $Res Function(NotificationMetadata) _then;

  @override
  $Res call({
    Object? comment = freezed,
  }) {
    return _then(_value.copyWith(
      comment: comment == freezed
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$NotificationMetadataCopyWith<$Res>
    implements $NotificationMetadataCopyWith<$Res> {
  factory _$NotificationMetadataCopyWith(_NotificationMetadata value,
          $Res Function(_NotificationMetadata) then) =
      __$NotificationMetadataCopyWithImpl<$Res>;
  @override
  $Res call({String? comment});
}

/// @nodoc
class __$NotificationMetadataCopyWithImpl<$Res>
    extends _$NotificationMetadataCopyWithImpl<$Res>
    implements _$NotificationMetadataCopyWith<$Res> {
  __$NotificationMetadataCopyWithImpl(
      _NotificationMetadata _value, $Res Function(_NotificationMetadata) _then)
      : super(_value, (v) => _then(v as _NotificationMetadata));

  @override
  _NotificationMetadata get _value => super._value as _NotificationMetadata;

  @override
  $Res call({
    Object? comment = freezed,
  }) {
    return _then(_NotificationMetadata(
      comment: comment == freezed
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NotificationMetadata implements _NotificationMetadata {
  const _$_NotificationMetadata({this.comment = null});

  factory _$_NotificationMetadata.fromJson(Map<String, dynamic> json) =>
      _$$_NotificationMetadataFromJson(json);

  @JsonKey()
  @override
  final String? comment;

  @override
  String toString() {
    return 'NotificationMetadata(comment: $comment)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NotificationMetadata &&
            const DeepCollectionEquality().equals(other.comment, comment));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(comment));

  @JsonKey(ignore: true)
  @override
  _$NotificationMetadataCopyWith<_NotificationMetadata> get copyWith =>
      __$NotificationMetadataCopyWithImpl<_NotificationMetadata>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NotificationMetadataToJson(this);
  }
}

abstract class _NotificationMetadata implements NotificationMetadata {
  const factory _NotificationMetadata({String? comment}) =
      _$_NotificationMetadata;

  factory _NotificationMetadata.fromJson(Map<String, dynamic> json) =
      _$_NotificationMetadata.fromJson;

  @override
  String? get comment;
  @override
  @JsonKey(ignore: true)
  _$NotificationMetadataCopyWith<_NotificationMetadata> get copyWith =>
      throw _privateConstructorUsedError;
}
