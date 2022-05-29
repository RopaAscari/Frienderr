// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'camera_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$CameraEventTearOff {
  const _$CameraEventTearOff();

  _InitializeCamera initializeCamera() {
    return const _InitializeCamera();
  }

  _ChangeLens changeLens({required CameraLensDirection direction}) {
    return _ChangeLens(
      direction: direction,
    );
  }

  _ChangeFlashMode changeFlashMode({required FlashMode mode}) {
    return _ChangeFlashMode(
      mode: mode,
    );
  }

  _DisposeCamera disposeCamera() {
    return const _DisposeCamera();
  }
}

/// @nodoc
const $CameraEvent = _$CameraEventTearOff();

/// @nodoc
mixin _$CameraEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializeCamera,
    required TResult Function(CameraLensDirection direction) changeLens,
    required TResult Function(FlashMode mode) changeFlashMode,
    required TResult Function() disposeCamera,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initializeCamera,
    TResult Function(CameraLensDirection direction)? changeLens,
    TResult Function(FlashMode mode)? changeFlashMode,
    TResult Function()? disposeCamera,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializeCamera,
    TResult Function(CameraLensDirection direction)? changeLens,
    TResult Function(FlashMode mode)? changeFlashMode,
    TResult Function()? disposeCamera,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitializeCamera value) initializeCamera,
    required TResult Function(_ChangeLens value) changeLens,
    required TResult Function(_ChangeFlashMode value) changeFlashMode,
    required TResult Function(_DisposeCamera value) disposeCamera,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_InitializeCamera value)? initializeCamera,
    TResult Function(_ChangeLens value)? changeLens,
    TResult Function(_ChangeFlashMode value)? changeFlashMode,
    TResult Function(_DisposeCamera value)? disposeCamera,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitializeCamera value)? initializeCamera,
    TResult Function(_ChangeLens value)? changeLens,
    TResult Function(_ChangeFlashMode value)? changeFlashMode,
    TResult Function(_DisposeCamera value)? disposeCamera,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CameraEventCopyWith<$Res> {
  factory $CameraEventCopyWith(
          CameraEvent value, $Res Function(CameraEvent) then) =
      _$CameraEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$CameraEventCopyWithImpl<$Res> implements $CameraEventCopyWith<$Res> {
  _$CameraEventCopyWithImpl(this._value, this._then);

  final CameraEvent _value;
  // ignore: unused_field
  final $Res Function(CameraEvent) _then;
}

/// @nodoc
abstract class _$InitializeCameraCopyWith<$Res> {
  factory _$InitializeCameraCopyWith(
          _InitializeCamera value, $Res Function(_InitializeCamera) then) =
      __$InitializeCameraCopyWithImpl<$Res>;
}

/// @nodoc
class __$InitializeCameraCopyWithImpl<$Res>
    extends _$CameraEventCopyWithImpl<$Res>
    implements _$InitializeCameraCopyWith<$Res> {
  __$InitializeCameraCopyWithImpl(
      _InitializeCamera _value, $Res Function(_InitializeCamera) _then)
      : super(_value, (v) => _then(v as _InitializeCamera));

  @override
  _InitializeCamera get _value => super._value as _InitializeCamera;
}

/// @nodoc

class _$_InitializeCamera implements _InitializeCamera {
  const _$_InitializeCamera();

  @override
  String toString() {
    return 'CameraEvent.initializeCamera()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _InitializeCamera);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializeCamera,
    required TResult Function(CameraLensDirection direction) changeLens,
    required TResult Function(FlashMode mode) changeFlashMode,
    required TResult Function() disposeCamera,
  }) {
    return initializeCamera();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initializeCamera,
    TResult Function(CameraLensDirection direction)? changeLens,
    TResult Function(FlashMode mode)? changeFlashMode,
    TResult Function()? disposeCamera,
  }) {
    return initializeCamera?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializeCamera,
    TResult Function(CameraLensDirection direction)? changeLens,
    TResult Function(FlashMode mode)? changeFlashMode,
    TResult Function()? disposeCamera,
    required TResult orElse(),
  }) {
    if (initializeCamera != null) {
      return initializeCamera();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitializeCamera value) initializeCamera,
    required TResult Function(_ChangeLens value) changeLens,
    required TResult Function(_ChangeFlashMode value) changeFlashMode,
    required TResult Function(_DisposeCamera value) disposeCamera,
  }) {
    return initializeCamera(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_InitializeCamera value)? initializeCamera,
    TResult Function(_ChangeLens value)? changeLens,
    TResult Function(_ChangeFlashMode value)? changeFlashMode,
    TResult Function(_DisposeCamera value)? disposeCamera,
  }) {
    return initializeCamera?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitializeCamera value)? initializeCamera,
    TResult Function(_ChangeLens value)? changeLens,
    TResult Function(_ChangeFlashMode value)? changeFlashMode,
    TResult Function(_DisposeCamera value)? disposeCamera,
    required TResult orElse(),
  }) {
    if (initializeCamera != null) {
      return initializeCamera(this);
    }
    return orElse();
  }
}

