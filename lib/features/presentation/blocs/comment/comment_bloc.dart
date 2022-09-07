import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frienderr/core/injection/injection.dart';
import 'package:frienderr/features/presentation/navigation/app_router.dart';
import 'package:frienderr/features/presentation/widgets/snackbar_message.dart';
import 'package:injectable/injectable.dart';
import 'package:frienderr/core/enums/enums.dart';
import 'package:frienderr/core/failure/failure.dart';
import 'package:frienderr/core/constants/constants.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frienderr/features/domain/entities/comment.dart';
import 'package:frienderr/features/data/models/post/post_model.dart';
import 'package:frienderr/features/data/models/user/user_model.dart';
import 'package:frienderr/features/domain/entities/notification.dart';
import 'package:frienderr/features/data/models/comment/comment_model.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:frienderr/features/domain/usecases/comment/get_comments_usecase.dart';
import 'package:frienderr/features/domain/usecases/comment/post_comment_usecase.dart';
import 'package:frienderr/features/domain/usecases/comment/get_paginated_comments.dart';
import 'package:frienderr/features/domain/usecases/comment/delete_comment_usecase.dart';

part 'comment_event.dart';
part 'comment_state.dart';
part 'comment_bloc.freezed.dart';

@injectable
class CommentBloc extends Bloc<CommentEvent, CommentState> {
  final GetCommentsUseCase _getCommentsUsecase;
  final PostCommentUseCase _postCommentUsecase;
  final DeleteCommentUseCase _deleteCommentUsecase;
  final GetPaginatedCommentsUseCase _getPaginatedCommentsUsecase;

  CommentBloc(this._getCommentsUsecase, this._postCommentUsecase,
      this._deleteCommentUsecase, this._getPaginatedCommentsUsecase)
      : super(CommentState(
          reachedMaximumThreshold: false,
          paginationController:
              PagingController(firstPageKey: 0, invisibleItemsThreshold: 1),
        )) {
    on<_GetComments>(_getComment);
    on<_PostComment>(_postComment);
    on<_DeleteComment>(_deleteComment);
    on<_GetPaginatedComments>(_getPaginatedComments);
  }

  Future<void> _getComment(
      _GetComments event, Emitter<CommentState> emit) async {
    final Either<Failure, List<Comment>> _either =
        await _getCommentsUsecase(GetCommentsParams(event.postId, event.type));

    return _either.fold((error) {
      state.paginationController.error = error.message;
    }, (List<Comment> comments) {
      if (comments.length < Constants.pageSize) {
        state.paginationController.appendLastPage(comments);
        emit(state.copyWith(reachedMaximumThreshold: true));
      } else {
        int nextPageKey = state.paginationController.nextPageKey ?? 0;
        nextPageKey++;

        state.paginationController.appendPage(comments, nextPageKey);
      }
    });
  }

  Future<void> _getPaginatedComments(
      _GetPaginatedComments event, Emitter<CommentState> emit) async {
    final previousComment = state.paginationController
        .itemList![state.paginationController.itemList!.length - 1];

    final Either<Failure, List<Comment>> _either =
        await _getPaginatedCommentsUsecase(GetPaginatedCommentsParams(
            previousComment: previousComment, type: event.type));

    return _either.fold((error) {
      state.paginationController.error = error.message;
    }, (List<Comment> comments) {
      if (comments.length < Constants.pageSize) {
        state.paginationController.appendLastPage(comments);
        emit(state.copyWith(reachedMaximumThreshold: true));
      } else {
        int nextPageKey = state.paginationController.nextPageKey ?? 0;
        nextPageKey++;

        state.paginationController.appendPage(comments, nextPageKey);
      }
    });
  }

  Future<void> _postComment(
      _PostComment event, Emitter<CommentState> emit) async {
    final Either<Failure, Comment> _either =
        await _postCommentUsecase(PostCommentUseCaseParams(
      type: event.type,
      comment: event.comment,
      notification: event.notification,
    ));
    return _either.fold((Failure error) {
      emit(state.copyWith(action: CommentListenableAction.creationFailed));
    }, (Comment comment) {
      state.paginationController.appendLastPage([comment]);
      emit(state.copyWith(action: CommentListenableAction.created));
    });
  }

  Future<void> _deleteComment(
      _DeleteComment event, Emitter<CommentState> emit) async {
    final Either<Failure, bool> _either = await _deleteCommentUsecase(
        DeleteCommentParams(event.id, event.postId, event.type));
    return _either.fold((Failure error) {
      getService<AppRouter>().context.showToast(
          content: const Text("Something went wrong",
              style: TextStyle(color: Colors.white, fontSize: 12)),
          type: SnackBarType.error);

      emit(state.copyWith(action: CommentListenableAction.deleteFailed));
    }, (bool success) {
      if (!success) {
        getService<AppRouter>().context.showToast(
            content: const Text("Something went wrong",
                style: TextStyle(color: Colors.white, fontSize: 12)),
            type: SnackBarType.error);
        return;
      }
      state.paginationController.itemList?.removeWhere(
        (r) => r.id == event.id,
      );
      emit(state.copyWith(action: CommentListenableAction.deleted));
    });
  }
}
