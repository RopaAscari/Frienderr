// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'snap_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SnapEventTearOff {
  const _$SnapEventTearOff();

  _SnapsInitialized initialize() {
    return const _SnapsInitialized();
  }

  _GetPaginatedSnaps getPaginatedSnaps() {
    return const _GetPaginatedSnaps();
  }

  _PlaySnapAtIndex playSnapAtIndex({required int index}) {
    return _PlaySnapAtIndex(
      index: index,
    );
  }

  _SnapsChange onSnapChange({required int index}) {
    return _SnapsChange(
      index: index,
    );
  }

  _CreateSnap createSnap({required String caption, required File file}) {
    return _CreateSnap(
      caption: caption,
      file: file,
    );
  }

  _DeleteSnap deleteQuick({required String snapId}) {
    return _DeleteSnap(
      snapId: snapId,
    );
  }

  _LikeSnap likeSnap({required String userId, required String snapId}) {
    return _LikeSnap(
      userId: userId,
      snapId: snapId,
    );
  }

  _UnLikeSnap unLikeSnap({required String userId, required String snapId}) {
    return _UnLikeSnap(
      userId: userId,
      snapId: snapId,
    );
  }
}

/// @nodoc
const $SnapEvent = _$SnapEventTearOff();

/// @nodoc
mixin _$SnapEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function() getPaginatedSnaps,
    required TResult Function(int index) playSnapAtIndex,
    required TResult Function(int index) onSnapChange,
    required TResult Function(String caption, File file) createSnap,
    required TResult Function(String snapId) deleteQuick,
    required TResult Function(String userId, String snapId) likeSnap,
    required TResult Function(String userId, String snapId) unLikeSnap,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function()? getPaginatedSnaps,
    TResult Function(int index)? playSnapAtIndex,
    TResult Function(int index)? onSnapChange,
    TResult Function(String caption, File file)? createSnap,
    TResult Function(String snapId)? deleteQuick,
    TResult Function(String userId, String snapId)? likeSnap,
    TResult Function(String userId, String snapId)? unLikeSnap,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function()? getPaginatedSnaps,
    TResult Function(int index)? playSnapAtIndex,
    TResult Function(int index)? onSnapChange,
    TResult Function(String caption, File file)? createSnap,
    TResult Function(String snapId)? deleteQuick,
    TResult Function(String userId, String snapId)? likeSnap,
    TResult Function(String userId, String snapId)? unLikeSnap,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SnapsInitialized value) initialize,
    required TResult Function(_GetPaginatedSnaps value) getPaginatedSnaps,
    required TResult Function(_PlaySnapAtIndex value) playSnapAtIndex,
    required TResult Function(_SnapsChange value) onSnapChange,
    required TResult Function(_CreateSnap value) createSnap,
    required TResult Function(_DeleteSnap value) deleteQuick,
    required TResult Function(_LikeSnap value) likeSnap,
    required TResult Function(_UnLikeSnap value) unLikeSnap,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SnapsInitialized value)? initialize,
    TResult Function(_GetPaginatedSnaps value)? getPaginatedSnaps,
    TResult Function(_PlaySnapAtIndex value)? playSnapAtIndex,
    TResult Function(_SnapsChange value)? onSnapChange,
    TResult Function(_CreateSnap value)? createSnap,
    TResult Function(_DeleteSnap value)? deleteQuick,
    TResult Function(_LikeSnap value)? likeSnap,
    TResult Function(_UnLikeSnap value)? unLikeSnap,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SnapsInitialized value)? initialize,
    TResult Function(_GetPaginatedSnaps value)? getPaginatedSnaps,
    TResult Function(_PlaySnapAtIndex value)? playSnapAtIndex,
    TResult Function(_SnapsChange value)? onSnapChange,
    TResult Function(_CreateSnap value)? createSnap,
    TResult Function(_DeleteSnap value)? deleteQuick,
    TResult Function(_LikeSnap value)? likeSnap,
    TResult Function(_UnLikeSnap value)? unLikeSnap,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SnapEventCopyWith<$Res> {
  factory $SnapEventCopyWith(SnapEvent value, $Res Function(SnapEvent) then) =
      _$SnapEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$SnapEventCopyWithImpl<$Res> implements $SnapEventCopyWith<$Res> {
  _$SnapEventCopyWithImpl(this._value, this._then);

  final SnapEvent _value;
  // ignore: unused_field
  final $Res Function(SnapEvent) _then;
}

/// @nodoc
abstract class _$SnapsInitializedCopyWith<$Res> {
  factory _$SnapsInitializedCopyWith(
          _SnapsInitialized value, $Res Function(_SnapsInitialized) then) =
      __$SnapsInitializedCopyWithImpl<$Res>;
}

/// @nodoc
class __$SnapsInitializedCopyWithImpl<$Res>
    extends _$SnapEventCopyWithImpl<$Res>
    implements _$SnapsInitializedCopyWith<$Res> {
  __$SnapsInitializedCopyWithImpl(
      _SnapsInitialized _value, $Res Function(_SnapsInitialized) _then)
      : super(_value, (v) => _then(v as _SnapsInitialized));

  @override
  _SnapsInitialized get _value => super._value as _SnapsInitialized;
}

/// @nodoc

class _$_SnapsInitialized implements _SnapsInitialized {
  const _$_SnapsInitialized();

  @override
  String toString() {
    return 'SnapEvent.initialize()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _SnapsInitialized);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function() getPaginatedSnaps,
    required TResult Function(int index) playSnapAtIndex,
    required TResult Function(int index) onSnapChange,
    required TResult Function(String caption, File file) createSnap,
    required TResult Function(String snapId) deleteQuick,
    required TResult Function(String userId, String snapId) likeSnap,
    required TResult Function(String userId, String snapId) unLikeSnap,
  }) {
    return initialize();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function()? getPaginatedSnaps,
    TResult Function(int index)? playSnapAtIndex,
    TResult Function(int index)? onSnapChange,
    TResult Function(String caption, File file)? createSnap,
    TResult Function(String snapId)? deleteQuick,
    TResult Function(String userId, String snapId)? likeSnap,
    TResult Function(String userId, String snapId)? unLikeSnap,
  }) {
    return initialize?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function()? getPaginatedSnaps,
    TResult Function(int index)? playSnapAtIndex,
    TResult Function(int index)? onSnapChange,
    TResult Function(String caption, File file)? createSnap,
    TResult Function(String snapId)? deleteQuick,
    TResult Function(String userId, String snapId)? likeSnap,
    TResult Function(String userId, String snapId)? unLikeSnap,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SnapsInitialized value) initialize,
    required TResult Function(_GetPaginatedSnaps value) getPaginatedSnaps,
    required TResult Function(_PlaySnapAtIndex value) playSnapAtIndex,
    required TResult Function(_SnapsChange value) onSnapChange,
    required TResult Function(_CreateSnap value) createSnap,
    required TResult Function(_DeleteSnap value) deleteQuick,
    required TResult Function(_LikeSnap value) likeSnap,
    required TResult Function(_UnLikeSnap value) unLikeSnap,
  }) {
    return initialize(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SnapsInitialized value)? initialize,
    TResult Function(_GetPaginatedSnaps value)? getPaginatedSnaps,
    TResult Function(_PlaySnapAtIndex value)? playSnapAtIndex,
    TResult Function(_SnapsChange value)? onSnapChange,
    TResult Function(_CreateSnap value)? createSnap,
    TResult Function(_DeleteSnap value)? deleteQuick,
    TResult Function(_LikeSnap value)? likeSnap,
    TResult Function(_UnLikeSnap value)? unLikeSnap,
  }) {
    return initialize?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SnapsInitialized value)? initialize,
    TResult Function(_GetPaginatedSnaps value)? getPaginatedSnaps,
    TResult Function(_PlaySnapAtIndex value)? playSnapAtIndex,
    TResult Function(_SnapsChange value)? onSnapChange,
    TResult Function(_CreateSnap value)? createSnap,
    TResult Function(_DeleteSnap value)? deleteQuick,
    TResult Function(_LikeSnap value)? likeSnap,
    TResult Function(_UnLikeSnap value)? unLikeSnap,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(this);
    }
    return orElse();
  }
}

