import 'dart:io';
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:frienderr/core/injection/injection.dart';
import 'package:frienderr/core/services/video_service.dart';
import 'package:injectable/injectable.dart';
import 'package:video_player/video_player.dart';
import 'package:frienderr/core/constants/constants.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cached_video_player/cached_video_player.dart';
import 'package:frienderr/features/data/models/snap/snap_model.dart';
import 'package:frienderr/features/domain/usecases/quick/like_snap.dart';
import 'package:frienderr/features/domain/usecases/quick/get_snaps.dart';
import 'package:frienderr/features/domain/usecases/quick/create_snap.dart';
import 'package:frienderr/features/domain/usecases/quick/delete_snap.dart';
import 'package:frienderr/features/domain/usecases/quick/unlike_snap.dart';
import 'package:frienderr/features/domain/usecases/quick/get_paginated_snaps.dart';

part 'snap_event.dart';
part 'snap_state.dart';
part 'snap_bloc.freezed.dart';

@injectable
class SnapBloc extends Bloc<SnapEvent, SnapState> {
  final GetSnapUseCase _getSnapsUseCase;
  final LikeSnapUseCase _likeSnapUseCase;
  final CreateSnapUseCase _createSnapUseCase;
  final DeleteSnapUseCase _deleteSnapUseCase;
  final UnLikeSnapUseCase _unLikeSnapUseCase;
  final GetPaginatedSnapsUseCase _getPaginatedSnapsUseCase;
  SnapBloc(
      this._getSnapsUseCase,
      this._likeSnapUseCase,
      this._createSnapUseCase,
      this._deleteSnapUseCase,
      this._unLikeSnapUseCase,
      this._getPaginatedSnapsUseCase)
      : super(SnapState()) {
    on<_LikeSnap>(_likeSnap);
    on<_CreateSnap>(_createSnap);
    on<_DeleteSnap>(_deleteSnap);
    on<_UnLikeSnap>(_unLikeSnap);
    on<_SnapsChange>(_onSnapChange);
    on<_SnapsInitialized>(_onInitialize);
    on<_PlaySnapAtIndex>(_playSnapAtIndex);
    on<_GetPaginatedSnaps>(_getPaginatedSnaps);
  }

  Future<void> _createSnap(_CreateSnap event, Emitter<SnapState> emit) async {
    emit(state.copyWith(action: SnapListenableAction.idle));
    final either = await _createSnapUseCase(CreateSnapsParams(
      event.file,
      event.caption,
    ));

    return either.fold((error) {
      emit(state.copyWith(action: SnapListenableAction.creationFailure));
    }, (quicks) async {
      emit(state.copyWith(action: SnapListenableAction.created));
    });
  }

  Future<void> _deleteSnap(_DeleteSnap event, Emitter<SnapState> emit) async {
    emit(state.copyWith(action: SnapListenableAction.idle));
    final either = await _deleteSnapUseCase(DeleteSnapParams(event.snapId));

    return either.fold((error) {
      log('failure ${error.message}');
      emit(state.copyWith(action: SnapListenableAction.deteleFailure));
    }, (quicks) async {
      log('success $quicks');
      final index =
          state.snaps.indexWhere((element) => element.id == event.snapId);

      await state.controllers[index].pause();
      await state.controllers[index].dispose();

      state.controllers.removeAt(index);
      state.snaps.removeWhere((element) => element.id == event.snapId);

      emit(state.copyWith(action: SnapListenableAction.deleted));
    });
  }

  Future<void> _unLikeSnap(_UnLikeSnap event, Emitter<SnapState> emit) async {
    emit(state.copyWith(action: SnapListenableAction.idle));
    final either =
        await _unLikeSnapUseCase(UnLikeSnapsParams(event.userId, event.snapId));

    return either.fold((error) {
      emit(state.copyWith(action: SnapListenableAction.unLikeFailure));
    }, (quicks) async {
      emit(state.copyWith(action: SnapListenableAction.unliked));
    });
  }

  Future<void> _likeSnap(_LikeSnap event, Emitter<SnapState> emit) async {
    emit(state.copyWith(action: SnapListenableAction.idle));
    final either =
        await _likeSnapUseCase(LikeSnapParams(event.userId, event.snapId));

    return either.fold((error) {
      emit(state.copyWith(action: SnapListenableAction.unLikeFailure));
    }, (quicks) async {
      emit(state.copyWith(action: SnapListenableAction.unliked));
    });
  }

