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

  _InstantiateChat instantiateChat({required ChatDTO chat}) {
    return _InstantiateChat(
      chat: chat,
    );
  }

  _GetChats getChats({required String id}) {
    return _GetChats(
      id: id,
    );
  }

  _GetPaginatedChats getPaginatedChats({required String id}) {
    return _GetPaginatedChats(
      id: id,
    );
  }

  _DeleteChat deleteChat({required String uid}) {
    return _DeleteChat(
      uid: uid,
    );
  }

  _StartTyping startTyping({required String uid, required String chatId}) {
    return _StartTyping(
      uid: uid,
      chatId: chatId,
    );
  }

  _StopTyping stopTyping({required String uid, required String chatId}) {
    return _StopTyping(
      uid: uid,
      chatId: chatId,
    );
  }
}

/// @nodoc
const $ChatEvent = _$ChatEventTearOff();

/// @nodoc
mixin _$ChatEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ChatDTO chat) instantiateChat,
    required TResult Function(String id) getChats,
    required TResult Function(String id) getPaginatedChats,
    required TResult Function(String uid) deleteChat,
    required TResult Function(String uid, String chatId) startTyping,
    required TResult Function(String uid, String chatId) stopTyping,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(ChatDTO chat)? instantiateChat,
    TResult Function(String id)? getChats,
    TResult Function(String id)? getPaginatedChats,
    TResult Function(String uid)? deleteChat,
    TResult Function(String uid, String chatId)? startTyping,
    TResult Function(String uid, String chatId)? stopTyping,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ChatDTO chat)? instantiateChat,
    TResult Function(String id)? getChats,
    TResult Function(String id)? getPaginatedChats,
    TResult Function(String uid)? deleteChat,
    TResult Function(String uid, String chatId)? startTyping,
    TResult Function(String uid, String chatId)? stopTyping,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InstantiateChat value) instantiateChat,
    required TResult Function(_GetChats value) getChats,
    required TResult Function(_GetPaginatedChats value) getPaginatedChats,
    required TResult Function(_DeleteChat value) deleteChat,
    required TResult Function(_StartTyping value) startTyping,
    required TResult Function(_StopTyping value) stopTyping,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_InstantiateChat value)? instantiateChat,
    TResult Function(_GetChats value)? getChats,
    TResult Function(_GetPaginatedChats value)? getPaginatedChats,
    TResult Function(_DeleteChat value)? deleteChat,
    TResult Function(_StartTyping value)? startTyping,
    TResult Function(_StopTyping value)? stopTyping,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InstantiateChat value)? instantiateChat,
    TResult Function(_GetChats value)? getChats,
    TResult Function(_GetPaginatedChats value)? getPaginatedChats,
    TResult Function(_DeleteChat value)? deleteChat,
    TResult Function(_StartTyping value)? startTyping,
    TResult Function(_StopTyping value)? stopTyping,
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
abstract class _$InstantiateChatCopyWith<$Res> {
  factory _$InstantiateChatCopyWith(
          _InstantiateChat value, $Res Function(_InstantiateChat) then) =
      __$InstantiateChatCopyWithImpl<$Res>;
  $Res call({ChatDTO chat});
}

/// @nodoc
class __$InstantiateChatCopyWithImpl<$Res> extends _$ChatEventCopyWithImpl<$Res>
    implements _$InstantiateChatCopyWith<$Res> {
  __$InstantiateChatCopyWithImpl(
      _InstantiateChat _value, $Res Function(_InstantiateChat) _then)
      : super(_value, (v) => _then(v as _InstantiateChat));

  @override
  _InstantiateChat get _value => super._value as _InstantiateChat;

  @override
  $Res call({
    Object? chat = freezed,
  }) {
    return _then(_InstantiateChat(
      chat: chat == freezed
          ? _value.chat
          : chat // ignore: cast_nullable_to_non_nullable
              as ChatDTO,
    ));
  }
}

/// @nodoc

class _$_InstantiateChat implements _InstantiateChat {
  const _$_InstantiateChat({required this.chat});

  @override
  final ChatDTO chat;

