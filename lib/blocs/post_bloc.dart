import 'package:bloc/bloc.dart';
import 'package:frienderr/state/post_state.dart';
import 'package:frienderr/events/post_event.dart';
import 'package:frienderr/repositories/post_repository.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final PostRepository postRepository = new PostRepository();
  PostBloc() : super(PostState());

  @override
  Stream<PostState> mapEventToState(PostEvent event) async* {
    try {
      if (event is LikePost) {
        final response = await postRepository.likePost(event.post, event.user);
        if (!response) {
          yield LikeFailure(error: 'Failed to like post');
        }
      }

      if (event is UnLikePost) {
        final response =
            await postRepository.unLikePost(event.postId, event.userId);

        if (!response) {
          yield UnLikeFailure(error: 'Failed to unlike post');
        }
      }
      if (event is DeletePost) {
        final response = await postRepository.deletePost(event.postId);
        if (!response) {
          yield DeleteFailure(error: 'Failed to delete post');
          return;
        }
        yield DeleteSuccess();
      }
    } catch (e) {
      //yield ChatError(error: 'Something went wrong');
    }
  }
}
