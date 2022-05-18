import 'package:bloc/bloc.dart';
import 'package:frienderr/features/data/models/story/story_content.dart';
import 'package:frienderr/features/domain/entities/media_asset.dart';
import 'package:frienderr/features/domain/usecases/story/delete_story_usecase.dart';
import 'package:frienderr/features/domain/usecases/story/view_story_usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frienderr/features/domain/entities/story.dart';
import 'package:frienderr/features/domain/usecases/story/get_story_usecase.dart';
import 'package:frienderr/features/domain/usecases/story/create_story_usecase.dart';
import 'package:frienderr/features/domain/usecases/story/update_story_usecase.dart';
import 'package:frienderr/features/domain/usecases/story/get_story_stream_usecase.dart';

part 'story_state.dart';
part 'story_event.dart';
part 'story_bloc.freezed.dart';

@injectable
class StoryBloc extends Bloc<StoryEvent, StoryState> {
  final GetStoryUseCase _getStoryUseCase;
  final CreateStoryUseCase _createStoryUseCase;
  final UpdateStoryUseCase _updateStoryUseCase;
  final DeleteStoryUseCase _deleteStoryUseCase;
  final ViewStoryUseCase _viewStoryStreamUseCase;
  final GetStoryStreamUseCase _getStoryStreamUseCase;

  StoryBloc(
    this._getStoryUseCase,
    this._updateStoryUseCase,
    this._createStoryUseCase,
    this._deleteStoryUseCase,
    this._getStoryStreamUseCase,
    this._viewStoryStreamUseCase,
  ) : super(StoryState(
            stories: StoryResponse(
                stories: [],
                userStory:
                    UserStory(story: null, doesUserHaveStories: false)))) {
    on<_ViewStory>(_viewStory);
    on<_LoadStories>(_loadStories);
    on<_CreateStory>(_createStory);
    on<_UpdateStory>(_updateStory);
    on<_DeleteStory>(_deleteStory);
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> get stories {
    final either = _getStoryStreamUseCase(GetStoryStreamParams(''));
    return either.fold(
        (l) => defaultStream(Duration(seconds: 5), 10), (r) => r);
  }

  Future<void> _loadStories(
      _LoadStories event, Emitter<StoryState> emit) async {
    final either = await _getStoryUseCase(GetStoryParams(event.userId));

    return either.fold((error) {
      emit(state.copyWith(error: error.message, status: StoryStatus.error));
    }, (StoryResponse response) {
      emit(state.copyWith(stories: response, status: StoryStatus.loaded));
    });
  }

  Future<void> _createStory(
      _CreateStory event, Emitter<StoryState> emit) async {
    final either = await _createStoryUseCase(CreateStoryParams(event.assets));

    return either.fold((error) {
      emit(state.copyWith(action: StoryListenableAction.creationFailure));
    }, (bool response) {
      if (!response) {
        emit(state.copyWith(action: StoryListenableAction.creationFailure));
        return;
      }
      emit(state.copyWith(action: StoryListenableAction.created));
    });
  }

  Future<void> _updateStory(
      _UpdateStory event, Emitter<StoryState> emit) async {
    final either = await _updateStoryUseCase(
        UpdateStoryParams(event.userId, event.assets));

    return either.fold((error) {
      emit(state.copyWith(action: StoryListenableAction.updateFailure));
    }, (bool response) {
      if (!response) {
        emit(state.copyWith(action: StoryListenableAction.updateFailure));
        return;
      }
      emit(state.copyWith(action: StoryListenableAction.updated));
    });
  }

  Future<void> _viewStory(_ViewStory event, Emitter<StoryState> emit) async {
    final either = await _viewStoryStreamUseCase(
        ViewStoryParams(event.userId, event.storyId, event.stories));

    return either.fold((error) {
      print(error.message);
      emit(state.copyWith(action: StoryListenableAction.viewFailure));
    }, (bool response) {
      if (!response) {
        emit(state.copyWith(action: StoryListenableAction.viewFailure));
        return;
      }
      emit(state.copyWith(action: StoryListenableAction.viewed));
    });
  }

  Future<void> _deleteStory(
      _DeleteStory event, Emitter<StoryState> emit) async {
    final either = await _deleteStoryUseCase(
        DeleteStoryParams(event.isLast, event.userId, event.story));

    return either.fold((error) {
      print(error.message);
      emit(state.copyWith(action: StoryListenableAction.deteleFailure));
    }, (bool response) {
      if (!response) {
        emit(state.copyWith(action: StoryListenableAction.deteleFailure));
        return;
      }
      emit(state.copyWith(action: StoryListenableAction.deleted));
    });
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> defaultStream(Duration interval,
      [int? maxCount]) async* {
    int i = 0;
    while (true) {
      await Future.delayed(interval);
      i++;
      yield {} as QuerySnapshot<Map<String, dynamic>>;
      if (i == maxCount) break;
    }
  }
}