  @override
  String toString() {
    return 'ChatEvent.instantiateChat(chat: $chat)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _InstantiateChat &&
            const DeepCollectionEquality().equals(other.chat, chat));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(chat));

  @JsonKey(ignore: true)
  @override
  _$InstantiateChatCopyWith<_InstantiateChat> get copyWith =>
      __$InstantiateChatCopyWithImpl<_InstantiateChat>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ChatDTO chat) instantiateChat,
    required TResult Function(String id) getChats,
    required TResult Function(String id) getPaginatedChats,
    required TResult Function(String uid) deleteChat,
    required TResult Function(String uid, String chatId) startTyping,
    required TResult Function(String uid, String chatId) stopTyping,
  }) {
    return instantiateChat(chat);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(ChatDTO chat)? instantiateChat,
    TResult Function(String id)? getChats,
    TResult Function(String id)? getPaginatedChats,
    TResult Function(String uid)? deleteChat,
    TResult Function(String uid, String chatId)? startTyping,
    TResult Function(String uid, String chatId)? stopTyping,
  }) {
    return instantiateChat?.call(chat);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ChatDTO chat)? instantiateChat,
    TResult Function(String id)? getChats,
    TResult Function(String id)? getPaginatedChats,
    TResult Function(String uid)? deleteChat,
    TResult Function(String uid, String chatId)? startTyping,
    TResult Function(String uid, String chatId)? stopTyping,
    required TResult orElse(),
  }) {
    if (instantiateChat != null) {
      return instantiateChat(chat);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InstantiateChat value) instantiateChat,
    required TResult Function(_GetChats value) getChats,
    required TResult Function(_GetPaginatedChats value) getPaginatedChats,
    required TResult Function(_DeleteChat value) deleteChat,
    required TResult Function(_StartTyping value) startTyping,
    required TResult Function(_StopTyping value) stopTyping,
  }) {
    return instantiateChat(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_InstantiateChat value)? instantiateChat,
    TResult Function(_GetChats value)? getChats,
    TResult Function(_GetPaginatedChats value)? getPaginatedChats,
    TResult Function(_DeleteChat value)? deleteChat,
    TResult Function(_StartTyping value)? startTyping,
    TResult Function(_StopTyping value)? stopTyping,
  }) {
    return instantiateChat?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InstantiateChat value)? instantiateChat,
    TResult Function(_GetChats value)? getChats,
    TResult Function(_GetPaginatedChats value)? getPaginatedChats,
    TResult Function(_DeleteChat value)? deleteChat,
    TResult Function(_StartTyping value)? startTyping,
    TResult Function(_StopTyping value)? stopTyping,
    required TResult orElse(),
  }) {
    if (instantiateChat != null) {
      return instantiateChat(this);
    }
    return orElse();
  }
}

abstract class _InstantiateChat implements ChatEvent {
  const factory _InstantiateChat({required ChatDTO chat}) = _$_InstantiateChat;

  ChatDTO get chat;
  @JsonKey(ignore: true)
  _$InstantiateChatCopyWith<_InstantiateChat> get copyWith =>
      throw _privateConstructorUsedError;
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
    required TResult Function(ChatDTO chat) instantiateChat,
    required TResult Function(String id) getChats,
    required TResult Function(String id) getPaginatedChats,
    required TResult Function(String uid) deleteChat,
    required TResult Function(String uid, String chatId) startTyping,
    required TResult Function(String uid, String chatId) stopTyping,
  }) {
    return getChats(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(ChatDTO chat)? instantiateChat,
    TResult Function(String id)? getChats,
    TResult Function(String id)? getPaginatedChats,
    TResult Function(String uid)? deleteChat,
    TResult Function(String uid, String chatId)? startTyping,
    TResult Function(String uid, String chatId)? stopTyping,
  }) {
    return getChats?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ChatDTO chat)? instantiateChat,
    TResult Function(String id)? getChats,
    TResult Function(String id)? getPaginatedChats,
    TResult Function(String uid)? deleteChat,
    TResult Function(String uid, String chatId)? startTyping,
    TResult Function(String uid, String chatId)? stopTyping,
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
    required TResult Function(_InstantiateChat value) instantiateChat,
    required TResult Function(_GetChats value) getChats,
    required TResult Function(_GetPaginatedChats value) getPaginatedChats,
    required TResult Function(_DeleteChat value) deleteChat,
    required TResult Function(_StartTyping value) startTyping,
    required TResult Function(_StopTyping value) stopTyping,
  }) {
    return getChats(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_InstantiateChat value)? instantiateChat,
    TResult Function(_GetChats value)? getChats,
    TResult Function(_GetPaginatedChats value)? getPaginatedChats,
    TResult Function(_DeleteChat value)? deleteChat,
    TResult Function(_StartTyping value)? startTyping,
    TResult Function(_StopTyping value)? stopTyping,
  }) {
    return getChats?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InstantiateChat value)? instantiateChat,
    TResult Function(_GetChats value)? getChats,
    TResult Function(_GetPaginatedChats value)? getPaginatedChats,
    TResult Function(_DeleteChat value)? deleteChat,
    TResult Function(_StartTyping value)? startTyping,
    TResult Function(_StopTyping value)? stopTyping,
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
abstract class _$GetPaginatedChatsCopyWith<$Res> {
  factory _$GetPaginatedChatsCopyWith(
          _GetPaginatedChats value, $Res Function(_GetPaginatedChats) then) =
      __$GetPaginatedChatsCopyWithImpl<$Res>;
  $Res call({String id});
}

