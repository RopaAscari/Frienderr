import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:frienderr/features/domain/entities/story_view.dart';
import 'package:injectable/injectable.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:frienderr/core/constants/constants.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frienderr/features/domain/entities/story.dart';
import 'package:frienderr/features/domain/entities/media_asset.dart';
import 'package:frienderr/features/data/models/user/user_model.dart';
import 'package:frienderr/features/data/models/story/story_model.dart';
import 'package:frienderr/features/data/models/story/story_content.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:frienderr/features/domain/usecases/story/get_story_usecase.dart';
import 'package:frienderr/features/domain/usecases/story/view_story_usecase.dart';
import 'package:frienderr/features/presentation/extensions/paging_controller.dart';
import 'package:frienderr/features/domain/usecases/story/delete_story_usecase.dart';
import 'package:frienderr/features/domain/usecases/story/create_story_usecase.dart';
import 'package:frienderr/features/domain/usecases/story/update_story_usecase.dart';
import 'package:frienderr/features/domain/usecases/story/get_story_stream_usecase.dart';
import 'package:frienderr/features/domain/usecases/story/get_story_viewers_usecase.dart';
import 'package:frienderr/features/domain/usecases/story/get_paginated_story_usecase.dart';
import 'package:frienderr/features/domain/usecases/story/get_paginated_story_viewers_usecase.dart.dart';

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
  final GetStoryViewersUseCase _getStoryViewersUseCase;
  final GetPaginatedStoryUseCase _getPaginatedStoryUseCase;
  final GetPaginatedStoryViewersUseCase _getPaginatedStoryViewersUseCase;

  StoryBloc(
      this._getStoryUseCase,
      this._updateStoryUseCase,
      this._createStoryUseCase,
      this._deleteStoryUseCase,
      this._getStoryStreamUseCase,
      this._viewStoryStreamUseCase,
      this._getStoryViewersUseCase,
      this._getPaginatedStoryUseCase,
      this._getPaginatedStoryViewersUseCase)
      : super(StoryState(
          reachedMaximumThreshold: false,
          previousStoryViewerTimestamp: 0,
          storyViewsReachedMaximumThreshold: false,
          userStory: UserStory(story: null, doesUserHaveStories: false),
          paginationController:
              PagingController(firstPageKey: 0, invisibleItemsThreshold: 1),
          storyViewsPaginationController:
              PagingController(firstPageKey: 0, invisibleItemsThreshold: 1),
        )) {
    on<_ViewStory>(_viewStory);
    on<_CreateStory>(_createStory);
    on<_UpdateStory>(_updateStory);
    on<_DeleteStory>(_deleteStory);
    on<_ResetState>(_resetState);
    on<_FetchStories>(_fetchStories);
    on<_FetchStoryViewers>(_fetchStoryViewers);
    on<_FetchPaginatedStories>(_fetchPaginatedStories);
    on<_FetchPaginatedStoryViewers>(_fetchPaginatedStoryViewers);
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> get stories {
    final either = _getStoryStreamUseCase(GetStoryStreamParams(''));
    return either.fold(
        (l) => defaultStream(const Duration(seconds: 5), 10), (r) => r);
  }

  Future<void> _resetState(_ResetState event, Emitter<StoryState> emit) async {
    emit(state.copyWith(action: StoryListenableAction.idle));
  }

  Future<void> _fetchStories(
      _FetchStories event, Emitter<StoryState> emit) async {
    emit(state.copyWith(action: StoryListenableAction.idle));
    final either = await _getStoryUseCase(GetStoryParams(event.userId));

    return either.fold((error) {
      state.paginationController.error = error.message;
    }, (StoryResponse response) {
      if (state.paginationController.itemList != null &&
          state.paginationController.itemList!.isNotEmpty) {
        state.paginationController.reset();
      }

      if (response.stories.length < Constants.pageSize ||
          response.stories.length == 1) {
        state.paginationController.appendLastPage(response.stories);
        emit(state.copyWith(reachedMaximumThreshold: true));
      } else {
        int nextPageKey = state.paginationController.nextPageKey ?? 0;
        nextPageKey++;

        state.paginationController.appendPage(response.stories, nextPageKey);
      }
      emit(state.copyWith(userStory: response.userStory));
    });
  }

  Future<void> _fetchPaginatedStories(
      _FetchPaginatedStories event, Emitter<StoryState> emit) async {
    emit(state.copyWith(action: StoryListenableAction.idle));
    final previousStory = state.paginationController
        .itemList![state.paginationController.itemList!.length - 1];
    final either = await _getPaginatedStoryUseCase(
        GetPaginatedStoryParams(event.userId, previousStory));

    return either.fold((error) {
      state.paginationController.error = error.message;
    }, (StoryResponse response) {
      if (response.stories.length < Constants.pageSize) {
        state.paginationController.appendLastPage(response.stories);
        emit(state.copyWith(reachedMaximumThreshold: true));
      } else {
        int nextPageKey = state.paginationController.nextPageKey ?? 0;
        nextPageKey++;

        state.paginationController.appendPage(response.stories, nextPageKey);
      }
      emit(state.copyWith(userStory: response.userStory));
    });
  }

  Future<void> _createStory(
      _CreateStory event, Emitter<StoryState> emit) async {
    emit(state.copyWith(action: StoryListenableAction.idle));
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
    emit(state.copyWith(action: StoryListenableAction.idle));
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
    emit(state.copyWith(action: StoryListenableAction.idle));
    final either = await _viewStoryStreamUseCase(ViewStoryParams(
        event.userId, event.storyId, event.stories, event.contentId));

    return either.fold((error) {
      emit(state.copyWith(action: StoryListenableAction.viewFailure));
    }, (bool response) {
      if (!response) {
        emit(state.copyWith(action: StoryListenableAction.viewFailure));
        return;
      }
      emit(state.copyWith(action: StoryListenableAction.viewed));

      int index = state.paginationController.itemList!.indexWhere((x) {
        return x.id == event.storyId;
      });

      if (index < 0) {
        return;
      }

      final _story = state.paginationController.itemList![index];

      final _storyItem = Story(
          id: _story.id,
          user: _story.user,
          dateUpdated: _story.dateUpdated,
          isPersitent: _story.isPersitent,
          content: _story.content.map((x) {
            return StoryContent(
              id: x.id,
              media: x.media,
              reactions: x.reactions,
              dateCreated: x.dateCreated,
              isViewed: event.contentId == x.id,
            );
          }).toList());

      state.paginationController.itemList![index] = _storyItem;
    });
  }

  Future<void> _deleteStory(
      _DeleteStory event, Emitter<StoryState> emit) async {
    emit(state.copyWith(action: StoryListenableAction.idle));
    final either = await _deleteStoryUseCase(
        DeleteStoryParams(event.isLast, event.userId, event.content));

    return either.fold((error) {
      log(error.message);
      emit(state.copyWith(action: StoryListenableAction.deteleFailure));
    }, (bool response) {
      if (!response) {
        emit(state.copyWith(action: StoryListenableAction.deteleFailure));
        return;
      }
      emit(state.copyWith(action: StoryListenableAction.deleted));
    });
  }

  Future<void> _fetchStoryViewers(
      _FetchStoryViewers event, Emitter<StoryState> emit) async {
    emit(state.copyWith(action: StoryListenableAction.idle));
    final either = await _getStoryViewersUseCase(
        GetStoryViewersParams(event.userId, event.contentId));

    return either.fold((error) {
      log(error.message);
      state.storyViewsPaginationController.error = error.message;
    }, (StoryViewResponse response) {
      if (state.storyViewsPaginationController.itemList != null &&
          state.storyViewsPaginationController.itemList!.isNotEmpty) {
        state.storyViewsPaginationController.reset();
      }

      if (response.users.length < Constants.pageSize ||
          response.users.length == 1) {
        state.storyViewsPaginationController.appendLastPage(response.users);
        emit(state.copyWith(storyViewsReachedMaximumThreshold: true));
      } else {
        int nextPageKey = state.storyViewsPaginationController.nextPageKey ?? 0;
        nextPageKey++;

        state.storyViewsPaginationController
            .appendPage(response.users, nextPageKey);
      }

      emit(state.copyWith(
          previousStoryViewerTimestamp: response.previousStoryViewerTimestamp));
    });
  }

  Future<void> _fetchPaginatedStoryViewers(
      _FetchPaginatedStoryViewers event, Emitter<StoryState> emit) async {
    emit(state.copyWith(action: StoryListenableAction.idle));
    final either = await _getPaginatedStoryViewersUseCase(
        GetPaginatedStoryViewersParams(
            event.userId, event.contentId, state.previousStoryViewerTimestamp));

    return either.fold((error) {
      state.storyViewsPaginationController.error = error.message;
    }, (StoryViewResponse response) {
      if (response.users.length < Constants.pageSize ||
          response.users.length == 1) {
        state.storyViewsPaginationController.appendLastPage(response.users);
        emit(state.copyWith(storyViewsReachedMaximumThreshold: true));
      } else {
        int nextPageKey = state.storyViewsPaginationController.nextPageKey ?? 0;
        nextPageKey++;

        state.storyViewsPaginationController
            .appendPage(response.users, nextPageKey);
      }
      emit(state.copyWith(
          previousStoryViewerTimestamp: response.previousStoryViewerTimestamp));
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
