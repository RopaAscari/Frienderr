// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'quick_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$QuickEventTearOff {
  const _$QuickEventTearOff();

  _QuicksInitialized initialize() {
    return const _QuicksInitialized();
  }

  _PlaySnapAtIndex playSnapAtIndex({required int index}) {
    return _PlaySnapAtIndex(
      index: index,
    );
  }

  _QuicksChange onSnapChange({required int index}) {
    return _QuicksChange(
      index: index,
    );
  }

  _CreateQuick createQuick({required String caption, required File file}) {
    return _CreateQuick(
      caption: caption,
      file: file,
    );
  }

  _DeleteQuick deleteQuick({required String quickId}) {
    return _DeleteQuick(
      quickId: quickId,
    );
  }

  _LikeQuick likeQuick({required String userId, required String quickId}) {
    return _LikeQuick(
      userId: userId,
      quickId: quickId,
    );
  }

  _UnLikeQuick unLikeQuick({required String userId, required String quickId}) {
    return _UnLikeQuick(
      userId: userId,
      quickId: quickId,
    );
  }
}

/// @nodoc
const $QuickEvent = _$QuickEventTearOff();

/// @nodoc
mixin _$QuickEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(int index) playSnapAtIndex,
    required TResult Function(int index) onSnapChange,
    required TResult Function(String caption, File file) createQuick,
    required TResult Function(String quickId) deleteQuick,
    required TResult Function(String userId, String quickId) likeQuick,
    required TResult Function(String userId, String quickId) unLikeQuick,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(int index)? playSnapAtIndex,
    TResult Function(int index)? onSnapChange,
    TResult Function(String caption, File file)? createQuick,
    TResult Function(String quickId)? deleteQuick,
    TResult Function(String userId, String quickId)? likeQuick,
    TResult Function(String userId, String quickId)? unLikeQuick,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(int index)? playSnapAtIndex,
    TResult Function(int index)? onSnapChange,
    TResult Function(String caption, File file)? createQuick,
    TResult Function(String quickId)? deleteQuick,
    TResult Function(String userId, String quickId)? likeQuick,
    TResult Function(String userId, String quickId)? unLikeQuick,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_QuicksInitialized value) initialize,
    required TResult Function(_PlaySnapAtIndex value) playSnapAtIndex,
    required TResult Function(_QuicksChange value) onSnapChange,
    required TResult Function(_CreateQuick value) createQuick,
    required TResult Function(_DeleteQuick value) deleteQuick,
    required TResult Function(_LikeQuick value) likeQuick,
    required TResult Function(_UnLikeQuick value) unLikeQuick,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_QuicksInitialized value)? initialize,
    TResult Function(_PlaySnapAtIndex value)? playSnapAtIndex,
    TResult Function(_QuicksChange value)? onSnapChange,
    TResult Function(_CreateQuick value)? createQuick,
    TResult Function(_DeleteQuick value)? deleteQuick,
    TResult Function(_LikeQuick value)? likeQuick,
    TResult Function(_UnLikeQuick value)? unLikeQuick,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_QuicksInitialized value)? initialize,
    TResult Function(_PlaySnapAtIndex value)? playSnapAtIndex,
    TResult Function(_QuicksChange value)? onSnapChange,
    TResult Function(_CreateQuick value)? createQuick,
    TResult Function(_DeleteQuick value)? deleteQuick,
    TResult Function(_LikeQuick value)? likeQuick,
    TResult Function(_UnLikeQuick value)? unLikeQuick,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuickEventCopyWith<$Res> {
  factory $QuickEventCopyWith(
          QuickEvent value, $Res Function(QuickEvent) then) =
      _$QuickEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$QuickEventCopyWithImpl<$Res> implements $QuickEventCopyWith<$Res> {
  _$QuickEventCopyWithImpl(this._value, this._then);

  final QuickEvent _value;
  // ignore: unused_field
  final $Res Function(QuickEvent) _then;
}

/// @nodoc
abstract class _$QuicksInitializedCopyWith<$Res> {
  factory _$QuicksInitializedCopyWith(
          _QuicksInitialized value, $Res Function(_QuicksInitialized) then) =
      __$QuicksInitializedCopyWithImpl<$Res>;
}

/// @nodoc
class __$QuicksInitializedCopyWithImpl<$Res>
    extends _$QuickEventCopyWithImpl<$Res>
    implements _$QuicksInitializedCopyWith<$Res> {
  __$QuicksInitializedCopyWithImpl(
      _QuicksInitialized _value, $Res Function(_QuicksInitialized) _then)
      : super(_value, (v) => _then(v as _QuicksInitialized));

  @override
  _QuicksInitialized get _value => super._value as _QuicksInitialized;
}

/// @nodoc

class _$_QuicksInitialized implements _QuicksInitialized {
  const _$_QuicksInitialized();

  @override
  String toString() {
    return 'QuickEvent.initialize()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _QuicksInitialized);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(int index) playSnapAtIndex,
    required TResult Function(int index) onSnapChange,
    required TResult Function(String caption, File file) createQuick,
    required TResult Function(String quickId) deleteQuick,
    required TResult Function(String userId, String quickId) likeQuick,
    required TResult Function(String userId, String quickId) unLikeQuick,
  }) {
    return initialize();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(int index)? playSnapAtIndex,
    TResult Function(int index)? onSnapChange,
    TResult Function(String caption, File file)? createQuick,
    TResult Function(String quickId)? deleteQuick,
    TResult Function(String userId, String quickId)? likeQuick,
    TResult Function(String userId, String quickId)? unLikeQuick,
  }) {
    return initialize?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(int index)? playSnapAtIndex,
    TResult Function(int index)? onSnapChange,
    TResult Function(String caption, File file)? createQuick,
    TResult Function(String quickId)? deleteQuick,
    TResult Function(String userId, String quickId)? likeQuick,
    TResult Function(String userId, String quickId)? unLikeQuick,
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
    required TResult Function(_QuicksInitialized value) initialize,
    required TResult Function(_PlaySnapAtIndex value) playSnapAtIndex,
    required TResult Function(_QuicksChange value) onSnapChange,
    required TResult Function(_CreateQuick value) createQuick,
    required TResult Function(_DeleteQuick value) deleteQuick,
    required TResult Function(_LikeQuick value) likeQuick,
    required TResult Function(_UnLikeQuick value) unLikeQuick,
  }) {
    return initialize(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_QuicksInitialized value)? initialize,
    TResult Function(_PlaySnapAtIndex value)? playSnapAtIndex,
    TResult Function(_QuicksChange value)? onSnapChange,
    TResult Function(_CreateQuick value)? createQuick,
    TResult Function(_DeleteQuick value)? deleteQuick,
    TResult Function(_LikeQuick value)? likeQuick,
    TResult Function(_UnLikeQuick value)? unLikeQuick,
  }) {
    return initialize?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_QuicksInitialized value)? initialize,
    TResult Function(_PlaySnapAtIndex value)? playSnapAtIndex,
    TResult Function(_QuicksChange value)? onSnapChange,
    TResult Function(_CreateQuick value)? createQuick,
    TResult Function(_DeleteQuick value)? deleteQuick,
    TResult Function(_LikeQuick value)? likeQuick,
    TResult Function(_UnLikeQuick value)? unLikeQuick,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(this);
    }
    return orElse();
  }
}

