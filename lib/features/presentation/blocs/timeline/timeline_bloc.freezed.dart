// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'timeline_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$TimelineEventTearOff {
  const _$TimelineEventTearOff();

  _FetchTimelinePosts fetchTimelinePosts() {
    return const _FetchTimelinePosts();
  }

  _FetchTimelinePaginatedPosts fetchPaginatedTimelinePosts(
      {required List<PostEntity> posts}) {
    return _FetchTimelinePaginatedPosts(
      posts: posts,
    );
  }
}

/// @nodoc
const $TimelineEvent = _$TimelineEventTearOff();

/// @nodoc
mixin _$TimelineEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchTimelinePosts,
    required TResult Function(List<PostEntity> posts)
        fetchPaginatedTimelinePosts,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? fetchTimelinePosts,
    TResult Function(List<PostEntity> posts)? fetchPaginatedTimelinePosts,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchTimelinePosts,
    TResult Function(List<PostEntity> posts)? fetchPaginatedTimelinePosts,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchTimelinePosts value) fetchTimelinePosts,
    required TResult Function(_FetchTimelinePaginatedPosts value)
        fetchPaginatedTimelinePosts,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_FetchTimelinePosts value)? fetchTimelinePosts,
    TResult Function(_FetchTimelinePaginatedPosts value)?
        fetchPaginatedTimelinePosts,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchTimelinePosts value)? fetchTimelinePosts,
    TResult Function(_FetchTimelinePaginatedPosts value)?
        fetchPaginatedTimelinePosts,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimelineEventCopyWith<$Res> {
  factory $TimelineEventCopyWith(
          TimelineEvent value, $Res Function(TimelineEvent) then) =
      _$TimelineEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$TimelineEventCopyWithImpl<$Res>
    implements $TimelineEventCopyWith<$Res> {
  _$TimelineEventCopyWithImpl(this._value, this._then);

  final TimelineEvent _value;
  // ignore: unused_field
  final $Res Function(TimelineEvent) _then;
}

/// @nodoc
abstract class _$FetchTimelinePostsCopyWith<$Res> {
  factory _$FetchTimelinePostsCopyWith(
          _FetchTimelinePosts value, $Res Function(_FetchTimelinePosts) then) =
      __$FetchTimelinePostsCopyWithImpl<$Res>;
}

/// @nodoc
class __$FetchTimelinePostsCopyWithImpl<$Res>
    extends _$TimelineEventCopyWithImpl<$Res>
    implements _$FetchTimelinePostsCopyWith<$Res> {
  __$FetchTimelinePostsCopyWithImpl(
      _FetchTimelinePosts _value, $Res Function(_FetchTimelinePosts) _then)
      : super(_value, (v) => _then(v as _FetchTimelinePosts));

  @override
  _FetchTimelinePosts get _value => super._value as _FetchTimelinePosts;
}

/// @nodoc

class _$_FetchTimelinePosts implements _FetchTimelinePosts {
  const _$_FetchTimelinePosts();

  @override
  String toString() {
    return 'TimelineEvent.fetchTimelinePosts()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _FetchTimelinePosts);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchTimelinePosts,
    required TResult Function(List<PostEntity> posts)
        fetchPaginatedTimelinePosts,
  }) {
    return fetchTimelinePosts();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? fetchTimelinePosts,
    TResult Function(List<PostEntity> posts)? fetchPaginatedTimelinePosts,
  }) {
    return fetchTimelinePosts?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchTimelinePosts,
    TResult Function(List<PostEntity> posts)? fetchPaginatedTimelinePosts,
    required TResult orElse(),
  }) {
    if (fetchTimelinePosts != null) {
      return fetchTimelinePosts();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchTimelinePosts value) fetchTimelinePosts,
    required TResult Function(_FetchTimelinePaginatedPosts value)
        fetchPaginatedTimelinePosts,
  }) {
    return fetchTimelinePosts(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_FetchTimelinePosts value)? fetchTimelinePosts,
    TResult Function(_FetchTimelinePaginatedPosts value)?
        fetchPaginatedTimelinePosts,
  }) {
    return fetchTimelinePosts?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchTimelinePosts value)? fetchTimelinePosts,
    TResult Function(_FetchTimelinePaginatedPosts value)?
        fetchPaginatedTimelinePosts,
    required TResult orElse(),
  }) {
    if (fetchTimelinePosts != null) {
      return fetchTimelinePosts(this);
    }
    return orElse();
  }
}

