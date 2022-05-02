// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'story_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$StoryStateTearOff {
  const _$StoryStateTearOff();

  _StoryState call(
      {String error = '',
      required StoryResponse stories,
      StoryStatus status = StoryStatus.idle,
      StoryListenableAction action = StoryListenableAction.idle}) {
    return _StoryState(
      error: error,
      stories: stories,
      status: status,
      action: action,
    );
  }
}

/// @nodoc
const $StoryState = _$StoryStateTearOff();

/// @nodoc
mixin _$StoryState {
  String get error => throw _privateConstructorUsedError;
  StoryResponse get stories => throw _privateConstructorUsedError;
  StoryStatus get status => throw _privateConstructorUsedError;
  StoryListenableAction get action => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StoryStateCopyWith<StoryState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoryStateCopyWith<$Res> {
  factory $StoryStateCopyWith(
          StoryState value, $Res Function(StoryState) then) =
      _$StoryStateCopyWithImpl<$Res>;
  $Res call(
      {String error,
      StoryResponse stories,
      StoryStatus status,
      StoryListenableAction action});
}

/// @nodoc
class _$StoryStateCopyWithImpl<$Res> implements $StoryStateCopyWith<$Res> {
  _$StoryStateCopyWithImpl(this._value, this._then);

  final StoryState _value;
  // ignore: unused_field
  final $Res Function(StoryState) _then;

  @override
  $Res call({
    Object? error = freezed,
    Object? stories = freezed,
    Object? status = freezed,
    Object? action = freezed,
  }) {
    return _then(_value.copyWith(
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
      stories: stories == freezed
          ? _value.stories
          : stories // ignore: cast_nullable_to_non_nullable
              as StoryResponse,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StoryStatus,
      action: action == freezed
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as StoryListenableAction,
    ));
  }
}

/// @nodoc
abstract class _$StoryStateCopyWith<$Res> implements $StoryStateCopyWith<$Res> {
  factory _$StoryStateCopyWith(
          _StoryState value, $Res Function(_StoryState) then) =
      __$StoryStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {String error,
      StoryResponse stories,
      StoryStatus status,
      StoryListenableAction action});
}

/// @nodoc
class __$StoryStateCopyWithImpl<$Res> extends _$StoryStateCopyWithImpl<$Res>
    implements _$StoryStateCopyWith<$Res> {
  __$StoryStateCopyWithImpl(
      _StoryState _value, $Res Function(_StoryState) _then)
      : super(_value, (v) => _then(v as _StoryState));

  @override
  _StoryState get _value => super._value as _StoryState;

  @override
  $Res call({
    Object? error = freezed,
    Object? stories = freezed,
    Object? status = freezed,
    Object? action = freezed,
  }) {
    return _then(_StoryState(
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
      stories: stories == freezed
          ? _value.stories
          : stories // ignore: cast_nullable_to_non_nullable
              as StoryResponse,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StoryStatus,
      action: action == freezed
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as StoryListenableAction,
    ));
  }
}

/// @nodoc

class _$_StoryState implements _StoryState {
  _$_StoryState(
      {this.error = '',
      required this.stories,
      this.status = StoryStatus.idle,
      this.action = StoryListenableAction.idle});

  @JsonKey()
  @override
  final String error;
  @override
  final StoryResponse stories;
  @JsonKey()
  @override
  final StoryStatus status;
  @JsonKey()
  @override
  final StoryListenableAction action;

  @override
  String toString() {
    return 'StoryState(error: $error, stories: $stories, status: $status, action: $action)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _StoryState &&
            const DeepCollectionEquality().equals(other.error, error) &&
            const DeepCollectionEquality().equals(other.stories, stories) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality().equals(other.action, action));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(error),
      const DeepCollectionEquality().hash(stories),
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(action));

  @JsonKey(ignore: true)
  @override
  _$StoryStateCopyWith<_StoryState> get copyWith =>
      __$StoryStateCopyWithImpl<_StoryState>(this, _$identity);
}

abstract class _StoryState implements StoryState {
  factory _StoryState(
      {String error,
      required StoryResponse stories,
      StoryStatus status,
      StoryListenableAction action}) = _$_StoryState;

