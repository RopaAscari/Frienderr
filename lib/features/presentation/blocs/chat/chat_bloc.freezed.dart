// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'chat_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ChatEventTearOff {
  const _$ChatEventTearOff();

  _GetChats getChats({required String id}) {
    return _GetChats(
      id: id,
    );
  }

  _UpdateChat updateChat({required String chats}) {
    return _UpdateChat(
      chats: chats,
    );
  }

  _OpenChat openChat(
      {required dynamic chats,
      required dynamic index,
      required dynamic context,
      required dynamic metaData}) {
    return _OpenChat(
      chats: chats,
      index: index,
      context: context,
      metaData: metaData,
    );
  }
}

/// @nodoc
const $ChatEvent = _$ChatEventTearOff();

/// @nodoc
mixin _$ChatEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id) getChats,
    required TResult Function(String chats) updateChat,
    required TResult Function(
            dynamic chats, dynamic index, dynamic context, dynamic metaData)
        openChat,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String id)? getChats,
    TResult Function(String chats)? updateChat,
    TResult Function(
            dynamic chats, dynamic index, dynamic context, dynamic metaData)?
        openChat,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? getChats,
    TResult Function(String chats)? updateChat,
    TResult Function(
            dynamic chats, dynamic index, dynamic context, dynamic metaData)?
        openChat,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetChats value) getChats,
    required TResult Function(_UpdateChat value) updateChat,
    required TResult Function(_OpenChat value) openChat,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetChats value)? getChats,
    TResult Function(_UpdateChat value)? updateChat,
    TResult Function(_OpenChat value)? openChat,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetChats value)? getChats,
    TResult Function(_UpdateChat value)? updateChat,
    TResult Function(_OpenChat value)? openChat,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatEventCopyWith<$Res> {
  factory $ChatEventCopyWith(ChatEvent value, $Res Function(ChatEvent) then) =
      _$ChatEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$ChatEventCopyWithImpl<$Res> implements $ChatEventCopyWith<$Res> {
  _$ChatEventCopyWithImpl(this._value, this._then);

  final ChatEvent _value;
  // ignore: unused_field
  final $Res Function(ChatEvent) _then;
}

/// @nodoc
abstract class _$GetChatsCopyWith<$Res> {
  factory _$GetChatsCopyWith(_GetChats value, $Res Function(_GetChats) then) =
      __$GetChatsCopyWithImpl<$Res>;
  $Res call({String id});
}

/// @nodoc
class __$GetChatsCopyWithImpl<$Res> extends _$ChatEventCopyWithImpl<$Res>
    implements _$GetChatsCopyWith<$Res> {
  __$GetChatsCopyWithImpl(_GetChats _value, $Res Function(_GetChats) _then)
      : super(_value, (v) => _then(v as _GetChats));

  @override
  _GetChats get _value => super._value as _GetChats;

  @override
  $Res call({
    Object? id = freezed,
  }) {
    return _then(_GetChats(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_GetChats implements _GetChats {
  const _$_GetChats({required this.id});

  @override
  final String id;

  @override
  String toString() {
    return 'ChatEvent.getChats(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GetChats &&
            const DeepCollectionEquality().equals(other.id, id));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(id));

  @JsonKey(ignore: true)
  @override
  _$GetChatsCopyWith<_GetChats> get copyWith =>
      __$GetChatsCopyWithImpl<_GetChats>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id) getChats,
    required TResult Function(String chats) updateChat,
    required TResult Function(
            dynamic chats, dynamic index, dynamic context, dynamic metaData)
        openChat,
  }) {
    return getChats(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String id)? getChats,
    TResult Function(String chats)? updateChat,
    TResult Function(
            dynamic chats, dynamic index, dynamic context, dynamic metaData)?
        openChat,
  }) {
    return getChats?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? getChats,
    TResult Function(String chats)? updateChat,
    TResult Function(
            dynamic chats, dynamic index, dynamic context, dynamic metaData)?
        openChat,
    required TResult orElse(),
  }) {
    if (getChats != null) {
      return getChats(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetChats value) getChats,
    required TResult Function(_UpdateChat value) updateChat,
    required TResult Function(_OpenChat value) openChat,
  }) {
    return getChats(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetChats value)? getChats,
    TResult Function(_UpdateChat value)? updateChat,
    TResult Function(_OpenChat value)? openChat,
  }) {
    return getChats?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetChats value)? getChats,
    TResult Function(_UpdateChat value)? updateChat,
    TResult Function(_OpenChat value)? openChat,
    required TResult orElse(),
  }) {
    if (getChats != null) {
      return getChats(this);
    }
    return orElse();
  }
}

