import 'package:bloc/bloc.dart';
import 'package:frienderr/models/story/story.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frienderr/repositories/story_repository.dart';

part 'story_state.dart';
part 'story_event.dart';
part 'story_bloc.freezed.dart';

class StoryBloc extends Bloc<StoryEvent, StoryState> {
  StoryBloc() : super(StoryState()) {
    on<_LoadStories>(_loadStories);
  }

  final StoryRepository storyRepository = StoryRepository();

  Stream<QuerySnapshot<Map<String, dynamic>>> get stories {
    return storyRepository.delegateStoryStream();
  }

  Future<void> _loadStories(
      _LoadStories event, Emitter<StoryState> emit) async {}
}