abstract class _FetchTimelinePosts implements TimelineEvent {
  const factory _FetchTimelinePosts() = _$_FetchTimelinePosts;
}

/// @nodoc
abstract class _$FetchTimelinePaginatedPostsCopyWith<$Res> {
  factory _$FetchTimelinePaginatedPostsCopyWith(
          _FetchTimelinePaginatedPosts value,
          $Res Function(_FetchTimelinePaginatedPosts) then) =
      __$FetchTimelinePaginatedPostsCopyWithImpl<$Res>;
  $Res call({List<PostEntity> posts});
}

/// @nodoc
class __$FetchTimelinePaginatedPostsCopyWithImpl<$Res>
    extends _$TimelineEventCopyWithImpl<$Res>
    implements _$FetchTimelinePaginatedPostsCopyWith<$Res> {
  __$FetchTimelinePaginatedPostsCopyWithImpl(
      _FetchTimelinePaginatedPosts _value,
      $Res Function(_FetchTimelinePaginatedPosts) _then)
      : super(_value, (v) => _then(v as _FetchTimelinePaginatedPosts));

  @override
  _FetchTimelinePaginatedPosts get _value =>
      super._value as _FetchTimelinePaginatedPosts;

  @override
  $Res call({
    Object? posts = freezed,
  }) {
    return _then(_FetchTimelinePaginatedPosts(
      posts: posts == freezed
          ? _value.posts
          : posts // ignore: cast_nullable_to_non_nullable
              as List<PostEntity>,
    ));
  }
}

/// @nodoc

class _$_FetchTimelinePaginatedPosts implements _FetchTimelinePaginatedPosts {
  const _$_FetchTimelinePaginatedPosts({required this.posts});

  @override
  final List<PostEntity> posts;

  @override
  String toString() {
    return 'TimelineEvent.fetchPaginatedTimelinePosts(posts: $posts)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FetchTimelinePaginatedPosts &&
            const DeepCollectionEquality().equals(other.posts, posts));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(posts));

  @JsonKey(ignore: true)
  @override
  _$FetchTimelinePaginatedPostsCopyWith<_FetchTimelinePaginatedPosts>
      get copyWith => __$FetchTimelinePaginatedPostsCopyWithImpl<
          _FetchTimelinePaginatedPosts>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchTimelinePosts,
    required TResult Function(List<PostEntity> posts)
        fetchPaginatedTimelinePosts,
  }) {
    return fetchPaginatedTimelinePosts(posts);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? fetchTimelinePosts,
    TResult Function(List<PostEntity> posts)? fetchPaginatedTimelinePosts,
  }) {
    return fetchPaginatedTimelinePosts?.call(posts);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchTimelinePosts,
    TResult Function(List<PostEntity> posts)? fetchPaginatedTimelinePosts,
    required TResult orElse(),
  }) {
    if (fetchPaginatedTimelinePosts != null) {
      return fetchPaginatedTimelinePosts(posts);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchTimelinePosts value) fetchTimelinePosts,
    required TResult Function(_FetchTimelinePaginatedPosts value)
        fetchPaginatedTimelinePosts,
  }) {
    return fetchPaginatedTimelinePosts(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_FetchTimelinePosts value)? fetchTimelinePosts,
    TResult Function(_FetchTimelinePaginatedPosts value)?
        fetchPaginatedTimelinePosts,
  }) {
    return fetchPaginatedTimelinePosts?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchTimelinePosts value)? fetchTimelinePosts,
    TResult Function(_FetchTimelinePaginatedPosts value)?
        fetchPaginatedTimelinePosts,
    required TResult orElse(),
  }) {
    if (fetchPaginatedTimelinePosts != null) {
      return fetchPaginatedTimelinePosts(this);
    }
    return orElse();
  }
}

abstract class _FetchTimelinePaginatedPosts implements TimelineEvent {
  const factory _FetchTimelinePaginatedPosts(
      {required List<PostEntity> posts}) = _$_FetchTimelinePaginatedPosts;

  List<PostEntity> get posts;
  @JsonKey(ignore: true)
  _$FetchTimelinePaginatedPostsCopyWith<_FetchTimelinePaginatedPosts>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
class _$TimelineStateTearOff {
  const _$TimelineStateTearOff();