abstract class _GetChats implements ChatEvent {
  const factory _GetChats({required String id}) = _$_GetChats;

  String get id;
  @JsonKey(ignore: true)
  _$GetChatsCopyWith<_GetChats> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$UpdateChatCopyWith<$Res> {
  factory _$UpdateChatCopyWith(
          _UpdateChat value, $Res Function(_UpdateChat) then) =
      __$UpdateChatCopyWithImpl<$Res>;
  $Res call({String chats});
}

/// @nodoc
class __$UpdateChatCopyWithImpl<$Res> extends _$ChatEventCopyWithImpl<$Res>
    implements _$UpdateChatCopyWith<$Res> {
  __$UpdateChatCopyWithImpl(
      _UpdateChat _value, $Res Function(_UpdateChat) _then)
      : super(_value, (v) => _then(v as _UpdateChat));

  @override
  _UpdateChat get _value => super._value as _UpdateChat;

  @override
  $Res call({
    Object? chats = freezed,
  }) {
    return _then(_UpdateChat(
      chats: chats == freezed
          ? _value.chats
          : chats // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_UpdateChat implements _UpdateChat {
  const _$_UpdateChat({required this.chats});

  @override
  final String chats;

  @override
  String toString() {
    return 'ChatEvent.updateChat(chats: $chats)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UpdateChat &&
            const DeepCollectionEquality().equals(other.chats, chats));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(chats));

  @JsonKey(ignore: true)
  @override
  _$UpdateChatCopyWith<_UpdateChat> get copyWith =>
      __$UpdateChatCopyWithImpl<_UpdateChat>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id) getChats,
    required TResult Function(String chats) updateChat,
    required TResult Function(
            dynamic chats, dynamic index, dynamic context, dynamic metaData)
        openChat,
  }) {
    return updateChat(chats);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String id)? getChats,
    TResult Function(String chats)? updateChat,
    TResult Function(
            dynamic chats, dynamic index, dynamic context, dynamic metaData)?
        openChat,
  }) {
    return updateChat?.call(chats);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? getChats,
    TResult Function(String chats)? updateChat,
    TResult Function(
            dynamic chats, dynamic index, dynamic context, dynamic metaData)?
        openChat,
    required TResult orElse(),
  }) {
    if (updateChat != null) {
      return updateChat(chats);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetChats value) getChats,
    required TResult Function(_UpdateChat value) updateChat,
    required TResult Function(_OpenChat value) openChat,
  }) {
    return updateChat(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetChats value)? getChats,
    TResult Function(_UpdateChat value)? updateChat,
    TResult Function(_OpenChat value)? openChat,
  }) {
    return updateChat?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetChats value)? getChats,
    TResult Function(_UpdateChat value)? updateChat,
    TResult Function(_OpenChat value)? openChat,
    required TResult orElse(),
  }) {
    if (updateChat != null) {
      return updateChat(this);
    }
    return orElse();
  }
}

abstract class _UpdateChat implements ChatEvent {
  const factory _UpdateChat({required String chats}) = _$_UpdateChat;