abstract class _SnapsInitialized implements SnapEvent {
  const factory _SnapsInitialized() = _$_SnapsInitialized;
}

/// @nodoc
abstract class _$GetPaginatedSnapsCopyWith<$Res> {
  factory _$GetPaginatedSnapsCopyWith(
          _GetPaginatedSnaps value, $Res Function(_GetPaginatedSnaps) then) =
      __$GetPaginatedSnapsCopyWithImpl<$Res>;
}

/// @nodoc
class __$GetPaginatedSnapsCopyWithImpl<$Res>
    extends _$SnapEventCopyWithImpl<$Res>
    implements _$GetPaginatedSnapsCopyWith<$Res> {
  __$GetPaginatedSnapsCopyWithImpl(
      _GetPaginatedSnaps _value, $Res Function(_GetPaginatedSnaps) _then)
      : super(_value, (v) => _then(v as _GetPaginatedSnaps));

  @override
  _GetPaginatedSnaps get _value => super._value as _GetPaginatedSnaps;
}

/// @nodoc

class _$_GetPaginatedSnaps implements _GetPaginatedSnaps {
  const _$_GetPaginatedSnaps();

  @override
  String toString() {
    return 'SnapEvent.getPaginatedSnaps()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _GetPaginatedSnaps);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function() getPaginatedSnaps,
    required TResult Function(int index) playSnapAtIndex,
    required TResult Function(int index) onSnapChange,
    required TResult Function(String caption, File file) createSnap,
    required TResult Function(String snapId) deleteQuick,
    required TResult Function(String userId, String snapId) likeSnap,
    required TResult Function(String userId, String snapId) unLikeSnap,
  }) {
    return getPaginatedSnaps();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function()? getPaginatedSnaps,
    TResult Function(int index)? playSnapAtIndex,
    TResult Function(int index)? onSnapChange,
    TResult Function(String caption, File file)? createSnap,
    TResult Function(String snapId)? deleteQuick,
    TResult Function(String userId, String snapId)? likeSnap,
    TResult Function(String userId, String snapId)? unLikeSnap,
  }) {
    return getPaginatedSnaps?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function()? getPaginatedSnaps,
    TResult Function(int index)? playSnapAtIndex,
    TResult Function(int index)? onSnapChange,
    TResult Function(String caption, File file)? createSnap,
    TResult Function(String snapId)? deleteQuick,
    TResult Function(String userId, String snapId)? likeSnap,
    TResult Function(String userId, String snapId)? unLikeSnap,
    required TResult orElse(),
  }) {
    if (getPaginatedSnaps != null) {
      return getPaginatedSnaps();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SnapsInitialized value) initialize,
    required TResult Function(_GetPaginatedSnaps value) getPaginatedSnaps,
    required TResult Function(_PlaySnapAtIndex value) playSnapAtIndex,
    required TResult Function(_SnapsChange value) onSnapChange,
    required TResult Function(_CreateSnap value) createSnap,
    required TResult Function(_DeleteSnap value) deleteQuick,
    required TResult Function(_LikeSnap value) likeSnap,
    required TResult Function(_UnLikeSnap value) unLikeSnap,
  }) {
    return getPaginatedSnaps(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SnapsInitialized value)? initialize,
    TResult Function(_GetPaginatedSnaps value)? getPaginatedSnaps,
    TResult Function(_PlaySnapAtIndex value)? playSnapAtIndex,
    TResult Function(_SnapsChange value)? onSnapChange,
    TResult Function(_CreateSnap value)? createSnap,
    TResult Function(_DeleteSnap value)? deleteQuick,
    TResult Function(_LikeSnap value)? likeSnap,
    TResult Function(_UnLikeSnap value)? unLikeSnap,
  }) {
    return getPaginatedSnaps?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SnapsInitialized value)? initialize,
    TResult Function(_GetPaginatedSnaps value)? getPaginatedSnaps,
    TResult Function(_PlaySnapAtIndex value)? playSnapAtIndex,
    TResult Function(_SnapsChange value)? onSnapChange,
    TResult Function(_CreateSnap value)? createSnap,
    TResult Function(_DeleteSnap value)? deleteQuick,
    TResult Function(_LikeSnap value)? likeSnap,
    TResult Function(_UnLikeSnap value)? unLikeSnap,
    required TResult orElse(),
  }) {
    if (getPaginatedSnaps != null) {
      return getPaginatedSnaps(this);
    }
    return orElse();
  }
}

abstract class _GetPaginatedSnaps implements SnapEvent {
  const factory _GetPaginatedSnaps() = _$_GetPaginatedSnaps;
}

/// @nodoc
abstract class _$PlaySnapAtIndexCopyWith<$Res> {
  factory _$PlaySnapAtIndexCopyWith(
          _PlaySnapAtIndex value, $Res Function(_PlaySnapAtIndex) then) =
      __$PlaySnapAtIndexCopyWithImpl<$Res>;
  $Res call({int index});
}