/// @nodoc
class __$GetPaginatedChatsCopyWithImpl<$Res>
    extends _$ChatEventCopyWithImpl<$Res>
    implements _$GetPaginatedChatsCopyWith<$Res> {
  __$GetPaginatedChatsCopyWithImpl(
      _GetPaginatedChats _value, $Res Function(_GetPaginatedChats) _then)
      : super(_value, (v) => _then(v as _GetPaginatedChats));

  @override
  _GetPaginatedChats get _value => super._value as _GetPaginatedChats;

  @override
  $Res call({
    Object? id = freezed,
  }) {
    return _then(_GetPaginatedChats(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_GetPaginatedChats implements _GetPaginatedChats {
  const _$_GetPaginatedChats({required this.id});

  @override
  final String id;

  @override
  String toString() {
    return 'ChatEvent.getPaginatedChats(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GetPaginatedChats &&
            const DeepCollectionEquality().equals(other.id, id));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(id));

  @JsonKey(ignore: true)
  @override
  _$GetPaginatedChatsCopyWith<_GetPaginatedChats> get copyWith =>
      __$GetPaginatedChatsCopyWithImpl<_GetPaginatedChats>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ChatDTO chat) instantiateChat,
    required TResult Function(String id) getChats,
    required TResult Function(String id) getPaginatedChats,
    required TResult Function(String uid) deleteChat,
    required TResult Function(String uid, String chatId) startTyping,
    required TResult Function(String uid, String chatId) stopTyping,
  }) {
    return getPaginatedChats(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(ChatDTO chat)? instantiateChat,
    TResult Function(String id)? getChats,
    TResult Function(String id)? getPaginatedChats,
    TResult Function(String uid)? deleteChat,
    TResult Function(String uid, String chatId)? startTyping,
    TResult Function(String uid, String chatId)? stopTyping,
  }) {
    return getPaginatedChats?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ChatDTO chat)? instantiateChat,
    TResult Function(String id)? getChats,
    TResult Function(String id)? getPaginatedChats,
    TResult Function(String uid)? deleteChat,
    TResult Function(String uid, String chatId)? startTyping,
    TResult Function(String uid, String chatId)? stopTyping,
    required TResult orElse(),
  }) {
    if (getPaginatedChats != null) {
      return getPaginatedChats(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InstantiateChat value) instantiateChat,
    required TResult Function(_GetChats value) getChats,
    required TResult Function(_GetPaginatedChats value) getPaginatedChats,
    required TResult Function(_DeleteChat value) deleteChat,
    required TResult Function(_StartTyping value) startTyping,
    required TResult Function(_StopTyping value) stopTyping,
  }) {
    return getPaginatedChats(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_InstantiateChat value)? instantiateChat,
    TResult Function(_GetChats value)? getChats,
    TResult Function(_GetPaginatedChats value)? getPaginatedChats,
    TResult Function(_DeleteChat value)? deleteChat,
    TResult Function(_StartTyping value)? startTyping,
    TResult Function(_StopTyping value)? stopTyping,
  }) {
    return getPaginatedChats?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InstantiateChat value)? instantiateChat,
    TResult Function(_GetChats value)? getChats,
    TResult Function(_GetPaginatedChats value)? getPaginatedChats,
    TResult Function(_DeleteChat value)? deleteChat,
    TResult Function(_StartTyping value)? startTyping,
    TResult Function(_StopTyping value)? stopTyping,
    required TResult orElse(),
  }) {
    if (getPaginatedChats != null) {
      return getPaginatedChats(this);
    }
    return orElse();
  }
}

