import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frienderr/features/domain/entities/story.dart';
import 'package:frienderr/features/domain/usecases/story/get_story_stream_usecase.dart';

part 'story_state.dart';
part 'story_event.dart';
part 'story_bloc.freezed.dart';

@injectable
class StoryBloc extends Bloc<StoryEvent, StoryState> {
  final GetStoryStreamUseCase _getStoryStreamUseCase;
  StoryBloc(this._getStoryStreamUseCase) : super(StoryState()) {
    on<_LoadStories>(_loadStories);
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> get stories {
    final either = _getStoryStreamUseCase(GetStoryStreamParams(''));
    return either.fold(
        (l) => defaultStream(Duration(seconds: 5), 10), (r) => r);
  }

  Future<void> _loadStories(
      _LoadStories event, Emitter<StoryState> emit) async {}

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