/// @nodoc
class __$PlaySnapAtIndexCopyWithImpl<$Res> extends _$SnapEventCopyWithImpl<$Res>
    implements _$PlaySnapAtIndexCopyWith<$Res> {
  __$PlaySnapAtIndexCopyWithImpl(
      _PlaySnapAtIndex _value, $Res Function(_PlaySnapAtIndex) _then)
      : super(_value, (v) => _then(v as _PlaySnapAtIndex));

  @override
  _PlaySnapAtIndex get _value => super._value as _PlaySnapAtIndex;

  @override
  $Res call({
    Object? index = freezed,
  }) {
    return _then(_PlaySnapAtIndex(
      index: index == freezed
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_PlaySnapAtIndex implements _PlaySnapAtIndex {
  const _$_PlaySnapAtIndex({required this.index});

  @override
  final int index;

  @override
  String toString() {
    return 'SnapEvent.playSnapAtIndex(index: $index)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PlaySnapAtIndex &&
            const DeepCollectionEquality().equals(other.index, index));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(index));

  @JsonKey(ignore: true)
  @override
  _$PlaySnapAtIndexCopyWith<_PlaySnapAtIndex> get copyWith =>
      __$PlaySnapAtIndexCopyWithImpl<_PlaySnapAtIndex>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function() getPaginatedSnaps,
    required TResult Function(int index) playSnapAtIndex,
    required TResult Function(int index) onSnapChange,
    required TResult Function(String caption, File file) createSnap,
    required TResult Function(String snapId) deleteQuick,
    required TResult Function(String userId, String snapId) likeSnap,
    required TResult Function(String userId, String snapId) unLikeSnap,
  }) {
    return playSnapAtIndex(index);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function()? getPaginatedSnaps,
    TResult Function(int index)? playSnapAtIndex,
    TResult Function(int index)? onSnapChange,
    TResult Function(String caption, File file)? createSnap,
    TResult Function(String snapId)? deleteQuick,
    TResult Function(String userId, String snapId)? likeSnap,
    TResult Function(String userId, String snapId)? unLikeSnap,
  }) {
    return playSnapAtIndex?.call(index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function()? getPaginatedSnaps,
    TResult Function(int index)? playSnapAtIndex,
    TResult Function(int index)? onSnapChange,
    TResult Function(String caption, File file)? createSnap,
    TResult Function(String snapId)? deleteQuick,
    TResult Function(String userId, String snapId)? likeSnap,
    TResult Function(String userId, String snapId)? unLikeSnap,
    required TResult orElse(),
  }) {
    if (playSnapAtIndex != null) {
      return playSnapAtIndex(index);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SnapsInitialized value) initialize,
    required TResult Function(_GetPaginatedSnaps value) getPaginatedSnaps,
    required TResult Function(_PlaySnapAtIndex value) playSnapAtIndex,
    required TResult Function(_SnapsChange value) onSnapChange,
    required TResult Function(_CreateSnap value) createSnap,
    required TResult Function(_DeleteSnap value) deleteQuick,
    required TResult Function(_LikeSnap value) likeSnap,
    required TResult Function(_UnLikeSnap value) unLikeSnap,
  }) {
    return playSnapAtIndex(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SnapsInitialized value)? initialize,
    TResult Function(_GetPaginatedSnaps value)? getPaginatedSnaps,
    TResult Function(_PlaySnapAtIndex value)? playSnapAtIndex,
    TResult Function(_SnapsChange value)? onSnapChange,
    TResult Function(_CreateSnap value)? createSnap,
    TResult Function(_DeleteSnap value)? deleteQuick,
    TResult Function(_LikeSnap value)? likeSnap,
    TResult Function(_UnLikeSnap value)? unLikeSnap,
  }) {
    return playSnapAtIndex?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SnapsInitialized value)? initialize,
    TResult Function(_GetPaginatedSnaps value)? getPaginatedSnaps,
    TResult Function(_PlaySnapAtIndex value)? playSnapAtIndex,
    TResult Function(_SnapsChange value)? onSnapChange,
    TResult Function(_CreateSnap value)? createSnap,
    TResult Function(_DeleteSnap value)? deleteQuick,
    TResult Function(_LikeSnap value)? likeSnap,
    TResult Function(_UnLikeSnap value)? unLikeSnap,
    required TResult orElse(),
  }) {
    if (playSnapAtIndex != null) {
      return playSnapAtIndex(this);
    }
    return orElse();
  }
}

abstract class _PlaySnapAtIndex implements SnapEvent {
  const factory _PlaySnapAtIndex({required int index}) = _$_PlaySnapAtIndex;