  Future<void> _getPaginatedSnaps(
      _GetPaginatedSnaps event, Emitter<SnapState> emit) async {
    emit(state.copyWith(action: SnapListenableAction.idle));
    emit(state.copyWith(isPaginationLoading: true));

    final prevSnap = state.snaps[state.snaps.length - 1];

    final either =
        await _getPaginatedSnapsUseCase(GetPaginatedSnapsParams(prevSnap));

    return either.fold(
      (error) {
        emit(state.copyWith(
            paginationError: error.message, isPaginationLoading: false));
      },
      (newSnaps) async {
        if (newSnaps.isEmpty) {
          emit(state.copyWith(
              isPaginationLoading: true, reachedMaximumThreshold: true));
          return;
        }
        emit(state.copyWith(isPaginationLoading: false));

        List<Snap> _oldSnaps = List.from(state.snaps);

        List<VideoPlayerController> _controllers = List.from(state.controllers);

        newSnaps.asMap().forEach((index, value) async => _controllers.add(
            await getService<VideoControllerService>()
                .getControllerForVideo(newSnaps[index].url)));

        final _snaps = [..._oldSnaps, ...newSnaps];

        emit(state.copyWith(
          snaps: _snaps,
          controllers: _controllers,
          reachedMaximumThreshold:
              newSnaps.length < Constants.pageSize || newSnaps.length == 1,
        ));

        if (state.snaps.isNotEmpty) {
          await _initializeControllerAtIndex(state.focusedIndex + 1, emit);
        }
      },
    );
  }

  Future<void> _onInitialize(
      _SnapsInitialized event, Emitter<SnapState> emit) async {
    emit(state.copyWith(action: SnapListenableAction.idle));
    final either = await _getSnapsUseCase(GetSnapsParams());

    if (state.snaps.isNotEmpty) {
      emit(state.copyWith(snaps: []));
    }

    return either.fold(
      (error) {
        emit(state.copyWith(
            error: error.message,
            currentState: SnapStatus.error,
            action: SnapListenableAction.idle));
      },
      (snaps) async {
        emit(state.copyWith(
            snaps: snaps,
            currentState: SnapStatus.loaded,
            action: SnapListenableAction.idle));

        if (state.snaps.isNotEmpty) {
          await _initializeControllerAtIndex(0, emit);

          /// Initialize 2nd video
          await _initializeControllerAtIndex(1, emit);
        }
      },
    );
  }

  Future<void> _onSnapChange(
      _SnapsChange event, Emitter<SnapState> emit) async {
    emit(state.copyWith(action: SnapListenableAction.idle));
    if (event.index > state.focusedIndex) {
      _playNext(event.index, emit);
    } else {
      _playPrevious(event.index, emit);
    }

    emit(state.copyWith(focusedIndex: event.index));
  }

  Future<void> _playSnapAtIndex(
      _PlaySnapAtIndex event, Emitter<SnapState> emit) async {
    _playControllerAtIndex(event.index);
  }

  void _playNext(int index, Emitter<SnapState> emit) async {
    /// Stop [index - 1] controller
    _stopControllerAtIndex(index - 1);

    /// Play current video (already initialized)
    _playControllerAtIndex(index);

    /// Dispose [index - 2] controller
    _disposeControllerAtIndex(index - 2);

    /// Initialize [index + 1] controller
    await _initializeControllerAtIndex(index + 1, emit);

    // await _initializeControllerAtIndex(index + 2, emit);
  }

  void _playPrevious(int index, Emitter<SnapState> emit) async {
    /// Stop [index + 1] controller
    _stopControllerAtIndex(index + 1);

    /// Dispose [index + 2] controller
    _disposeControllerAtIndex(index + 2);

    /// Play current video (already initialized)
    _playControllerAtIndex(index);

    /// Initialize [index - 1] controller
    await _initializeControllerAtIndex(index - 1, emit);

    //await _initializeControllerAtIndex(index - 2, emit);
  }

  Future _initializeControllerAtIndex(int index, emit) async {
    if (state.snaps.length > index && index >= 0) {
      /// Create new controller
      final VideoPlayerController _controller =
          await getService<VideoControllerService>()
              .getControllerForVideo(state.snaps[index].url);

      List<VideoPlayerController> _controllers = List.from(state.controllers);

      if (_controllers.isEmpty) {
        _controllers =
            List.filled(state.snaps.length, _controller, growable: true);
      }

      _controllers[index] = _controller;

      emit(state.copyWith(controllers: _controllers));
      await _controller.initialize();
    }
  }

  void _playControllerAtIndex(int index) {
    if (state.snaps.length > index && index >= 0) {
      /// Get controller at [index]
      final VideoPlayerController _controller = state.controllers[index];

      if (!_controller.value.hasError || !_controller.value.isInitialized) {
        /// Play controller
        _controller.play();
      }
    }
  }

  void _stopControllerAtIndex(int index) {
    if (state.snaps.length > index && index >= 0) {
      /// Get controller at [index]
      final VideoPlayerController _controller = state.controllers[index];
      if (!_controller.value.hasError || !_controller.value.isInitialized) {
        /// Pause
        _controller.pause();

        /// Reset postiton to beginning
        _controller.seekTo(const Duration());
      }
    }
  }

  void _disposeControllerAtIndex(int index) {
    if (state.snaps.length > index && index >= 0) {
      /// Get controller at [index]
      final VideoPlayerController _controller = state.controllers[index];

      _controller.dispose();
    }
  }
}
