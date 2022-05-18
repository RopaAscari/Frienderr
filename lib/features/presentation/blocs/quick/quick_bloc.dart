import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:frienderr/features/domain/entities/media_asset.dart';
import 'package:frienderr/features/domain/usecases/quick/create_quick.dart';
import 'package:frienderr/features/domain/usecases/quick/delete_quick.dart';
import 'package:frienderr/features/domain/usecases/quick/like_quick.dart';
import 'package:frienderr/features/domain/usecases/quick/unlike_quick.dart';
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

  final CreateQuickUseCase _createQuicksUseCase;
  final DeleteQuickUseCase _deleteQuicksUseCase;
  final LikeQuickUseCase _likeQuicksUseCase;
  final UnLikeQuickUseCase _unLikeQuicksUseCase;
  QuickBloc(
      this._getQuicksUseCase,
      this._createQuicksUseCase,
      this._deleteQuicksUseCase,
      this._likeQuicksUseCase,
      this._unLikeQuicksUseCase)
      : super(QuickState()) {
    on<_LikeQuick>(_likeQuick);
    on<_CreateQuick>(_createQuick);
    on<_DeleteQuick>(_deleteQuick);
    on<_UnLikeQuick>(_unLikeQuick);
    on<_QuicksInitialized>(_onInitialize);
    on<_QuicksChange>(_onSnapChange);
    on<_PlaySnapAtIndex>(_playSnapAtIndex);
  }

  Future<void> _createQuick(
      _CreateQuick event, Emitter<QuickState> emit) async {
    final either = await _createQuicksUseCase(CreateQuicksParams(
      event.file,
      event.caption,
    ));

    return either.fold((error) {
      emit(state.copyWith(action: QuickListenableAction.creationFailure));
    }, (quicks) async {
      emit(state.copyWith(action: QuickListenableAction.created));
    });
  }

  Future<void> _deleteQuick(
      _DeleteQuick event, Emitter<QuickState> emit) async {
    final either =
        await _deleteQuicksUseCase(DeleteQuicksParams(event.quickId));

    return either.fold((error) {
      emit(state.copyWith(action: QuickListenableAction.deteleFailure));
    }, (quicks) async {
      emit(state.copyWith(action: QuickListenableAction.deleted));
    });
  }

  Future<void> _unLikeQuick(
      _UnLikeQuick event, Emitter<QuickState> emit) async {
    final either = await _unLikeQuicksUseCase(
        UnLikeQuicksParams(event.userId, event.quickId));

    return either.fold((error) {
      emit(state.copyWith(action: QuickListenableAction.unLikeFailure));
    }, (quicks) async {
      emit(state.copyWith(action: QuickListenableAction.unliked));
    });
  }

  Future<void> _likeQuick(_LikeQuick event, Emitter<QuickState> emit) async {
    final either =
        await _likeQuicksUseCase(LikeQuicksParams(event.userId, event.quickId));

    return either.fold((error) {
      emit(state.copyWith(action: QuickListenableAction.unLikeFailure));
    }, (quicks) async {
      emit(state.copyWith(action: QuickListenableAction.unliked));
    });
  }

  Future<void> _onInitialize(
      _QuicksInitialized event, Emitter<QuickState> emit) async {
    final either = await _getQuicksUseCase(GetQuicksParams());

    return either.fold(
      (error) {
        emit(state.copyWith(
            error: error.message,
            currentState: QuickStatus.error,
            action: QuickListenableAction.idle));
      },
      (quicks) async {
        emit(state.copyWith(
            quicks: quicks,
            currentState: QuickStatus.loaded,
            action: QuickListenableAction.idle));

        if (state.quicks.isNotEmpty) {
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
      print(state.controllers.length);

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