  int get index;
  @JsonKey(ignore: true)
  _$PlaySnapAtIndexCopyWith<_PlaySnapAtIndex> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$SnapsChangeCopyWith<$Res> {
  factory _$SnapsChangeCopyWith(
          _SnapsChange value, $Res Function(_SnapsChange) then) =
      __$SnapsChangeCopyWithImpl<$Res>;
  $Res call({int index});
}

/// @nodoc
class __$SnapsChangeCopyWithImpl<$Res> extends _$SnapEventCopyWithImpl<$Res>
    implements _$SnapsChangeCopyWith<$Res> {
  __$SnapsChangeCopyWithImpl(
      _SnapsChange _value, $Res Function(_SnapsChange) _then)
      : super(_value, (v) => _then(v as _SnapsChange));

  @override
  _SnapsChange get _value => super._value as _SnapsChange;

  @override
  $Res call({
    Object? index = freezed,
  }) {
    return _then(_SnapsChange(
      index: index == freezed
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_SnapsChange implements _SnapsChange {
  const _$_SnapsChange({required this.index});

  @override
  final int index;

  @override
  String toString() {
    return 'SnapEvent.onSnapChange(index: $index)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SnapsChange &&
            const DeepCollectionEquality().equals(other.index, index));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(index));

  @JsonKey(ignore: true)
  @override
  _$SnapsChangeCopyWith<_SnapsChange> get copyWith =>
      __$SnapsChangeCopyWithImpl<_SnapsChange>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function() getPaginatedSnaps,
    required TResult Function(int index) playSnapAtIndex,
    required TResult Function(int index) onSnapChange,
    required TResult Function(String caption, File file) createSnap,
    required TResult Function(String snapId) deleteQuick,
    required TResult Function(String userId, String snapId) likeSnap,
    required TResult Function(String userId, String snapId) unLikeSnap,
  }) {
    return onSnapChange(index);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function()? getPaginatedSnaps,
    TResult Function(int index)? playSnapAtIndex,
    TResult Function(int index)? onSnapChange,
    TResult Function(String caption, File file)? createSnap,
    TResult Function(String snapId)? deleteQuick,
    TResult Function(String userId, String snapId)? likeSnap,
    TResult Function(String userId, String snapId)? unLikeSnap,
  }) {
    return onSnapChange?.call(index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function()? getPaginatedSnaps,
    TResult Function(int index)? playSnapAtIndex,
    TResult Function(int index)? onSnapChange,
    TResult Function(String caption, File file)? createSnap,
    TResult Function(String snapId)? deleteQuick,
    TResult Function(String userId, String snapId)? likeSnap,
    TResult Function(String userId, String snapId)? unLikeSnap,
    required TResult orElse(),
  }) {
    if (onSnapChange != null) {
      return onSnapChange(index);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SnapsInitialized value) initialize,
    required TResult Function(_GetPaginatedSnaps value) getPaginatedSnaps,
    required TResult Function(_PlaySnapAtIndex value) playSnapAtIndex,
    required TResult Function(_SnapsChange value) onSnapChange,
    required TResult Function(_CreateSnap value) createSnap,
    required TResult Function(_DeleteSnap value) deleteQuick,
    required TResult Function(_LikeSnap value) likeSnap,
    required TResult Function(_UnLikeSnap value) unLikeSnap,
  }) {
    return onSnapChange(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SnapsInitialized value)? initialize,
    TResult Function(_GetPaginatedSnaps value)? getPaginatedSnaps,
    TResult Function(_PlaySnapAtIndex value)? playSnapAtIndex,
    TResult Function(_SnapsChange value)? onSnapChange,
    TResult Function(_CreateSnap value)? createSnap,
    TResult Function(_DeleteSnap value)? deleteQuick,
    TResult Function(_LikeSnap value)? likeSnap,
    TResult Function(_UnLikeSnap value)? unLikeSnap,
  }) {
    return onSnapChange?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SnapsInitialized value)? initialize,
    TResult Function(_GetPaginatedSnaps value)? getPaginatedSnaps,
    TResult Function(_PlaySnapAtIndex value)? playSnapAtIndex,
    TResult Function(_SnapsChange value)? onSnapChange,
    TResult Function(_CreateSnap value)? createSnap,
    TResult Function(_DeleteSnap value)? deleteQuick,
    TResult Function(_LikeSnap value)? likeSnap,
    TResult Function(_UnLikeSnap value)? unLikeSnap,
    required TResult orElse(),
  }) {
    if (onSnapChange != null) {
      return onSnapChange(this);
    }
    return orElse();
  }
}

abstract class _SnapsChange implements SnapEvent {
  const factory _SnapsChange({required int index}) = _$_SnapsChange;

  int get index;
  @JsonKey(ignore: true)
  _$SnapsChangeCopyWith<_SnapsChange> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$CreateSnapCopyWith<$Res> {
  factory _$CreateSnapCopyWith(
          _CreateSnap value, $Res Function(_CreateSnap) then) =
      __$CreateSnapCopyWithImpl<$Res>;
  $Res call({String caption, File file});
}

/// @nodoc
class __$CreateSnapCopyWithImpl<$Res> extends _$SnapEventCopyWithImpl<$Res>
    implements _$CreateSnapCopyWith<$Res> {
  __$CreateSnapCopyWithImpl(
      _CreateSnap _value, $Res Function(_CreateSnap) _then)
      : super(_value, (v) => _then(v as _CreateSnap));

  @override
  _CreateSnap get _value => super._value as _CreateSnap;

  @override
  $Res call({
    Object? caption = freezed,
    Object? file = freezed,
  }) {
    return _then(_CreateSnap(
      caption: caption == freezed
          ? _value.caption
          : caption // ignore: cast_nullable_to_non_nullable
              as String,
      file: file == freezed
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as File,
    ));
  }
}

/// @nodoc

class _$_CreateSnap implements _CreateSnap {
  const _$_CreateSnap({required this.caption, required this.file});

  @override
  final String caption;
  @override
  final File file;

  @override
  String toString() {
    return 'SnapEvent.createSnap(caption: $caption, file: $file)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CreateSnap &&
            const DeepCollectionEquality().equals(other.caption, caption) &&
            const DeepCollectionEquality().equals(other.file, file));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(caption),
      const DeepCollectionEquality().hash(file));

  @JsonKey(ignore: true)
  @override
  _$CreateSnapCopyWith<_CreateSnap> get copyWith =>
      __$CreateSnapCopyWithImpl<_CreateSnap>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function() getPaginatedSnaps,
    required TResult Function(int index) playSnapAtIndex,
    required TResult Function(int index) onSnapChange,
    required TResult Function(String caption, File file) createSnap,
    required TResult Function(String snapId) deleteQuick,
    required TResult Function(String userId, String snapId) likeSnap,
    required TResult Function(String userId, String snapId) unLikeSnap,
  }) {
    return createSnap(caption, file);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function()? getPaginatedSnaps,
    TResult Function(int index)? playSnapAtIndex,
    TResult Function(int index)? onSnapChange,
    TResult Function(String caption, File file)? createSnap,
    TResult Function(String snapId)? deleteQuick,
    TResult Function(String userId, String snapId)? likeSnap,
    TResult Function(String userId, String snapId)? unLikeSnap,
  }) {
    return createSnap?.call(caption, file);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function()? getPaginatedSnaps,
    TResult Function(int index)? playSnapAtIndex,
    TResult Function(int index)? onSnapChange,
    TResult Function(String caption, File file)? createSnap,
    TResult Function(String snapId)? deleteQuick,
    TResult Function(String userId, String snapId)? likeSnap,
    TResult Function(String userId, String snapId)? unLikeSnap,
    required TResult orElse(),
  }) {
    if (createSnap != null) {
      return createSnap(caption, file);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SnapsInitialized value) initialize,
    required TResult Function(_GetPaginatedSnaps value) getPaginatedSnaps,
    required TResult Function(_PlaySnapAtIndex value) playSnapAtIndex,
    required TResult Function(_SnapsChange value) onSnapChange,
    required TResult Function(_CreateSnap value) createSnap,
    required TResult Function(_DeleteSnap value) deleteQuick,
    required TResult Function(_LikeSnap value) likeSnap,
    required TResult Function(_UnLikeSnap value) unLikeSnap,
  }) {
    return createSnap(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SnapsInitialized value)? initialize,
    TResult Function(_GetPaginatedSnaps value)? getPaginatedSnaps,
    TResult Function(_PlaySnapAtIndex value)? playSnapAtIndex,
    TResult Function(_SnapsChange value)? onSnapChange,
    TResult Function(_CreateSnap value)? createSnap,
    TResult Function(_DeleteSnap value)? deleteQuick,
    TResult Function(_LikeSnap value)? likeSnap,
    TResult Function(_UnLikeSnap value)? unLikeSnap,
  }) {
    return createSnap?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SnapsInitialized value)? initialize,
    TResult Function(_GetPaginatedSnaps value)? getPaginatedSnaps,
    TResult Function(_PlaySnapAtIndex value)? playSnapAtIndex,
    TResult Function(_SnapsChange value)? onSnapChange,
    TResult Function(_CreateSnap value)? createSnap,
    TResult Function(_DeleteSnap value)? deleteQuick,
    TResult Function(_LikeSnap value)? likeSnap,
    TResult Function(_UnLikeSnap value)? unLikeSnap,
    required TResult orElse(),
  }) {
    if (createSnap != null) {
      return createSnap(this);
    }
    return orElse();
  }
}

