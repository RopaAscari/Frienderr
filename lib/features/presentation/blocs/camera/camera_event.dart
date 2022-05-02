part of 'camera_bloc.dart';

@freezed
class CameraEvent with _$CameraEvent {
  const factory CameraEvent.initializeCamera() = _InitializeCamera;
  const factory CameraEvent.changeLens(
      {required CameraLensDirection direction}) = _ChangeLens;
  const factory CameraEvent.changeFlashMode({required FlashMode mode}) =
      _ChangeFlashMode;

  const factory CameraEvent.disposeCamera() = _DisposeCamera;
}