abstract class _QuicksInitialized implements QuickEvent {
  const factory _QuicksInitialized() = _$_QuicksInitialized;
}

/// @nodoc
abstract class _$PlaySnapAtIndexCopyWith<$Res> {
  factory _$PlaySnapAtIndexCopyWith(
          _PlaySnapAtIndex value, $Res Function(_PlaySnapAtIndex) then) =
      __$PlaySnapAtIndexCopyWithImpl<$Res>;
  $Res call({int index});
}

/// @nodoc
class __$PlaySnapAtIndexCopyWithImpl<$Res>
    extends _$QuickEventCopyWithImpl<$Res>
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
    return 'QuickEvent.playSnapAtIndex(index: $index)';
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
    required TResult Function(int index) playSnapAtIndex,
    required TResult Function(int index) onSnapChange,
    required TResult Function(String caption, File file) createQuick,
    required TResult Function(String quickId) deleteQuick,
    required TResult Function(String userId, String quickId) likeQuick,
    required TResult Function(String userId, String quickId) unLikeQuick,
  }) {
    return playSnapAtIndex(index);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(int index)? playSnapAtIndex,
    TResult Function(int index)? onSnapChange,
    TResult Function(String caption, File file)? createQuick,
    TResult Function(String quickId)? deleteQuick,
    TResult Function(String userId, String quickId)? likeQuick,
    TResult Function(String userId, String quickId)? unLikeQuick,
  }) {
    return playSnapAtIndex?.call(index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(int index)? playSnapAtIndex,
    TResult Function(int index)? onSnapChange,
    TResult Function(String caption, File file)? createQuick,
    TResult Function(String quickId)? deleteQuick,
    TResult Function(String userId, String quickId)? likeQuick,
    TResult Function(String userId, String quickId)? unLikeQuick,
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
    required TResult Function(_QuicksInitialized value) initialize,
    required TResult Function(_PlaySnapAtIndex value) playSnapAtIndex,
    required TResult Function(_QuicksChange value) onSnapChange,
    required TResult Function(_CreateQuick value) createQuick,
    required TResult Function(_DeleteQuick value) deleteQuick,
    required TResult Function(_LikeQuick value) likeQuick,
    required TResult Function(_UnLikeQuick value) unLikeQuick,
  }) {
    return playSnapAtIndex(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_QuicksInitialized value)? initialize,
    TResult Function(_PlaySnapAtIndex value)? playSnapAtIndex,
    TResult Function(_QuicksChange value)? onSnapChange,
    TResult Function(_CreateQuick value)? createQuick,
    TResult Function(_DeleteQuick value)? deleteQuick,
    TResult Function(_LikeQuick value)? likeQuick,
    TResult Function(_UnLikeQuick value)? unLikeQuick,
  }) {
    return playSnapAtIndex?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_QuicksInitialized value)? initialize,
    TResult Function(_PlaySnapAtIndex value)? playSnapAtIndex,
    TResult Function(_QuicksChange value)? onSnapChange,
    TResult Function(_CreateQuick value)? createQuick,
    TResult Function(_DeleteQuick value)? deleteQuick,
    TResult Function(_LikeQuick value)? likeQuick,
    TResult Function(_UnLikeQuick value)? unLikeQuick,
    required TResult orElse(),
  }) {
    if (playSnapAtIndex != null) {
      return playSnapAtIndex(this);
    }
    return orElse();
  }
}