  _TimelineState call(
      {String error = '',
      required TimelineResponse timelinePosts,
      TimelineStatus status = TimelineStatus.Idle}) {
    return _TimelineState(
      error: error,
      timelinePosts: timelinePosts,
      status: status,
    );
  }
}

/// @nodoc
const $TimelineState = _$TimelineStateTearOff();

/// @nodoc
mixin _$TimelineState {
  String get error => throw _privateConstructorUsedError;
  TimelineResponse get timelinePosts => throw _privateConstructorUsedError;
  TimelineStatus get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TimelineStateCopyWith<TimelineState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimelineStateCopyWith<$Res> {
  factory $TimelineStateCopyWith(
          TimelineState value, $Res Function(TimelineState) then) =
      _$TimelineStateCopyWithImpl<$Res>;
  $Res call(
      {String error, TimelineResponse timelinePosts, TimelineStatus status});
}

/// @nodoc
class _$TimelineStateCopyWithImpl<$Res>
    implements $TimelineStateCopyWith<$Res> {
  _$TimelineStateCopyWithImpl(this._value, this._then);

  final TimelineState _value;
  // ignore: unused_field
  final $Res Function(TimelineState) _then;

  @override
  $Res call({
    Object? error = freezed,
    Object? timelinePosts = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
      timelinePosts: timelinePosts == freezed
          ? _value.timelinePosts
          : timelinePosts // ignore: cast_nullable_to_non_nullable
              as TimelineResponse,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as TimelineStatus,
    ));
  }
}

/// @nodoc
abstract class _$TimelineStateCopyWith<$Res>
    implements $TimelineStateCopyWith<$Res> {
  factory _$TimelineStateCopyWith(
          _TimelineState value, $Res Function(_TimelineState) then) =
      __$TimelineStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {String error, TimelineResponse timelinePosts, TimelineStatus status});
}

/// @nodoc
class __$TimelineStateCopyWithImpl<$Res>
    extends _$TimelineStateCopyWithImpl<$Res>
    implements _$TimelineStateCopyWith<$Res> {
  __$TimelineStateCopyWithImpl(
      _TimelineState _value, $Res Function(_TimelineState) _then)
      : super(_value, (v) => _then(v as _TimelineState));

  @override
  _TimelineState get _value => super._value as _TimelineState;

  @override
  $Res call({
    Object? error = freezed,
    Object? timelinePosts = freezed,
    Object? status = freezed,
  }) {
    return _then(_TimelineState(
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
      timelinePosts: timelinePosts == freezed
          ? _value.timelinePosts
          : timelinePosts // ignore: cast_nullable_to_non_nullable
              as TimelineResponse,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as TimelineStatus,
    ));
  }
}

/// @nodoc

class _$_TimelineState implements _TimelineState {
  _$_TimelineState(
      {this.error = '',
      required this.timelinePosts,
      this.status = TimelineStatus.Idle});

  @JsonKey()
  @override
  final String error;
  @override
  final TimelineResponse timelinePosts;
  @JsonKey()
  @override
  final TimelineStatus status;

  @override
  String toString() {
    return 'TimelineState(error: $error, timelinePosts: $timelinePosts, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TimelineState &&
            const DeepCollectionEquality().equals(other.error, error) &&
            const DeepCollectionEquality()
                .equals(other.timelinePosts, timelinePosts) &&
            const DeepCollectionEquality().equals(other.status, status));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(error),
      const DeepCollectionEquality().hash(timelinePosts),
      const DeepCollectionEquality().hash(status));

  @JsonKey(ignore: true)
  @override
  _$TimelineStateCopyWith<_TimelineState> get copyWith =>
      __$TimelineStateCopyWithImpl<_TimelineState>(this, _$identity);
}

abstract class _TimelineState implements TimelineState {
  factory _TimelineState(
      {String error,
      required TimelineResponse timelinePosts,
      TimelineStatus status}) = _$_TimelineState;

  @override
  String get error;
  @override
  TimelineResponse get timelinePosts;
  @override
  TimelineStatus get status;
  @override
  @JsonKey(ignore: true)
  _$TimelineStateCopyWith<_TimelineState> get copyWith =>
      throw _privateConstructorUsedError;
}