abstract class _CreateSnap implements SnapEvent {
  const factory _CreateSnap({required String caption, required File file}) =
      _$_CreateSnap;

  String get caption;
  File get file;
  @JsonKey(ignore: true)
  _$CreateSnapCopyWith<_CreateSnap> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$DeleteSnapCopyWith<$Res> {
  factory _$DeleteSnapCopyWith(
          _DeleteSnap value, $Res Function(_DeleteSnap) then) =
      __$DeleteSnapCopyWithImpl<$Res>;
  $Res call({String snapId});
}

/// @nodoc
class __$DeleteSnapCopyWithImpl<$Res> extends _$SnapEventCopyWithImpl<$Res>
    implements _$DeleteSnapCopyWith<$Res> {
  __$DeleteSnapCopyWithImpl(
      _DeleteSnap _value, $Res Function(_DeleteSnap) _then)
      : super(_value, (v) => _then(v as _DeleteSnap));

  @override
  _DeleteSnap get _value => super._value as _DeleteSnap;

  @override
  $Res call({
    Object? snapId = freezed,
  }) {
    return _then(_DeleteSnap(
      snapId: snapId == freezed
          ? _value.snapId
          : snapId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_DeleteSnap implements _DeleteSnap {
  const _$_DeleteSnap({required this.snapId});

  @override
  final String snapId;

  @override
  String toString() {
    return 'SnapEvent.deleteQuick(snapId: $snapId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DeleteSnap &&
            const DeepCollectionEquality().equals(other.snapId, snapId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(snapId));

  @JsonKey(ignore: true)
  @override
  _$DeleteSnapCopyWith<_DeleteSnap> get copyWith =>
      __$DeleteSnapCopyWithImpl<_DeleteSnap>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function() getPaginatedSnaps,
    required TResult Function(int index) playSnapAtIndex,
    required TResult Function(int index) onSnapChange,
    required TResult Function(String caption, File file) createSnap,
    required TResult Function(String snapId) deleteQuick,
    required TResult Function(String userId, String snapId) likeSnap,
    required TResult Function(String userId, String snapId) unLikeSnap,
  }) {
    return deleteQuick(snapId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function()? getPaginatedSnaps,
    TResult Function(int index)? playSnapAtIndex,
    TResult Function(int index)? onSnapChange,
    TResult Function(String caption, File file)? createSnap,
    TResult Function(String snapId)? deleteQuick,
    TResult Function(String userId, String snapId)? likeSnap,
    TResult Function(String userId, String snapId)? unLikeSnap,
  }) {
    return deleteQuick?.call(snapId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function()? getPaginatedSnaps,
    TResult Function(int index)? playSnapAtIndex,
    TResult Function(int index)? onSnapChange,
    TResult Function(String caption, File file)? createSnap,
    TResult Function(String snapId)? deleteQuick,
    TResult Function(String userId, String snapId)? likeSnap,
    TResult Function(String userId, String snapId)? unLikeSnap,
    required TResult orElse(),
  }) {
    if (deleteQuick != null) {
      return deleteQuick(snapId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SnapsInitialized value) initialize,
    required TResult Function(_GetPaginatedSnaps value) getPaginatedSnaps,
    required TResult Function(_PlaySnapAtIndex value) playSnapAtIndex,
    required TResult Function(_SnapsChange value) onSnapChange,
    required TResult Function(_CreateSnap value) createSnap,
    required TResult Function(_DeleteSnap value) deleteQuick,
    required TResult Function(_LikeSnap value) likeSnap,
    required TResult Function(_UnLikeSnap value) unLikeSnap,
  }) {
    return deleteQuick(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SnapsInitialized value)? initialize,
    TResult Function(_GetPaginatedSnaps value)? getPaginatedSnaps,
    TResult Function(_PlaySnapAtIndex value)? playSnapAtIndex,
    TResult Function(_SnapsChange value)? onSnapChange,
    TResult Function(_CreateSnap value)? createSnap,
    TResult Function(_DeleteSnap value)? deleteQuick,
    TResult Function(_LikeSnap value)? likeSnap,
    TResult Function(_UnLikeSnap value)? unLikeSnap,
  }) {
    return deleteQuick?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SnapsInitialized value)? initialize,
    TResult Function(_GetPaginatedSnaps value)? getPaginatedSnaps,
    TResult Function(_PlaySnapAtIndex value)? playSnapAtIndex,
    TResult Function(_SnapsChange value)? onSnapChange,
    TResult Function(_CreateSnap value)? createSnap,
    TResult Function(_DeleteSnap value)? deleteQuick,
    TResult Function(_LikeSnap value)? likeSnap,
    TResult Function(_UnLikeSnap value)? unLikeSnap,
    required TResult orElse(),
  }) {
    if (deleteQuick != null) {
      return deleteQuick(this);
    }
    return orElse();
  }
}

abstract class _DeleteSnap implements SnapEvent {
  const factory _DeleteSnap({required String snapId}) = _$_DeleteSnap;

