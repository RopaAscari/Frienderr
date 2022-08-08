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
      {required UserStory userStory,
      int previousStoryViewerTimestamp = 0,
      bool reachedMaximumThreshold = false,
      bool storyViewsReachedMaximumThreshold = false,
      required PagingController<int, Story> paginationController,
      required PagingController<int, UserModel> storyViewsPaginationController,
      StoryListenableAction action = StoryListenableAction.idle}) {
    return _StoryState(
      userStory: userStory,
      previousStoryViewerTimestamp: previousStoryViewerTimestamp,
      reachedMaximumThreshold: reachedMaximumThreshold,
      storyViewsReachedMaximumThreshold: storyViewsReachedMaximumThreshold,
      paginationController: paginationController,
      storyViewsPaginationController: storyViewsPaginationController,
      action: action,
    );
  }
}

/// @nodoc
const $StoryState = _$StoryStateTearOff();

/// @nodoc
mixin _$StoryState {
  UserStory get userStory => throw _privateConstructorUsedError;
  int get previousStoryViewerTimestamp => throw _privateConstructorUsedError;
  bool get reachedMaximumThreshold => throw _privateConstructorUsedError;
  bool get storyViewsReachedMaximumThreshold =>
      throw _privateConstructorUsedError;
  PagingController<int, Story> get paginationController =>
      throw _privateConstructorUsedError;
  PagingController<int, UserModel> get storyViewsPaginationController =>
      throw _privateConstructorUsedError;
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
      {UserStory userStory,
      int previousStoryViewerTimestamp,
      bool reachedMaximumThreshold,
      bool storyViewsReachedMaximumThreshold,
      PagingController<int, Story> paginationController,
      PagingController<int, UserModel> storyViewsPaginationController,
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
    Object? userStory = freezed,
    Object? previousStoryViewerTimestamp = freezed,
    Object? reachedMaximumThreshold = freezed,
    Object? storyViewsReachedMaximumThreshold = freezed,
    Object? paginationController = freezed,
    Object? storyViewsPaginationController = freezed,
    Object? action = freezed,
  }) {
    return _then(_value.copyWith(
      userStory: userStory == freezed
          ? _value.userStory
          : userStory // ignore: cast_nullable_to_non_nullable
              as UserStory,
      previousStoryViewerTimestamp: previousStoryViewerTimestamp == freezed
          ? _value.previousStoryViewerTimestamp
          : previousStoryViewerTimestamp // ignore: cast_nullable_to_non_nullable
              as int,
      reachedMaximumThreshold: reachedMaximumThreshold == freezed
          ? _value.reachedMaximumThreshold
          : reachedMaximumThreshold // ignore: cast_nullable_to_non_nullable
              as bool,
      storyViewsReachedMaximumThreshold: storyViewsReachedMaximumThreshold ==
              freezed
          ? _value.storyViewsReachedMaximumThreshold
          : storyViewsReachedMaximumThreshold // ignore: cast_nullable_to_non_nullable
              as bool,
      paginationController: paginationController == freezed
          ? _value.paginationController
          : paginationController // ignore: cast_nullable_to_non_nullable
              as PagingController<int, Story>,
      storyViewsPaginationController: storyViewsPaginationController == freezed
          ? _value.storyViewsPaginationController
          : storyViewsPaginationController // ignore: cast_nullable_to_non_nullable
              as PagingController<int, UserModel>,
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
      {UserStory userStory,
      int previousStoryViewerTimestamp,
      bool reachedMaximumThreshold,
      bool storyViewsReachedMaximumThreshold,
      PagingController<int, Story> paginationController,
      PagingController<int, UserModel> storyViewsPaginationController,
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
    Object? userStory = freezed,
    Object? previousStoryViewerTimestamp = freezed,
    Object? reachedMaximumThreshold = freezed,
    Object? storyViewsReachedMaximumThreshold = freezed,
    Object? paginationController = freezed,
    Object? storyViewsPaginationController = freezed,
    Object? action = freezed,
  }) {
    return _then(_StoryState(
      userStory: userStory == freezed
          ? _value.userStory
          : userStory // ignore: cast_nullable_to_non_nullable
              as UserStory,
      previousStoryViewerTimestamp: previousStoryViewerTimestamp == freezed
          ? _value.previousStoryViewerTimestamp
          : previousStoryViewerTimestamp // ignore: cast_nullable_to_non_nullable
              as int,
      reachedMaximumThreshold: reachedMaximumThreshold == freezed
          ? _value.reachedMaximumThreshold
          : reachedMaximumThreshold // ignore: cast_nullable_to_non_nullable
              as bool,
      storyViewsReachedMaximumThreshold: storyViewsReachedMaximumThreshold ==
              freezed
          ? _value.storyViewsReachedMaximumThreshold
          : storyViewsReachedMaximumThreshold // ignore: cast_nullable_to_non_nullable
              as bool,
      paginationController: paginationController == freezed
          ? _value.paginationController
          : paginationController // ignore: cast_nullable_to_non_nullable
              as PagingController<int, Story>,
      storyViewsPaginationController: storyViewsPaginationController == freezed
          ? _value.storyViewsPaginationController
          : storyViewsPaginationController // ignore: cast_nullable_to_non_nullable
              as PagingController<int, UserModel>,
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
      {required this.userStory,
      this.previousStoryViewerTimestamp = 0,
      this.reachedMaximumThreshold = false,
      this.storyViewsReachedMaximumThreshold = false,
      required this.paginationController,
      required this.storyViewsPaginationController,
      this.action = StoryListenableAction.idle});

  @override
  final UserStory userStory;
  @JsonKey()
  @override
  final int previousStoryViewerTimestamp;
  @JsonKey()
  @override
  final bool reachedMaximumThreshold;
  @JsonKey()
  @override
  final bool storyViewsReachedMaximumThreshold;
  @override
  final PagingController<int, Story> paginationController;
  @override
  final PagingController<int, UserModel> storyViewsPaginationController;
  @JsonKey()
  @override
  final StoryListenableAction action;

  @override
  String toString() {
    return 'StoryState(userStory: $userStory, previousStoryViewerTimestamp: $previousStoryViewerTimestamp, reachedMaximumThreshold: $reachedMaximumThreshold, storyViewsReachedMaximumThreshold: $storyViewsReachedMaximumThreshold, paginationController: $paginationController, storyViewsPaginationController: $storyViewsPaginationController, action: $action)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _StoryState &&
            const DeepCollectionEquality().equals(other.userStory, userStory) &&
            const DeepCollectionEquality().equals(
                other.previousStoryViewerTimestamp,
                previousStoryViewerTimestamp) &&
            const DeepCollectionEquality().equals(
                other.reachedMaximumThreshold, reachedMaximumThreshold) &&
            const DeepCollectionEquality().equals(
                other.storyViewsReachedMaximumThreshold,
                storyViewsReachedMaximumThreshold) &&
            const DeepCollectionEquality()
                .equals(other.paginationController, paginationController) &&
            const DeepCollectionEquality().equals(
                other.storyViewsPaginationController,
                storyViewsPaginationController) &&
            const DeepCollectionEquality().equals(other.action, action));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(userStory),
      const DeepCollectionEquality().hash(previousStoryViewerTimestamp),
      const DeepCollectionEquality().hash(reachedMaximumThreshold),
      const DeepCollectionEquality().hash(storyViewsReachedMaximumThreshold),
      const DeepCollectionEquality().hash(paginationController),
      const DeepCollectionEquality().hash(storyViewsPaginationController),
      const DeepCollectionEquality().hash(action));

  @JsonKey(ignore: true)
  @override
  _$StoryStateCopyWith<_StoryState> get copyWith =>
      __$StoryStateCopyWithImpl<_StoryState>(this, _$identity);
}

abstract class _StoryState implements StoryState {
  factory _StoryState(
      {required UserStory userStory,
      int previousStoryViewerTimestamp,
      bool reachedMaximumThreshold,
      bool storyViewsReachedMaximumThreshold,
      required PagingController<int, Story> paginationController,
      required PagingController<int, UserModel> storyViewsPaginationController,
      StoryListenableAction action}) = _$_StoryState;

  @override
  UserStory get userStory;
  @override
  int get previousStoryViewerTimestamp;
  @override
  bool get reachedMaximumThreshold;
  @override
  bool get storyViewsReachedMaximumThreshold;
  @override
  PagingController<int, Story> get paginationController;
  @override
  PagingController<int, UserModel> get storyViewsPaginationController;
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

  _CreateStory createStory({required List<GalleryAsset> assets}) {
    return _CreateStory(
      assets: assets,
    );
  }

  _UpdateStory updateStory(
      {required String userId, required List<GalleryAsset> assets}) {
    return _UpdateStory(
      userId: userId,
      assets: assets,
    );
  }

  _DeleteStory deleteStory(
      {required bool isLast,
      required String userId,
      required List<StoryContent>? content}) {
    return _DeleteStory(
      isLast: isLast,
      userId: userId,
      content: content,
    );
  }

  _FetchStories fetchStories({required String userId}) {
    return _FetchStories(
      userId: userId,
    );
  }

  _ResetState resetState() {
    return const _ResetState();
  }

  _FetchStoryViewers fetchStoryViewers(
      {required String userId, required String contentId}) {
    return _FetchStoryViewers(
      userId: userId,
      contentId: contentId,
    );
  }

  _FetchPaginatedStoryViewers fetchPaginatedStoryViewers(
      {required String userId, required String contentId}) {
    return _FetchPaginatedStoryViewers(
      userId: userId,
      contentId: contentId,
    );
  }

  _FetchPaginatedStories fetchPaginatedStories({required String userId}) {
    return _FetchPaginatedStories(
      userId: userId,
    );
  }

  _ViewStory viewStory(
      {required String userId,
      required String storyId,
      required String contentId,
      required List<StoryContent> stories}) {
    return _ViewStory(
      userId: userId,
      storyId: storyId,
      contentId: contentId,
      stories: stories,
    );
  }
}

/// @nodoc
const $StoryEvent = _$StoryEventTearOff();

/// @nodoc
mixin _$StoryEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<GalleryAsset> assets) createStory,
    required TResult Function(String userId, List<GalleryAsset> assets)
        updateStory,
    required TResult Function(
            bool isLast, String userId, List<StoryContent>? content)
        deleteStory,
    required TResult Function(String userId) fetchStories,
    required TResult Function() resetState,
    required TResult Function(String userId, String contentId)
        fetchStoryViewers,
    required TResult Function(String userId, String contentId)
        fetchPaginatedStoryViewers,
    required TResult Function(String userId) fetchPaginatedStories,
    required TResult Function(String userId, String storyId, String contentId,
            List<StoryContent> stories)
        viewStory,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<GalleryAsset> assets)? createStory,
    TResult Function(String userId, List<GalleryAsset> assets)? updateStory,
    TResult Function(bool isLast, String userId, List<StoryContent>? content)?
        deleteStory,
    TResult Function(String userId)? fetchStories,
    TResult Function()? resetState,
    TResult Function(String userId, String contentId)? fetchStoryViewers,
    TResult Function(String userId, String contentId)?
        fetchPaginatedStoryViewers,
    TResult Function(String userId)? fetchPaginatedStories,
    TResult Function(String userId, String storyId, String contentId,
            List<StoryContent> stories)?
        viewStory,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<GalleryAsset> assets)? createStory,
    TResult Function(String userId, List<GalleryAsset> assets)? updateStory,
    TResult Function(bool isLast, String userId, List<StoryContent>? content)?
        deleteStory,
    TResult Function(String userId)? fetchStories,
    TResult Function()? resetState,
    TResult Function(String userId, String contentId)? fetchStoryViewers,
    TResult Function(String userId, String contentId)?
        fetchPaginatedStoryViewers,
    TResult Function(String userId)? fetchPaginatedStories,
    TResult Function(String userId, String storyId, String contentId,
            List<StoryContent> stories)?
        viewStory,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CreateStory value) createStory,
    required TResult Function(_UpdateStory value) updateStory,
    required TResult Function(_DeleteStory value) deleteStory,
    required TResult Function(_FetchStories value) fetchStories,
    required TResult Function(_ResetState value) resetState,
    required TResult Function(_FetchStoryViewers value) fetchStoryViewers,
    required TResult Function(_FetchPaginatedStoryViewers value)
        fetchPaginatedStoryViewers,
    required TResult Function(_FetchPaginatedStories value)
        fetchPaginatedStories,
    required TResult Function(_ViewStory value) viewStory,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_CreateStory value)? createStory,
    TResult Function(_UpdateStory value)? updateStory,
    TResult Function(_DeleteStory value)? deleteStory,
    TResult Function(_FetchStories value)? fetchStories,
    TResult Function(_ResetState value)? resetState,
    TResult Function(_FetchStoryViewers value)? fetchStoryViewers,
    TResult Function(_FetchPaginatedStoryViewers value)?
        fetchPaginatedStoryViewers,
    TResult Function(_FetchPaginatedStories value)? fetchPaginatedStories,
    TResult Function(_ViewStory value)? viewStory,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CreateStory value)? createStory,
    TResult Function(_UpdateStory value)? updateStory,
    TResult Function(_DeleteStory value)? deleteStory,
    TResult Function(_FetchStories value)? fetchStories,
    TResult Function(_ResetState value)? resetState,
    TResult Function(_FetchStoryViewers value)? fetchStoryViewers,
    TResult Function(_FetchPaginatedStoryViewers value)?
        fetchPaginatedStoryViewers,
    TResult Function(_FetchPaginatedStories value)? fetchPaginatedStories,
    TResult Function(_ViewStory value)? viewStory,
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
    required TResult Function(List<GalleryAsset> assets) createStory,
    required TResult Function(String userId, List<GalleryAsset> assets)
        updateStory,
    required TResult Function(
            bool isLast, String userId, List<StoryContent>? content)
        deleteStory,
    required TResult Function(String userId) fetchStories,
    required TResult Function() resetState,
    required TResult Function(String userId, String contentId)
        fetchStoryViewers,
    required TResult Function(String userId, String contentId)
        fetchPaginatedStoryViewers,
    required TResult Function(String userId) fetchPaginatedStories,
    required TResult Function(String userId, String storyId, String contentId,
            List<StoryContent> stories)
        viewStory,
  }) {
    return createStory(assets);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<GalleryAsset> assets)? createStory,
    TResult Function(String userId, List<GalleryAsset> assets)? updateStory,
    TResult Function(bool isLast, String userId, List<StoryContent>? content)?
        deleteStory,
    TResult Function(String userId)? fetchStories,
    TResult Function()? resetState,
    TResult Function(String userId, String contentId)? fetchStoryViewers,
    TResult Function(String userId, String contentId)?
        fetchPaginatedStoryViewers,
    TResult Function(String userId)? fetchPaginatedStories,
    TResult Function(String userId, String storyId, String contentId,
            List<StoryContent> stories)?
        viewStory,
  }) {
    return createStory?.call(assets);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<GalleryAsset> assets)? createStory,
    TResult Function(String userId, List<GalleryAsset> assets)? updateStory,
    TResult Function(bool isLast, String userId, List<StoryContent>? content)?
        deleteStory,
    TResult Function(String userId)? fetchStories,
    TResult Function()? resetState,
    TResult Function(String userId, String contentId)? fetchStoryViewers,
    TResult Function(String userId, String contentId)?
        fetchPaginatedStoryViewers,
    TResult Function(String userId)? fetchPaginatedStories,
    TResult Function(String userId, String storyId, String contentId,
            List<StoryContent> stories)?
        viewStory,
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
    required TResult Function(_CreateStory value) createStory,
    required TResult Function(_UpdateStory value) updateStory,
    required TResult Function(_DeleteStory value) deleteStory,
    required TResult Function(_FetchStories value) fetchStories,
    required TResult Function(_ResetState value) resetState,
    required TResult Function(_FetchStoryViewers value) fetchStoryViewers,
    required TResult Function(_FetchPaginatedStoryViewers value)
        fetchPaginatedStoryViewers,
    required TResult Function(_FetchPaginatedStories value)
        fetchPaginatedStories,
    required TResult Function(_ViewStory value) viewStory,
  }) {
    return createStory(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_CreateStory value)? createStory,
    TResult Function(_UpdateStory value)? updateStory,
    TResult Function(_DeleteStory value)? deleteStory,
    TResult Function(_FetchStories value)? fetchStories,
    TResult Function(_ResetState value)? resetState,
    TResult Function(_FetchStoryViewers value)? fetchStoryViewers,
    TResult Function(_FetchPaginatedStoryViewers value)?
        fetchPaginatedStoryViewers,
    TResult Function(_FetchPaginatedStories value)? fetchPaginatedStories,
    TResult Function(_ViewStory value)? viewStory,
  }) {
    return createStory?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CreateStory value)? createStory,
    TResult Function(_UpdateStory value)? updateStory,
    TResult Function(_DeleteStory value)? deleteStory,
    TResult Function(_FetchStories value)? fetchStories,
    TResult Function(_ResetState value)? resetState,
    TResult Function(_FetchStoryViewers value)? fetchStoryViewers,
    TResult Function(_FetchPaginatedStoryViewers value)?
        fetchPaginatedStoryViewers,
    TResult Function(_FetchPaginatedStories value)? fetchPaginatedStories,
    TResult Function(_ViewStory value)? viewStory,
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
  $Res call({String userId, List<GalleryAsset> assets});
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
    Object? userId = freezed,
    Object? assets = freezed,
  }) {
    return _then(_UpdateStory(
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      assets: assets == freezed
          ? _value.assets
          : assets // ignore: cast_nullable_to_non_nullable
              as List<GalleryAsset>,
    ));
  }
}

