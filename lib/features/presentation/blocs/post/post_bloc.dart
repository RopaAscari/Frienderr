import 'dart:async';
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:frienderr/core/enums/enums.dart';
import 'package:frienderr/core/injection/injection.dart';
import 'package:frienderr/features/data/models/post/post_reaction_model.dart';
import 'package:frienderr/features/data/models/user/user_model.dart';
import 'package:frienderr/features/domain/entities/save_post.dart';
import 'package:frienderr/features/domain/usecases/post/create_status_post_usecase.dart';
import 'package:frienderr/features/domain/usecases/post/save_post_usecase.dart';
import 'package:frienderr/features/domain/usecases/post/share_post_usacase.dart';
import 'package:frienderr/features/domain/usecases/post/unsave_post_usecase.dart';
import 'package:frienderr/features/domain/usecases/post/update_post_reaction_usecase.dart';
import 'package:frienderr/features/domain/usecases/timeline/get_posts_usecase.dart';
import 'package:frienderr/features/presentation/navigation/app_router.dart';
import 'package:frienderr/features/presentation/widgets/snackbar_message.dart';

import 'package:injectable/injectable.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frienderr/features/domain/entities/user.dart';
import 'package:frienderr/features/domain/entities/post.dart';
import 'package:frienderr/features/domain/entities/media_asset.dart';
import 'package:frienderr/features/data/models/post/post_model.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:frienderr/features/domain/usecases/post/react_post_usecase.dart';
import 'package:frienderr/features/domain/usecases/post/unreact_post_usecase.dart';
import 'package:frienderr/features/domain/usecases/post/create_post_usecase.dart';
import 'package:frienderr/features/domain/usecases/post/delete_post_usecase.dart';
import 'package:frienderr/features/presentation/extensions/paging_controller.dart';
import 'package:frienderr/features/domain/usecases/timeline/get_post_usecase.dart';
import 'package:frienderr/features/domain/usecases/timeline/get_post_stream_usecase.dart';
import 'package:frienderr/features/domain/usecases/timeline/get_paginated_posts_usecase.dart';

part 'post_event.dart';
part 'post_state.dart';
part 'post_bloc.freezed.dart';

