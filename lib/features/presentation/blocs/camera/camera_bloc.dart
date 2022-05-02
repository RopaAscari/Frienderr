import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:camera/camera.dart';
import 'package:injectable/injectable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'camera_event.dart';
part 'camera_state.dart';
part 'camera_bloc.freezed.dart';

@injectable
class CameraBloc extends Bloc<CameraEvent, CameraState> {
  CameraBloc() : super(CameraState(controller: null)) {
    on<_ChangeLens>(_changeLens);
    on<_InitializeCamera>(_initializeCamera);
    on<_ChangeFlashMode>(_changeFlashMode);
    on<_DisposeCamera>(_disposeCamera);
  }

  Future<void> _changeLens(_ChangeLens event, Emitter<CameraState> emit) async {
    try {
      // emit(state.copyWith(currentState: CameraStatus.Initializing));

      CameraDescription camera = state.cameras
          .firstWhere((camera) => camera.lensDirection == event.direction);

      await state.controller?.dispose();

      final _controller = CameraController(
        camera,
        ResolutionPreset.medium,
      );

      await _controller.initialize();

      emit(state.copyWith(
          controller: _controller, action: CameraListenableAction.lensChanged));
    } catch (error) {
      emit(state.copyWith(currentState: CameraStatus.error));
    }
  }

  Future<void> _initializeCamera(
      _InitializeCamera event, Emitter<CameraState> emit) async {
    try {
      emit(state.copyWith(currentState: CameraStatus.initializing));

      final cameras = await availableCameras();
      final firstCamera = cameras.first;

      final _controller = CameraController(
        firstCamera,
        ResolutionPreset.medium,
      );

      await _controller.initialize();

      emit(state.copyWith(
        cameras: cameras,
        controller: _controller,
        currentState: CameraStatus.initialized,
      ));
    } catch (error) {
      emit(state.copyWith(currentState: CameraStatus.error));
    }
  }

  Future<void> _changeFlashMode(
      _ChangeFlashMode event, Emitter<CameraState> emit) async {
    try {
      CameraListenableAction action = CameraListenableAction.idle;

      state.controller?.setFlashMode(event.mode);

      if (event.mode == FlashMode.off) {
        action = CameraListenableAction.flashToggledOff;
      } else if (event.mode == FlashMode.torch) {
        action = CameraListenableAction.flashToggledOn;
      }
      emit(state.copyWith(
        action: action,
        controller: state.controller,
      ));
    } catch (error) {
      emit(state.copyWith(currentState: CameraStatus.error));
    }
  }

  Future<void> _disposeCamera(
      _DisposeCamera event, Emitter<CameraState> emit) async {
    try {
      state.controller?.dispose();
    } catch (error) {
      emit(state.copyWith(currentState: CameraStatus.error));
    }
  }
}