abstract class _PlaySnapAtIndex implements QuickEvent {
  const factory _PlaySnapAtIndex({required int index}) = _$_PlaySnapAtIndex;

  int get index;
  @JsonKey(ignore: true)
  _$PlaySnapAtIndexCopyWith<_PlaySnapAtIndex> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$QuicksChangeCopyWith<$Res> {
  factory _$QuicksChangeCopyWith(
          _QuicksChange value, $Res Function(_QuicksChange) then) =
      __$QuicksChangeCopyWithImpl<$Res>;
  $Res call({int index});
}

/// @nodoc
class __$QuicksChangeCopyWithImpl<$Res> extends _$QuickEventCopyWithImpl<$Res>
    implements _$QuicksChangeCopyWith<$Res> {
  __$QuicksChangeCopyWithImpl(
      _QuicksChange _value, $Res Function(_QuicksChange) _then)
      : super(_value, (v) => _then(v as _QuicksChange));

  @override
  _QuicksChange get _value => super._value as _QuicksChange;

  @override
  $Res call({
    Object? index = freezed,
  }) {
    return _then(_QuicksChange(
      index: index == freezed
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_QuicksChange implements _QuicksChange {
  const _$_QuicksChange({required this.index});

  @override
  final int index;

  @override
  String toString() {
    return 'QuickEvent.onSnapChange(index: $index)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _QuicksChange &&
            const DeepCollectionEquality().equals(other.index, index));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(index));

  @JsonKey(ignore: true)
  @override
  _$QuicksChangeCopyWith<_QuicksChange> get copyWith =>
      __$QuicksChangeCopyWithImpl<_QuicksChange>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(int index) playSnapAtIndex,
    required TResult Function(int index) onSnapChange,
    required TResult Function(String caption, File file) createQuick,
    required TResult Function(String quickId) deleteQuick,
    required TResult Function(String userId, String quickId) likeQuick,
    required TResult Function(String userId, String quickId) unLikeQuick,
  }) {
    return onSnapChange(index);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(int index)? playSnapAtIndex,
    TResult Function(int index)? onSnapChange,
    TResult Function(String caption, File file)? createQuick,
    TResult Function(String quickId)? deleteQuick,
    TResult Function(String userId, String quickId)? likeQuick,
    TResult Function(String userId, String quickId)? unLikeQuick,
  }) {
    return onSnapChange?.call(index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(int index)? playSnapAtIndex,
    TResult Function(int index)? onSnapChange,
    TResult Function(String caption, File file)? createQuick,
    TResult Function(String quickId)? deleteQuick,
    TResult Function(String userId, String quickId)? likeQuick,
    TResult Function(String userId, String quickId)? unLikeQuick,
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
    required TResult Function(_QuicksInitialized value) initialize,
    required TResult Function(_PlaySnapAtIndex value) playSnapAtIndex,
    required TResult Function(_QuicksChange value) onSnapChange,
    required TResult Function(_CreateQuick value) createQuick,
    required TResult Function(_DeleteQuick value) deleteQuick,
    required TResult Function(_LikeQuick value) likeQuick,
    required TResult Function(_UnLikeQuick value) unLikeQuick,
  }) {
    return onSnapChange(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_QuicksInitialized value)? initialize,
    TResult Function(_PlaySnapAtIndex value)? playSnapAtIndex,
    TResult Function(_QuicksChange value)? onSnapChange,
    TResult Function(_CreateQuick value)? createQuick,
    TResult Function(_DeleteQuick value)? deleteQuick,
    TResult Function(_LikeQuick value)? likeQuick,
    TResult Function(_UnLikeQuick value)? unLikeQuick,
  }) {
    return onSnapChange?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_QuicksInitialized value)? initialize,
    TResult Function(_PlaySnapAtIndex value)? playSnapAtIndex,
    TResult Function(_QuicksChange value)? onSnapChange,
    TResult Function(_CreateQuick value)? createQuick,
    TResult Function(_DeleteQuick value)? deleteQuick,
    TResult Function(_LikeQuick value)? likeQuick,
    TResult Function(_UnLikeQuick value)? unLikeQuick,
    required TResult orElse(),
  }) {
    if (onSnapChange != null) {
      return onSnapChange(this);
    }
    return orElse();
  }
}

