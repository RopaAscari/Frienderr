part of 'camera_bloc.dart';

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
    @Default(CameraStatus.idle) CameraStatus currentState,
    @Default(CameraListenableAction.idle) CameraListenableAction action,
  }) = _CameraState;
}
