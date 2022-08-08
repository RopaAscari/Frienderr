part of 'snap_bloc.dart';

@freezed
class SnapEvent with _$SnapEvent {
  const factory SnapEvent.initialize() = _SnapsInitialized;

  const factory SnapEvent.getPaginatedSnaps() = _GetPaginatedSnaps;

  const factory SnapEvent.playSnapAtIndex({required int index}) =
      _PlaySnapAtIndex;
  const factory SnapEvent.onSnapChange({required int index}) = _SnapsChange;

  const factory SnapEvent.createSnap(
      {required String caption, required File file}) = _CreateSnap;
  const factory SnapEvent.deleteQuick({required String snapId}) = _DeleteSnap;
  const factory SnapEvent.likeSnap({
    required String userId,
    required String snapId,
  }) = _LikeSnap;
  const factory SnapEvent.unLikeSnap({
    required String userId,
    required String snapId,
  }) = _UnLikeSnap;
}