abstract class _GetPaginatedChats implements ChatEvent {
  const factory _GetPaginatedChats({required String id}) = _$_GetPaginatedChats;

  String get id;
  @JsonKey(ignore: true)
  _$GetPaginatedChatsCopyWith<_GetPaginatedChats> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$DeleteChatCopyWith<$Res> {
  factory _$DeleteChatCopyWith(
          _DeleteChat value, $Res Function(_DeleteChat) then) =
      __$DeleteChatCopyWithImpl<$Res>;
  $Res call({String uid});
}

/// @nodoc
class __$DeleteChatCopyWithImpl<$Res> extends _$ChatEventCopyWithImpl<$Res>
    implements _$DeleteChatCopyWith<$Res> {
  __$DeleteChatCopyWithImpl(
      _DeleteChat _value, $Res Function(_DeleteChat) _then)
      : super(_value, (v) => _then(v as _DeleteChat));

  @override
  _DeleteChat get _value => super._value as _DeleteChat;

  @override
  $Res call({
    Object? uid = freezed,
  }) {
    return _then(_DeleteChat(
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_DeleteChat implements _DeleteChat {
  const _$_DeleteChat({required this.uid});

  @override
  final String uid;

  @override
  String toString() {
    return 'ChatEvent.deleteChat(uid: $uid)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DeleteChat &&
            const DeepCollectionEquality().equals(other.uid, uid));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(uid));

  @JsonKey(ignore: true)
  @override
  _$DeleteChatCopyWith<_DeleteChat> get copyWith =>
      __$DeleteChatCopyWithImpl<_DeleteChat>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ChatDTO chat) instantiateChat,
    required TResult Function(String id) getChats,
    required TResult Function(String id) getPaginatedChats,
    required TResult Function(String uid) deleteChat,
    required TResult Function(String uid, String chatId) startTyping,
    required TResult Function(String uid, String chatId) stopTyping,
  }) {
    return deleteChat(uid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(ChatDTO chat)? instantiateChat,
    TResult Function(String id)? getChats,
    TResult Function(String id)? getPaginatedChats,
    TResult Function(String uid)? deleteChat,
    TResult Function(String uid, String chatId)? startTyping,
    TResult Function(String uid, String chatId)? stopTyping,
  }) {
    return deleteChat?.call(uid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ChatDTO chat)? instantiateChat,
    TResult Function(String id)? getChats,
    TResult Function(String id)? getPaginatedChats,
    TResult Function(String uid)? deleteChat,
    TResult Function(String uid, String chatId)? startTyping,
    TResult Function(String uid, String chatId)? stopTyping,
    required TResult orElse(),
  }) {
    if (deleteChat != null) {
      return deleteChat(uid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InstantiateChat value) instantiateChat,
    required TResult Function(_GetChats value) getChats,
    required TResult Function(_GetPaginatedChats value) getPaginatedChats,
    required TResult Function(_DeleteChat value) deleteChat,
    required TResult Function(_StartTyping value) startTyping,
    required TResult Function(_StopTyping value) stopTyping,
  }) {
    return deleteChat(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_InstantiateChat value)? instantiateChat,
    TResult Function(_GetChats value)? getChats,
    TResult Function(_GetPaginatedChats value)? getPaginatedChats,
    TResult Function(_DeleteChat value)? deleteChat,
    TResult Function(_StartTyping value)? startTyping,
    TResult Function(_StopTyping value)? stopTyping,
  }) {
    return deleteChat?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InstantiateChat value)? instantiateChat,
    TResult Function(_GetChats value)? getChats,
    TResult Function(_GetPaginatedChats value)? getPaginatedChats,
    TResult Function(_DeleteChat value)? deleteChat,
    TResult Function(_StartTyping value)? startTyping,
    TResult Function(_StopTyping value)? stopTyping,
    required TResult orElse(),
  }) {
    if (deleteChat != null) {
      return deleteChat(this);
    }
    return orElse();
  }
}

abstract class _DeleteChat implements ChatEvent {
  const factory _DeleteChat({required String uid}) = _$_DeleteChat;

