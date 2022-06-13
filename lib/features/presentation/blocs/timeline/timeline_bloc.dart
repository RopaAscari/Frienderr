import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frienderr/features/domain/entities/post.dart';
import 'package:frienderr/features/domain/usecases/timeline/get_posts_usecase.dart';
import 'package:frienderr/features/domain/usecases/timeline/get_post_stream_usecase.dart';
import 'package:frienderr/features/domain/usecases/timeline/get_paginated_posts_usecase.dart';

part 'timeline_event.dart';
part 'timeline_state.dart';
part 'timeline_bloc.freezed.dart';

@injectable
class TimelineBloc extends Bloc<TimelineEvent, TimelineState> {
  final GetPostsUseCase _getPostUsecase;
  final GetPostsStreamUseCase _getTimelineStreamUseCase;
  final GetPaginatedPostsUseCase _getPaginatedPostsUseCase;

  TimelineBloc(this._getPostUsecase, this._getTimelineStreamUseCase,
      this._getPaginatedPostsUseCase)
      : super(TimelineState(
            timelinePosts: TimelineResponse(posts: [], userCaughtUp: true))) {
    on<_FetchTimelinePosts>(_fetchTimelinePosts);
    on<_FetchTimelinePaginatedPosts>(_fetchTimelinePaginatedPosts);
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> get timeline {
    final either = _getTimelineStreamUseCase(GetTimelineStreamParams());
    return either.fold(
        (l) => defaultStream(const Duration(seconds: 5), 10), (r) => r);
  }

  Future<void> _fetchTimelinePosts(
      _FetchTimelinePosts event, Emitter<TimelineState> emit) async {
    emit(state.copyWith(status: TimelineStatus.Loading));

    final either = await _getPostUsecase(GetPostsParams());

    return either.fold((error) {
      emit(state.copyWith(error: error.message, status: TimelineStatus.Error));
    }, (TimelineResponse response) {
      emit(state.copyWith(
          timelinePosts: response, status: TimelineStatus.Loaded));
    });
  }

  Future<void> _fetchTimelinePaginatedPosts(
      _FetchTimelinePaginatedPosts event, Emitter<TimelineState> emit) async {
    emit(state.copyWith(status: TimelineStatus.Loading));

    final either =
        await _getPaginatedPostsUseCase(GetPaginatedPostsParams(posts: []));

    return either.fold((error) {
      emit(state.copyWith(error: error.message, status: TimelineStatus.Error));
    }, (TimelineResponse response) {
      emit(state.copyWith(
          timelinePosts: response, status: TimelineStatus.Loaded));
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
