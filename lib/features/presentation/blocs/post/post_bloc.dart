import 'package:bloc/bloc.dart';
import 'package:frienderr/features/domain/usecases/post/delete_post_usecase.dart';
import 'package:frienderr/features/domain/usecases/post/like_post_usecase.dart';
import 'package:frienderr/features/domain/usecases/post/unlike_post_usecase.dart';

import 'package:injectable/injectable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frienderr/features/domain/entities/user.dart';

part 'post_event.dart';
part 'post_state.dart';
part 'post_bloc.freezed.dart';

@injectable
class PostBloc extends Bloc<PostEvent, PostState> {
  final LikePostUseCase _likePostUseCase;
  final UnLikePostUseCase _unLikePostUseCase;
  final DeletePostUseCase _deletePostUseCase;
  PostBloc(
      this._likePostUseCase, this._unLikePostUseCase, this._deletePostUseCase)
      : super(PostState()) {
    on<_LikePost>(_likePost);
    on<_UnLikePost>(_unLikePost);
    on<_DeletePost>(_deletePost);
  }

  Future<void> _likePost(_LikePost event, Emitter<PostState> emit) async {
    final either =
        await _likePostUseCase(LikePostParams(event.post, event.user));

    return either.fold(
        (l) => emit(state.copyWith(currentState: PostStatus.Failure)),
        (r) => {emit(state.copyWith(currentState: PostStatus.LikePost))});
  }

  Future<void> _unLikePost(_UnLikePost event, Emitter<PostState> emit) async {
    final either =
        await _unLikePostUseCase(UnLikePostParams(event.postId, event.userId));

    return either.fold(
        (l) => emit(state.copyWith(currentState: PostStatus.Failure)),
        (r) => {emit(state.copyWith(currentState: PostStatus.LikePost))});
  }

  Future<void> _deletePost(_DeletePost event, Emitter<PostState> emit) async {
    final either = await _deletePostUseCase(DeletePostParams(event.postId));

    return either.fold(
        (l) => emit(state.copyWith(currentState: PostStatus.Failure)),
        (r) => {emit(state.copyWith(currentState: PostStatus.LikePost))});
  }
}