  @override
  String get error;
  @override
  StoryResponse get stories;
  @override
  StoryStatus get status;
  @override
  StoryListenableAction get action;
  @override
  @JsonKey(ignore: true)
  _$StoryStateCopyWith<_StoryState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$StoryEventTearOff {
  const _$StoryEventTearOff();

  _LoadStories loadStories({required String userId}) {
    return _LoadStories(
      userId: userId,
    );
  }

  _CreateStory createStory({required List<GalleryAsset> assets}) {
    return _CreateStory(
      assets: assets,
    );
  }

  _UpdateStory updateStory({required List<GalleryAsset> assets}) {
    return _UpdateStory(
      assets: assets,
    );
  }
}

/// @nodoc
const $StoryEvent = _$StoryEventTearOff();

/// @nodoc
mixin _$StoryEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) loadStories,
    required TResult Function(List<GalleryAsset> assets) createStory,
    required TResult Function(List<GalleryAsset> assets) updateStory,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String userId)? loadStories,
    TResult Function(List<GalleryAsset> assets)? createStory,
    TResult Function(List<GalleryAsset> assets)? updateStory,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? loadStories,
    TResult Function(List<GalleryAsset> assets)? createStory,
    TResult Function(List<GalleryAsset> assets)? updateStory,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadStories value) loadStories,
    required TResult Function(_CreateStory value) createStory,
    required TResult Function(_UpdateStory value) updateStory,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_LoadStories value)? loadStories,
    TResult Function(_CreateStory value)? createStory,
    TResult Function(_UpdateStory value)? updateStory,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadStories value)? loadStories,
    TResult Function(_CreateStory value)? createStory,
    TResult Function(_UpdateStory value)? updateStory,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoryEventCopyWith<$Res> {
  factory $StoryEventCopyWith(
          StoryEvent value, $Res Function(StoryEvent) then) =
      _$StoryEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$StoryEventCopyWithImpl<$Res> implements $StoryEventCopyWith<$Res> {
  _$StoryEventCopyWithImpl(this._value, this._then);

  final StoryEvent _value;
  // ignore: unused_field
  final $Res Function(StoryEvent) _then;
}

/// @nodoc
abstract class _$LoadStoriesCopyWith<$Res> {
  factory _$LoadStoriesCopyWith(
          _LoadStories value, $Res Function(_LoadStories) then) =
      __$LoadStoriesCopyWithImpl<$Res>;
  $Res call({String userId});
}

/// @nodoc
class __$LoadStoriesCopyWithImpl<$Res> extends _$StoryEventCopyWithImpl<$Res>
    implements _$LoadStoriesCopyWith<$Res> {
  __$LoadStoriesCopyWithImpl(
      _LoadStories _value, $Res Function(_LoadStories) _then)
      : super(_value, (v) => _then(v as _LoadStories));

  @override
  _LoadStories get _value => super._value as _LoadStories;

  @override
  $Res call({
    Object? userId = freezed,
  }) {
    return _then(_LoadStories(
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_LoadStories implements _LoadStories {
  const _$_LoadStories({required this.userId});

  @override
  final String userId;

  @override
  String toString() {
    return 'StoryEvent.loadStories(userId: $userId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LoadStories &&
            const DeepCollectionEquality().equals(other.userId, userId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(userId));

  @JsonKey(ignore: true)
  @override
  _$LoadStoriesCopyWith<_LoadStories> get copyWith =>
      __$LoadStoriesCopyWithImpl<_LoadStories>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) loadStories,
    required TResult Function(List<GalleryAsset> assets) createStory,
    required TResult Function(List<GalleryAsset> assets) updateStory,
  }) {
    return loadStories(userId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String userId)? loadStories,
    TResult Function(List<GalleryAsset> assets)? createStory,
    TResult Function(List<GalleryAsset> assets)? updateStory,
  }) {
    return loadStories?.call(userId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? loadStories,
    TResult Function(List<GalleryAsset> assets)? createStory,
    TResult Function(List<GalleryAsset> assets)? updateStory,
    required TResult orElse(),
  }) {
    if (loadStories != null) {
      return loadStories(userId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadStories value) loadStories,
    required TResult Function(_CreateStory value) createStory,
    required TResult Function(_UpdateStory value) updateStory,
  }) {
    return loadStories(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_LoadStories value)? loadStories,
    TResult Function(_CreateStory value)? createStory,
    TResult Function(_UpdateStory value)? updateStory,
  }) {
    return loadStories?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadStories value)? loadStories,
    TResult Function(_CreateStory value)? createStory,
    TResult Function(_UpdateStory value)? updateStory,
    required TResult orElse(),
  }) {
    if (loadStories != null) {
      return loadStories(this);
    }
    return orElse();
  }
}

abstract class _LoadStories implements StoryEvent {
  const factory _LoadStories({required String userId}) = _$_LoadStories;

  String get userId;
  @JsonKey(ignore: true)
  _$LoadStoriesCopyWith<_LoadStories> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$CreateStoryCopyWith<$Res> {
  factory _$CreateStoryCopyWith(
          _CreateStory value, $Res Function(_CreateStory) then) =
      __$CreateStoryCopyWithImpl<$Res>;
  $Res call({List<GalleryAsset> assets});
}

/// @nodoc
class __$CreateStoryCopyWithImpl<$Res> extends _$StoryEventCopyWithImpl<$Res>
    implements _$CreateStoryCopyWith<$Res> {
  __$CreateStoryCopyWithImpl(
      _CreateStory _value, $Res Function(_CreateStory) _then)
      : super(_value, (v) => _then(v as _CreateStory));

  @override
  _CreateStory get _value => super._value as _CreateStory;

  @override
  $Res call({
    Object? assets = freezed,
  }) {
    return _then(_CreateStory(
      assets: assets == freezed
          ? _value.assets
          : assets // ignore: cast_nullable_to_non_nullable
              as List<GalleryAsset>,
    ));
  }
}

/// @nodoc

class _$_CreateStory implements _CreateStory {
  const _$_CreateStory({required this.assets});

  @override
  final List<GalleryAsset> assets;

