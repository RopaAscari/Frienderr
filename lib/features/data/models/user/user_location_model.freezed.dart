// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_location_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserLocationModel _$UserLocationModelFromJson(Map<String, dynamic> json) {
  return _UserLocationModel.fromJson(json);
}

/// @nodoc
class _$UserLocationModelTearOff {
  const _$UserLocationModelTearOff();

  _UserLocationModel call(
      {bool? latitude,
      String? longitude,
      String? bitmapImage,
      bool isLocationEnabled = false}) {
    return _UserLocationModel(
      latitude: latitude,
      longitude: longitude,
      bitmapImage: bitmapImage,
      isLocationEnabled: isLocationEnabled,
    );
  }

  UserLocationModel fromJson(Map<String, Object?> json) {
    return UserLocationModel.fromJson(json);
  }
}

/// @nodoc
const $UserLocationModel = _$UserLocationModelTearOff();

/// @nodoc
mixin _$UserLocationModel {
  bool? get latitude => throw _privateConstructorUsedError;
  String? get longitude => throw _privateConstructorUsedError;
  String? get bitmapImage => throw _privateConstructorUsedError;
  bool get isLocationEnabled => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserLocationModelCopyWith<UserLocationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserLocationModelCopyWith<$Res> {
  factory $UserLocationModelCopyWith(
          UserLocationModel value, $Res Function(UserLocationModel) then) =
      _$UserLocationModelCopyWithImpl<$Res>;
  $Res call(
      {bool? latitude,
      String? longitude,
      String? bitmapImage,
      bool isLocationEnabled});
}

/// @nodoc
class _$UserLocationModelCopyWithImpl<$Res>
    implements $UserLocationModelCopyWith<$Res> {
  _$UserLocationModelCopyWithImpl(this._value, this._then);

  final UserLocationModel _value;
  // ignore: unused_field
  final $Res Function(UserLocationModel) _then;

  @override
  $Res call({
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? bitmapImage = freezed,
    Object? isLocationEnabled = freezed,
  }) {
    return _then(_value.copyWith(
      latitude: latitude == freezed
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as bool?,
      longitude: longitude == freezed
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as String?,
      bitmapImage: bitmapImage == freezed
          ? _value.bitmapImage
          : bitmapImage // ignore: cast_nullable_to_non_nullable
              as String?,
      isLocationEnabled: isLocationEnabled == freezed
          ? _value.isLocationEnabled
          : isLocationEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$UserLocationModelCopyWith<$Res>
    implements $UserLocationModelCopyWith<$Res> {
  factory _$UserLocationModelCopyWith(
          _UserLocationModel value, $Res Function(_UserLocationModel) then) =
      __$UserLocationModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool? latitude,
      String? longitude,
      String? bitmapImage,
      bool isLocationEnabled});
}

/// @nodoc
class __$UserLocationModelCopyWithImpl<$Res>
    extends _$UserLocationModelCopyWithImpl<$Res>
    implements _$UserLocationModelCopyWith<$Res> {
  __$UserLocationModelCopyWithImpl(
      _UserLocationModel _value, $Res Function(_UserLocationModel) _then)
      : super(_value, (v) => _then(v as _UserLocationModel));

  @override
  _UserLocationModel get _value => super._value as _UserLocationModel;

  @override
  $Res call({
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? bitmapImage = freezed,
    Object? isLocationEnabled = freezed,
  }) {
    return _then(_UserLocationModel(
      latitude: latitude == freezed
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as bool?,
      longitude: longitude == freezed
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as String?,
      bitmapImage: bitmapImage == freezed
          ? _value.bitmapImage
          : bitmapImage // ignore: cast_nullable_to_non_nullable
              as String?,
      isLocationEnabled: isLocationEnabled == freezed
          ? _value.isLocationEnabled
          : isLocationEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserLocationModel implements _UserLocationModel {
  const _$_UserLocationModel(
      {this.latitude,
      this.longitude,
      this.bitmapImage,
      this.isLocationEnabled = false});

  factory _$_UserLocationModel.fromJson(Map<String, dynamic> json) =>
      _$$_UserLocationModelFromJson(json);

  @override
  final bool? latitude;
  @override
  final String? longitude;
  @override
  final String? bitmapImage;
  @JsonKey()
  @override
  final bool isLocationEnabled;

  @override
  String toString() {
    return 'UserLocationModel(latitude: $latitude, longitude: $longitude, bitmapImage: $bitmapImage, isLocationEnabled: $isLocationEnabled)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserLocationModel &&
            const DeepCollectionEquality().equals(other.latitude, latitude) &&
            const DeepCollectionEquality().equals(other.longitude, longitude) &&
            const DeepCollectionEquality()
                .equals(other.bitmapImage, bitmapImage) &&
            const DeepCollectionEquality()
                .equals(other.isLocationEnabled, isLocationEnabled));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(latitude),
      const DeepCollectionEquality().hash(longitude),
      const DeepCollectionEquality().hash(bitmapImage),
      const DeepCollectionEquality().hash(isLocationEnabled));

  @JsonKey(ignore: true)
  @override
  _$UserLocationModelCopyWith<_UserLocationModel> get copyWith =>
      __$UserLocationModelCopyWithImpl<_UserLocationModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserLocationModelToJson(this);
  }
}

abstract class _UserLocationModel implements UserLocationModel {
  const factory _UserLocationModel(
      {bool? latitude,
      String? longitude,
      String? bitmapImage,
      bool isLocationEnabled}) = _$_UserLocationModel;

  factory _UserLocationModel.fromJson(Map<String, dynamic> json) =
      _$_UserLocationModel.fromJson;

  @override
  bool? get latitude;
  @override
  String? get longitude;
  @override
  String? get bitmapImage;
  @override
  bool get isLocationEnabled;
  @override
  @JsonKey(ignore: true)
  _$UserLocationModelCopyWith<_UserLocationModel> get copyWith =>
      throw _privateConstructorUsedError;
}
