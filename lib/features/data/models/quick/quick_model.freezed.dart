// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'quick_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

QuickModel _$QuickModelFromJson(Map<String, dynamic> json) {
  return _QuickModel.fromJson(json);
}

/// @nodoc
class _$QuickModelTearOff {
  const _$QuickModelTearOff();

  _QuickModel call({String url = ''}) {
    return _QuickModel(
      url: url,
    );
  }

  QuickModel fromJson(Map<String, Object?> json) {
    return QuickModel.fromJson(json);
  }
}

/// @nodoc
const $QuickModel = _$QuickModelTearOff();

/// @nodoc
mixin _$QuickModel {
  String get url => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuickModelCopyWith<QuickModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuickModelCopyWith<$Res> {
  factory $QuickModelCopyWith(
          QuickModel value, $Res Function(QuickModel) then) =
      _$QuickModelCopyWithImpl<$Res>;
  $Res call({String url});
}

/// @nodoc
class _$QuickModelCopyWithImpl<$Res> implements $QuickModelCopyWith<$Res> {
  _$QuickModelCopyWithImpl(this._value, this._then);

  final QuickModel _value;
  // ignore: unused_field
  final $Res Function(QuickModel) _then;

  @override
  $Res call({
    Object? url = freezed,
  }) {
    return _then(_value.copyWith(
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$QuickModelCopyWith<$Res> implements $QuickModelCopyWith<$Res> {
  factory _$QuickModelCopyWith(
          _QuickModel value, $Res Function(_QuickModel) then) =
      __$QuickModelCopyWithImpl<$Res>;
  @override
  $Res call({String url});
}

/// @nodoc
class __$QuickModelCopyWithImpl<$Res> extends _$QuickModelCopyWithImpl<$Res>
    implements _$QuickModelCopyWith<$Res> {
  __$QuickModelCopyWithImpl(
      _QuickModel _value, $Res Function(_QuickModel) _then)
      : super(_value, (v) => _then(v as _QuickModel));

  @override
  _QuickModel get _value => super._value as _QuickModel;

  @override
  $Res call({
    Object? url = freezed,
  }) {
    return _then(_QuickModel(
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_QuickModel implements _QuickModel {
  const _$_QuickModel({this.url = ''});

  factory _$_QuickModel.fromJson(Map<String, dynamic> json) =>
      _$$_QuickModelFromJson(json);

  @JsonKey()
  @override
  final String url;

  @override
  String toString() {
    return 'QuickModel(url: $url)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _QuickModel &&
            const DeepCollectionEquality().equals(other.url, url));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(url));

  @JsonKey(ignore: true)
  @override
  _$QuickModelCopyWith<_QuickModel> get copyWith =>
      __$QuickModelCopyWithImpl<_QuickModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_QuickModelToJson(this);
  }
}

abstract class _QuickModel implements QuickModel {
  const factory _QuickModel({String url}) = _$_QuickModel;

  factory _QuickModel.fromJson(Map<String, dynamic> json) =
      _$_QuickModel.fromJson;

  @override
  String get url;
  @override
  @JsonKey(ignore: true)
  _$QuickModelCopyWith<_QuickModel> get copyWith =>
      throw _privateConstructorUsedError;
}