abstract class _QuicksChange implements QuickEvent {
  const factory _QuicksChange({required int index}) = _$_QuicksChange;

  int get index;
  @JsonKey(ignore: true)
  _$QuicksChangeCopyWith<_QuicksChange> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$CreateQuickCopyWith<$Res> {
  factory _$CreateQuickCopyWith(
          _CreateQuick value, $Res Function(_CreateQuick) then) =
      __$CreateQuickCopyWithImpl<$Res>;
  $Res call({String caption, File file});
}

/// @nodoc
class __$CreateQuickCopyWithImpl<$Res> extends _$QuickEventCopyWithImpl<$Res>
    implements _$CreateQuickCopyWith<$Res> {
  __$CreateQuickCopyWithImpl(
      _CreateQuick _value, $Res Function(_CreateQuick) _then)
      : super(_value, (v) => _then(v as _CreateQuick));

  @override
  _CreateQuick get _value => super._value as _CreateQuick;

  @override
  $Res call({
    Object? caption = freezed,
    Object? file = freezed,
  }) {
    return _then(_CreateQuick(
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

class _$_CreateQuick implements _CreateQuick {
  const _$_CreateQuick({required this.caption, required this.file});

  @override
  final String caption;
  @override
  final File file;

  @override
  String toString() {
    return 'QuickEvent.createQuick(caption: $caption, file: $file)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CreateQuick &&
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
  _$CreateQuickCopyWith<_CreateQuick> get copyWith =>
      __$CreateQuickCopyWithImpl<_CreateQuick>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(int index) playSnapAtIndex,
    required TResult Function(int index) onSnapChange,
    required TResult Function(String caption, File file) createQuick,
    required TResult Function(String quickId) deleteQuick,
    required TResult Function(String userId, String quickId) likeQuick,
    required TResult Function(String userId, String quickId) unLikeQuick,
  }) {
    return createQuick(caption, file);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(int index)? playSnapAtIndex,
    TResult Function(int index)? onSnapChange,
    TResult Function(String caption, File file)? createQuick,
    TResult Function(String quickId)? deleteQuick,
    TResult Function(String userId, String quickId)? likeQuick,
    TResult Function(String userId, String quickId)? unLikeQuick,
  }) {
    return createQuick?.call(caption, file);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(int index)? playSnapAtIndex,
    TResult Function(int index)? onSnapChange,
    TResult Function(String caption, File file)? createQuick,
    TResult Function(String quickId)? deleteQuick,
    TResult Function(String userId, String quickId)? likeQuick,
    TResult Function(String userId, String quickId)? unLikeQuick,
    required TResult orElse(),
  }) {
    if (createQuick != null) {
      return createQuick(caption, file);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_QuicksInitialized value) initialize,
    required TResult Function(_PlaySnapAtIndex value) playSnapAtIndex,
    required TResult Function(_QuicksChange value) onSnapChange,
    required TResult Function(_CreateQuick value) createQuick,
    required TResult Function(_DeleteQuick value) deleteQuick,
    required TResult Function(_LikeQuick value) likeQuick,
    required TResult Function(_UnLikeQuick value) unLikeQuick,
  }) {
    return createQuick(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_QuicksInitialized value)? initialize,
    TResult Function(_PlaySnapAtIndex value)? playSnapAtIndex,
    TResult Function(_QuicksChange value)? onSnapChange,
    TResult Function(_CreateQuick value)? createQuick,
    TResult Function(_DeleteQuick value)? deleteQuick,
    TResult Function(_LikeQuick value)? likeQuick,
    TResult Function(_UnLikeQuick value)? unLikeQuick,
  }) {
    return createQuick?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_QuicksInitialized value)? initialize,
    TResult Function(_PlaySnapAtIndex value)? playSnapAtIndex,
    TResult Function(_QuicksChange value)? onSnapChange,
    TResult Function(_CreateQuick value)? createQuick,
    TResult Function(_DeleteQuick value)? deleteQuick,
    TResult Function(_LikeQuick value)? likeQuick,
    TResult Function(_UnLikeQuick value)? unLikeQuick,
    required TResult orElse(),
  }) {
    if (createQuick != null) {
      return createQuick(this);
    }
    return orElse();
  }
}

abstract class _CreateQuick implements QuickEvent {
  const factory _CreateQuick({required String caption, required File file}) =
      _$_CreateQuick;