  String get chats;
  @JsonKey(ignore: true)
  _$UpdateChatCopyWith<_UpdateChat> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$OpenChatCopyWith<$Res> {
  factory _$OpenChatCopyWith(_OpenChat value, $Res Function(_OpenChat) then) =
      __$OpenChatCopyWithImpl<$Res>;
  $Res call({dynamic chats, dynamic index, dynamic context, dynamic metaData});
}

/// @nodoc
class __$OpenChatCopyWithImpl<$Res> extends _$ChatEventCopyWithImpl<$Res>
    implements _$OpenChatCopyWith<$Res> {
  __$OpenChatCopyWithImpl(_OpenChat _value, $Res Function(_OpenChat) _then)
      : super(_value, (v) => _then(v as _OpenChat));

  @override
  _OpenChat get _value => super._value as _OpenChat;

  @override
  $Res call({
    Object? chats = freezed,
    Object? index = freezed,
    Object? context = freezed,
    Object? metaData = freezed,
  }) {
    return _then(_OpenChat(
      chats: chats == freezed
          ? _value.chats
          : chats // ignore: cast_nullable_to_non_nullable
              as dynamic,
      index: index == freezed
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as dynamic,
      context: context == freezed
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as dynamic,
      metaData: metaData == freezed
          ? _value.metaData
          : metaData // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

class _$_OpenChat implements _OpenChat {
  const _$_OpenChat(
      {required this.chats,
      required this.index,
      required this.context,
      required this.metaData});

  @override
  final dynamic chats;
  @override
  final dynamic index;
  @override
  final dynamic context;
  @override
  final dynamic metaData;

  @override
  String toString() {
    return 'ChatEvent.openChat(chats: $chats, index: $index, context: $context, metaData: $metaData)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _OpenChat &&
            const DeepCollectionEquality().equals(other.chats, chats) &&
            const DeepCollectionEquality().equals(other.index, index) &&
            const DeepCollectionEquality().equals(other.context, context) &&
            const DeepCollectionEquality().equals(other.metaData, metaData));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(chats),
      const DeepCollectionEquality().hash(index),
      const DeepCollectionEquality().hash(context),
      const DeepCollectionEquality().hash(metaData));

  @JsonKey(ignore: true)
  @override
  _$OpenChatCopyWith<_OpenChat> get copyWith =>
      __$OpenChatCopyWithImpl<_OpenChat>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id) getChats,
    required TResult Function(String chats) updateChat,
    required TResult Function(
            dynamic chats, dynamic index, dynamic context, dynamic metaData)
        openChat,
  }) {
    return openChat(chats, index, context, metaData);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String id)? getChats,
    TResult Function(String chats)? updateChat,
    TResult Function(
            dynamic chats, dynamic index, dynamic context, dynamic metaData)?
        openChat,
  }) {
    return openChat?.call(chats, index, context, metaData);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? getChats,
    TResult Function(String chats)? updateChat,
    TResult Function(
            dynamic chats, dynamic index, dynamic context, dynamic metaData)?
        openChat,
    required TResult orElse(),
  }) {
    if (openChat != null) {
      return openChat(chats, index, context, metaData);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetChats value) getChats,
    required TResult Function(_UpdateChat value) updateChat,
    required TResult Function(_OpenChat value) openChat,
  }) {
    return openChat(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetChats value)? getChats,
    TResult Function(_UpdateChat value)? updateChat,
    TResult Function(_OpenChat value)? openChat,
  }) {
    return openChat?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetChats value)? getChats,
    TResult Function(_UpdateChat value)? updateChat,
    TResult Function(_OpenChat value)? openChat,
    required TResult orElse(),
  }) {
    if (openChat != null) {
      return openChat(this);
    }
    return orElse();
  }
}

abstract class _OpenChat implements ChatEvent {
  const factory _OpenChat(
      {required dynamic chats,
      required dynamic index,
      required dynamic context,
      required dynamic metaData}) = _$_OpenChat;

