part of 'timeline_bloc.dart';

@freezed
class TimelineEvent with _$TimelineEvent {
  const factory TimelineEvent.fetchTimelinePosts() = _FetchTimelinePosts;
}