  String get caption;
  File get file;
  @JsonKey(ignore: true)
  _$CreateQuickCopyWith<_CreateQuick> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$DeleteQuickCopyWith<$Res> {
  factory _$DeleteQuickCopyWith(
          _DeleteQuick value, $Res Function(_DeleteQuick) then) =
      __$DeleteQuickCopyWithImpl<$Res>;
  $Res call({String quickId});
}

/// @nodoc
class __$DeleteQuickCopyWithImpl<$Res> extends _$QuickEventCopyWithImpl<$Res>
    implements _$DeleteQuickCopyWith<$Res> {
  __$DeleteQuickCopyWithImpl(
      _DeleteQuick _value, $Res Function(_DeleteQuick) _then)
      : super(_value, (v) => _then(v as _DeleteQuick));

  @override
  _DeleteQuick get _value => super._value as _DeleteQuick;

  @override
  $Res call({
    Object? quickId = freezed,
  }) {
    return _then(_DeleteQuick(
      quickId: quickId == freezed
          ? _value.quickId
          : quickId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_DeleteQuick implements _DeleteQuick {
  const _$_DeleteQuick({required this.quickId});

  @override
  final String quickId;

  @override
  String toString() {
    return 'QuickEvent.deleteQuick(quickId: $quickId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DeleteQuick &&
            const DeepCollectionEquality().equals(other.quickId, quickId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(quickId));

  @JsonKey(ignore: true)
  @override
  _$DeleteQuickCopyWith<_DeleteQuick> get copyWith =>
      __$DeleteQuickCopyWithImpl<_DeleteQuick>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(int index) playSnapAtIndex,
    required TResult Function(int index) onSnapChange,
    required TResult Function(String caption, File file) createQuick,
    required TResult Function(String quickId) deleteQuick,
    required TResult Function(String userId, String quickId) likeQuick,
    required TResult Function(String userId, String quickId) unLikeQuick,
  }) {
    return deleteQuick(quickId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(int index)? playSnapAtIndex,
    TResult Function(int index)? onSnapChange,
    TResult Function(String caption, File file)? createQuick,
    TResult Function(String quickId)? deleteQuick,
    TResult Function(String userId, String quickId)? likeQuick,
    TResult Function(String userId, String quickId)? unLikeQuick,
  }) {
    return deleteQuick?.call(quickId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(int index)? playSnapAtIndex,
    TResult Function(int index)? onSnapChange,
    TResult Function(String caption, File file)? createQuick,
    TResult Function(String quickId)? deleteQuick,
    TResult Function(String userId, String quickId)? likeQuick,
    TResult Function(String userId, String quickId)? unLikeQuick,
    required TResult orElse(),
  }) {
    if (deleteQuick != null) {
      return deleteQuick(quickId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_QuicksInitialized value) initialize,
    required TResult Function(_PlaySnapAtIndex value) playSnapAtIndex,
    required TResult Function(_QuicksChange value) onSnapChange,
    required TResult Function(_CreateQuick value) createQuick,
    required TResult Function(_DeleteQuick value) deleteQuick,
    required TResult Function(_LikeQuick value) likeQuick,
    required TResult Function(_UnLikeQuick value) unLikeQuick,
  }) {
    return deleteQuick(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_QuicksInitialized value)? initialize,
    TResult Function(_PlaySnapAtIndex value)? playSnapAtIndex,
    TResult Function(_QuicksChange value)? onSnapChange,
    TResult Function(_CreateQuick value)? createQuick,
    TResult Function(_DeleteQuick value)? deleteQuick,
    TResult Function(_LikeQuick value)? likeQuick,
    TResult Function(_UnLikeQuick value)? unLikeQuick,
  }) {
    return deleteQuick?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_QuicksInitialized value)? initialize,
    TResult Function(_PlaySnapAtIndex value)? playSnapAtIndex,
    TResult Function(_QuicksChange value)? onSnapChange,
    TResult Function(_CreateQuick value)? createQuick,
    TResult Function(_DeleteQuick value)? deleteQuick,
    TResult Function(_LikeQuick value)? likeQuick,
    TResult Function(_UnLikeQuick value)? unLikeQuick,
    required TResult orElse(),
  }) {
    if (deleteQuick != null) {
      return deleteQuick(this);
    }
    return orElse();
  }
}

abstract class _DeleteQuick implements QuickEvent {
  const factory _DeleteQuick({required String quickId}) = _$_DeleteQuick;