  @override
  String toString() {
    return 'StoryEvent.createStory(assets: $assets)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CreateStory &&
            const DeepCollectionEquality().equals(other.assets, assets));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(assets));

  @JsonKey(ignore: true)
  @override
  _$CreateStoryCopyWith<_CreateStory> get copyWith =>
      __$CreateStoryCopyWithImpl<_CreateStory>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) loadStories,
    required TResult Function(List<GalleryAsset> assets) createStory,
    required TResult Function(List<GalleryAsset> assets) updateStory,
  }) {
    return createStory(assets);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String userId)? loadStories,
    TResult Function(List<GalleryAsset> assets)? createStory,
    TResult Function(List<GalleryAsset> assets)? updateStory,
  }) {
    return createStory?.call(assets);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? loadStories,
    TResult Function(List<GalleryAsset> assets)? createStory,
    TResult Function(List<GalleryAsset> assets)? updateStory,
    required TResult orElse(),
  }) {
    if (createStory != null) {
      return createStory(assets);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadStories value) loadStories,
    required TResult Function(_CreateStory value) createStory,
    required TResult Function(_UpdateStory value) updateStory,
  }) {
    return createStory(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_LoadStories value)? loadStories,
    TResult Function(_CreateStory value)? createStory,
    TResult Function(_UpdateStory value)? updateStory,
  }) {
    return createStory?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadStories value)? loadStories,
    TResult Function(_CreateStory value)? createStory,
    TResult Function(_UpdateStory value)? updateStory,
    required TResult orElse(),
  }) {
    if (createStory != null) {
      return createStory(this);
    }
    return orElse();
  }
}

abstract class _CreateStory implements StoryEvent {
  const factory _CreateStory({required List<GalleryAsset> assets}) =
      _$_CreateStory;

  List<GalleryAsset> get assets;
  @JsonKey(ignore: true)
  _$CreateStoryCopyWith<_CreateStory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$UpdateStoryCopyWith<$Res> {
  factory _$UpdateStoryCopyWith(
          _UpdateStory value, $Res Function(_UpdateStory) then) =
      __$UpdateStoryCopyWithImpl<$Res>;
  $Res call({List<GalleryAsset> assets});
}

/// @nodoc
class __$UpdateStoryCopyWithImpl<$Res> extends _$StoryEventCopyWithImpl<$Res>
    implements _$UpdateStoryCopyWith<$Res> {
  __$UpdateStoryCopyWithImpl(
      _UpdateStory _value, $Res Function(_UpdateStory) _then)
      : super(_value, (v) => _then(v as _UpdateStory));

  @override
  _UpdateStory get _value => super._value as _UpdateStory;

  @override
  $Res call({
    Object? assets = freezed,
  }) {
    return _then(_UpdateStory(
      assets: assets == freezed
          ? _value.assets
          : assets // ignore: cast_nullable_to_non_nullable
              as List<GalleryAsset>,
    ));
  }
}

/// @nodoc

class _$_UpdateStory implements _UpdateStory {
  const _$_UpdateStory({required this.assets});

  @override
  final List<GalleryAsset> assets;

  @override
  String toString() {
    return 'StoryEvent.updateStory(assets: $assets)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UpdateStory &&
            const DeepCollectionEquality().equals(other.assets, assets));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(assets));

  @JsonKey(ignore: true)
  @override
  _$UpdateStoryCopyWith<_UpdateStory> get copyWith =>
      __$UpdateStoryCopyWithImpl<_UpdateStory>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) loadStories,
    required TResult Function(List<GalleryAsset> assets) createStory,
    required TResult Function(List<GalleryAsset> assets) updateStory,
  }) {
    return updateStory(assets);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String userId)? loadStories,
    TResult Function(List<GalleryAsset> assets)? createStory,
    TResult Function(List<GalleryAsset> assets)? updateStory,
  }) {
    return updateStory?.call(assets);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? loadStories,
    TResult Function(List<GalleryAsset> assets)? createStory,
    TResult Function(List<GalleryAsset> assets)? updateStory,
    required TResult orElse(),
  }) {
    if (updateStory != null) {
      return updateStory(assets);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadStories value) loadStories,
    required TResult Function(_CreateStory value) createStory,
    required TResult Function(_UpdateStory value) updateStory,
  }) {
    return updateStory(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_LoadStories value)? loadStories,
    TResult Function(_CreateStory value)? createStory,
    TResult Function(_UpdateStory value)? updateStory,
  }) {
    return updateStory?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadStories value)? loadStories,
    TResult Function(_CreateStory value)? createStory,
    TResult Function(_UpdateStory value)? updateStory,
    required TResult orElse(),
  }) {
    if (updateStory != null) {
      return updateStory(this);
    }
    return orElse();
  }
}

abstract class _UpdateStory implements StoryEvent {
  const factory _UpdateStory({required List<GalleryAsset> assets}) =
      _$_UpdateStory;

  List<GalleryAsset> get assets;
  @JsonKey(ignore: true)
  _$UpdateStoryCopyWith<_UpdateStory> get copyWith =>
      throw _privateConstructorUsedError;
}