  String get snapId;
  @JsonKey(ignore: true)
  _$DeleteSnapCopyWith<_DeleteSnap> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$LikeSnapCopyWith<$Res> {
  factory _$LikeSnapCopyWith(_LikeSnap value, $Res Function(_LikeSnap) then) =
      __$LikeSnapCopyWithImpl<$Res>;
  $Res call({String userId, String snapId});
}

/// @nodoc
class __$LikeSnapCopyWithImpl<$Res> extends _$SnapEventCopyWithImpl<$Res>
    implements _$LikeSnapCopyWith<$Res> {
  __$LikeSnapCopyWithImpl(_LikeSnap _value, $Res Function(_LikeSnap) _then)
      : super(_value, (v) => _then(v as _LikeSnap));

  @override
  _LikeSnap get _value => super._value as _LikeSnap;

  @override
  $Res call({
    Object? userId = freezed,
    Object? snapId = freezed,
  }) {
    return _then(_LikeSnap(
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      snapId: snapId == freezed
          ? _value.snapId
          : snapId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_LikeSnap implements _LikeSnap {
  const _$_LikeSnap({required this.userId, required this.snapId});

  @override
  final String userId;
  @override
  final String snapId;

  @override
  String toString() {
    return 'SnapEvent.likeSnap(userId: $userId, snapId: $snapId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LikeSnap &&
            const DeepCollectionEquality().equals(other.userId, userId) &&
            const DeepCollectionEquality().equals(other.snapId, snapId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(userId),
      const DeepCollectionEquality().hash(snapId));

  @JsonKey(ignore: true)
  @override
  _$LikeSnapCopyWith<_LikeSnap> get copyWith =>
      __$LikeSnapCopyWithImpl<_LikeSnap>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function() getPaginatedSnaps,
    required TResult Function(int index) playSnapAtIndex,
    required TResult Function(int index) onSnapChange,
    required TResult Function(String caption, File file) createSnap,
    required TResult Function(String snapId) deleteQuick,
    required TResult Function(String userId, String snapId) likeSnap,
    required TResult Function(String userId, String snapId) unLikeSnap,
  }) {
    return likeSnap(userId, snapId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function()? getPaginatedSnaps,
    TResult Function(int index)? playSnapAtIndex,
    TResult Function(int index)? onSnapChange,
    TResult Function(String caption, File file)? createSnap,
    TResult Function(String snapId)? deleteQuick,
    TResult Function(String userId, String snapId)? likeSnap,
    TResult Function(String userId, String snapId)? unLikeSnap,
  }) {
    return likeSnap?.call(userId, snapId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function()? getPaginatedSnaps,
    TResult Function(int index)? playSnapAtIndex,
    TResult Function(int index)? onSnapChange,
    TResult Function(String caption, File file)? createSnap,
    TResult Function(String snapId)? deleteQuick,
    TResult Function(String userId, String snapId)? likeSnap,
    TResult Function(String userId, String snapId)? unLikeSnap,
    required TResult orElse(),
  }) {
    if (likeSnap != null) {
      return likeSnap(userId, snapId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SnapsInitialized value) initialize,
    required TResult Function(_GetPaginatedSnaps value) getPaginatedSnaps,
    required TResult Function(_PlaySnapAtIndex value) playSnapAtIndex,
    required TResult Function(_SnapsChange value) onSnapChange,
    required TResult Function(_CreateSnap value) createSnap,
    required TResult Function(_DeleteSnap value) deleteQuick,
    required TResult Function(_LikeSnap value) likeSnap,
    required TResult Function(_UnLikeSnap value) unLikeSnap,
  }) {
    return likeSnap(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SnapsInitialized value)? initialize,
    TResult Function(_GetPaginatedSnaps value)? getPaginatedSnaps,
    TResult Function(_PlaySnapAtIndex value)? playSnapAtIndex,
    TResult Function(_SnapsChange value)? onSnapChange,
    TResult Function(_CreateSnap value)? createSnap,
    TResult Function(_DeleteSnap value)? deleteQuick,
    TResult Function(_LikeSnap value)? likeSnap,
    TResult Function(_UnLikeSnap value)? unLikeSnap,
  }) {
    return likeSnap?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SnapsInitialized value)? initialize,
    TResult Function(_GetPaginatedSnaps value)? getPaginatedSnaps,
    TResult Function(_PlaySnapAtIndex value)? playSnapAtIndex,
    TResult Function(_SnapsChange value)? onSnapChange,
    TResult Function(_CreateSnap value)? createSnap,
    TResult Function(_DeleteSnap value)? deleteQuick,
    TResult Function(_LikeSnap value)? likeSnap,
    TResult Function(_UnLikeSnap value)? unLikeSnap,
    required TResult orElse(),
  }) {
    if (likeSnap != null) {
      return likeSnap(this);
    }
    return orElse();
  }
}

abstract class _LikeSnap implements SnapEvent {
  const factory _LikeSnap({required String userId, required String snapId}) =
      _$_LikeSnap;

