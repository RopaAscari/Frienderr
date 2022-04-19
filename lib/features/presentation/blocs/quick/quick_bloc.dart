import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:video_player/video_player.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frienderr/features/domain/entities/quick.dart';
import 'package:frienderr/features/domain/usecases/quick/get_quicks.dart';

part 'quick_event.dart';
part 'quick_state.dart';
part 'quick_bloc.freezed.dart';

@injectable
class QuickBloc extends Bloc<QuickEvent, QuickState> {
  final GetQuickUseCase _getQuicksUseCase;
  QuickBloc(this._getQuicksUseCase) : super(QuickState()) {
    on<_QuicksInitialized>(_onInitialize);
    on<_QuicksChange>(_onSnapChange);
    on<_PlaySnapAtIndex>(_playSnapAtIndex);
  }

  Future<void> _onInitialize(
      _QuicksInitialized event, Emitter<QuickState> emit) async {
    final either = await _getQuicksUseCase(GetQuicksParams());

    return either.fold(
      (error) {},
      (quicks) async {
        emit(state.copyWith(quicks: quicks));

        if (state.quicks.length > 0) {
          await _initializeControllerAtIndex(0, emit);

          /// Initialize 2nd video
          await _initializeControllerAtIndex(1, emit);
        }
      },
    );
  }

  Future<void> _onSnapChange(
      _QuicksChange event, Emitter<QuickState> emit) async {
    if (event.index > state.focusedIndex) {
      _playNext(event.index, emit);
    } else {
      _playPrevious(event.index, emit);
    }

    emit(state.copyWith(focusedIndex: event.index));
  }

  Future<void> _playSnapAtIndex(
      _PlaySnapAtIndex event, Emitter<QuickState> emit) async {
    _playControllerAtIndex(event.index);
  }

  void _playNext(int index, Emitter<QuickState> emit) async {
    /// Stop [index - 1] controller
    _stopControllerAtIndex(index - 1);

    /// Play current video (already initialized)
    _playControllerAtIndex(index);

    /// Dispose [index - 2] controller
    _disposeControllerAtIndex(index - 2);

    /// Initialize [index + 1] controller
    await _initializeControllerAtIndex(index + 1, emit);
  }

  void _playPrevious(int index, Emitter<QuickState> emit) async {
    /// Stop [index + 1] controller
    _stopControllerAtIndex(index + 1);

    /// Dispose [index + 2] controller
    _disposeControllerAtIndex(index + 2);

    /// Play current video (already initialized)
    _playControllerAtIndex(index);

    /// Initialize [index - 1] controller
    await _initializeControllerAtIndex(index - 1, emit);
  }

  Future _initializeControllerAtIndex(int index, emit) async {
    if (state.quicks.length > index && index >= 0) {
      /// Create new controller
      final VideoPlayerController _controller =
          VideoPlayerController.network(state.quicks[index].url);

      List<VideoPlayerController> _controllers = List.from(state.controllers);

      if (_controllers.isEmpty) {
        _controllers =
            List.filled(state.quicks.length, _controller, growable: true);
      }

      _controllers[index] = _controller;

      emit(state.copyWith(controllers: _controllers));

      await _controller.initialize();
    }
  }

  void _playControllerAtIndex(int index) {
    if (state.quicks.length > index && index >= 0) {
      /// Get controller at [index]
      final VideoPlayerController _controller = state.controllers[index];

      /// Play controller
      _controller.play();
    }
  }

  void _stopControllerAtIndex(int index) {
    if (state.quicks.length > index && index >= 0) {
      /// Get controller at [index]
      final VideoPlayerController _controller = state.controllers[index];

      /// Pause
      _controller.pause();

      /// Reset postiton to beginning
      _controller.seekTo(const Duration());
    }
  }

  void _disposeControllerAtIndex(int index) {
    if (state.quicks.length > index && index >= 0) {
      /// Get controller at [index]
      final VideoPlayerController _controller = state.controllers[index];

      _controller.dispose();
    }
  }
}
