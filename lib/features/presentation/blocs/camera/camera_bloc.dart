import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:camera/camera.dart';
import 'package:injectable/injectable.dart';
import 'package:camera_deep_ar/camera_deep_ar.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frienderr/features/presentation/screens/camera/feature_list.dart';

part 'camera_event.dart';
part 'camera_state.dart';
part 'camera_bloc.freezed.dart';

@injectable
class CameraBloc extends Bloc<CameraEvent, CameraState> {
  CameraBloc()
      : super(const CameraState(controller: null, deepArController: null)) {
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

      final _deepArController = CameraDeepArController(const DeepArConfig(
        androidKey:
            "3332daabda1e0784d08dec6da756646d57d37eb12e0ba28db523a8736c284ce605d24eac43a0c22f",
        ioskey:
            "dc808d1cde5684e23b18993334f96b54fb99730bc1b9f53ab16b2b1587bd39b8967d4195efeacf95",
        displayMode: DisplayMode.camera,
// displayMode: DisplayMode.camera,
      ));

      await _controller.initialize();

      emit(state.copyWith(
        cameras: cameras,
        controller: _controller,
        deepArController: _deepArController,
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