abstract class _InitializeCamera implements CameraEvent {
  const factory _InitializeCamera() = _$_InitializeCamera;
}

/// @nodoc
abstract class _$ChangeLensCopyWith<$Res> {
  factory _$ChangeLensCopyWith(
          _ChangeLens value, $Res Function(_ChangeLens) then) =
      __$ChangeLensCopyWithImpl<$Res>;
  $Res call({CameraLensDirection direction});
}

/// @nodoc
class __$ChangeLensCopyWithImpl<$Res> extends _$CameraEventCopyWithImpl<$Res>
    implements _$ChangeLensCopyWith<$Res> {
  __$ChangeLensCopyWithImpl(
      _ChangeLens _value, $Res Function(_ChangeLens) _then)
      : super(_value, (v) => _then(v as _ChangeLens));

  @override
  _ChangeLens get _value => super._value as _ChangeLens;

  @override
  $Res call({
    Object? direction = freezed,
  }) {
    return _then(_ChangeLens(
      direction: direction == freezed
          ? _value.direction
          : direction // ignore: cast_nullable_to_non_nullable
              as CameraLensDirection,
    ));
  }
}

/// @nodoc

class _$_ChangeLens implements _ChangeLens {
  const _$_ChangeLens({required this.direction});

  @override
  final CameraLensDirection direction;

  @override
  String toString() {
    return 'CameraEvent.changeLens(direction: $direction)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChangeLens &&
            const DeepCollectionEquality().equals(other.direction, direction));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(direction));

  @JsonKey(ignore: true)
  @override
  _$ChangeLensCopyWith<_ChangeLens> get copyWith =>
      __$ChangeLensCopyWithImpl<_ChangeLens>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializeCamera,
    required TResult Function(CameraLensDirection direction) changeLens,
    required TResult Function(FlashMode mode) changeFlashMode,
    required TResult Function() disposeCamera,
  }) {
    return changeLens(direction);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initializeCamera,
    TResult Function(CameraLensDirection direction)? changeLens,
    TResult Function(FlashMode mode)? changeFlashMode,
    TResult Function()? disposeCamera,
  }) {
    return changeLens?.call(direction);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializeCamera,
    TResult Function(CameraLensDirection direction)? changeLens,
    TResult Function(FlashMode mode)? changeFlashMode,
    TResult Function()? disposeCamera,
    required TResult orElse(),
  }) {
    if (changeLens != null) {
      return changeLens(direction);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitializeCamera value) initializeCamera,
    required TResult Function(_ChangeLens value) changeLens,
    required TResult Function(_ChangeFlashMode value) changeFlashMode,
    required TResult Function(_DisposeCamera value) disposeCamera,
  }) {
    return changeLens(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_InitializeCamera value)? initializeCamera,
    TResult Function(_ChangeLens value)? changeLens,
    TResult Function(_ChangeFlashMode value)? changeFlashMode,
    TResult Function(_DisposeCamera value)? disposeCamera,
  }) {
    return changeLens?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitializeCamera value)? initializeCamera,
    TResult Function(_ChangeLens value)? changeLens,
    TResult Function(_ChangeFlashMode value)? changeFlashMode,
    TResult Function(_DisposeCamera value)? disposeCamera,
    required TResult orElse(),
  }) {
    if (changeLens != null) {
      return changeLens(this);
    }
    return orElse();
  }
}

