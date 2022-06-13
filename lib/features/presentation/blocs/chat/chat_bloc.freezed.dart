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

  _InstantiateChat instantiateChat({required ChatEntity chat}) {
    return _InstantiateChat(
      chat: chat,
    );
  }

  _GetChats getChats({required String id}) {
    return _GetChats(
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
    required TResult Function(ChatEntity chat) instantiateChat,
    required TResult Function(String id) getChats,
    required TResult Function(String uid) deleteChat,
    required TResult Function(String uid, String chatId) startTyping,
    required TResult Function(String uid, String chatId) stopTyping,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(ChatEntity chat)? instantiateChat,
    TResult Function(String id)? getChats,
    TResult Function(String uid)? deleteChat,
    TResult Function(String uid, String chatId)? startTyping,
    TResult Function(String uid, String chatId)? stopTyping,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ChatEntity chat)? instantiateChat,
    TResult Function(String id)? getChats,
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
    required TResult Function(_DeleteChat value) deleteChat,
    required TResult Function(_StartTyping value) startTyping,
    required TResult Function(_StopTyping value) stopTyping,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_InstantiateChat value)? instantiateChat,
    TResult Function(_GetChats value)? getChats,
    TResult Function(_DeleteChat value)? deleteChat,
    TResult Function(_StartTyping value)? startTyping,
    TResult Function(_StopTyping value)? stopTyping,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InstantiateChat value)? instantiateChat,
    TResult Function(_GetChats value)? getChats,
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
  $Res call({ChatEntity chat});
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
              as ChatEntity,
    ));
  }
}

/// @nodoc

class _$_InstantiateChat implements _InstantiateChat {
  const _$_InstantiateChat({required this.chat});

  @override
  final ChatEntity chat;

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
    required TResult Function(ChatEntity chat) instantiateChat,
    required TResult Function(String id) getChats,
    required TResult Function(String uid) deleteChat,
    required TResult Function(String uid, String chatId) startTyping,
    required TResult Function(String uid, String chatId) stopTyping,
  }) {
    return instantiateChat(chat);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(ChatEntity chat)? instantiateChat,
    TResult Function(String id)? getChats,
    TResult Function(String uid)? deleteChat,
    TResult Function(String uid, String chatId)? startTyping,
    TResult Function(String uid, String chatId)? stopTyping,
  }) {
    return instantiateChat?.call(chat);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ChatEntity chat)? instantiateChat,
    TResult Function(String id)? getChats,
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
  const factory _InstantiateChat({required ChatEntity chat}) =
      _$_InstantiateChat;

  ChatEntity get chat;
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
    required TResult Function(ChatEntity chat) instantiateChat,
    required TResult Function(String id) getChats,
    required TResult Function(String uid) deleteChat,
    required TResult Function(String uid, String chatId) startTyping,
    required TResult Function(String uid, String chatId) stopTyping,
  }) {
    return getChats(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(ChatEntity chat)? instantiateChat,
    TResult Function(String id)? getChats,
    TResult Function(String uid)? deleteChat,
    TResult Function(String uid, String chatId)? startTyping,
    TResult Function(String uid, String chatId)? stopTyping,
  }) {
    return getChats?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ChatEntity chat)? instantiateChat,
    TResult Function(String id)? getChats,
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
    required TResult Function(ChatEntity chat) instantiateChat,
    required TResult Function(String id) getChats,
    required TResult Function(String uid) deleteChat,
    required TResult Function(String uid, String chatId) startTyping,
    required TResult Function(String uid, String chatId) stopTyping,
  }) {
    return deleteChat(uid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(ChatEntity chat)? instantiateChat,
    TResult Function(String id)? getChats,
    TResult Function(String uid)? deleteChat,
    TResult Function(String uid, String chatId)? startTyping,
    TResult Function(String uid, String chatId)? stopTyping,
  }) {
    return deleteChat?.call(uid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ChatEntity chat)? instantiateChat,
    TResult Function(String id)? getChats,
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
    required TResult Function(ChatEntity chat) instantiateChat,
    required TResult Function(String id) getChats,
    required TResult Function(String uid) deleteChat,
    required TResult Function(String uid, String chatId) startTyping,
    required TResult Function(String uid, String chatId) stopTyping,
  }) {
    return startTyping(uid, chatId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(ChatEntity chat)? instantiateChat,
    TResult Function(String id)? getChats,
    TResult Function(String uid)? deleteChat,
    TResult Function(String uid, String chatId)? startTyping,
    TResult Function(String uid, String chatId)? stopTyping,
  }) {
    return startTyping?.call(uid, chatId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ChatEntity chat)? instantiateChat,
    TResult Function(String id)? getChats,
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
    required TResult Function(ChatEntity chat) instantiateChat,
    required TResult Function(String id) getChats,
    required TResult Function(String uid) deleteChat,
    required TResult Function(String uid, String chatId) startTyping,
    required TResult Function(String uid, String chatId) stopTyping,
  }) {
    return stopTyping(uid, chatId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(ChatEntity chat)? instantiateChat,
    TResult Function(String id)? getChats,
    TResult Function(String uid)? deleteChat,
    TResult Function(String uid, String chatId)? startTyping,
    TResult Function(String uid, String chatId)? stopTyping,
  }) {
    return stopTyping?.call(uid, chatId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ChatEntity chat)? instantiateChat,
    TResult Function(String id)? getChats,
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
      {String? error = null,
      required List<ChatEntity> chats,
      ChatStatus currentState = ChatStatus.idle,
      ChatListenableAction action = ChatListenableAction.idle}) {
    return _ChatState(
      error: error,
      chats: chats,
      currentState: currentState,
      action: action,
    );
  }
}

