part of 'quick_bloc.dart';

@freezed
class QuickEvent with _$QuickEvent {
  const factory QuickEvent.initialize() = _QuicksInitialized;

  const factory QuickEvent.playSnapAtIndex({required int index}) =
      _PlaySnapAtIndex;
  const factory QuickEvent.onSnapChange({required int index}) = _QuicksChange;

  const factory QuickEvent.createQuick(
      {required String caption, required File file}) = _CreateQuick;
  const factory QuickEvent.deleteQuick({required String quickId}) =
      _DeleteQuick;
  const factory QuickEvent.likeQuick({
    required String userId,
    required String quickId,
  }) = _LikeQuick;
  const factory QuickEvent.unLikeQuick({
    required String userId,
    required String quickId,
  }) = _UnLikeQuick;
}