/// @nodoc

class _$_UpdateStory implements _UpdateStory {
  const _$_UpdateStory({required this.userId, required this.assets});

  @override
  final String userId;
  @override
  final List<GalleryAsset> assets;

  @override
  String toString() {
    return 'StoryEvent.updateStory(userId: $userId, assets: $assets)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UpdateStory &&
            const DeepCollectionEquality().equals(other.userId, userId) &&
            const DeepCollectionEquality().equals(other.assets, assets));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(userId),
      const DeepCollectionEquality().hash(assets));

  @JsonKey(ignore: true)
  @override
  _$UpdateStoryCopyWith<_UpdateStory> get copyWith =>
      __$UpdateStoryCopyWithImpl<_UpdateStory>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<GalleryAsset> assets) createStory,
    required TResult Function(String userId, List<GalleryAsset> assets)
        updateStory,
    required TResult Function(
            bool isLast, String userId, List<StoryContent>? content)
        deleteStory,
    required TResult Function(String userId) fetchStories,
    required TResult Function() resetState,
    required TResult Function(String userId, String contentId)
        fetchStoryViewers,
    required TResult Function(String userId, String contentId)
        fetchPaginatedStoryViewers,
    required TResult Function(String userId) fetchPaginatedStories,
    required TResult Function(String userId, String storyId, String contentId,
            List<StoryContent> stories)
        viewStory,
  }) {
    return updateStory(userId, assets);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<GalleryAsset> assets)? createStory,
    TResult Function(String userId, List<GalleryAsset> assets)? updateStory,
    TResult Function(bool isLast, String userId, List<StoryContent>? content)?
        deleteStory,
    TResult Function(String userId)? fetchStories,
    TResult Function()? resetState,
    TResult Function(String userId, String contentId)? fetchStoryViewers,
    TResult Function(String userId, String contentId)?
        fetchPaginatedStoryViewers,
    TResult Function(String userId)? fetchPaginatedStories,
    TResult Function(String userId, String storyId, String contentId,
            List<StoryContent> stories)?
        viewStory,
  }) {
    return updateStory?.call(userId, assets);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<GalleryAsset> assets)? createStory,
    TResult Function(String userId, List<GalleryAsset> assets)? updateStory,
    TResult Function(bool isLast, String userId, List<StoryContent>? content)?
        deleteStory,
    TResult Function(String userId)? fetchStories,
    TResult Function()? resetState,
    TResult Function(String userId, String contentId)? fetchStoryViewers,
    TResult Function(String userId, String contentId)?
        fetchPaginatedStoryViewers,
    TResult Function(String userId)? fetchPaginatedStories,
    TResult Function(String userId, String storyId, String contentId,
            List<StoryContent> stories)?
        viewStory,
    required TResult orElse(),
  }) {
    if (updateStory != null) {
      return updateStory(userId, assets);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CreateStory value) createStory,
    required TResult Function(_UpdateStory value) updateStory,
    required TResult Function(_DeleteStory value) deleteStory,
    required TResult Function(_FetchStories value) fetchStories,
    required TResult Function(_ResetState value) resetState,
    required TResult Function(_FetchStoryViewers value) fetchStoryViewers,
    required TResult Function(_FetchPaginatedStoryViewers value)
        fetchPaginatedStoryViewers,
    required TResult Function(_FetchPaginatedStories value)
        fetchPaginatedStories,
    required TResult Function(_ViewStory value) viewStory,
  }) {
    return updateStory(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_CreateStory value)? createStory,
    TResult Function(_UpdateStory value)? updateStory,
    TResult Function(_DeleteStory value)? deleteStory,
    TResult Function(_FetchStories value)? fetchStories,
    TResult Function(_ResetState value)? resetState,
    TResult Function(_FetchStoryViewers value)? fetchStoryViewers,
    TResult Function(_FetchPaginatedStoryViewers value)?
        fetchPaginatedStoryViewers,
    TResult Function(_FetchPaginatedStories value)? fetchPaginatedStories,
    TResult Function(_ViewStory value)? viewStory,
  }) {
    return updateStory?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CreateStory value)? createStory,
    TResult Function(_UpdateStory value)? updateStory,
    TResult Function(_DeleteStory value)? deleteStory,
    TResult Function(_FetchStories value)? fetchStories,
    TResult Function(_ResetState value)? resetState,
    TResult Function(_FetchStoryViewers value)? fetchStoryViewers,
    TResult Function(_FetchPaginatedStoryViewers value)?
        fetchPaginatedStoryViewers,
    TResult Function(_FetchPaginatedStories value)? fetchPaginatedStories,
    TResult Function(_ViewStory value)? viewStory,
    required TResult orElse(),
  }) {
    if (updateStory != null) {
      return updateStory(this);
    }
    return orElse();
  }
}