  String get uid;
  @JsonKey(ignore: true)
  _$DeleteChatCopyWith<_DeleteChat> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$StartTypingCopyWith<$Res> {
  factory _$StartTypingCopyWith(
          _StartTyping value, $Res Function(_StartTyping) then) =
      __$StartTypingCopyWithImpl<$Res>;
  $Res call({String uid, String chatId});
}

/// @nodoc
class __$StartTypingCopyWithImpl<$Res> extends _$ChatEventCopyWithImpl<$Res>
    implements _$StartTypingCopyWith<$Res> {
  __$StartTypingCopyWithImpl(
      _StartTyping _value, $Res Function(_StartTyping) _then)
      : super(_value, (v) => _then(v as _StartTyping));

  @override
  _StartTyping get _value => super._value as _StartTyping;

  @override
  $Res call({
    Object? uid = freezed,
    Object? chatId = freezed,
  }) {
    return _then(_StartTyping(
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      chatId: chatId == freezed
          ? _value.chatId
          : chatId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_StartTyping implements _StartTyping {
  const _$_StartTyping({required this.uid, required this.chatId});

  @override
  final String uid;
  @override
  final String chatId;

  @override
  String toString() {
    return 'ChatEvent.startTyping(uid: $uid, chatId: $chatId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _StartTyping &&
            const DeepCollectionEquality().equals(other.uid, uid) &&
            const DeepCollectionEquality().equals(other.chatId, chatId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(uid),
      const DeepCollectionEquality().hash(chatId));

  @JsonKey(ignore: true)
  @override
  _$StartTypingCopyWith<_StartTyping> get copyWith =>
      __$StartTypingCopyWithImpl<_StartTyping>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ChatDTO chat) instantiateChat,
    required TResult Function(String id) getChats,
    required TResult Function(String id) getPaginatedChats,
    required TResult Function(String uid) deleteChat,
    required TResult Function(String uid, String chatId) startTyping,
    required TResult Function(String uid, String chatId) stopTyping,
  }) {
    return startTyping(uid, chatId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(ChatDTO chat)? instantiateChat,
    TResult Function(String id)? getChats,
    TResult Function(String id)? getPaginatedChats,
    TResult Function(String uid)? deleteChat,
    TResult Function(String uid, String chatId)? startTyping,
    TResult Function(String uid, String chatId)? stopTyping,
  }) {
    return startTyping?.call(uid, chatId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ChatDTO chat)? instantiateChat,
    TResult Function(String id)? getChats,
    TResult Function(String id)? getPaginatedChats,
    TResult Function(String uid)? deleteChat,
    TResult Function(String uid, String chatId)? startTyping,
    TResult Function(String uid, String chatId)? stopTyping,
    required TResult orElse(),
  }) {
    if (startTyping != null) {
      return startTyping(uid, chatId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InstantiateChat value) instantiateChat,
    required TResult Function(_GetChats value) getChats,
    required TResult Function(_GetPaginatedChats value) getPaginatedChats,
    required TResult Function(_DeleteChat value) deleteChat,
    required TResult Function(_StartTyping value) startTyping,
    required TResult Function(_StopTyping value) stopTyping,
  }) {
    return startTyping(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_InstantiateChat value)? instantiateChat,
    TResult Function(_GetChats value)? getChats,
    TResult Function(_GetPaginatedChats value)? getPaginatedChats,
    TResult Function(_DeleteChat value)? deleteChat,
    TResult Function(_StartTyping value)? startTyping,
    TResult Function(_StopTyping value)? stopTyping,
  }) {
    return startTyping?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InstantiateChat value)? instantiateChat,
    TResult Function(_GetChats value)? getChats,
    TResult Function(_GetPaginatedChats value)? getPaginatedChats,
    TResult Function(_DeleteChat value)? deleteChat,
    TResult Function(_StartTyping value)? startTyping,
    TResult Function(_StopTyping value)? stopTyping,
    required TResult orElse(),
  }) {
    if (startTyping != null) {
      return startTyping(this);
    }
    return orElse();
  }
}

abstract class _StartTyping implements ChatEvent {
  const factory _StartTyping({required String uid, required String chatId}) =
      _$_StartTyping;

