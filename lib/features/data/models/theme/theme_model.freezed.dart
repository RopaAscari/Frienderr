// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'theme_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ApplicationTheme _$ApplicationThemeFromJson(Map<String, dynamic> json) {
  return _ApplicationTheme.fromJson(json);
}

/// @nodoc
class _$ApplicationThemeTearOff {
  const _$ApplicationThemeTearOff();

  _ApplicationTheme call({String theme = 'dark'}) {
    return _ApplicationTheme(
      theme: theme,
    );
  }

  ApplicationTheme fromJson(Map<String, Object?> json) {
    return ApplicationTheme.fromJson(json);
  }
}

/// @nodoc
const $ApplicationTheme = _$ApplicationThemeTearOff();

/// @nodoc
mixin _$ApplicationTheme {
  String get theme => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ApplicationThemeCopyWith<ApplicationTheme> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApplicationThemeCopyWith<$Res> {
  factory $ApplicationThemeCopyWith(
          ApplicationTheme value, $Res Function(ApplicationTheme) then) =
      _$ApplicationThemeCopyWithImpl<$Res>;
  $Res call({String theme});
}

/// @nodoc
class _$ApplicationThemeCopyWithImpl<$Res>
    implements $ApplicationThemeCopyWith<$Res> {
  _$ApplicationThemeCopyWithImpl(this._value, this._then);

  final ApplicationTheme _value;
  // ignore: unused_field
  final $Res Function(ApplicationTheme) _then;

  @override
  $Res call({
    Object? theme = freezed,
  }) {
    return _then(_value.copyWith(
      theme: theme == freezed
          ? _value.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$ApplicationThemeCopyWith<$Res>
    implements $ApplicationThemeCopyWith<$Res> {
  factory _$ApplicationThemeCopyWith(
          _ApplicationTheme value, $Res Function(_ApplicationTheme) then) =
      __$ApplicationThemeCopyWithImpl<$Res>;
  @override
  $Res call({String theme});
}

/// @nodoc
class __$ApplicationThemeCopyWithImpl<$Res>
    extends _$ApplicationThemeCopyWithImpl<$Res>
    implements _$ApplicationThemeCopyWith<$Res> {
  __$ApplicationThemeCopyWithImpl(
      _ApplicationTheme _value, $Res Function(_ApplicationTheme) _then)
      : super(_value, (v) => _then(v as _ApplicationTheme));

  @override
  _ApplicationTheme get _value => super._value as _ApplicationTheme;

  @override
  $Res call({
    Object? theme = freezed,
  }) {
    return _then(_ApplicationTheme(
      theme: theme == freezed
          ? _value.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ApplicationTheme implements _ApplicationTheme {
  const _$_ApplicationTheme({this.theme = 'dark'});

  factory _$_ApplicationTheme.fromJson(Map<String, dynamic> json) =>
      _$$_ApplicationThemeFromJson(json);

  @JsonKey()
  @override
  final String theme;

  @override
  String toString() {
    return 'ApplicationTheme(theme: $theme)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ApplicationTheme &&
            const DeepCollectionEquality().equals(other.theme, theme));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(theme));

  @JsonKey(ignore: true)
  @override
  _$ApplicationThemeCopyWith<_ApplicationTheme> get copyWith =>
      __$ApplicationThemeCopyWithImpl<_ApplicationTheme>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ApplicationThemeToJson(this);
  }
}

abstract class _ApplicationTheme implements ApplicationTheme {
  const factory _ApplicationTheme({String theme}) = _$_ApplicationTheme;

  factory _ApplicationTheme.fromJson(Map<String, dynamic> json) =
      _$_ApplicationTheme.fromJson;

  @override
  String get theme;
  @override
  @JsonKey(ignore: true)
  _$ApplicationThemeCopyWith<_ApplicationTheme> get copyWith =>
      throw _privateConstructorUsedError;
}