abstract class _UpdateStory implements StoryEvent {
  const factory _UpdateStory(
      {required String userId,
      required List<GalleryAsset> assets}) = _$_UpdateStory;

  String get userId;
  List<GalleryAsset> get assets;
  @JsonKey(ignore: true)
  _$UpdateStoryCopyWith<_UpdateStory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$DeleteStoryCopyWith<$Res> {
  factory _$DeleteStoryCopyWith(
          _DeleteStory value, $Res Function(_DeleteStory) then) =
      __$DeleteStoryCopyWithImpl<$Res>;
  $Res call({bool isLast, String userId, List<StoryContent>? content});
}

/// @nodoc
class __$DeleteStoryCopyWithImpl<$Res> extends _$StoryEventCopyWithImpl<$Res>
    implements _$DeleteStoryCopyWith<$Res> {
  __$DeleteStoryCopyWithImpl(
      _DeleteStory _value, $Res Function(_DeleteStory) _then)
      : super(_value, (v) => _then(v as _DeleteStory));

  @override
  _DeleteStory get _value => super._value as _DeleteStory;

  @override
  $Res call({
    Object? isLast = freezed,
    Object? userId = freezed,
    Object? content = freezed,
  }) {
    return _then(_DeleteStory(
      isLast: isLast == freezed
          ? _value.isLast
          : isLast // ignore: cast_nullable_to_non_nullable
              as bool,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as List<StoryContent>?,
    ));
  }
}

/// @nodoc

class _$_DeleteStory implements _DeleteStory {
  const _$_DeleteStory(
      {required this.isLast, required this.userId, required this.content});

  @override
  final bool isLast;
  @override
  final String userId;
  @override
  final List<StoryContent>? content;