  String get quickId;
  @JsonKey(ignore: true)
  _$DeleteQuickCopyWith<_DeleteQuick> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$LikeQuickCopyWith<$Res> {
  factory _$LikeQuickCopyWith(
          _LikeQuick value, $Res Function(_LikeQuick) then) =
      __$LikeQuickCopyWithImpl<$Res>;
  $Res call({String userId, String quickId});
}

/// @nodoc
class __$LikeQuickCopyWithImpl<$Res> extends _$QuickEventCopyWithImpl<$Res>
    implements _$LikeQuickCopyWith<$Res> {
  __$LikeQuickCopyWithImpl(_LikeQuick _value, $Res Function(_LikeQuick) _then)
      : super(_value, (v) => _then(v as _LikeQuick));

  @override
  _LikeQuick get _value => super._value as _LikeQuick;

  @override
  $Res call({
    Object? userId = freezed,
    Object? quickId = freezed,
  }) {
    return _then(_LikeQuick(
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      quickId: quickId == freezed
          ? _value.quickId
          : quickId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_LikeQuick implements _LikeQuick {
  const _$_LikeQuick({required this.userId, required this.quickId});

  @override
  final String userId;
  @override
  final String quickId;

  @override
  String toString() {
    return 'QuickEvent.likeQuick(userId: $userId, quickId: $quickId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LikeQuick &&
            const DeepCollectionEquality().equals(other.userId, userId) &&
            const DeepCollectionEquality().equals(other.quickId, quickId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(userId),
      const DeepCollectionEquality().hash(quickId));

  @JsonKey(ignore: true)
  @override
  _$LikeQuickCopyWith<_LikeQuick> get copyWith =>
      __$LikeQuickCopyWithImpl<_LikeQuick>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(int index) playSnapAtIndex,
    required TResult Function(int index) onSnapChange,
    required TResult Function(String caption, File file) createQuick,
    required TResult Function(String quickId) deleteQuick,
    required TResult Function(String userId, String quickId) likeQuick,
    required TResult Function(String userId, String quickId) unLikeQuick,
  }) {
    return likeQuick(userId, quickId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(int index)? playSnapAtIndex,
    TResult Function(int index)? onSnapChange,
    TResult Function(String caption, File file)? createQuick,
    TResult Function(String quickId)? deleteQuick,
    TResult Function(String userId, String quickId)? likeQuick,
    TResult Function(String userId, String quickId)? unLikeQuick,
  }) {
    return likeQuick?.call(userId, quickId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(int index)? playSnapAtIndex,
    TResult Function(int index)? onSnapChange,
    TResult Function(String caption, File file)? createQuick,
    TResult Function(String quickId)? deleteQuick,
    TResult Function(String userId, String quickId)? likeQuick,
    TResult Function(String userId, String quickId)? unLikeQuick,
    required TResult orElse(),
  }) {
    if (likeQuick != null) {
      return likeQuick(userId, quickId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_QuicksInitialized value) initialize,
    required TResult Function(_PlaySnapAtIndex value) playSnapAtIndex,
    required TResult Function(_QuicksChange value) onSnapChange,
    required TResult Function(_CreateQuick value) createQuick,
    required TResult Function(_DeleteQuick value) deleteQuick,
    required TResult Function(_LikeQuick value) likeQuick,
    required TResult Function(_UnLikeQuick value) unLikeQuick,
  }) {
    return likeQuick(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_QuicksInitialized value)? initialize,
    TResult Function(_PlaySnapAtIndex value)? playSnapAtIndex,
    TResult Function(_QuicksChange value)? onSnapChange,
    TResult Function(_CreateQuick value)? createQuick,
    TResult Function(_DeleteQuick value)? deleteQuick,
    TResult Function(_LikeQuick value)? likeQuick,
    TResult Function(_UnLikeQuick value)? unLikeQuick,
  }) {
    return likeQuick?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_QuicksInitialized value)? initialize,
    TResult Function(_PlaySnapAtIndex value)? playSnapAtIndex,
    TResult Function(_QuicksChange value)? onSnapChange,
    TResult Function(_CreateQuick value)? createQuick,
    TResult Function(_DeleteQuick value)? deleteQuick,
    TResult Function(_LikeQuick value)? likeQuick,
    TResult Function(_UnLikeQuick value)? unLikeQuick,
    required TResult orElse(),
  }) {
    if (likeQuick != null) {
      return likeQuick(this);
    }
    return orElse();
  }
}

abstract class _LikeQuick implements QuickEvent {
  const factory _LikeQuick({required String userId, required String quickId}) =
      _$_LikeQuick;

