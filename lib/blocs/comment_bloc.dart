import 'package:bloc/bloc.dart';
import 'package:frienderr/state/comment_state.dart';
import 'package:frienderr/events/comment_event.dart';
import 'package:frienderr/repositories/comment_repository.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState> {
  final CommentRepository commentRepository = new CommentRepository();

  CommentBloc() : super(CommentState());

  @override
  Stream<CommentState> mapEventToState(CommentEvent event) async* {
    if (event is FetchComments) {
      try {
        yield CommentsLoading();
        final comments = await commentRepository.getComments(event.postId);
        if (comments.length == 0) {
          yield CommentsEmpty(message: 'Be the first to comment on this post');
          return;
        }

        yield CommentsLoaded(comments: comments);
      } catch (e) {
        CommentsError(error: 'Error retrieving comments');
      }
    }
    if (event is PostComment) {
      try {
        final comments =
            await commentRepository.postComment(event.comment, event.postId);

        yield CommentsLoaded(comments: comments);
      } catch (e) {
        CommentsError(error: 'Error posting your comment');
      }
    }
  }
}