  @override
  String toString() {
    return 'StoryEvent.deleteStory(isLast: $isLast, userId: $userId, content: $content)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DeleteStory &&
            const DeepCollectionEquality().equals(other.isLast, isLast) &&
            const DeepCollectionEquality().equals(other.userId, userId) &&
            const DeepCollectionEquality().equals(other.content, content));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isLast),
      const DeepCollectionEquality().hash(userId),
      const DeepCollectionEquality().hash(content));

  @JsonKey(ignore: true)
  @override
  _$DeleteStoryCopyWith<_DeleteStory> get copyWith =>
      __$DeleteStoryCopyWithImpl<_DeleteStory>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<GalleryAsset> assets) createStory,
    required TResult Function(String userId, List<GalleryAsset> assets)
        updateStory,
    required TResult Function(
            bool isLast, String userId, List<StoryContent>? content)
        deleteStory,
    required TResult Function(String userId) fetchStories,
    required TResult Function() resetState,
    required TResult Function(String userId, String contentId)
        fetchStoryViewers,
    required TResult Function(String userId, String contentId)
        fetchPaginatedStoryViewers,
    required TResult Function(String userId) fetchPaginatedStories,
    required TResult Function(String userId, String storyId, String contentId,
            List<StoryContent> stories)
        viewStory,
  }) {
    return deleteStory(isLast, userId, content);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<GalleryAsset> assets)? createStory,
    TResult Function(String userId, List<GalleryAsset> assets)? updateStory,
    TResult Function(bool isLast, String userId, List<StoryContent>? content)?
        deleteStory,
    TResult Function(String userId)? fetchStories,
    TResult Function()? resetState,
    TResult Function(String userId, String contentId)? fetchStoryViewers,
    TResult Function(String userId, String contentId)?
        fetchPaginatedStoryViewers,
    TResult Function(String userId)? fetchPaginatedStories,
    TResult Function(String userId, String storyId, String contentId,
            List<StoryContent> stories)?
        viewStory,
  }) {
    return deleteStory?.call(isLast, userId, content);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<GalleryAsset> assets)? createStory,
    TResult Function(String userId, List<GalleryAsset> assets)? updateStory,
    TResult Function(bool isLast, String userId, List<StoryContent>? content)?
        deleteStory,
    TResult Function(String userId)? fetchStories,
    TResult Function()? resetState,
    TResult Function(String userId, String contentId)? fetchStoryViewers,
    TResult Function(String userId, String contentId)?
        fetchPaginatedStoryViewers,
    TResult Function(String userId)? fetchPaginatedStories,
    TResult Function(String userId, String storyId, String contentId,
            List<StoryContent> stories)?
        viewStory,
    required TResult orElse(),
  }) {
    if (deleteStory != null) {
      return deleteStory(isLast, userId, content);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CreateStory value) createStory,
    required TResult Function(_UpdateStory value) updateStory,
    required TResult Function(_DeleteStory value) deleteStory,
    required TResult Function(_FetchStories value) fetchStories,
    required TResult Function(_ResetState value) resetState,
    required TResult Function(_FetchStoryViewers value) fetchStoryViewers,
    required TResult Function(_FetchPaginatedStoryViewers value)
        fetchPaginatedStoryViewers,
    required TResult Function(_FetchPaginatedStories value)
        fetchPaginatedStories,
    required TResult Function(_ViewStory value) viewStory,
  }) {
    return deleteStory(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_CreateStory value)? createStory,
    TResult Function(_UpdateStory value)? updateStory,
    TResult Function(_DeleteStory value)? deleteStory,
    TResult Function(_FetchStories value)? fetchStories,
    TResult Function(_ResetState value)? resetState,
    TResult Function(_FetchStoryViewers value)? fetchStoryViewers,
    TResult Function(_FetchPaginatedStoryViewers value)?
        fetchPaginatedStoryViewers,
    TResult Function(_FetchPaginatedStories value)? fetchPaginatedStories,
    TResult Function(_ViewStory value)? viewStory,
  }) {
    return deleteStory?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CreateStory value)? createStory,
    TResult Function(_UpdateStory value)? updateStory,
    TResult Function(_DeleteStory value)? deleteStory,
    TResult Function(_FetchStories value)? fetchStories,
    TResult Function(_ResetState value)? resetState,
    TResult Function(_FetchStoryViewers value)? fetchStoryViewers,
    TResult Function(_FetchPaginatedStoryViewers value)?
        fetchPaginatedStoryViewers,
    TResult Function(_FetchPaginatedStories value)? fetchPaginatedStories,
    TResult Function(_ViewStory value)? viewStory,
    required TResult orElse(),
  }) {
    if (deleteStory != null) {
      return deleteStory(this);
    }
    return orElse();
  }
}

abstract class _DeleteStory implements StoryEvent {
  const factory _DeleteStory(
      {required bool isLast,
      required String userId,
      required List<StoryContent>? content}) = _$_DeleteStory;

  bool get isLast;
  String get userId;
  List<StoryContent>? get content;
  @JsonKey(ignore: true)
  _$DeleteStoryCopyWith<_DeleteStory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$FetchStoriesCopyWith<$Res> {
  factory _$FetchStoriesCopyWith(
          _FetchStories value, $Res Function(_FetchStories) then) =
      __$FetchStoriesCopyWithImpl<$Res>;
  $Res call({String userId});
}

/// @nodoc
class __$FetchStoriesCopyWithImpl<$Res> extends _$StoryEventCopyWithImpl<$Res>
    implements _$FetchStoriesCopyWith<$Res> {
  __$FetchStoriesCopyWithImpl(
      _FetchStories _value, $Res Function(_FetchStories) _then)
      : super(_value, (v) => _then(v as _FetchStories));

  @override
  _FetchStories get _value => super._value as _FetchStories;

  @override
  $Res call({
    Object? userId = freezed,
  }) {
    return _then(_FetchStories(
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_FetchStories implements _FetchStories {
  const _$_FetchStories({required this.userId});

  @override
  final String userId;

  @override
  String toString() {
    return 'StoryEvent.fetchStories(userId: $userId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FetchStories &&
            const DeepCollectionEquality().equals(other.userId, userId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(userId));

  @JsonKey(ignore: true)
  @override
  _$FetchStoriesCopyWith<_FetchStories> get copyWith =>
      __$FetchStoriesCopyWithImpl<_FetchStories>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<GalleryAsset> assets) createStory,
    required TResult Function(String userId, List<GalleryAsset> assets)
        updateStory,
    required TResult Function(
            bool isLast, String userId, List<StoryContent>? content)
        deleteStory,
    required TResult Function(String userId) fetchStories,
    required TResult Function() resetState,
    required TResult Function(String userId, String contentId)
        fetchStoryViewers,
    required TResult Function(String userId, String contentId)
        fetchPaginatedStoryViewers,
    required TResult Function(String userId) fetchPaginatedStories,
    required TResult Function(String userId, String storyId, String contentId,
            List<StoryContent> stories)
        viewStory,
  }) {
    return fetchStories(userId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<GalleryAsset> assets)? createStory,
    TResult Function(String userId, List<GalleryAsset> assets)? updateStory,
    TResult Function(bool isLast, String userId, List<StoryContent>? content)?
        deleteStory,
    TResult Function(String userId)? fetchStories,
    TResult Function()? resetState,
    TResult Function(String userId, String contentId)? fetchStoryViewers,
    TResult Function(String userId, String contentId)?
        fetchPaginatedStoryViewers,
    TResult Function(String userId)? fetchPaginatedStories,
    TResult Function(String userId, String storyId, String contentId,
            List<StoryContent> stories)?
        viewStory,
  }) {
    return fetchStories?.call(userId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<GalleryAsset> assets)? createStory,
    TResult Function(String userId, List<GalleryAsset> assets)? updateStory,
    TResult Function(bool isLast, String userId, List<StoryContent>? content)?
        deleteStory,
    TResult Function(String userId)? fetchStories,
    TResult Function()? resetState,
    TResult Function(String userId, String contentId)? fetchStoryViewers,
    TResult Function(String userId, String contentId)?
        fetchPaginatedStoryViewers,
    TResult Function(String userId)? fetchPaginatedStories,
    TResult Function(String userId, String storyId, String contentId,
            List<StoryContent> stories)?
        viewStory,
    required TResult orElse(),
  }) {
    if (fetchStories != null) {
      return fetchStories(userId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CreateStory value) createStory,
    required TResult Function(_UpdateStory value) updateStory,
    required TResult Function(_DeleteStory value) deleteStory,
    required TResult Function(_FetchStories value) fetchStories,
    required TResult Function(_ResetState value) resetState,
    required TResult Function(_FetchStoryViewers value) fetchStoryViewers,
    required TResult Function(_FetchPaginatedStoryViewers value)
        fetchPaginatedStoryViewers,
    required TResult Function(_FetchPaginatedStories value)
        fetchPaginatedStories,
    required TResult Function(_ViewStory value) viewStory,
  }) {
    return fetchStories(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_CreateStory value)? createStory,
    TResult Function(_UpdateStory value)? updateStory,
    TResult Function(_DeleteStory value)? deleteStory,
    TResult Function(_FetchStories value)? fetchStories,
    TResult Function(_ResetState value)? resetState,
    TResult Function(_FetchStoryViewers value)? fetchStoryViewers,
    TResult Function(_FetchPaginatedStoryViewers value)?
        fetchPaginatedStoryViewers,
    TResult Function(_FetchPaginatedStories value)? fetchPaginatedStories,
    TResult Function(_ViewStory value)? viewStory,
  }) {
    return fetchStories?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CreateStory value)? createStory,
    TResult Function(_UpdateStory value)? updateStory,
    TResult Function(_DeleteStory value)? deleteStory,
    TResult Function(_FetchStories value)? fetchStories,
    TResult Function(_ResetState value)? resetState,
    TResult Function(_FetchStoryViewers value)? fetchStoryViewers,
    TResult Function(_FetchPaginatedStoryViewers value)?
        fetchPaginatedStoryViewers,
    TResult Function(_FetchPaginatedStories value)? fetchPaginatedStories,
    TResult Function(_ViewStory value)? viewStory,
    required TResult orElse(),
  }) {
    if (fetchStories != null) {
      return fetchStories(this);
    }
    return orElse();
  }
}