  String get userId;
  String get snapId;
  @JsonKey(ignore: true)
  _$LikeSnapCopyWith<_LikeSnap> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$UnLikeSnapCopyWith<$Res> {
  factory _$UnLikeSnapCopyWith(
          _UnLikeSnap value, $Res Function(_UnLikeSnap) then) =
      __$UnLikeSnapCopyWithImpl<$Res>;
  $Res call({String userId, String snapId});
}

/// @nodoc
class __$UnLikeSnapCopyWithImpl<$Res> extends _$SnapEventCopyWithImpl<$Res>
    implements _$UnLikeSnapCopyWith<$Res> {
  __$UnLikeSnapCopyWithImpl(
      _UnLikeSnap _value, $Res Function(_UnLikeSnap) _then)
      : super(_value, (v) => _then(v as _UnLikeSnap));

  @override
  _UnLikeSnap get _value => super._value as _UnLikeSnap;

  @override
  $Res call({
    Object? userId = freezed,
    Object? snapId = freezed,
  }) {
    return _then(_UnLikeSnap(
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      snapId: snapId == freezed
          ? _value.snapId
          : snapId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_UnLikeSnap implements _UnLikeSnap {
  const _$_UnLikeSnap({required this.userId, required this.snapId});

  @override
  final String userId;
  @override
  final String snapId;

  @override
  String toString() {
    return 'SnapEvent.unLikeSnap(userId: $userId, snapId: $snapId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UnLikeSnap &&
            const DeepCollectionEquality().equals(other.userId, userId) &&
            const DeepCollectionEquality().equals(other.snapId, snapId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(userId),
      const DeepCollectionEquality().hash(snapId));

  @JsonKey(ignore: true)
  @override
  _$UnLikeSnapCopyWith<_UnLikeSnap> get copyWith =>
      __$UnLikeSnapCopyWithImpl<_UnLikeSnap>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function() getPaginatedSnaps,
    required TResult Function(int index) playSnapAtIndex,
    required TResult Function(int index) onSnapChange,
    required TResult Function(String caption, File file) createSnap,
    required TResult Function(String snapId) deleteQuick,
    required TResult Function(String userId, String snapId) likeSnap,
    required TResult Function(String userId, String snapId) unLikeSnap,
  }) {
    return unLikeSnap(userId, snapId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function()? getPaginatedSnaps,
    TResult Function(int index)? playSnapAtIndex,
    TResult Function(int index)? onSnapChange,
    TResult Function(String caption, File file)? createSnap,
    TResult Function(String snapId)? deleteQuick,
    TResult Function(String userId, String snapId)? likeSnap,
    TResult Function(String userId, String snapId)? unLikeSnap,
  }) {
    return unLikeSnap?.call(userId, snapId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function()? getPaginatedSnaps,
    TResult Function(int index)? playSnapAtIndex,
    TResult Function(int index)? onSnapChange,
    TResult Function(String caption, File file)? createSnap,
    TResult Function(String snapId)? deleteQuick,
    TResult Function(String userId, String snapId)? likeSnap,
    TResult Function(String userId, String snapId)? unLikeSnap,
    required TResult orElse(),
  }) {
    if (unLikeSnap != null) {
      return unLikeSnap(userId, snapId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SnapsInitialized value) initialize,
    required TResult Function(_GetPaginatedSnaps value) getPaginatedSnaps,
    required TResult Function(_PlaySnapAtIndex value) playSnapAtIndex,
    required TResult Function(_SnapsChange value) onSnapChange,
    required TResult Function(_CreateSnap value) createSnap,
    required TResult Function(_DeleteSnap value) deleteQuick,
    required TResult Function(_LikeSnap value) likeSnap,
    required TResult Function(_UnLikeSnap value) unLikeSnap,
  }) {
    return unLikeSnap(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SnapsInitialized value)? initialize,
    TResult Function(_GetPaginatedSnaps value)? getPaginatedSnaps,
    TResult Function(_PlaySnapAtIndex value)? playSnapAtIndex,
    TResult Function(_SnapsChange value)? onSnapChange,
    TResult Function(_CreateSnap value)? createSnap,
    TResult Function(_DeleteSnap value)? deleteQuick,
    TResult Function(_LikeSnap value)? likeSnap,
    TResult Function(_UnLikeSnap value)? unLikeSnap,
  }) {
    return unLikeSnap?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SnapsInitialized value)? initialize,
    TResult Function(_GetPaginatedSnaps value)? getPaginatedSnaps,
    TResult Function(_PlaySnapAtIndex value)? playSnapAtIndex,
    TResult Function(_SnapsChange value)? onSnapChange,
    TResult Function(_CreateSnap value)? createSnap,
    TResult Function(_DeleteSnap value)? deleteQuick,
    TResult Function(_LikeSnap value)? likeSnap,
    TResult Function(_UnLikeSnap value)? unLikeSnap,
    required TResult orElse(),
  }) {
    if (unLikeSnap != null) {
      return unLikeSnap(this);
    }
    return orElse();
  }
}

abstract class _UnLikeSnap implements SnapEvent {
  const factory _UnLikeSnap({required String userId, required String snapId}) =
      _$_UnLikeSnap;

  String get userId;
  String get snapId;
  @JsonKey(ignore: true)
  _$UnLikeSnapCopyWith<_UnLikeSnap> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$SnapStateTearOff {
  const _$SnapStateTearOff();

  _SnapState call(
      {int focusedIndex = 0,
      String? error = null,
      List<Snap> snaps = const [],
      String? paginationError = null,
      bool isPaginationLoading = false,
      SnapStatus currentState = SnapStatus.idle,
      bool reachedMaximumThreshold = false,
      List<VideoPlayerController> controllers = const [],
      SnapListenableAction action = SnapListenableAction.idle}) {
    return _SnapState(
      focusedIndex: focusedIndex,
      error: error,
      snaps: snaps,
      paginationError: paginationError,
      isPaginationLoading: isPaginationLoading,
      currentState: currentState,
      reachedMaximumThreshold: reachedMaximumThreshold,
      controllers: controllers,
      action: action,
    );
  }
}

/// @nodoc
const $SnapState = _$SnapStateTearOff();

/// @nodoc
mixin _$SnapState {
  int get focusedIndex => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  List<Snap> get snaps => throw _privateConstructorUsedError;
  String? get paginationError => throw _privateConstructorUsedError;
  bool get isPaginationLoading => throw _privateConstructorUsedError;
  SnapStatus get currentState => throw _privateConstructorUsedError;
  bool get reachedMaximumThreshold => throw _privateConstructorUsedError;
  List<VideoPlayerController> get controllers =>
      throw _privateConstructorUsedError;
  SnapListenableAction get action => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SnapStateCopyWith<SnapState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SnapStateCopyWith<$Res> {
  factory $SnapStateCopyWith(SnapState value, $Res Function(SnapState) then) =
      _$SnapStateCopyWithImpl<$Res>;
  $Res call(
      {int focusedIndex,
      String? error,
      List<Snap> snaps,
      String? paginationError,
      bool isPaginationLoading,
      SnapStatus currentState,
      bool reachedMaximumThreshold,
      List<VideoPlayerController> controllers,
      SnapListenableAction action});
}

/// @nodoc
class _$SnapStateCopyWithImpl<$Res> implements $SnapStateCopyWith<$Res> {
  _$SnapStateCopyWithImpl(this._value, this._then);

  final SnapState _value;
  // ignore: unused_field
  final $Res Function(SnapState) _then;

  @override
  $Res call({
    Object? focusedIndex = freezed,
    Object? error = freezed,
    Object? snaps = freezed,
    Object? paginationError = freezed,
    Object? isPaginationLoading = freezed,
    Object? currentState = freezed,
    Object? reachedMaximumThreshold = freezed,
    Object? controllers = freezed,
    Object? action = freezed,
  }) {
    return _then(_value.copyWith(
      focusedIndex: focusedIndex == freezed
          ? _value.focusedIndex
          : focusedIndex // ignore: cast_nullable_to_non_nullable
              as int,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      snaps: snaps == freezed
          ? _value.snaps
          : snaps // ignore: cast_nullable_to_non_nullable
              as List<Snap>,
      paginationError: paginationError == freezed
          ? _value.paginationError
          : paginationError // ignore: cast_nullable_to_non_nullable
              as String?,
      isPaginationLoading: isPaginationLoading == freezed
          ? _value.isPaginationLoading
          : isPaginationLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      currentState: currentState == freezed
          ? _value.currentState
          : currentState // ignore: cast_nullable_to_non_nullable
              as SnapStatus,
      reachedMaximumThreshold: reachedMaximumThreshold == freezed
          ? _value.reachedMaximumThreshold
          : reachedMaximumThreshold // ignore: cast_nullable_to_non_nullable
              as bool,
      controllers: controllers == freezed
          ? _value.controllers
          : controllers // ignore: cast_nullable_to_non_nullable
              as List<VideoPlayerController>,
      action: action == freezed
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as SnapListenableAction,
    ));
  }
}

/// @nodoc
abstract class _$SnapStateCopyWith<$Res> implements $SnapStateCopyWith<$Res> {
  factory _$SnapStateCopyWith(
          _SnapState value, $Res Function(_SnapState) then) =
      __$SnapStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {int focusedIndex,
      String? error,
      List<Snap> snaps,
      String? paginationError,
      bool isPaginationLoading,
      SnapStatus currentState,
      bool reachedMaximumThreshold,
      List<VideoPlayerController> controllers,
      SnapListenableAction action});
}

/// @nodoc
class __$SnapStateCopyWithImpl<$Res> extends _$SnapStateCopyWithImpl<$Res>
    implements _$SnapStateCopyWith<$Res> {
  __$SnapStateCopyWithImpl(_SnapState _value, $Res Function(_SnapState) _then)
      : super(_value, (v) => _then(v as _SnapState));

  @override
  _SnapState get _value => super._value as _SnapState;

  @override
  $Res call({
    Object? focusedIndex = freezed,
    Object? error = freezed,
    Object? snaps = freezed,
    Object? paginationError = freezed,
    Object? isPaginationLoading = freezed,
    Object? currentState = freezed,
    Object? reachedMaximumThreshold = freezed,
    Object? controllers = freezed,
    Object? action = freezed,
  }) {
    return _then(_SnapState(
      focusedIndex: focusedIndex == freezed
          ? _value.focusedIndex
          : focusedIndex // ignore: cast_nullable_to_non_nullable
              as int,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      snaps: snaps == freezed
          ? _value.snaps
          : snaps // ignore: cast_nullable_to_non_nullable
              as List<Snap>,
      paginationError: paginationError == freezed
          ? _value.paginationError
          : paginationError // ignore: cast_nullable_to_non_nullable
              as String?,
      isPaginationLoading: isPaginationLoading == freezed
          ? _value.isPaginationLoading
          : isPaginationLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      currentState: currentState == freezed
          ? _value.currentState
          : currentState // ignore: cast_nullable_to_non_nullable
              as SnapStatus,
      reachedMaximumThreshold: reachedMaximumThreshold == freezed
          ? _value.reachedMaximumThreshold
          : reachedMaximumThreshold // ignore: cast_nullable_to_non_nullable
              as bool,
      controllers: controllers == freezed
          ? _value.controllers
          : controllers // ignore: cast_nullable_to_non_nullable
              as List<VideoPlayerController>,
      action: action == freezed
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as SnapListenableAction,
    ));
  }
}

/// @nodoc

class _$_SnapState implements _SnapState {
  _$_SnapState(
      {this.focusedIndex = 0,
      this.error = null,
      this.snaps = const [],
      this.paginationError = null,
      this.isPaginationLoading = false,
      this.currentState = SnapStatus.idle,
      this.reachedMaximumThreshold = false,
      this.controllers = const [],
      this.action = SnapListenableAction.idle});

