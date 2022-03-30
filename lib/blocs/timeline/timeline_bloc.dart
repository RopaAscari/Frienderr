import 'package:bloc/bloc.dart';
import 'package:frienderr/models/post/post.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frienderr/repositories/timeline_repository.dart';

part 'timeline_event.dart';
part 'timeline_state.dart';
part 'timeline_bloc.freezed.dart';

class TimelineBloc extends Bloc<TimelineEvent, TimelineState> {
  TimelineBloc() : super(TimelineState()) {
    on<_FetchTimelinePosts>(_fetchTimelinePosts);
  }

  final TimelineRepository timelineRepository = new TimelineRepository();

  Future<void> _fetchTimelinePosts(
      _FetchTimelinePosts event, Emitter<TimelineState> emit) async {
    try {
      emit(state.copyWith(status: TimelineStatus.Loading));

      final timelinePosts = await timelineRepository.fetchTimelinelinePosts();

      final List<Post> posts = postsFromList(timelinePosts.docs);

      emit(state.copyWith(timelinePosts: posts, status: TimelineStatus.Loaded));
    } catch (e) {
      emit(state.copyWith(error: e.toString(), status: TimelineStatus.Error));
    }
  }
}