abstract class _FetchStories implements StoryEvent {
  const factory _FetchStories({required String userId}) = _$_FetchStories;

  String get userId;
  @JsonKey(ignore: true)
  _$FetchStoriesCopyWith<_FetchStories> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$ResetStateCopyWith<$Res> {
  factory _$ResetStateCopyWith(
          _ResetState value, $Res Function(_ResetState) then) =
      __$ResetStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$ResetStateCopyWithImpl<$Res> extends _$StoryEventCopyWithImpl<$Res>
    implements _$ResetStateCopyWith<$Res> {
  __$ResetStateCopyWithImpl(
      _ResetState _value, $Res Function(_ResetState) _then)
      : super(_value, (v) => _then(v as _ResetState));

  @override
  _ResetState get _value => super._value as _ResetState;
}

/// @nodoc

class _$_ResetState implements _ResetState {
  const _$_ResetState();

  @override
  String toString() {
    return 'StoryEvent.resetState()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _ResetState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<GalleryAsset> assets) createStory,
    required TResult Function(String userId, List<GalleryAsset> assets)
        updateStory,
    required TResult Function(
            bool isLast, String userId, List<StoryContent>? content)
        deleteStory,
    required TResult Function(String userId) fetchStories,
    required TResult Function() resetState,
    required TResult Function(String userId, String contentId)
        fetchStoryViewers,
    required TResult Function(String userId, String contentId)
        fetchPaginatedStoryViewers,
    required TResult Function(String userId) fetchPaginatedStories,
    required TResult Function(String userId, String storyId, String contentId,
            List<StoryContent> stories)
        viewStory,
  }) {
    return resetState();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<GalleryAsset> assets)? createStory,
    TResult Function(String userId, List<GalleryAsset> assets)? updateStory,
    TResult Function(bool isLast, String userId, List<StoryContent>? content)?
        deleteStory,
    TResult Function(String userId)? fetchStories,
    TResult Function()? resetState,
    TResult Function(String userId, String contentId)? fetchStoryViewers,
    TResult Function(String userId, String contentId)?
        fetchPaginatedStoryViewers,
    TResult Function(String userId)? fetchPaginatedStories,
    TResult Function(String userId, String storyId, String contentId,
            List<StoryContent> stories)?
        viewStory,
  }) {
    return resetState?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<GalleryAsset> assets)? createStory,
    TResult Function(String userId, List<GalleryAsset> assets)? updateStory,
    TResult Function(bool isLast, String userId, List<StoryContent>? content)?
        deleteStory,
    TResult Function(String userId)? fetchStories,
    TResult Function()? resetState,
    TResult Function(String userId, String contentId)? fetchStoryViewers,
    TResult Function(String userId, String contentId)?
        fetchPaginatedStoryViewers,
    TResult Function(String userId)? fetchPaginatedStories,
    TResult Function(String userId, String storyId, String contentId,
            List<StoryContent> stories)?
        viewStory,
    required TResult orElse(),
  }) {
    if (resetState != null) {
      return resetState();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CreateStory value) createStory,
    required TResult Function(_UpdateStory value) updateStory,
    required TResult Function(_DeleteStory value) deleteStory,
    required TResult Function(_FetchStories value) fetchStories,
    required TResult Function(_ResetState value) resetState,
    required TResult Function(_FetchStoryViewers value) fetchStoryViewers,
    required TResult Function(_FetchPaginatedStoryViewers value)
        fetchPaginatedStoryViewers,
    required TResult Function(_FetchPaginatedStories value)
        fetchPaginatedStories,
    required TResult Function(_ViewStory value) viewStory,
  }) {
    return resetState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_CreateStory value)? createStory,
    TResult Function(_UpdateStory value)? updateStory,
    TResult Function(_DeleteStory value)? deleteStory,
    TResult Function(_FetchStories value)? fetchStories,
    TResult Function(_ResetState value)? resetState,
    TResult Function(_FetchStoryViewers value)? fetchStoryViewers,
    TResult Function(_FetchPaginatedStoryViewers value)?
        fetchPaginatedStoryViewers,
    TResult Function(_FetchPaginatedStories value)? fetchPaginatedStories,
    TResult Function(_ViewStory value)? viewStory,
  }) {
    return resetState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CreateStory value)? createStory,
    TResult Function(_UpdateStory value)? updateStory,
    TResult Function(_DeleteStory value)? deleteStory,
    TResult Function(_FetchStories value)? fetchStories,
    TResult Function(_ResetState value)? resetState,
    TResult Function(_FetchStoryViewers value)? fetchStoryViewers,
    TResult Function(_FetchPaginatedStoryViewers value)?
        fetchPaginatedStoryViewers,
    TResult Function(_FetchPaginatedStories value)? fetchPaginatedStories,
    TResult Function(_ViewStory value)? viewStory,
    required TResult orElse(),
  }) {
    if (resetState != null) {
      return resetState(this);
    }
    return orElse();
  }
}

abstract class _ResetState implements StoryEvent {
  const factory _ResetState() = _$_ResetState;
}

/// @nodoc
abstract class _$FetchStoryViewersCopyWith<$Res> {
  factory _$FetchStoryViewersCopyWith(
          _FetchStoryViewers value, $Res Function(_FetchStoryViewers) then) =
      __$FetchStoryViewersCopyWithImpl<$Res>;
  $Res call({String userId, String contentId});
}