/// @nodoc
const $ChatState = _$ChatStateTearOff();

/// @nodoc
mixin _$ChatState {
  String? get error => throw _privateConstructorUsedError;
  List<ChatEntity> get chats => throw _privateConstructorUsedError;
  ChatStatus get currentState => throw _privateConstructorUsedError;
  ChatListenableAction get action => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ChatStateCopyWith<ChatState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatStateCopyWith<$Res> {
  factory $ChatStateCopyWith(ChatState value, $Res Function(ChatState) then) =
      _$ChatStateCopyWithImpl<$Res>;
  $Res call(
      {String? error,
      List<ChatEntity> chats,
      ChatStatus currentState,
      ChatListenableAction action});
}

/// @nodoc
class _$ChatStateCopyWithImpl<$Res> implements $ChatStateCopyWith<$Res> {
  _$ChatStateCopyWithImpl(this._value, this._then);

  final ChatState _value;
  // ignore: unused_field
  final $Res Function(ChatState) _then;

  @override
  $Res call({
    Object? error = freezed,
    Object? chats = freezed,
    Object? currentState = freezed,
    Object? action = freezed,
  }) {
    return _then(_value.copyWith(
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      chats: chats == freezed
          ? _value.chats
          : chats // ignore: cast_nullable_to_non_nullable
              as List<ChatEntity>,
      currentState: currentState == freezed
          ? _value.currentState
          : currentState // ignore: cast_nullable_to_non_nullable
              as ChatStatus,
      action: action == freezed
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as ChatListenableAction,
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
      {String? error,
      List<ChatEntity> chats,
      ChatStatus currentState,
      ChatListenableAction action});
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
    Object? error = freezed,
    Object? chats = freezed,
    Object? currentState = freezed,
    Object? action = freezed,
  }) {
    return _then(_ChatState(
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      chats: chats == freezed
          ? _value.chats
          : chats // ignore: cast_nullable_to_non_nullable
              as List<ChatEntity>,
      currentState: currentState == freezed
          ? _value.currentState
          : currentState // ignore: cast_nullable_to_non_nullable
              as ChatStatus,
      action: action == freezed
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as ChatListenableAction,
    ));
  }
}

/// @nodoc

class _$_ChatState implements _ChatState {
  const _$_ChatState(
      {this.error = null,
      required this.chats,
      this.currentState = ChatStatus.idle,
      this.action = ChatListenableAction.idle});

  @JsonKey()
  @override
  final String? error;
  @override
  final List<ChatEntity> chats;
  @JsonKey()
  @override
  final ChatStatus currentState;
  @JsonKey()
  @override
  final ChatListenableAction action;

  @override
  String toString() {
    return 'ChatState(error: $error, chats: $chats, currentState: $currentState, action: $action)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChatState &&
            const DeepCollectionEquality().equals(other.error, error) &&
            const DeepCollectionEquality().equals(other.chats, chats) &&
            const DeepCollectionEquality()
                .equals(other.currentState, currentState) &&
            const DeepCollectionEquality().equals(other.action, action));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(error),
      const DeepCollectionEquality().hash(chats),
      const DeepCollectionEquality().hash(currentState),
      const DeepCollectionEquality().hash(action));

  @JsonKey(ignore: true)
  @override
  _$ChatStateCopyWith<_ChatState> get copyWith =>
      __$ChatStateCopyWithImpl<_ChatState>(this, _$identity);
}

abstract class _ChatState implements ChatState {
  const factory _ChatState(
      {String? error,
      required List<ChatEntity> chats,
      ChatStatus currentState,
      ChatListenableAction action}) = _$_ChatState;

  @override
  String? get error;
  @override
  List<ChatEntity> get chats;
  @override
  ChatStatus get currentState;
  @override
  ChatListenableAction get action;
  @override
  @JsonKey(ignore: true)
  _$ChatStateCopyWith<_ChatState> get copyWith =>
      throw _privateConstructorUsedError;
}