abstract class _ChangeLens implements CameraEvent {
  const factory _ChangeLens({required CameraLensDirection direction}) =
      _$_ChangeLens;

  CameraLensDirection get direction;
  @JsonKey(ignore: true)
  _$ChangeLensCopyWith<_ChangeLens> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$ChangeFlashModeCopyWith<$Res> {
  factory _$ChangeFlashModeCopyWith(
          _ChangeFlashMode value, $Res Function(_ChangeFlashMode) then) =
      __$ChangeFlashModeCopyWithImpl<$Res>;
  $Res call({FlashMode mode});
}

/// @nodoc
class __$ChangeFlashModeCopyWithImpl<$Res>
    extends _$CameraEventCopyWithImpl<$Res>
    implements _$ChangeFlashModeCopyWith<$Res> {
  __$ChangeFlashModeCopyWithImpl(
      _ChangeFlashMode _value, $Res Function(_ChangeFlashMode) _then)
      : super(_value, (v) => _then(v as _ChangeFlashMode));

  @override
  _ChangeFlashMode get _value => super._value as _ChangeFlashMode;

  @override
  $Res call({
    Object? mode = freezed,
  }) {
    return _then(_ChangeFlashMode(
      mode: mode == freezed
          ? _value.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as FlashMode,
    ));
  }
}

/// @nodoc

class _$_ChangeFlashMode implements _ChangeFlashMode {
  const _$_ChangeFlashMode({required this.mode});

  @override
  final FlashMode mode;

  @override
  String toString() {
    return 'CameraEvent.changeFlashMode(mode: $mode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChangeFlashMode &&
            const DeepCollectionEquality().equals(other.mode, mode));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(mode));

  @JsonKey(ignore: true)
  @override
  _$ChangeFlashModeCopyWith<_ChangeFlashMode> get copyWith =>
      __$ChangeFlashModeCopyWithImpl<_ChangeFlashMode>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializeCamera,
    required TResult Function(CameraLensDirection direction) changeLens,
    required TResult Function(FlashMode mode) changeFlashMode,
    required TResult Function() disposeCamera,
  }) {
    return changeFlashMode(mode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initializeCamera,
    TResult Function(CameraLensDirection direction)? changeLens,
    TResult Function(FlashMode mode)? changeFlashMode,
    TResult Function()? disposeCamera,
  }) {
    return changeFlashMode?.call(mode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializeCamera,
    TResult Function(CameraLensDirection direction)? changeLens,
    TResult Function(FlashMode mode)? changeFlashMode,
    TResult Function()? disposeCamera,
    required TResult orElse(),
  }) {
    if (changeFlashMode != null) {
      return changeFlashMode(mode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitializeCamera value) initializeCamera,
    required TResult Function(_ChangeLens value) changeLens,
    required TResult Function(_ChangeFlashMode value) changeFlashMode,
    required TResult Function(_DisposeCamera value) disposeCamera,
  }) {
    return changeFlashMode(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_InitializeCamera value)? initializeCamera,
    TResult Function(_ChangeLens value)? changeLens,
    TResult Function(_ChangeFlashMode value)? changeFlashMode,
    TResult Function(_DisposeCamera value)? disposeCamera,
  }) {
    return changeFlashMode?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitializeCamera value)? initializeCamera,
    TResult Function(_ChangeLens value)? changeLens,
    TResult Function(_ChangeFlashMode value)? changeFlashMode,
    TResult Function(_DisposeCamera value)? disposeCamera,
    required TResult orElse(),
  }) {
    if (changeFlashMode != null) {
      return changeFlashMode(this);
    }
    return orElse();
  }
}

abstract class _ChangeFlashMode implements CameraEvent {
  const factory _ChangeFlashMode({required FlashMode mode}) =
      _$_ChangeFlashMode;