/// @nodoc
class __$FetchStoryViewersCopyWithImpl<$Res>
    extends _$StoryEventCopyWithImpl<$Res>
    implements _$FetchStoryViewersCopyWith<$Res> {
  __$FetchStoryViewersCopyWithImpl(
      _FetchStoryViewers _value, $Res Function(_FetchStoryViewers) _then)
      : super(_value, (v) => _then(v as _FetchStoryViewers));

  @override
  _FetchStoryViewers get _value => super._value as _FetchStoryViewers;

  @override
  $Res call({
    Object? userId = freezed,
    Object? contentId = freezed,
  }) {
    return _then(_FetchStoryViewers(
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      contentId: contentId == freezed
          ? _value.contentId
          : contentId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_FetchStoryViewers implements _FetchStoryViewers {
  const _$_FetchStoryViewers({required this.userId, required this.contentId});

  @override
  final String userId;
  @override
  final String contentId;

  @override
  String toString() {
    return 'StoryEvent.fetchStoryViewers(userId: $userId, contentId: $contentId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FetchStoryViewers &&
            const DeepCollectionEquality().equals(other.userId, userId) &&
            const DeepCollectionEquality().equals(other.contentId, contentId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(userId),
      const DeepCollectionEquality().hash(contentId));

  @JsonKey(ignore: true)
  @override
  _$FetchStoryViewersCopyWith<_FetchStoryViewers> get copyWith =>
      __$FetchStoryViewersCopyWithImpl<_FetchStoryViewers>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<GalleryAsset> assets) createStory,
    required TResult Function(String userId, List<GalleryAsset> assets)
        updateStory,
    required TResult Function(
            bool isLast, String userId, List<StoryContent>? content)
        deleteStory,
    required TResult Function(String userId) fetchStories,
    required TResult Function() resetState,
    required TResult Function(String userId, String contentId)
        fetchStoryViewers,
    required TResult Function(String userId, String contentId)
        fetchPaginatedStoryViewers,
    required TResult Function(String userId) fetchPaginatedStories,
    required TResult Function(String userId, String storyId, String contentId,
            List<StoryContent> stories)
        viewStory,
  }) {
    return fetchStoryViewers(userId, contentId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<GalleryAsset> assets)? createStory,
    TResult Function(String userId, List<GalleryAsset> assets)? updateStory,
    TResult Function(bool isLast, String userId, List<StoryContent>? content)?
        deleteStory,
    TResult Function(String userId)? fetchStories,
    TResult Function()? resetState,
    TResult Function(String userId, String contentId)? fetchStoryViewers,
    TResult Function(String userId, String contentId)?
        fetchPaginatedStoryViewers,
    TResult Function(String userId)? fetchPaginatedStories,
    TResult Function(String userId, String storyId, String contentId,
            List<StoryContent> stories)?
        viewStory,
  }) {
    return fetchStoryViewers?.call(userId, contentId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<GalleryAsset> assets)? createStory,
    TResult Function(String userId, List<GalleryAsset> assets)? updateStory,
    TResult Function(bool isLast, String userId, List<StoryContent>? content)?
        deleteStory,
    TResult Function(String userId)? fetchStories,
    TResult Function()? resetState,
    TResult Function(String userId, String contentId)? fetchStoryViewers,
    TResult Function(String userId, String contentId)?
        fetchPaginatedStoryViewers,
    TResult Function(String userId)? fetchPaginatedStories,
    TResult Function(String userId, String storyId, String contentId,
            List<StoryContent> stories)?
        viewStory,
    required TResult orElse(),
  }) {
    if (fetchStoryViewers != null) {
      return fetchStoryViewers(userId, contentId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CreateStory value) createStory,
    required TResult Function(_UpdateStory value) updateStory,
    required TResult Function(_DeleteStory value) deleteStory,
    required TResult Function(_FetchStories value) fetchStories,
    required TResult Function(_ResetState value) resetState,
    required TResult Function(_FetchStoryViewers value) fetchStoryViewers,
    required TResult Function(_FetchPaginatedStoryViewers value)
        fetchPaginatedStoryViewers,
    required TResult Function(_FetchPaginatedStories value)
        fetchPaginatedStories,
    required TResult Function(_ViewStory value) viewStory,
  }) {
    return fetchStoryViewers(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_CreateStory value)? createStory,
    TResult Function(_UpdateStory value)? updateStory,
    TResult Function(_DeleteStory value)? deleteStory,
    TResult Function(_FetchStories value)? fetchStories,
    TResult Function(_ResetState value)? resetState,
    TResult Function(_FetchStoryViewers value)? fetchStoryViewers,
    TResult Function(_FetchPaginatedStoryViewers value)?
        fetchPaginatedStoryViewers,
    TResult Function(_FetchPaginatedStories value)? fetchPaginatedStories,
    TResult Function(_ViewStory value)? viewStory,
  }) {
    return fetchStoryViewers?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CreateStory value)? createStory,
    TResult Function(_UpdateStory value)? updateStory,
    TResult Function(_DeleteStory value)? deleteStory,
    TResult Function(_FetchStories value)? fetchStories,
    TResult Function(_ResetState value)? resetState,
    TResult Function(_FetchStoryViewers value)? fetchStoryViewers,
    TResult Function(_FetchPaginatedStoryViewers value)?
        fetchPaginatedStoryViewers,
    TResult Function(_FetchPaginatedStories value)? fetchPaginatedStories,
    TResult Function(_ViewStory value)? viewStory,
    required TResult orElse(),
  }) {
    if (fetchStoryViewers != null) {
      return fetchStoryViewers(this);
    }
    return orElse();
  }
}

abstract class _FetchStoryViewers implements StoryEvent {
  const factory _FetchStoryViewers(
      {required String userId,
      required String contentId}) = _$_FetchStoryViewers;

  String get userId;
  String get contentId;
  @JsonKey(ignore: true)
  _$FetchStoryViewersCopyWith<_FetchStoryViewers> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$FetchPaginatedStoryViewersCopyWith<$Res> {
  factory _$FetchPaginatedStoryViewersCopyWith(
          _FetchPaginatedStoryViewers value,
          $Res Function(_FetchPaginatedStoryViewers) then) =
      __$FetchPaginatedStoryViewersCopyWithImpl<$Res>;
  $Res call({String userId, String contentId});
}

/// @nodoc
class __$FetchPaginatedStoryViewersCopyWithImpl<$Res>
    extends _$StoryEventCopyWithImpl<$Res>
    implements _$FetchPaginatedStoryViewersCopyWith<$Res> {
  __$FetchPaginatedStoryViewersCopyWithImpl(_FetchPaginatedStoryViewers _value,
      $Res Function(_FetchPaginatedStoryViewers) _then)
      : super(_value, (v) => _then(v as _FetchPaginatedStoryViewers));

  @override
  _FetchPaginatedStoryViewers get _value =>
      super._value as _FetchPaginatedStoryViewers;

  @override
  $Res call({
    Object? userId = freezed,
    Object? contentId = freezed,
  }) {
    return _then(_FetchPaginatedStoryViewers(
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      contentId: contentId == freezed
          ? _value.contentId
          : contentId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_FetchPaginatedStoryViewers implements _FetchPaginatedStoryViewers {
  const _$_FetchPaginatedStoryViewers(
      {required this.userId, required this.contentId});

  @override
  final String userId;
  @override
  final String contentId;

  @override
  String toString() {
    return 'StoryEvent.fetchPaginatedStoryViewers(userId: $userId, contentId: $contentId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FetchPaginatedStoryViewers &&
            const DeepCollectionEquality().equals(other.userId, userId) &&
            const DeepCollectionEquality().equals(other.contentId, contentId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(userId),
      const DeepCollectionEquality().hash(contentId));

  @JsonKey(ignore: true)
  @override
  _$FetchPaginatedStoryViewersCopyWith<_FetchPaginatedStoryViewers>
      get copyWith => __$FetchPaginatedStoryViewersCopyWithImpl<
          _FetchPaginatedStoryViewers>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<GalleryAsset> assets) createStory,
    required TResult Function(String userId, List<GalleryAsset> assets)
        updateStory,
    required TResult Function(
            bool isLast, String userId, List<StoryContent>? content)
        deleteStory,
    required TResult Function(String userId) fetchStories,
    required TResult Function() resetState,
    required TResult Function(String userId, String contentId)
        fetchStoryViewers,
    required TResult Function(String userId, String contentId)
        fetchPaginatedStoryViewers,
    required TResult Function(String userId) fetchPaginatedStories,
    required TResult Function(String userId, String storyId, String contentId,
            List<StoryContent> stories)
        viewStory,
  }) {
    return fetchPaginatedStoryViewers(userId, contentId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<GalleryAsset> assets)? createStory,
    TResult Function(String userId, List<GalleryAsset> assets)? updateStory,
    TResult Function(bool isLast, String userId, List<StoryContent>? content)?
        deleteStory,
    TResult Function(String userId)? fetchStories,
    TResult Function()? resetState,
    TResult Function(String userId, String contentId)? fetchStoryViewers,
    TResult Function(String userId, String contentId)?
        fetchPaginatedStoryViewers,
    TResult Function(String userId)? fetchPaginatedStories,
    TResult Function(String userId, String storyId, String contentId,
            List<StoryContent> stories)?
        viewStory,
  }) {
    return fetchPaginatedStoryViewers?.call(userId, contentId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<GalleryAsset> assets)? createStory,
    TResult Function(String userId, List<GalleryAsset> assets)? updateStory,
    TResult Function(bool isLast, String userId, List<StoryContent>? content)?
        deleteStory,
    TResult Function(String userId)? fetchStories,
    TResult Function()? resetState,
    TResult Function(String userId, String contentId)? fetchStoryViewers,
    TResult Function(String userId, String contentId)?
        fetchPaginatedStoryViewers,
    TResult Function(String userId)? fetchPaginatedStories,
    TResult Function(String userId, String storyId, String contentId,
            List<StoryContent> stories)?
        viewStory,
    required TResult orElse(),
  }) {
    if (fetchPaginatedStoryViewers != null) {
      return fetchPaginatedStoryViewers(userId, contentId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CreateStory value) createStory,
    required TResult Function(_UpdateStory value) updateStory,
    required TResult Function(_DeleteStory value) deleteStory,
    required TResult Function(_FetchStories value) fetchStories,
    required TResult Function(_ResetState value) resetState,
    required TResult Function(_FetchStoryViewers value) fetchStoryViewers,
    required TResult Function(_FetchPaginatedStoryViewers value)
        fetchPaginatedStoryViewers,
    required TResult Function(_FetchPaginatedStories value)
        fetchPaginatedStories,
    required TResult Function(_ViewStory value) viewStory,
  }) {
    return fetchPaginatedStoryViewers(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_CreateStory value)? createStory,
    TResult Function(_UpdateStory value)? updateStory,
    TResult Function(_DeleteStory value)? deleteStory,
    TResult Function(_FetchStories value)? fetchStories,
    TResult Function(_ResetState value)? resetState,
    TResult Function(_FetchStoryViewers value)? fetchStoryViewers,
    TResult Function(_FetchPaginatedStoryViewers value)?
        fetchPaginatedStoryViewers,
    TResult Function(_FetchPaginatedStories value)? fetchPaginatedStories,
    TResult Function(_ViewStory value)? viewStory,
  }) {
    return fetchPaginatedStoryViewers?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CreateStory value)? createStory,
    TResult Function(_UpdateStory value)? updateStory,
    TResult Function(_DeleteStory value)? deleteStory,
    TResult Function(_FetchStories value)? fetchStories,
    TResult Function(_ResetState value)? resetState,
    TResult Function(_FetchStoryViewers value)? fetchStoryViewers,
    TResult Function(_FetchPaginatedStoryViewers value)?
        fetchPaginatedStoryViewers,
    TResult Function(_FetchPaginatedStories value)? fetchPaginatedStories,
    TResult Function(_ViewStory value)? viewStory,
    required TResult orElse(),
  }) {
    if (fetchPaginatedStoryViewers != null) {
      return fetchPaginatedStoryViewers(this);
    }
    return orElse();
  }
}

