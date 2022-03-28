import 'package:bloc/bloc.dart';
import 'package:frienderr/state/post_state.dart';
import 'package:frienderr/events/post_event.dart';
import 'package:frienderr/repositories/post_repository.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final PostRepository postRepository = new PostRepository();
  PostBloc() : super(PostState()) {
    on<LikePost>((event, emit) async {
      final bool response =
          await postRepository.likePost(event.post, event.user);
      if (!response) {
        emit(LikeFailure(error: 'Failed to like post'));
      }
    });

    on<UnLikePost>((event, emit) async {
      final response =
          await postRepository.unLikePost(event.postId, event.userId);

      if (!response) {
        emit(UnLikeFailure(error: 'Failed to unlike post'));
      }
    });

    on<DeletePost>((event, emit) async {
      final response = await postRepository.deletePost(event.postId);
      if (!response) {
        emit(DeleteFailure(error: 'Failed to delete post'));
        return;
      }
    });
  }
}