  String get userId;
  String get quickId;
  @JsonKey(ignore: true)
  _$LikeQuickCopyWith<_LikeQuick> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$UnLikeQuickCopyWith<$Res> {
  factory _$UnLikeQuickCopyWith(
          _UnLikeQuick value, $Res Function(_UnLikeQuick) then) =
      __$UnLikeQuickCopyWithImpl<$Res>;
  $Res call({String userId, String quickId});
}

/// @nodoc
class __$UnLikeQuickCopyWithImpl<$Res> extends _$QuickEventCopyWithImpl<$Res>
    implements _$UnLikeQuickCopyWith<$Res> {
  __$UnLikeQuickCopyWithImpl(
      _UnLikeQuick _value, $Res Function(_UnLikeQuick) _then)
      : super(_value, (v) => _then(v as _UnLikeQuick));

  @override
  _UnLikeQuick get _value => super._value as _UnLikeQuick;

  @override
  $Res call({
    Object? userId = freezed,
    Object? quickId = freezed,
  }) {
    return _then(_UnLikeQuick(
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      quickId: quickId == freezed
          ? _value.quickId
          : quickId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_UnLikeQuick implements _UnLikeQuick {
  const _$_UnLikeQuick({required this.userId, required this.quickId});

  @override
  final String userId;
  @override
  final String quickId;

  @override
  String toString() {
    return 'QuickEvent.unLikeQuick(userId: $userId, quickId: $quickId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UnLikeQuick &&
            const DeepCollectionEquality().equals(other.userId, userId) &&
            const DeepCollectionEquality().equals(other.quickId, quickId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(userId),
      const DeepCollectionEquality().hash(quickId));

  @JsonKey(ignore: true)
  @override
  _$UnLikeQuickCopyWith<_UnLikeQuick> get copyWith =>
      __$UnLikeQuickCopyWithImpl<_UnLikeQuick>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(int index) playSnapAtIndex,
    required TResult Function(int index) onSnapChange,
    required TResult Function(String caption, File file) createQuick,
    required TResult Function(String quickId) deleteQuick,
    required TResult Function(String userId, String quickId) likeQuick,
    required TResult Function(String userId, String quickId) unLikeQuick,
  }) {
    return unLikeQuick(userId, quickId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(int index)? playSnapAtIndex,
    TResult Function(int index)? onSnapChange,
    TResult Function(String caption, File file)? createQuick,
    TResult Function(String quickId)? deleteQuick,
    TResult Function(String userId, String quickId)? likeQuick,
    TResult Function(String userId, String quickId)? unLikeQuick,
  }) {
    return unLikeQuick?.call(userId, quickId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(int index)? playSnapAtIndex,
    TResult Function(int index)? onSnapChange,
    TResult Function(String caption, File file)? createQuick,
    TResult Function(String quickId)? deleteQuick,
    TResult Function(String userId, String quickId)? likeQuick,
    TResult Function(String userId, String quickId)? unLikeQuick,
    required TResult orElse(),
  }) {
    if (unLikeQuick != null) {
      return unLikeQuick(userId, quickId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_QuicksInitialized value) initialize,
    required TResult Function(_PlaySnapAtIndex value) playSnapAtIndex,
    required TResult Function(_QuicksChange value) onSnapChange,
    required TResult Function(_CreateQuick value) createQuick,
    required TResult Function(_DeleteQuick value) deleteQuick,
    required TResult Function(_LikeQuick value) likeQuick,
    required TResult Function(_UnLikeQuick value) unLikeQuick,
  }) {
    return unLikeQuick(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_QuicksInitialized value)? initialize,
    TResult Function(_PlaySnapAtIndex value)? playSnapAtIndex,
    TResult Function(_QuicksChange value)? onSnapChange,
    TResult Function(_CreateQuick value)? createQuick,
    TResult Function(_DeleteQuick value)? deleteQuick,
    TResult Function(_LikeQuick value)? likeQuick,
    TResult Function(_UnLikeQuick value)? unLikeQuick,
  }) {
    return unLikeQuick?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_QuicksInitialized value)? initialize,
    TResult Function(_PlaySnapAtIndex value)? playSnapAtIndex,
    TResult Function(_QuicksChange value)? onSnapChange,
    TResult Function(_CreateQuick value)? createQuick,
    TResult Function(_DeleteQuick value)? deleteQuick,
    TResult Function(_LikeQuick value)? likeQuick,
    TResult Function(_UnLikeQuick value)? unLikeQuick,
    required TResult orElse(),
  }) {
    if (unLikeQuick != null) {
      return unLikeQuick(this);
    }
    return orElse();
  }
}

abstract class _UnLikeQuick implements QuickEvent {
  const factory _UnLikeQuick(
      {required String userId, required String quickId}) = _$_UnLikeQuick;