  String get uid;
  String get chatId;
  @JsonKey(ignore: true)
  _$StartTypingCopyWith<_StartTyping> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$StopTypingCopyWith<$Res> {
  factory _$StopTypingCopyWith(
          _StopTyping value, $Res Function(_StopTyping) then) =
      __$StopTypingCopyWithImpl<$Res>;
  $Res call({String uid, String chatId});
}

/// @nodoc
class __$StopTypingCopyWithImpl<$Res> extends _$ChatEventCopyWithImpl<$Res>
    implements _$StopTypingCopyWith<$Res> {
  __$StopTypingCopyWithImpl(
      _StopTyping _value, $Res Function(_StopTyping) _then)
      : super(_value, (v) => _then(v as _StopTyping));

  @override
  _StopTyping get _value => super._value as _StopTyping;

  @override
  $Res call({
    Object? uid = freezed,
    Object? chatId = freezed,
  }) {
    return _then(_StopTyping(
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      chatId: chatId == freezed
          ? _value.chatId
          : chatId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_StopTyping implements _StopTyping {
  const _$_StopTyping({required this.uid, required this.chatId});

  @override
  final String uid;
  @override
  final String chatId;

  @override
  String toString() {
    return 'ChatEvent.stopTyping(uid: $uid, chatId: $chatId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _StopTyping &&
            const DeepCollectionEquality().equals(other.uid, uid) &&
            const DeepCollectionEquality().equals(other.chatId, chatId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(uid),
      const DeepCollectionEquality().hash(chatId));

  @JsonKey(ignore: true)
  @override
  _$StopTypingCopyWith<_StopTyping> get copyWith =>
      __$StopTypingCopyWithImpl<_StopTyping>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ChatDTO chat) instantiateChat,
    required TResult Function(String id) getChats,
    required TResult Function(String id) getPaginatedChats,
    required TResult Function(String uid) deleteChat,
    required TResult Function(String uid, String chatId) startTyping,
    required TResult Function(String uid, String chatId) stopTyping,
  }) {
    return stopTyping(uid, chatId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(ChatDTO chat)? instantiateChat,
    TResult Function(String id)? getChats,
    TResult Function(String id)? getPaginatedChats,
    TResult Function(String uid)? deleteChat,
    TResult Function(String uid, String chatId)? startTyping,
    TResult Function(String uid, String chatId)? stopTyping,
  }) {
    return stopTyping?.call(uid, chatId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ChatDTO chat)? instantiateChat,
    TResult Function(String id)? getChats,
    TResult Function(String id)? getPaginatedChats,
    TResult Function(String uid)? deleteChat,
    TResult Function(String uid, String chatId)? startTyping,
    TResult Function(String uid, String chatId)? stopTyping,
    required TResult orElse(),
  }) {
    if (stopTyping != null) {
      return stopTyping(uid, chatId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InstantiateChat value) instantiateChat,
    required TResult Function(_GetChats value) getChats,
    required TResult Function(_GetPaginatedChats value) getPaginatedChats,
    required TResult Function(_DeleteChat value) deleteChat,
    required TResult Function(_StartTyping value) startTyping,
    required TResult Function(_StopTyping value) stopTyping,
  }) {
    return stopTyping(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_InstantiateChat value)? instantiateChat,
    TResult Function(_GetChats value)? getChats,
    TResult Function(_GetPaginatedChats value)? getPaginatedChats,
    TResult Function(_DeleteChat value)? deleteChat,
    TResult Function(_StartTyping value)? startTyping,
    TResult Function(_StopTyping value)? stopTyping,
  }) {
    return stopTyping?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InstantiateChat value)? instantiateChat,
    TResult Function(_GetChats value)? getChats,
    TResult Function(_GetPaginatedChats value)? getPaginatedChats,
    TResult Function(_DeleteChat value)? deleteChat,
    TResult Function(_StartTyping value)? startTyping,
    TResult Function(_StopTyping value)? stopTyping,
    required TResult orElse(),
  }) {
    if (stopTyping != null) {
      return stopTyping(this);
    }
    return orElse();
  }
}

abstract class _StopTyping implements ChatEvent {
  const factory _StopTyping({required String uid, required String chatId}) =
      _$_StopTyping;