  FlashMode get mode;
  @JsonKey(ignore: true)
  _$ChangeFlashModeCopyWith<_ChangeFlashMode> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$DisposeCameraCopyWith<$Res> {
  factory _$DisposeCameraCopyWith(
          _DisposeCamera value, $Res Function(_DisposeCamera) then) =
      __$DisposeCameraCopyWithImpl<$Res>;
}

/// @nodoc
class __$DisposeCameraCopyWithImpl<$Res> extends _$CameraEventCopyWithImpl<$Res>
    implements _$DisposeCameraCopyWith<$Res> {
  __$DisposeCameraCopyWithImpl(
      _DisposeCamera _value, $Res Function(_DisposeCamera) _then)
      : super(_value, (v) => _then(v as _DisposeCamera));

  @override
  _DisposeCamera get _value => super._value as _DisposeCamera;
}

/// @nodoc

class _$_DisposeCamera implements _DisposeCamera {
  const _$_DisposeCamera();

  @override
  String toString() {
    return 'CameraEvent.disposeCamera()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _DisposeCamera);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializeCamera,
    required TResult Function(CameraLensDirection direction) changeLens,
    required TResult Function(FlashMode mode) changeFlashMode,
    required TResult Function() disposeCamera,
  }) {
    return disposeCamera();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initializeCamera,
    TResult Function(CameraLensDirection direction)? changeLens,
    TResult Function(FlashMode mode)? changeFlashMode,
    TResult Function()? disposeCamera,
  }) {
    return disposeCamera?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializeCamera,
    TResult Function(CameraLensDirection direction)? changeLens,
    TResult Function(FlashMode mode)? changeFlashMode,
    TResult Function()? disposeCamera,
    required TResult orElse(),
  }) {
    if (disposeCamera != null) {
      return disposeCamera();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitializeCamera value) initializeCamera,
    required TResult Function(_ChangeLens value) changeLens,
    required TResult Function(_ChangeFlashMode value) changeFlashMode,
    required TResult Function(_DisposeCamera value) disposeCamera,
  }) {
    return disposeCamera(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_InitializeCamera value)? initializeCamera,
    TResult Function(_ChangeLens value)? changeLens,
    TResult Function(_ChangeFlashMode value)? changeFlashMode,
    TResult Function(_DisposeCamera value)? disposeCamera,
  }) {
    return disposeCamera?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitializeCamera value)? initializeCamera,
    TResult Function(_ChangeLens value)? changeLens,
    TResult Function(_ChangeFlashMode value)? changeFlashMode,
    TResult Function(_DisposeCamera value)? disposeCamera,
    required TResult orElse(),
  }) {
    if (disposeCamera != null) {
      return disposeCamera(this);
    }
    return orElse();
  }
}

abstract class _DisposeCamera implements CameraEvent {
  const factory _DisposeCamera() = _$_DisposeCamera;
}

/// @nodoc
class _$CameraStateTearOff {
  const _$CameraStateTearOff();

  _CameraState call(
      {required CameraController? controller,
      List<CameraDescription> cameras = const [],
      CameraStatus currentState = CameraStatus.idle,
      List<FeatureListItem> cameraFeatureList = featureList,
      List<FeatureListItem> cameraSubFeatureList = subFeatureList,
      List<SelectionModeItem> cameraSelectionModes = selectionModes,
      CameraListenableAction action = CameraListenableAction.idle}) {
    return _CameraState(
      controller: controller,
      cameras: cameras,
      currentState: currentState,
      cameraFeatureList: cameraFeatureList,
      cameraSubFeatureList: cameraSubFeatureList,
      cameraSelectionModes: cameraSelectionModes,
      action: action,
    );
  }
}

/// @nodoc
const $CameraState = _$CameraStateTearOff();