abstract class _FetchPaginatedStoryViewers implements StoryEvent {
  const factory _FetchPaginatedStoryViewers(
      {required String userId,
      required String contentId}) = _$_FetchPaginatedStoryViewers;

  String get userId;
  String get contentId;
  @JsonKey(ignore: true)
  _$FetchPaginatedStoryViewersCopyWith<_FetchPaginatedStoryViewers>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$FetchPaginatedStoriesCopyWith<$Res> {
  factory _$FetchPaginatedStoriesCopyWith(_FetchPaginatedStories value,
          $Res Function(_FetchPaginatedStories) then) =
      __$FetchPaginatedStoriesCopyWithImpl<$Res>;
  $Res call({String userId});
}

/// @nodoc
class __$FetchPaginatedStoriesCopyWithImpl<$Res>
    extends _$StoryEventCopyWithImpl<$Res>
    implements _$FetchPaginatedStoriesCopyWith<$Res> {
  __$FetchPaginatedStoriesCopyWithImpl(_FetchPaginatedStories _value,
      $Res Function(_FetchPaginatedStories) _then)
      : super(_value, (v) => _then(v as _FetchPaginatedStories));

  @override
  _FetchPaginatedStories get _value => super._value as _FetchPaginatedStories;

  @override
  $Res call({
    Object? userId = freezed,
  }) {
    return _then(_FetchPaginatedStories(
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_FetchPaginatedStories implements _FetchPaginatedStories {
  const _$_FetchPaginatedStories({required this.userId});

  @override
  final String userId;

  @override
  String toString() {
    return 'StoryEvent.fetchPaginatedStories(userId: $userId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FetchPaginatedStories &&
            const DeepCollectionEquality().equals(other.userId, userId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(userId));

  @JsonKey(ignore: true)
  @override
  _$FetchPaginatedStoriesCopyWith<_FetchPaginatedStories> get copyWith =>
      __$FetchPaginatedStoriesCopyWithImpl<_FetchPaginatedStories>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<GalleryAsset> assets) createStory,
    required TResult Function(String userId, List<GalleryAsset> assets)
        updateStory,
    required TResult Function(
            bool isLast, String userId, List<StoryContent>? content)
        deleteStory,
    required TResult Function(String userId) fetchStories,
    required TResult Function() resetState,
    required TResult Function(String userId, String contentId)
        fetchStoryViewers,
    required TResult Function(String userId, String contentId)
        fetchPaginatedStoryViewers,
    required TResult Function(String userId) fetchPaginatedStories,
    required TResult Function(String userId, String storyId, String contentId,
            List<StoryContent> stories)
        viewStory,
  }) {
    return fetchPaginatedStories(userId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<GalleryAsset> assets)? createStory,
    TResult Function(String userId, List<GalleryAsset> assets)? updateStory,
    TResult Function(bool isLast, String userId, List<StoryContent>? content)?
        deleteStory,
    TResult Function(String userId)? fetchStories,
    TResult Function()? resetState,
    TResult Function(String userId, String contentId)? fetchStoryViewers,
    TResult Function(String userId, String contentId)?
        fetchPaginatedStoryViewers,
    TResult Function(String userId)? fetchPaginatedStories,
    TResult Function(String userId, String storyId, String contentId,
            List<StoryContent> stories)?
        viewStory,
  }) {
    return fetchPaginatedStories?.call(userId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<GalleryAsset> assets)? createStory,
    TResult Function(String userId, List<GalleryAsset> assets)? updateStory,
    TResult Function(bool isLast, String userId, List<StoryContent>? content)?
        deleteStory,
    TResult Function(String userId)? fetchStories,
    TResult Function()? resetState,
    TResult Function(String userId, String contentId)? fetchStoryViewers,
    TResult Function(String userId, String contentId)?
        fetchPaginatedStoryViewers,
    TResult Function(String userId)? fetchPaginatedStories,
    TResult Function(String userId, String storyId, String contentId,
            List<StoryContent> stories)?
        viewStory,
    required TResult orElse(),
  }) {
    if (fetchPaginatedStories != null) {
      return fetchPaginatedStories(userId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CreateStory value) createStory,
    required TResult Function(_UpdateStory value) updateStory,
    required TResult Function(_DeleteStory value) deleteStory,
    required TResult Function(_FetchStories value) fetchStories,
    required TResult Function(_ResetState value) resetState,
    required TResult Function(_FetchStoryViewers value) fetchStoryViewers,
    required TResult Function(_FetchPaginatedStoryViewers value)
        fetchPaginatedStoryViewers,
    required TResult Function(_FetchPaginatedStories value)
        fetchPaginatedStories,
    required TResult Function(_ViewStory value) viewStory,
  }) {
    return fetchPaginatedStories(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_CreateStory value)? createStory,
    TResult Function(_UpdateStory value)? updateStory,
    TResult Function(_DeleteStory value)? deleteStory,
    TResult Function(_FetchStories value)? fetchStories,
    TResult Function(_ResetState value)? resetState,
    TResult Function(_FetchStoryViewers value)? fetchStoryViewers,
    TResult Function(_FetchPaginatedStoryViewers value)?
        fetchPaginatedStoryViewers,
    TResult Function(_FetchPaginatedStories value)? fetchPaginatedStories,
    TResult Function(_ViewStory value)? viewStory,
  }) {
    return fetchPaginatedStories?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CreateStory value)? createStory,
    TResult Function(_UpdateStory value)? updateStory,
    TResult Function(_DeleteStory value)? deleteStory,
    TResult Function(_FetchStories value)? fetchStories,
    TResult Function(_ResetState value)? resetState,
    TResult Function(_FetchStoryViewers value)? fetchStoryViewers,
    TResult Function(_FetchPaginatedStoryViewers value)?
        fetchPaginatedStoryViewers,
    TResult Function(_FetchPaginatedStories value)? fetchPaginatedStories,
    TResult Function(_ViewStory value)? viewStory,
    required TResult orElse(),
  }) {
    if (fetchPaginatedStories != null) {
      return fetchPaginatedStories(this);
    }
    return orElse();
  }
}