  String get userId;
  String get quickId;
  @JsonKey(ignore: true)
  _$UnLikeQuickCopyWith<_UnLikeQuick> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$QuickStateTearOff {
  const _$QuickStateTearOff();

  _QuickState call(
      {int focusedIndex = 0,
      String? error = null,
      List<QuickEntity> quicks = const [],
      List<VideoPlayerController> controllers = const [],
      QuickStatus currentState = QuickStatus.idle,
      QuickListenableAction action = QuickListenableAction.idle}) {
    return _QuickState(
      focusedIndex: focusedIndex,
      error: error,
      quicks: quicks,
      controllers: controllers,
      currentState: currentState,
      action: action,
    );
  }
}

/// @nodoc
const $QuickState = _$QuickStateTearOff();

/// @nodoc
mixin _$QuickState {
  int get focusedIndex => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  List<QuickEntity> get quicks => throw _privateConstructorUsedError;
  List<VideoPlayerController> get controllers =>
      throw _privateConstructorUsedError;
  QuickStatus get currentState => throw _privateConstructorUsedError;
  QuickListenableAction get action => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $QuickStateCopyWith<QuickState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuickStateCopyWith<$Res> {
  factory $QuickStateCopyWith(
          QuickState value, $Res Function(QuickState) then) =
      _$QuickStateCopyWithImpl<$Res>;
  $Res call(
      {int focusedIndex,
      String? error,
      List<QuickEntity> quicks,
      List<VideoPlayerController> controllers,
      QuickStatus currentState,
      QuickListenableAction action});
}

/// @nodoc
class _$QuickStateCopyWithImpl<$Res> implements $QuickStateCopyWith<$Res> {
  _$QuickStateCopyWithImpl(this._value, this._then);

  final QuickState _value;
  // ignore: unused_field
  final $Res Function(QuickState) _then;

  @override
  $Res call({
    Object? focusedIndex = freezed,
    Object? error = freezed,
    Object? quicks = freezed,
    Object? controllers = freezed,
    Object? currentState = freezed,
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
      quicks: quicks == freezed
          ? _value.quicks
          : quicks // ignore: cast_nullable_to_non_nullable
              as List<QuickEntity>,
      controllers: controllers == freezed
          ? _value.controllers
          : controllers // ignore: cast_nullable_to_non_nullable
              as List<VideoPlayerController>,
      currentState: currentState == freezed
          ? _value.currentState
          : currentState // ignore: cast_nullable_to_non_nullable
              as QuickStatus,
      action: action == freezed
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as QuickListenableAction,
    ));
  }
}

/// @nodoc
abstract class _$QuickStateCopyWith<$Res> implements $QuickStateCopyWith<$Res> {
  factory _$QuickStateCopyWith(
          _QuickState value, $Res Function(_QuickState) then) =
      __$QuickStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {int focusedIndex,
      String? error,
      List<QuickEntity> quicks,
      List<VideoPlayerController> controllers,
      QuickStatus currentState,
      QuickListenableAction action});
}

/// @nodoc
class __$QuickStateCopyWithImpl<$Res> extends _$QuickStateCopyWithImpl<$Res>
    implements _$QuickStateCopyWith<$Res> {
  __$QuickStateCopyWithImpl(
      _QuickState _value, $Res Function(_QuickState) _then)
      : super(_value, (v) => _then(v as _QuickState));

  @override
  _QuickState get _value => super._value as _QuickState;

  @override
  $Res call({
    Object? focusedIndex = freezed,
    Object? error = freezed,
    Object? quicks = freezed,
    Object? controllers = freezed,
    Object? currentState = freezed,
    Object? action = freezed,
  }) {
    return _then(_QuickState(
      focusedIndex: focusedIndex == freezed
          ? _value.focusedIndex
          : focusedIndex // ignore: cast_nullable_to_non_nullable
              as int,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      quicks: quicks == freezed
          ? _value.quicks
          : quicks // ignore: cast_nullable_to_non_nullable
              as List<QuickEntity>,
      controllers: controllers == freezed
          ? _value.controllers
          : controllers // ignore: cast_nullable_to_non_nullable
              as List<VideoPlayerController>,
      currentState: currentState == freezed
          ? _value.currentState
          : currentState // ignore: cast_nullable_to_non_nullable
              as QuickStatus,
      action: action == freezed
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as QuickListenableAction,
    ));
  }
}

/// @nodoc

class _$_QuickState implements _QuickState {
  _$_QuickState(
      {this.focusedIndex = 0,
      this.error = null,
      this.quicks = const [],
      this.controllers = const [],
      this.currentState = QuickStatus.idle,
      this.action = QuickListenableAction.idle});

  @JsonKey()
  @override
  final int focusedIndex;
  @JsonKey()
  @override
  final String? error;
  @JsonKey()
  @override
  final List<QuickEntity> quicks;
  @JsonKey()
  @override
  final List<VideoPlayerController> controllers;
  @JsonKey()
  @override
  final QuickStatus currentState;
  @JsonKey()
  @override
  final QuickListenableAction action;

  @override
  String toString() {
    return 'QuickState(focusedIndex: $focusedIndex, error: $error, quicks: $quicks, controllers: $controllers, currentState: $currentState, action: $action)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _QuickState &&
            const DeepCollectionEquality()
                .equals(other.focusedIndex, focusedIndex) &&
            const DeepCollectionEquality().equals(other.error, error) &&
            const DeepCollectionEquality().equals(other.quicks, quicks) &&
            const DeepCollectionEquality()
                .equals(other.controllers, controllers) &&
            const DeepCollectionEquality()
                .equals(other.currentState, currentState) &&
            const DeepCollectionEquality().equals(other.action, action));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(focusedIndex),
      const DeepCollectionEquality().hash(error),
      const DeepCollectionEquality().hash(quicks),
      const DeepCollectionEquality().hash(controllers),
      const DeepCollectionEquality().hash(currentState),
      const DeepCollectionEquality().hash(action));

  @JsonKey(ignore: true)
  @override
  _$QuickStateCopyWith<_QuickState> get copyWith =>
      __$QuickStateCopyWithImpl<_QuickState>(this, _$identity);
}

abstract class _QuickState implements QuickState {
  factory _QuickState(
      {int focusedIndex,
      String? error,
      List<QuickEntity> quicks,
      List<VideoPlayerController> controllers,
      QuickStatus currentState,
      QuickListenableAction action}) = _$_QuickState;

  @override
  int get focusedIndex;
  @override
  String? get error;
  @override
  List<QuickEntity> get quicks;
  @override
  List<VideoPlayerController> get controllers;
  @override
  QuickStatus get currentState;
  @override
  QuickListenableAction get action;
  @override
  @JsonKey(ignore: true)
  _$QuickStateCopyWith<_QuickState> get copyWith =>
      throw _privateConstructorUsedError;
}
