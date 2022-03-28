import 'package:bloc/bloc.dart';
import 'package:frienderr/state/comment_state.dart';
import 'package:frienderr/events/comment_event.dart';
import 'package:frienderr/models/comment/comment_model.dart';
import 'package:frienderr/repositories/comment_repository.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState> {
  final CommentRepository commentRepository = new CommentRepository();

  CommentBloc() : super(CommentState()) {
    on<FetchComments>((event, emit) async {
      try {
        emit(CommentsLoading());
        final List<CommentModel> comments =
            await commentRepository.getComments(event.postId);
        if (comments.length == 0) {
          emit(CommentsEmpty(message: 'Be the first to comment on this post'));
          return;
        }

        emit(CommentsLoaded(comments: comments));
      } catch (e) {
        CommentsError(error: 'Error retrieving comments');
      }
    });

    on<PostComment>((event, emit) async {
      try {
        final List<CommentModel> comments =
            await commentRepository.postComment(event.comment, event.postId);

        emit(CommentsLoaded(comments: comments));
      } catch (e) {
        CommentsError(error: 'Error posting your comment');
      }
    });
  }
}