/// @nodoc
mixin _$CameraState {
  CameraController? get controller => throw _privateConstructorUsedError;
  List<CameraDescription> get cameras =>
      throw _privateConstructorUsedError; //required CameraDeepArController? deepArController,
  CameraStatus get currentState => throw _privateConstructorUsedError;
  List<FeatureListItem> get cameraFeatureList =>
      throw _privateConstructorUsedError;
  List<FeatureListItem> get cameraSubFeatureList =>
      throw _privateConstructorUsedError;
  List<SelectionModeItem> get cameraSelectionModes =>
      throw _privateConstructorUsedError;
  CameraListenableAction get action => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CameraStateCopyWith<CameraState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CameraStateCopyWith<$Res> {
  factory $CameraStateCopyWith(
          CameraState value, $Res Function(CameraState) then) =
      _$CameraStateCopyWithImpl<$Res>;
  $Res call(
      {CameraController? controller,
      List<CameraDescription> cameras,
      CameraStatus currentState,
      List<FeatureListItem> cameraFeatureList,
      List<FeatureListItem> cameraSubFeatureList,
      List<SelectionModeItem> cameraSelectionModes,
      CameraListenableAction action});
}

/// @nodoc
class _$CameraStateCopyWithImpl<$Res> implements $CameraStateCopyWith<$Res> {
  _$CameraStateCopyWithImpl(this._value, this._then);

  final CameraState _value;
  // ignore: unused_field
  final $Res Function(CameraState) _then;

  @override
  $Res call({
    Object? controller = freezed,
    Object? cameras = freezed,
    Object? currentState = freezed,
    Object? cameraFeatureList = freezed,
    Object? cameraSubFeatureList = freezed,
    Object? cameraSelectionModes = freezed,
    Object? action = freezed,
  }) {
    return _then(_value.copyWith(
      controller: controller == freezed
          ? _value.controller
          : controller // ignore: cast_nullable_to_non_nullable
              as CameraController?,
      cameras: cameras == freezed
          ? _value.cameras
          : cameras // ignore: cast_nullable_to_non_nullable
              as List<CameraDescription>,
      currentState: currentState == freezed
          ? _value.currentState
          : currentState // ignore: cast_nullable_to_non_nullable
              as CameraStatus,
      cameraFeatureList: cameraFeatureList == freezed
          ? _value.cameraFeatureList
          : cameraFeatureList // ignore: cast_nullable_to_non_nullable
              as List<FeatureListItem>,
      cameraSubFeatureList: cameraSubFeatureList == freezed
          ? _value.cameraSubFeatureList
          : cameraSubFeatureList // ignore: cast_nullable_to_non_nullable
              as List<FeatureListItem>,
      cameraSelectionModes: cameraSelectionModes == freezed
          ? _value.cameraSelectionModes
          : cameraSelectionModes // ignore: cast_nullable_to_non_nullable
              as List<SelectionModeItem>,
      action: action == freezed
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as CameraListenableAction,
    ));
  }
}

/// @nodoc
abstract class _$CameraStateCopyWith<$Res>
    implements $CameraStateCopyWith<$Res> {
  factory _$CameraStateCopyWith(
          _CameraState value, $Res Function(_CameraState) then) =
      __$CameraStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {CameraController? controller,
      List<CameraDescription> cameras,
      CameraStatus currentState,
      List<FeatureListItem> cameraFeatureList,
      List<FeatureListItem> cameraSubFeatureList,
      List<SelectionModeItem> cameraSelectionModes,
      CameraListenableAction action});
}

/// @nodoc
class __$CameraStateCopyWithImpl<$Res> extends _$CameraStateCopyWithImpl<$Res>
    implements _$CameraStateCopyWith<$Res> {
  __$CameraStateCopyWithImpl(
      _CameraState _value, $Res Function(_CameraState) _then)
      : super(_value, (v) => _then(v as _CameraState));

  @override
  _CameraState get _value => super._value as _CameraState;

  @override
  $Res call({
    Object? controller = freezed,
    Object? cameras = freezed,
    Object? currentState = freezed,
    Object? cameraFeatureList = freezed,
    Object? cameraSubFeatureList = freezed,
    Object? cameraSelectionModes = freezed,
    Object? action = freezed,
  }) {
    return _then(_CameraState(
      controller: controller == freezed
          ? _value.controller
          : controller // ignore: cast_nullable_to_non_nullable
              as CameraController?,
      cameras: cameras == freezed
          ? _value.cameras
          : cameras // ignore: cast_nullable_to_non_nullable
              as List<CameraDescription>,
      currentState: currentState == freezed
          ? _value.currentState
          : currentState // ignore: cast_nullable_to_non_nullable
              as CameraStatus,
      cameraFeatureList: cameraFeatureList == freezed
          ? _value.cameraFeatureList
          : cameraFeatureList // ignore: cast_nullable_to_non_nullable
              as List<FeatureListItem>,
      cameraSubFeatureList: cameraSubFeatureList == freezed
          ? _value.cameraSubFeatureList
          : cameraSubFeatureList // ignore: cast_nullable_to_non_nullable
              as List<FeatureListItem>,
      cameraSelectionModes: cameraSelectionModes == freezed
          ? _value.cameraSelectionModes
          : cameraSelectionModes // ignore: cast_nullable_to_non_nullable
              as List<SelectionModeItem>,
      action: action == freezed
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as CameraListenableAction,
    ));
  }
}