  dynamic get chats;
  dynamic get index;
  dynamic get context;
  dynamic get metaData;
  @JsonKey(ignore: true)
  _$OpenChatCopyWith<_OpenChat> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$ChatStateTearOff {
  const _$ChatStateTearOff();

  _ChatState call(
      {required List<ChatModel> chats,
      String error = '',
      ChatStatus currentState = ChatStatus.Initial}) {
    return _ChatState(
      chats: chats,
      error: error,
      currentState: currentState,
    );
  }
}

/// @nodoc
const $ChatState = _$ChatStateTearOff();

/// @nodoc
mixin _$ChatState {
  List<ChatModel> get chats => throw _privateConstructorUsedError;
  String get error => throw _privateConstructorUsedError;
  ChatStatus get currentState => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ChatStateCopyWith<ChatState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatStateCopyWith<$Res> {
  factory $ChatStateCopyWith(ChatState value, $Res Function(ChatState) then) =
      _$ChatStateCopyWithImpl<$Res>;
  $Res call({List<ChatModel> chats, String error, ChatStatus currentState});
}

/// @nodoc
class _$ChatStateCopyWithImpl<$Res> implements $ChatStateCopyWith<$Res> {
  _$ChatStateCopyWithImpl(this._value, this._then);

  final ChatState _value;
  // ignore: unused_field
  final $Res Function(ChatState) _then;

  @override
  $Res call({
    Object? chats = freezed,
    Object? error = freezed,
    Object? currentState = freezed,
  }) {
    return _then(_value.copyWith(
      chats: chats == freezed
          ? _value.chats
          : chats // ignore: cast_nullable_to_non_nullable
              as List<ChatModel>,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
      currentState: currentState == freezed
          ? _value.currentState
          : currentState // ignore: cast_nullable_to_non_nullable
              as ChatStatus,
    ));
  }
}

/// @nodoc
abstract class _$ChatStateCopyWith<$Res> implements $ChatStateCopyWith<$Res> {
  factory _$ChatStateCopyWith(
          _ChatState value, $Res Function(_ChatState) then) =
      __$ChatStateCopyWithImpl<$Res>;
  @override
  $Res call({List<ChatModel> chats, String error, ChatStatus currentState});
}

/// @nodoc
class __$ChatStateCopyWithImpl<$Res> extends _$ChatStateCopyWithImpl<$Res>
    implements _$ChatStateCopyWith<$Res> {
  __$ChatStateCopyWithImpl(_ChatState _value, $Res Function(_ChatState) _then)
      : super(_value, (v) => _then(v as _ChatState));

  @override
  _ChatState get _value => super._value as _ChatState;

  @override
  $Res call({
    Object? chats = freezed,
    Object? error = freezed,
    Object? currentState = freezed,
  }) {
    return _then(_ChatState(
      chats: chats == freezed
          ? _value.chats
          : chats // ignore: cast_nullable_to_non_nullable
              as List<ChatModel>,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
      currentState: currentState == freezed
          ? _value.currentState
          : currentState // ignore: cast_nullable_to_non_nullable
              as ChatStatus,
    ));
  }
}

/// @nodoc

class _$_ChatState implements _ChatState {
  const _$_ChatState(
      {required this.chats,
      this.error = '',
      this.currentState = ChatStatus.Initial});

  @override
  final List<ChatModel> chats;
  @JsonKey()
  @override
  final String error;
  @JsonKey()
  @override
  final ChatStatus currentState;

  @override
  String toString() {
    return 'ChatState(chats: $chats, error: $error, currentState: $currentState)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChatState &&
            const DeepCollectionEquality().equals(other.chats, chats) &&
            const DeepCollectionEquality().equals(other.error, error) &&
            const DeepCollectionEquality()
                .equals(other.currentState, currentState));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(chats),
      const DeepCollectionEquality().hash(error),
      const DeepCollectionEquality().hash(currentState));

  @JsonKey(ignore: true)
  @override
  _$ChatStateCopyWith<_ChatState> get copyWith =>
      __$ChatStateCopyWithImpl<_ChatState>(this, _$identity);
}

abstract class _ChatState implements ChatState {
  const factory _ChatState(
      {required List<ChatModel> chats,
      String error,
      ChatStatus currentState}) = _$_ChatState;

  @override
  List<ChatModel> get chats;
  @override
  String get error;
  @override
  ChatStatus get currentState;
  @override
  @JsonKey(ignore: true)
  _$ChatStateCopyWith<_ChatState> get copyWith =>
      throw _privateConstructorUsedError;
}
