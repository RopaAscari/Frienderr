part of 'quick_bloc.dart';

@freezed
class QuickEvent with _$QuickEvent {
  const factory QuickEvent.initialize() = _QuicksInitialized;
  const factory QuickEvent.playSnapAtIndex({required int index}) =
      _PlaySnapAtIndex;
  const factory QuickEvent.onSnapChange({required int index}) = _QuicksChange;
}
