part of 'camera_bloc.dart';

enum CameraFeatureMode {
  flash,
  timer,
  filter,
  artboard,
  mutliselect,
}

enum CameraStatus { idle, error, initialized, initializing }

enum CameraListenableAction {
  idle,
  lensChanged,
  flashToggledOn,
  flashToggledOff
}

@freezed
class CameraState with _$CameraState {
  const factory CameraState({
    required CameraController? controller,
    @Default([]) List<CameraDescription> cameras,
    //required CameraDeepArController? deepArController,
    @Default(CameraStatus.idle) CameraStatus currentState,
    @Default(featureList) List<FeatureListItem> cameraFeatureList,
    @Default(subFeatureList) List<FeatureListItem> cameraSubFeatureList,
    @Default(selectionModes) List<SelectionModeItem> cameraSelectionModes,
    @Default(CameraListenableAction.idle) CameraListenableAction action,
  }) = _CameraState;
}