/// @nodoc

class _$_CameraState implements _CameraState {
  const _$_CameraState(
      {required this.controller,
      this.cameras = const [],
      this.currentState = CameraStatus.idle,
      this.cameraFeatureList = featureList,
      this.cameraSubFeatureList = subFeatureList,
      this.cameraSelectionModes = selectionModes,
      this.action = CameraListenableAction.idle});

  @override
  final CameraController? controller;
  @JsonKey()
  @override
  final List<CameraDescription> cameras;
  @JsonKey()
  @override //required CameraDeepArController? deepArController,
  final CameraStatus currentState;
  @JsonKey()
  @override
  final List<FeatureListItem> cameraFeatureList;
  @JsonKey()
  @override
  final List<FeatureListItem> cameraSubFeatureList;
  @JsonKey()
  @override
  final List<SelectionModeItem> cameraSelectionModes;
  @JsonKey()
  @override
  final CameraListenableAction action;

  @override
  String toString() {
    return 'CameraState(controller: $controller, cameras: $cameras, currentState: $currentState, cameraFeatureList: $cameraFeatureList, cameraSubFeatureList: $cameraSubFeatureList, cameraSelectionModes: $cameraSelectionModes, action: $action)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CameraState &&
            const DeepCollectionEquality()
                .equals(other.controller, controller) &&
            const DeepCollectionEquality().equals(other.cameras, cameras) &&
            const DeepCollectionEquality()
                .equals(other.currentState, currentState) &&
            const DeepCollectionEquality()
                .equals(other.cameraFeatureList, cameraFeatureList) &&
            const DeepCollectionEquality()
                .equals(other.cameraSubFeatureList, cameraSubFeatureList) &&
            const DeepCollectionEquality()
                .equals(other.cameraSelectionModes, cameraSelectionModes) &&
            const DeepCollectionEquality().equals(other.action, action));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(controller),
      const DeepCollectionEquality().hash(cameras),
      const DeepCollectionEquality().hash(currentState),
      const DeepCollectionEquality().hash(cameraFeatureList),
      const DeepCollectionEquality().hash(cameraSubFeatureList),
      const DeepCollectionEquality().hash(cameraSelectionModes),
      const DeepCollectionEquality().hash(action));

  @JsonKey(ignore: true)
  @override
  _$CameraStateCopyWith<_CameraState> get copyWith =>
      __$CameraStateCopyWithImpl<_CameraState>(this, _$identity);
}

abstract class _CameraState implements CameraState {
  const factory _CameraState(
      {required CameraController? controller,
      List<CameraDescription> cameras,
      CameraStatus currentState,
      List<FeatureListItem> cameraFeatureList,
      List<FeatureListItem> cameraSubFeatureList,
      List<SelectionModeItem> cameraSelectionModes,
      CameraListenableAction action}) = _$_CameraState;

  @override
  CameraController? get controller;
  @override
  List<CameraDescription> get cameras;
  @override //required CameraDeepArController? deepArController,
  CameraStatus get currentState;
  @override
  List<FeatureListItem> get cameraFeatureList;
  @override
  List<FeatureListItem> get cameraSubFeatureList;
  @override
  List<SelectionModeItem> get cameraSelectionModes;
  @override
  CameraListenableAction get action;
  @override
  @JsonKey(ignore: true)
  _$CameraStateCopyWith<_CameraState> get copyWith =>
      throw _privateConstructorUsedError;
}
