import 'package:bloc/bloc.dart';

import 'package:injectable/injectable.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frienderr/features/domain/entities/user.dart';
import 'package:frienderr/features/domain/entities/post.dart';
import 'package:frienderr/features/domain/entities/media_asset.dart';
import 'package:frienderr/features/domain/usecases/post/like_post_usecase.dart';
import 'package:frienderr/features/domain/usecases/post/unlike_post_usecase.dart';
import 'package:frienderr/features/domain/usecases/post/create_post_usecase.dart';
import 'package:frienderr/features/domain/usecases/post/delete_post_usecase.dart';
import 'package:frienderr/features/domain/usecases/timeline/get_posts_usecase.dart';
import 'package:frienderr/features/domain/usecases/timeline/get_post_stream_usecase.dart';
import 'package:frienderr/features/domain/usecases/timeline/get_paginated_posts_usecase.dart';

part 'post_event.dart';
part 'post_state.dart';
part 'post_bloc.freezed.dart';

@injectable
class PostBloc extends Bloc<PostEvent, PostState> {
  final GetPostsUseCase _getPostUsecase;
  final LikePostUseCase _likePostUseCase;
  final CreatePostUseCase _createPostUseCase;
  final UnLikePostUseCase _unLikePostUseCase;
  final DeletePostUseCase _deletePostUseCase;
  final GetPostsStreamUseCase _getTimelineStreamUseCase;
  final GetPaginatedPostsUseCase _getPaginatedPostsUseCase;
  PostBloc(
      this._getPostUsecase,
      this._likePostUseCase,
      this._createPostUseCase,
      this._unLikePostUseCase,
      this._deletePostUseCase,
      this._getTimelineStreamUseCase,
      this._getPaginatedPostsUseCase)
      : super(PostState(
            timelinePosts: TimelineResponse(posts: [], userCaughtUp: true))) {
    on<_LikePost>(_likePost);
    on<_UnLikePost>(_unLikePost);
    on<_DeletePost>(_deletePost);
    on<_CreatePost>(_createPost);
    on<_FetchTimelinePosts>(_fetchTimelinePosts);
    on<_FetchTimelinePaginatedPosts>(_fetchTimelinePaginatedPosts);
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> get timeline {
    final either = _getTimelineStreamUseCase(GetTimelineStreamParams());
    return either.fold(
        (l) => defaultStream(Duration(seconds: 5), 10), (r) => r);
  }

  Future<void> _fetchTimelinePosts(
      _FetchTimelinePosts event, Emitter<PostState> emit) async {
    if (event.shouldLoad) {
      emit(state.copyWith(
          currentState: PostStatus.loading, action: PostListenableAction.idle));
    }

    final either = await _getPostUsecase(GetPostsParams());

    return either.fold((error) {
      emit(state.copyWith(
          error: error.message, action: PostListenableAction.failure));
    }, (TimelineResponse response) {
      emit(state.copyWith(
          timelinePosts: response,
          currentState: PostStatus.loaded,
          action: PostListenableAction.idle));
    });
  }

  Future<void> _fetchTimelinePaginatedPosts(
      _FetchTimelinePaginatedPosts event, Emitter<PostState> emit) async {
    // emit(state.copyWith(currentState: PostStatus.loading));

    final List<Map<String, dynamic>> posts =
        state.timelinePosts.posts.map((post) {
      final map = {
        'id': post.id,
        'likes': post.likes,
        'shares': post.shares,
        'caption': post.caption,
        'user': {'id': post.user.id},
        'dateCreated': post.dateCreated,
        'commentCount': post.commentCount,
        'content': post.content.map((x) {
          return {
            'type': x.type,
            'media': x.media,
            'metadata': {
              'thumbnail': x.metadata.thumbnail,
            },
          };
        }).toList(),
      };
      return map;
    }).toList();
    final either =
        await _getPaginatedPostsUseCase(GetPaginatedPostsParams(posts: posts));

    return either.fold((error) {
      emit(state.copyWith(
          error: error.message, action: PostListenableAction.failure));
    }, (TimelineResponse response) {
      emit(state.copyWith(
          timelinePosts: response, currentState: PostStatus.loaded));
    });
  }

  Future<void> _createPost(_CreatePost event, Emitter<PostState> emit) async {
    final either = await _createPostUseCase(
        CreatePostParams(caption: event.caption, assets: event.assets));

    return either.fold((l) {
      emit(state.copyWith(action: PostListenableAction.failure));
    }, (r) {
      emit(state.copyWith(action: PostListenableAction.created));
    });
  }

  Future<void> _likePost(_LikePost event, Emitter<PostState> emit) async {
    final either =
        await _likePostUseCase(LikePostParams(event.post, event.user));

    return either.fold((l) {
      emit(state.copyWith(action: PostListenableAction.likeFailure));
    }, (r) {
      emit(state.copyWith(action: PostListenableAction.liked));
    });
  }

  Future<void> _unLikePost(_UnLikePost event, Emitter<PostState> emit) async {
    final either =
        await _unLikePostUseCase(UnLikePostParams(event.postId, event.userId));

    return either.fold((l) {
      emit(state.copyWith(action: PostListenableAction.failure));
    }, (r) {
      emit(state.copyWith(action: PostListenableAction.unliked));
    });
  }

  Future<void> _deletePost(_DeletePost event, Emitter<PostState> emit) async {
    final either = await _deletePostUseCase(DeletePostParams(event.postId));

    return either.fold((l) {
      emit(state.copyWith(action: PostListenableAction.failure));
    }, (r) {
      emit(state.copyWith(action: PostListenableAction.deleted));
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