  String get uid;
  String get chatId;
  @JsonKey(ignore: true)
  _$StopTypingCopyWith<_StopTyping> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$ChatStateTearOff {
  const _$ChatStateTearOff();

  _ChatState call(
      {bool reachedMaximumThreshold = false,
      ChatListenableAction action = ChatListenableAction.idle,
      required PagingController<int, ChatModel> paginationController}) {
    return _ChatState(
      reachedMaximumThreshold: reachedMaximumThreshold,
      action: action,
      paginationController: paginationController,
    );
  }
}

/// @nodoc
const $ChatState = _$ChatStateTearOff();

/// @nodoc
mixin _$ChatState {
  bool get reachedMaximumThreshold => throw _privateConstructorUsedError;
  ChatListenableAction get action => throw _privateConstructorUsedError;
  PagingController<int, ChatModel> get paginationController =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ChatStateCopyWith<ChatState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatStateCopyWith<$Res> {
  factory $ChatStateCopyWith(ChatState value, $Res Function(ChatState) then) =
      _$ChatStateCopyWithImpl<$Res>;
  $Res call(
      {bool reachedMaximumThreshold,
      ChatListenableAction action,
      PagingController<int, ChatModel> paginationController});
}

/// @nodoc
class _$ChatStateCopyWithImpl<$Res> implements $ChatStateCopyWith<$Res> {
  _$ChatStateCopyWithImpl(this._value, this._then);

  final ChatState _value;
  // ignore: unused_field
  final $Res Function(ChatState) _then;

  @override
  $Res call({
    Object? reachedMaximumThreshold = freezed,
    Object? action = freezed,
    Object? paginationController = freezed,
  }) {
    return _then(_value.copyWith(
      reachedMaximumThreshold: reachedMaximumThreshold == freezed
          ? _value.reachedMaximumThreshold
          : reachedMaximumThreshold // ignore: cast_nullable_to_non_nullable
              as bool,
      action: action == freezed
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as ChatListenableAction,
      paginationController: paginationController == freezed
          ? _value.paginationController
          : paginationController // ignore: cast_nullable_to_non_nullable
              as PagingController<int, ChatModel>,
    ));
  }
}

/// @nodoc
abstract class _$ChatStateCopyWith<$Res> implements $ChatStateCopyWith<$Res> {
  factory _$ChatStateCopyWith(
          _ChatState value, $Res Function(_ChatState) then) =
      __$ChatStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool reachedMaximumThreshold,
      ChatListenableAction action,
      PagingController<int, ChatModel> paginationController});
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
    Object? reachedMaximumThreshold = freezed,
    Object? action = freezed,
    Object? paginationController = freezed,
  }) {
    return _then(_ChatState(
      reachedMaximumThreshold: reachedMaximumThreshold == freezed
          ? _value.reachedMaximumThreshold
          : reachedMaximumThreshold // ignore: cast_nullable_to_non_nullable
              as bool,
      action: action == freezed
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as ChatListenableAction,
      paginationController: paginationController == freezed
          ? _value.paginationController
          : paginationController // ignore: cast_nullable_to_non_nullable
              as PagingController<int, ChatModel>,
    ));
  }
}

/// @nodoc

class _$_ChatState implements _ChatState {
  const _$_ChatState(
      {this.reachedMaximumThreshold = false,
      this.action = ChatListenableAction.idle,
      required this.paginationController});

  @JsonKey()
  @override
  final bool reachedMaximumThreshold;
  @JsonKey()
  @override
  final ChatListenableAction action;
  @override
  final PagingController<int, ChatModel> paginationController;

  @override
  String toString() {
    return 'ChatState(reachedMaximumThreshold: $reachedMaximumThreshold, action: $action, paginationController: $paginationController)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChatState &&
            const DeepCollectionEquality().equals(
                other.reachedMaximumThreshold, reachedMaximumThreshold) &&
            const DeepCollectionEquality().equals(other.action, action) &&
            const DeepCollectionEquality()
                .equals(other.paginationController, paginationController));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(reachedMaximumThreshold),
      const DeepCollectionEquality().hash(action),
      const DeepCollectionEquality().hash(paginationController));

  @JsonKey(ignore: true)
  @override
  _$ChatStateCopyWith<_ChatState> get copyWith =>
      __$ChatStateCopyWithImpl<_ChatState>(this, _$identity);
}

abstract class _ChatState implements ChatState {
  const factory _ChatState(
          {bool reachedMaximumThreshold,
          ChatListenableAction action,
          required PagingController<int, ChatModel> paginationController}) =
      _$_ChatState;

  @override
  bool get reachedMaximumThreshold;
  @override
  ChatListenableAction get action;
  @override
  PagingController<int, ChatModel> get paginationController;
  @override
  @JsonKey(ignore: true)
  _$ChatStateCopyWith<_ChatState> get copyWith =>
      throw _privateConstructorUsedError;
}