  @JsonKey()
  @override
  final int focusedIndex;
  @JsonKey()
  @override
  final String? error;
  @JsonKey()
  @override
  final List<Snap> snaps;
  @JsonKey()
  @override
  final String? paginationError;
  @JsonKey()
  @override
  final bool isPaginationLoading;
  @JsonKey()
  @override
  final SnapStatus currentState;
  @JsonKey()
  @override
  final bool reachedMaximumThreshold;
  @JsonKey()
  @override
  final List<VideoPlayerController> controllers;
  @JsonKey()
  @override
  final SnapListenableAction action;

  @override
  String toString() {
    return 'SnapState(focusedIndex: $focusedIndex, error: $error, snaps: $snaps, paginationError: $paginationError, isPaginationLoading: $isPaginationLoading, currentState: $currentState, reachedMaximumThreshold: $reachedMaximumThreshold, controllers: $controllers, action: $action)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SnapState &&
            const DeepCollectionEquality()
                .equals(other.focusedIndex, focusedIndex) &&
            const DeepCollectionEquality().equals(other.error, error) &&
            const DeepCollectionEquality().equals(other.snaps, snaps) &&
            const DeepCollectionEquality()
                .equals(other.paginationError, paginationError) &&
            const DeepCollectionEquality()
                .equals(other.isPaginationLoading, isPaginationLoading) &&
            const DeepCollectionEquality()
                .equals(other.currentState, currentState) &&
            const DeepCollectionEquality().equals(
                other.reachedMaximumThreshold, reachedMaximumThreshold) &&
            const DeepCollectionEquality()
                .equals(other.controllers, controllers) &&
            const DeepCollectionEquality().equals(other.action, action));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(focusedIndex),
      const DeepCollectionEquality().hash(error),
      const DeepCollectionEquality().hash(snaps),
      const DeepCollectionEquality().hash(paginationError),
      const DeepCollectionEquality().hash(isPaginationLoading),
      const DeepCollectionEquality().hash(currentState),
      const DeepCollectionEquality().hash(reachedMaximumThreshold),
      const DeepCollectionEquality().hash(controllers),
      const DeepCollectionEquality().hash(action));

  @JsonKey(ignore: true)
  @override
  _$SnapStateCopyWith<_SnapState> get copyWith =>
      __$SnapStateCopyWithImpl<_SnapState>(this, _$identity);
}

abstract class _SnapState implements SnapState {
  factory _SnapState(
      {int focusedIndex,
      String? error,
      List<Snap> snaps,
      String? paginationError,
      bool isPaginationLoading,
      SnapStatus currentState,
      bool reachedMaximumThreshold,
      List<VideoPlayerController> controllers,
      SnapListenableAction action}) = _$_SnapState;

  @override
  int get focusedIndex;
  @override
  String? get error;
  @override
  List<Snap> get snaps;
  @override
  String? get paginationError;
  @override
  bool get isPaginationLoading;
  @override
  SnapStatus get currentState;
  @override
  bool get reachedMaximumThreshold;
  @override
  List<VideoPlayerController> get controllers;
  @override
  SnapListenableAction get action;
  @override
  @JsonKey(ignore: true)
  _$SnapStateCopyWith<_SnapState> get copyWith =>
      throw _privateConstructorUsedError;
}