abstract class _FetchPaginatedStories implements StoryEvent {
  const factory _FetchPaginatedStories({required String userId}) =
      _$_FetchPaginatedStories;

  String get userId;
  @JsonKey(ignore: true)
  _$FetchPaginatedStoriesCopyWith<_FetchPaginatedStories> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$ViewStoryCopyWith<$Res> {
  factory _$ViewStoryCopyWith(
          _ViewStory value, $Res Function(_ViewStory) then) =
      __$ViewStoryCopyWithImpl<$Res>;
  $Res call(
      {String userId,
      String storyId,
      String contentId,
      List<StoryContent> stories});
}

/// @nodoc
class __$ViewStoryCopyWithImpl<$Res> extends _$StoryEventCopyWithImpl<$Res>
    implements _$ViewStoryCopyWith<$Res> {
  __$ViewStoryCopyWithImpl(_ViewStory _value, $Res Function(_ViewStory) _then)
      : super(_value, (v) => _then(v as _ViewStory));

  @override
  _ViewStory get _value => super._value as _ViewStory;

  @override
  $Res call({
    Object? userId = freezed,
    Object? storyId = freezed,
    Object? contentId = freezed,
    Object? stories = freezed,
  }) {
    return _then(_ViewStory(
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      storyId: storyId == freezed
          ? _value.storyId
          : storyId // ignore: cast_nullable_to_non_nullable
              as String,
      contentId: contentId == freezed
          ? _value.contentId
          : contentId // ignore: cast_nullable_to_non_nullable
              as String,
      stories: stories == freezed
          ? _value.stories
          : stories // ignore: cast_nullable_to_non_nullable
              as List<StoryContent>,
    ));
  }
}

/// @nodoc

class _$_ViewStory implements _ViewStory {
  const _$_ViewStory(
      {required this.userId,
      required this.storyId,
      required this.contentId,
      required this.stories});

  @override
  final String userId;
  @override
  final String storyId;
  @override
  final String contentId;
  @override
  final List<StoryContent> stories;

  @override
  String toString() {
    return 'StoryEvent.viewStory(userId: $userId, storyId: $storyId, contentId: $contentId, stories: $stories)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ViewStory &&
            const DeepCollectionEquality().equals(other.userId, userId) &&
            const DeepCollectionEquality().equals(other.storyId, storyId) &&
            const DeepCollectionEquality().equals(other.contentId, contentId) &&
            const DeepCollectionEquality().equals(other.stories, stories));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(userId),
      const DeepCollectionEquality().hash(storyId),
      const DeepCollectionEquality().hash(contentId),
      const DeepCollectionEquality().hash(stories));

  @JsonKey(ignore: true)
  @override
  _$ViewStoryCopyWith<_ViewStory> get copyWith =>
      __$ViewStoryCopyWithImpl<_ViewStory>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<GalleryAsset> assets) createStory,
    required TResult Function(String userId, List<GalleryAsset> assets)
        updateStory,
    required TResult Function(
            bool isLast, String userId, List<StoryContent>? content)
        deleteStory,
    required TResult Function(String userId) fetchStories,
    required TResult Function() resetState,
    required TResult Function(String userId, String contentId)
        fetchStoryViewers,
    required TResult Function(String userId, String contentId)
        fetchPaginatedStoryViewers,
    required TResult Function(String userId) fetchPaginatedStories,
    required TResult Function(String userId, String storyId, String contentId,
            List<StoryContent> stories)
        viewStory,
  }) {
    return viewStory(userId, storyId, contentId, stories);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<GalleryAsset> assets)? createStory,
    TResult Function(String userId, List<GalleryAsset> assets)? updateStory,
    TResult Function(bool isLast, String userId, List<StoryContent>? content)?
        deleteStory,
    TResult Function(String userId)? fetchStories,
    TResult Function()? resetState,
    TResult Function(String userId, String contentId)? fetchStoryViewers,
    TResult Function(String userId, String contentId)?
        fetchPaginatedStoryViewers,
    TResult Function(String userId)? fetchPaginatedStories,
    TResult Function(String userId, String storyId, String contentId,
            List<StoryContent> stories)?
        viewStory,
  }) {
    return viewStory?.call(userId, storyId, contentId, stories);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<GalleryAsset> assets)? createStory,
    TResult Function(String userId, List<GalleryAsset> assets)? updateStory,
    TResult Function(bool isLast, String userId, List<StoryContent>? content)?
        deleteStory,
    TResult Function(String userId)? fetchStories,
    TResult Function()? resetState,
    TResult Function(String userId, String contentId)? fetchStoryViewers,
    TResult Function(String userId, String contentId)?
        fetchPaginatedStoryViewers,
    TResult Function(String userId)? fetchPaginatedStories,
    TResult Function(String userId, String storyId, String contentId,
            List<StoryContent> stories)?
        viewStory,
    required TResult orElse(),
  }) {
    if (viewStory != null) {
      return viewStory(userId, storyId, contentId, stories);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CreateStory value) createStory,
    required TResult Function(_UpdateStory value) updateStory,
    required TResult Function(_DeleteStory value) deleteStory,
    required TResult Function(_FetchStories value) fetchStories,
    required TResult Function(_ResetState value) resetState,
    required TResult Function(_FetchStoryViewers value) fetchStoryViewers,
    required TResult Function(_FetchPaginatedStoryViewers value)
        fetchPaginatedStoryViewers,
    required TResult Function(_FetchPaginatedStories value)
        fetchPaginatedStories,
    required TResult Function(_ViewStory value) viewStory,
  }) {
    return viewStory(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_CreateStory value)? createStory,
    TResult Function(_UpdateStory value)? updateStory,
    TResult Function(_DeleteStory value)? deleteStory,
    TResult Function(_FetchStories value)? fetchStories,
    TResult Function(_ResetState value)? resetState,
    TResult Function(_FetchStoryViewers value)? fetchStoryViewers,
    TResult Function(_FetchPaginatedStoryViewers value)?
        fetchPaginatedStoryViewers,
    TResult Function(_FetchPaginatedStories value)? fetchPaginatedStories,
    TResult Function(_ViewStory value)? viewStory,
  }) {
    return viewStory?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CreateStory value)? createStory,
    TResult Function(_UpdateStory value)? updateStory,
    TResult Function(_DeleteStory value)? deleteStory,
    TResult Function(_FetchStories value)? fetchStories,
    TResult Function(_ResetState value)? resetState,
    TResult Function(_FetchStoryViewers value)? fetchStoryViewers,
    TResult Function(_FetchPaginatedStoryViewers value)?
        fetchPaginatedStoryViewers,
    TResult Function(_FetchPaginatedStories value)? fetchPaginatedStories,
    TResult Function(_ViewStory value)? viewStory,
    required TResult orElse(),
  }) {
    if (viewStory != null) {
      return viewStory(this);
    }
    return orElse();
  }
}

abstract class _ViewStory implements StoryEvent {
  const factory _ViewStory(
      {required String userId,
      required String storyId,
      required String contentId,
      required List<StoryContent> stories}) = _$_ViewStory;

  String get userId;
  String get storyId;
  String get contentId;
  List<StoryContent> get stories;
  @JsonKey(ignore: true)
  _$ViewStoryCopyWith<_ViewStory> get copyWith =>
      throw _privateConstructorUsedError;
}