@injectable
class PostBloc extends Bloc<PostEvent, PostState> {
  final GetPostUseCase _getPostUsecase;
  final GetPostsUseCase _getPostsUsecase;
  final SavePostUseCase _savePostUseCase;
  final SharePostUseCase _sharePostuseCase;
  final UnSavePostUseCase _unSavePostUseCase;
  final CreatePostUseCase _createPostUseCase;
  final DeletePostUseCase _deletePostUseCase;
  final ReactToPostUseCase _reactToPostUseCase;
  final UnReactToPostUseCase _unReactToPostUseCase;
  final GetPostsStreamUseCase _getTimelineStreamUseCase;
  final CreateStatusPostUseCase _createStatusPostUseCase;
  final GetPaginatedPostsUseCase _getPaginatedPostsUseCase;
  final UpdatePostReactionUseCase _updatePostReactionUseCase;
  PostBloc(
      this._getPostUsecase,
      this._sharePostuseCase,
      this._savePostUseCase,
      this._getPostsUsecase,
      this._unSavePostUseCase,
      this._createPostUseCase,
      this._deletePostUseCase,
      this._reactToPostUseCase,
      this._unReactToPostUseCase,
      this._createStatusPostUseCase,
      this._getPaginatedPostsUseCase,
      this._getTimelineStreamUseCase,
      this._updatePostReactionUseCase)
      : super(PostState(
          reachedMaximumThreshold: false,
          paginationController:
              PagingController(firstPageKey: 0, invisibleItemsThreshold: 1),
        )) {
    on<_GetPost>(_getPost);
    on<_SavePost>(_savePost);
    on<_ReactPost>(_likePost);
    on<_SharePost>(_sharePost);
    on<_DeletePost>(_deletePost);
    on<_CreatePost>(_createPost);
    on<_UnSavePost>(_unSavePost);
    on<_UnReactPost>(_unLikePost);
    on<_UpdateReactPost>(_updateReaction);
    on<_CreateStatusPost>(_createStatusPost);
    on<_FetchTimelinePosts>(_fetchTimelinePosts);
    on<_FetchTimelinePaginatedPosts>(_fetchTimelinePaginatedPosts);
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> get timeline {
    final either = _getTimelineStreamUseCase(GetTimelineStreamParams());
    return either.fold(
        (l) => defaultStream(const Duration(seconds: 5), 10), (r) => r);
  }

  PagingController<int, Post> get paginationController {
    return state.paginationController;
  }

  Future<void> _fetchTimelinePosts(
      _FetchTimelinePosts event, Emitter<PostState> emit) async {
    emit(state.copyWith(action: PostListenableAction.idle));

    final either = await _getPostsUsecase(GetPostsParams());

    return either.fold((error) {
      log(error.message);
      state.paginationController.error = error.message;
    }, (Timeline timeline) {
      if (state.paginationController.itemList != null &&
          state.paginationController.itemList!.isNotEmpty) {
        state.paginationController.reset();
      }

      if (timeline.userCaughtUp) {
        state.paginationController.appendLastPage(timeline.posts);
      } else {
        int nextPageKey = state.paginationController.nextPageKey ?? 0;
        nextPageKey++;

        state.paginationController.appendPage(timeline.posts, nextPageKey);
      }

      emit(state.copyWith(reachedMaximumThreshold: timeline.userCaughtUp));
    });
  }

  Future<void> _fetchTimelinePaginatedPosts(
      _FetchTimelinePaginatedPosts event, Emitter<PostState> emit) async {
    emit(state.copyWith(action: PostListenableAction.idle));
    final prevPost = state.paginationController
        .itemList![state.paginationController.itemList!.length - 1];
    final either = await _getPaginatedPostsUseCase(
        GetPaginatedPostsParams(post: prevPost));

    return either.fold((error) {
      state.paginationController.error = error.message;
    }, (Timeline timeline) {
      if (timeline.userCaughtUp) {
        state.paginationController.appendLastPage(timeline.posts);
        emit(state.copyWith(reachedMaximumThreshold: timeline.userCaughtUp));
      } else {
        int nextPageKey = state.paginationController.nextPageKey ?? 0;
        nextPageKey++;

        state.paginationController.appendPage(timeline.posts, nextPageKey);
      }
    });
  }

  Future<void> _createStatusPost(
      _CreateStatusPost event, Emitter<PostState> emit) async {
    emit(state.copyWith(action: PostListenableAction.idle));
    emit(state.copyWith(action: PostListenableAction.idle));
    final either = await _createStatusPostUseCase(CreateStatusPostParams(
      status: event.status,
    ));

    return either.fold((ex) {
      emit(state.copyWith(action: PostListenableAction.failure));
    }, (r) {
      emit(state.copyWith(action: PostListenableAction.created));
    });
  }

  Future<void> _createPost(_CreatePost event, Emitter<PostState> emit) async {
    emit(state.copyWith(action: PostListenableAction.idle));
    final either = await _createPostUseCase(
        CreatePostParams(caption: event.caption, assets: event.assets));

    return either.fold((ex) {
      emit(state.copyWith(action: PostListenableAction.failure));
    }, (r) {
      emit(state.copyWith(action: PostListenableAction.created));
    });
  }

  Future<void> _getPost(_GetPost event, Emitter<PostState> emit) async {
    emit(state.copyWith(action: PostListenableAction.idle));
    final either = await _getPostUsecase(GetPostParams(postId: event.postId));
    emit(state.copyWith(action: PostListenableAction.idle));
    return either.fold((ex) {
      emit(state.copyWith(action: PostListenableAction.rehydratedPostFailure));
    }, (rehydratedPost) {
      emit(state.copyWith(
        rehydratedPost: rehydratedPost,
        action: PostListenableAction.rehydratedPostSuccess,
      ));
    });
  }

  Future<void> _likePost(_ReactPost event, Emitter<PostState> emit) async {
    emit(state.copyWith(action: PostListenableAction.idle));
    final either = await _reactToPostUseCase(ReactToPostParams(
        event.post, event.user, event.reaction, event.latestReactions));

    return either.fold((l) {
      getService<AppRouter>().context.showToast(
          content: const Text("Something went wrong",
              style: TextStyle(color: Colors.white, fontSize: 12)),
          type: SnackBarType.error);
      emit(state.copyWith(action: PostListenableAction.likeFailure));
    }, (r) {
      emit(state.copyWith(action: PostListenableAction.liked));
    });
  }

  Future<void> _unLikePost(_UnReactPost event, Emitter<PostState> emit) async {
    emit(state.copyWith(action: PostListenableAction.idle));
    final either = await _unReactToPostUseCase(
        UnReactToPostParams(event.reaction, event.latestReactions));

    return either.fold((l) {
      getService<AppRouter>().context.showToast(
          content: const Text("Something went wrong",
              style: TextStyle(color: Colors.white, fontSize: 12)),
          type: SnackBarType.error);
      emit(state.copyWith(action: PostListenableAction.failure));
    }, (r) {
      emit(state.copyWith(action: PostListenableAction.unliked));
    });
  }

  Future<void> _updateReaction(
      _UpdateReactPost event, Emitter<PostState> emit) async {
    emit(state.copyWith(action: PostListenableAction.idle));
    final either = await _updatePostReactionUseCase(
        UpdatePostReactionParams(event.reaction, event.latestReactions));

    return either.fold((l) {
      getService<AppRouter>().context.showToast(
            type: SnackBarType.error,
            content: const Text("Something went wrong",
                style: TextStyle(color: Colors.white, fontSize: 12)),
          );
      emit(state.copyWith(action: PostListenableAction.failure));
    }, (r) {
      emit(state.copyWith(action: PostListenableAction.unliked));
    });
  }

  Future<void> _savePost(_SavePost event, Emitter<PostState> emit) async {
    emit(state.copyWith(action: PostListenableAction.idle));
    final either = await _savePostUseCase(SavePostParams(event.savedPost));

    return either.fold((ex) {
      getService<AppRouter>()
          .context
          .showToast(content: Text(ex.message), type: SnackBarType.error);
      emit(state.copyWith(action: PostListenableAction.saveFailure));
    }, (r) {
      if (r) {
        getService<AppRouter>().context.showToast(
            content: const Text("Post saved",
                style: TextStyle(color: Colors.white, fontSize: 12)),
            type: SnackBarType.idle);

        emit(state.copyWith(action: PostListenableAction.saveSuccess));
      } else {
        getService<AppRouter>().context.showToast(
              type: SnackBarType.error,
              content: const Text("Unable to save post",
                  style: TextStyle(color: Colors.white, fontSize: 12)),
            );
        emit(state.copyWith(action: PostListenableAction.saveFailure));
      }
    });
  }

  Future<void> _unSavePost(_UnSavePost event, Emitter<PostState> emit) async {
    emit(state.copyWith(action: PostListenableAction.idle));
    final either =
        await _unSavePostUseCase(UnSavePostParams(event.userId, event.postId));

    return either.fold((ex) {
      getService<AppRouter>()
          .context
          .showToast(content: Text(ex.message), type: SnackBarType.error);
      emit(state.copyWith(action: PostListenableAction.unsaveFailure));
    }, (r) {
      if (r) {
        emit(state.copyWith(action: PostListenableAction.unsaveSuccess));
      } else {
        emit(state.copyWith(action: PostListenableAction.unsaveFailure));
      }
    });
  }

  Future<void> _sharePost(_SharePost event, Emitter<PostState> emit) async {
    emit(state.copyWith(action: PostListenableAction.idle));
    final either = await _sharePostuseCase(SharePostParams(event.postId));

    return either.fold((ex) {
      getService<AppRouter>()
          .context
          .showToast(content: Text(ex.message), type: SnackBarType.error);
      emit(state.copyWith(action: PostListenableAction.shareFailure));
    }, (r) {
      if (r) {
        emit(state.copyWith(action: PostListenableAction.shareSuccess));

        getService<AppRouter>().context.showToast(
              type: SnackBarType.idle,
              content: const Text("Post shared",
                  style: TextStyle(color: Colors.white, fontSize: 12)),
            );
      } else {
        emit(state.copyWith(action: PostListenableAction.shareFailure));
      }
    });
  }

  Future<void> _deletePost(_DeletePost event, Emitter<PostState> emit) async {
    emit(state.copyWith(action: PostListenableAction.idle));
    final either = await _deletePostUseCase(DeletePostParams(event.postId));

    return either.fold((error) {
      getService<AppRouter>().context.showToast(
            type: SnackBarType.error,
            content: const Text("An error occured",
                style: TextStyle(color: Colors.white, fontSize: 12)),
          );

      emit(state.copyWith(action: PostListenableAction.failure));
    }, (success) {
      if (success) {
        state.paginationController.itemList!
            .removeWhere((x) => x.id == event.postId);
        emit(state.copyWith(action: PostListenableAction.deleted));

        getService<AppRouter>().context.showToast(
              type: SnackBarType.idle,
              content: const Text("Post deleted",
                  style: TextStyle(color: Colors.white, fontSize: 12)),
            );
      } else {
        getService<AppRouter>().context.showToast(
              type: SnackBarType.error,
              content: const Text("An error occured",
                  style: TextStyle(color: Colors.white, fontSize: 12)),
            );
      }
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
