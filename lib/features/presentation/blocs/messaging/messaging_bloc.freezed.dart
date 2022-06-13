// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'messaging_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$MessageEventTearOff {
  const _$MessageEventTearOff();

  _SendMultiMediaMessages sendMultimediaMessages(
      {required String pid,
      required String chatId,
      required List<MultimediaMessage> messages}) {
    return _SendMultiMediaMessages(
      pid: pid,
      chatId: chatId,
      messages: messages,
    );
  }

  _SendAudioMessage sendAudioMessage(
      {required File file,
      required String pid,
      required String chatId,
      required ChatMessage message}) {
    return _SendAudioMessage(
      file: file,
      pid: pid,
      chatId: chatId,
      message: message,
    );
  }

  _SendMessage sendMessage(
      {required String pid,
      required String chatId,
      required ChatMessage message}) {
    return _SendMessage(
      pid: pid,
      chatId: chatId,
      message: message,
    );
  }

  _SeenMessage seenMessage(
      {required String chatId, required String messageId}) {
    return _SeenMessage(
      chatId: chatId,
      messageId: messageId,
    );
  }

  _UpdatePreviousMessage updatePreviousMessage(
      {required String chatId, required String previousId}) {
    return _UpdatePreviousMessage(
      chatId: chatId,
      previousId: previousId,
    );
  }

  _DeleteMessage deleteMessage(
      {required String chatId, required String messageId}) {
    return _DeleteMessage(
      chatId: chatId,
      messageId: messageId,
    );
  }
}

/// @nodoc
const $MessageEvent = _$MessageEventTearOff();

/// @nodoc
mixin _$MessageEvent {
  String get chatId => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String pid, String chatId, List<MultimediaMessage> messages)
        sendMultimediaMessages,
    required TResult Function(
            File file, String pid, String chatId, ChatMessage message)
        sendAudioMessage,
    required TResult Function(String pid, String chatId, ChatMessage message)
        sendMessage,
    required TResult Function(String chatId, String messageId) seenMessage,
    required TResult Function(String chatId, String previousId)
        updatePreviousMessage,
    required TResult Function(String chatId, String messageId) deleteMessage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            String pid, String chatId, List<MultimediaMessage> messages)?
        sendMultimediaMessages,
    TResult Function(File file, String pid, String chatId, ChatMessage message)?
        sendAudioMessage,
    TResult Function(String pid, String chatId, ChatMessage message)?
        sendMessage,
    TResult Function(String chatId, String messageId)? seenMessage,
    TResult Function(String chatId, String previousId)? updatePreviousMessage,
    TResult Function(String chatId, String messageId)? deleteMessage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String pid, String chatId, List<MultimediaMessage> messages)?
        sendMultimediaMessages,
    TResult Function(File file, String pid, String chatId, ChatMessage message)?
        sendAudioMessage,
    TResult Function(String pid, String chatId, ChatMessage message)?
        sendMessage,
    TResult Function(String chatId, String messageId)? seenMessage,
    TResult Function(String chatId, String previousId)? updatePreviousMessage,
    TResult Function(String chatId, String messageId)? deleteMessage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SendMultiMediaMessages value)
        sendMultimediaMessages,
    required TResult Function(_SendAudioMessage value) sendAudioMessage,
    required TResult Function(_SendMessage value) sendMessage,
    required TResult Function(_SeenMessage value) seenMessage,
    required TResult Function(_UpdatePreviousMessage value)
        updatePreviousMessage,
    required TResult Function(_DeleteMessage value) deleteMessage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SendMultiMediaMessages value)? sendMultimediaMessages,
    TResult Function(_SendAudioMessage value)? sendAudioMessage,
    TResult Function(_SendMessage value)? sendMessage,
    TResult Function(_SeenMessage value)? seenMessage,
    TResult Function(_UpdatePreviousMessage value)? updatePreviousMessage,
    TResult Function(_DeleteMessage value)? deleteMessage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SendMultiMediaMessages value)? sendMultimediaMessages,
    TResult Function(_SendAudioMessage value)? sendAudioMessage,
    TResult Function(_SendMessage value)? sendMessage,
    TResult Function(_SeenMessage value)? seenMessage,
    TResult Function(_UpdatePreviousMessage value)? updatePreviousMessage,
    TResult Function(_DeleteMessage value)? deleteMessage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MessageEventCopyWith<MessageEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageEventCopyWith<$Res> {
  factory $MessageEventCopyWith(
          MessageEvent value, $Res Function(MessageEvent) then) =
      _$MessageEventCopyWithImpl<$Res>;
  $Res call({String chatId});
}

/// @nodoc
class _$MessageEventCopyWithImpl<$Res> implements $MessageEventCopyWith<$Res> {
  _$MessageEventCopyWithImpl(this._value, this._then);

  final MessageEvent _value;
  // ignore: unused_field
  final $Res Function(MessageEvent) _then;

  @override
  $Res call({
    Object? chatId = freezed,
  }) {
    return _then(_value.copyWith(
      chatId: chatId == freezed
          ? _value.chatId
          : chatId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$SendMultiMediaMessagesCopyWith<$Res>
    implements $MessageEventCopyWith<$Res> {
  factory _$SendMultiMediaMessagesCopyWith(_SendMultiMediaMessages value,
          $Res Function(_SendMultiMediaMessages) then) =
      __$SendMultiMediaMessagesCopyWithImpl<$Res>;
  @override
  $Res call({String pid, String chatId, List<MultimediaMessage> messages});
}

/// @nodoc
class __$SendMultiMediaMessagesCopyWithImpl<$Res>
    extends _$MessageEventCopyWithImpl<$Res>
    implements _$SendMultiMediaMessagesCopyWith<$Res> {
  __$SendMultiMediaMessagesCopyWithImpl(_SendMultiMediaMessages _value,
      $Res Function(_SendMultiMediaMessages) _then)
      : super(_value, (v) => _then(v as _SendMultiMediaMessages));

  @override
  _SendMultiMediaMessages get _value => super._value as _SendMultiMediaMessages;

  @override
  $Res call({
    Object? pid = freezed,
    Object? chatId = freezed,
    Object? messages = freezed,
  }) {
    return _then(_SendMultiMediaMessages(
      pid: pid == freezed
          ? _value.pid
          : pid // ignore: cast_nullable_to_non_nullable
              as String,
      chatId: chatId == freezed
          ? _value.chatId
          : chatId // ignore: cast_nullable_to_non_nullable
              as String,
      messages: messages == freezed
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<MultimediaMessage>,
    ));
  }
}

/// @nodoc

class _$_SendMultiMediaMessages implements _SendMultiMediaMessages {
  const _$_SendMultiMediaMessages(
      {required this.pid, required this.chatId, required this.messages});

  @override
  final String pid;
  @override
  final String chatId;
  @override
  final List<MultimediaMessage> messages;

  @override
  String toString() {
    return 'MessageEvent.sendMultimediaMessages(pid: $pid, chatId: $chatId, messages: $messages)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SendMultiMediaMessages &&
            const DeepCollectionEquality().equals(other.pid, pid) &&
            const DeepCollectionEquality().equals(other.chatId, chatId) &&
            const DeepCollectionEquality().equals(other.messages, messages));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(pid),
      const DeepCollectionEquality().hash(chatId),
      const DeepCollectionEquality().hash(messages));

  @JsonKey(ignore: true)
  @override
  _$SendMultiMediaMessagesCopyWith<_SendMultiMediaMessages> get copyWith =>
      __$SendMultiMediaMessagesCopyWithImpl<_SendMultiMediaMessages>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String pid, String chatId, List<MultimediaMessage> messages)
        sendMultimediaMessages,
    required TResult Function(
            File file, String pid, String chatId, ChatMessage message)
        sendAudioMessage,
    required TResult Function(String pid, String chatId, ChatMessage message)
        sendMessage,
    required TResult Function(String chatId, String messageId) seenMessage,
    required TResult Function(String chatId, String previousId)
        updatePreviousMessage,
    required TResult Function(String chatId, String messageId) deleteMessage,
  }) {
    return sendMultimediaMessages(pid, chatId, messages);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            String pid, String chatId, List<MultimediaMessage> messages)?
        sendMultimediaMessages,
    TResult Function(File file, String pid, String chatId, ChatMessage message)?
        sendAudioMessage,
    TResult Function(String pid, String chatId, ChatMessage message)?
        sendMessage,
    TResult Function(String chatId, String messageId)? seenMessage,
    TResult Function(String chatId, String previousId)? updatePreviousMessage,
    TResult Function(String chatId, String messageId)? deleteMessage,
  }) {
    return sendMultimediaMessages?.call(pid, chatId, messages);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String pid, String chatId, List<MultimediaMessage> messages)?
        sendMultimediaMessages,
    TResult Function(File file, String pid, String chatId, ChatMessage message)?
        sendAudioMessage,
    TResult Function(String pid, String chatId, ChatMessage message)?
        sendMessage,
    TResult Function(String chatId, String messageId)? seenMessage,
    TResult Function(String chatId, String previousId)? updatePreviousMessage,
    TResult Function(String chatId, String messageId)? deleteMessage,
    required TResult orElse(),
  }) {
    if (sendMultimediaMessages != null) {
      return sendMultimediaMessages(pid, chatId, messages);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SendMultiMediaMessages value)
        sendMultimediaMessages,
    required TResult Function(_SendAudioMessage value) sendAudioMessage,
    required TResult Function(_SendMessage value) sendMessage,
    required TResult Function(_SeenMessage value) seenMessage,
    required TResult Function(_UpdatePreviousMessage value)
        updatePreviousMessage,
    required TResult Function(_DeleteMessage value) deleteMessage,
  }) {
    return sendMultimediaMessages(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SendMultiMediaMessages value)? sendMultimediaMessages,
    TResult Function(_SendAudioMessage value)? sendAudioMessage,
    TResult Function(_SendMessage value)? sendMessage,
    TResult Function(_SeenMessage value)? seenMessage,
    TResult Function(_UpdatePreviousMessage value)? updatePreviousMessage,
    TResult Function(_DeleteMessage value)? deleteMessage,
  }) {
    return sendMultimediaMessages?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SendMultiMediaMessages value)? sendMultimediaMessages,
    TResult Function(_SendAudioMessage value)? sendAudioMessage,
    TResult Function(_SendMessage value)? sendMessage,
    TResult Function(_SeenMessage value)? seenMessage,
    TResult Function(_UpdatePreviousMessage value)? updatePreviousMessage,
    TResult Function(_DeleteMessage value)? deleteMessage,
    required TResult orElse(),
  }) {
    if (sendMultimediaMessages != null) {
      return sendMultimediaMessages(this);
    }
    return orElse();
  }
}

abstract class _SendMultiMediaMessages implements MessageEvent {
  const factory _SendMultiMediaMessages(
      {required String pid,
      required String chatId,
      required List<MultimediaMessage> messages}) = _$_SendMultiMediaMessages;

  String get pid;
  @override
  String get chatId;
  List<MultimediaMessage> get messages;
  @override
  @JsonKey(ignore: true)
  _$SendMultiMediaMessagesCopyWith<_SendMultiMediaMessages> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$SendAudioMessageCopyWith<$Res>
    implements $MessageEventCopyWith<$Res> {
  factory _$SendAudioMessageCopyWith(
          _SendAudioMessage value, $Res Function(_SendAudioMessage) then) =
      __$SendAudioMessageCopyWithImpl<$Res>;
  @override
  $Res call({File file, String pid, String chatId, ChatMessage message});
}

/// @nodoc
class __$SendAudioMessageCopyWithImpl<$Res>
    extends _$MessageEventCopyWithImpl<$Res>
    implements _$SendAudioMessageCopyWith<$Res> {
  __$SendAudioMessageCopyWithImpl(
      _SendAudioMessage _value, $Res Function(_SendAudioMessage) _then)
      : super(_value, (v) => _then(v as _SendAudioMessage));

  @override
  _SendAudioMessage get _value => super._value as _SendAudioMessage;

  @override
  $Res call({
    Object? file = freezed,
    Object? pid = freezed,
    Object? chatId = freezed,
    Object? message = freezed,
  }) {
    return _then(_SendAudioMessage(
      file: file == freezed
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as File,
      pid: pid == freezed
          ? _value.pid
          : pid // ignore: cast_nullable_to_non_nullable
              as String,
      chatId: chatId == freezed
          ? _value.chatId
          : chatId // ignore: cast_nullable_to_non_nullable
              as String,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as ChatMessage,
    ));
  }
}

/// @nodoc

class _$_SendAudioMessage implements _SendAudioMessage {
  const _$_SendAudioMessage(
      {required this.file,
      required this.pid,
      required this.chatId,
      required this.message});

  @override
  final File file;
  @override
  final String pid;
  @override
  final String chatId;
  @override
  final ChatMessage message;

  @override
  String toString() {
    return 'MessageEvent.sendAudioMessage(file: $file, pid: $pid, chatId: $chatId, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SendAudioMessage &&
            const DeepCollectionEquality().equals(other.file, file) &&
            const DeepCollectionEquality().equals(other.pid, pid) &&
            const DeepCollectionEquality().equals(other.chatId, chatId) &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(file),
      const DeepCollectionEquality().hash(pid),
      const DeepCollectionEquality().hash(chatId),
      const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  _$SendAudioMessageCopyWith<_SendAudioMessage> get copyWith =>
      __$SendAudioMessageCopyWithImpl<_SendAudioMessage>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String pid, String chatId, List<MultimediaMessage> messages)
        sendMultimediaMessages,
    required TResult Function(
            File file, String pid, String chatId, ChatMessage message)
        sendAudioMessage,
    required TResult Function(String pid, String chatId, ChatMessage message)
        sendMessage,
    required TResult Function(String chatId, String messageId) seenMessage,
    required TResult Function(String chatId, String previousId)
        updatePreviousMessage,
    required TResult Function(String chatId, String messageId) deleteMessage,
  }) {
    return sendAudioMessage(file, pid, chatId, message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            String pid, String chatId, List<MultimediaMessage> messages)?
        sendMultimediaMessages,
    TResult Function(File file, String pid, String chatId, ChatMessage message)?
        sendAudioMessage,
    TResult Function(String pid, String chatId, ChatMessage message)?
        sendMessage,
    TResult Function(String chatId, String messageId)? seenMessage,
    TResult Function(String chatId, String previousId)? updatePreviousMessage,
    TResult Function(String chatId, String messageId)? deleteMessage,
  }) {
    return sendAudioMessage?.call(file, pid, chatId, message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String pid, String chatId, List<MultimediaMessage> messages)?
        sendMultimediaMessages,
    TResult Function(File file, String pid, String chatId, ChatMessage message)?
        sendAudioMessage,
    TResult Function(String pid, String chatId, ChatMessage message)?
        sendMessage,
    TResult Function(String chatId, String messageId)? seenMessage,
    TResult Function(String chatId, String previousId)? updatePreviousMessage,
    TResult Function(String chatId, String messageId)? deleteMessage,
    required TResult orElse(),
  }) {
    if (sendAudioMessage != null) {
      return sendAudioMessage(file, pid, chatId, message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SendMultiMediaMessages value)
        sendMultimediaMessages,
    required TResult Function(_SendAudioMessage value) sendAudioMessage,
    required TResult Function(_SendMessage value) sendMessage,
    required TResult Function(_SeenMessage value) seenMessage,
    required TResult Function(_UpdatePreviousMessage value)
        updatePreviousMessage,
    required TResult Function(_DeleteMessage value) deleteMessage,
  }) {
    return sendAudioMessage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SendMultiMediaMessages value)? sendMultimediaMessages,
    TResult Function(_SendAudioMessage value)? sendAudioMessage,
    TResult Function(_SendMessage value)? sendMessage,
    TResult Function(_SeenMessage value)? seenMessage,
    TResult Function(_UpdatePreviousMessage value)? updatePreviousMessage,
    TResult Function(_DeleteMessage value)? deleteMessage,
  }) {
    return sendAudioMessage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SendMultiMediaMessages value)? sendMultimediaMessages,
    TResult Function(_SendAudioMessage value)? sendAudioMessage,
    TResult Function(_SendMessage value)? sendMessage,
    TResult Function(_SeenMessage value)? seenMessage,
    TResult Function(_UpdatePreviousMessage value)? updatePreviousMessage,
    TResult Function(_DeleteMessage value)? deleteMessage,
    required TResult orElse(),
  }) {
    if (sendAudioMessage != null) {
      return sendAudioMessage(this);
    }
    return orElse();
  }
}

abstract class _SendAudioMessage implements MessageEvent {
  const factory _SendAudioMessage(
      {required File file,
      required String pid,
      required String chatId,
      required ChatMessage message}) = _$_SendAudioMessage;

  File get file;
  String get pid;
  @override
  String get chatId;
  ChatMessage get message;
  @override
  @JsonKey(ignore: true)
  _$SendAudioMessageCopyWith<_SendAudioMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$SendMessageCopyWith<$Res>
    implements $MessageEventCopyWith<$Res> {
  factory _$SendMessageCopyWith(
          _SendMessage value, $Res Function(_SendMessage) then) =
      __$SendMessageCopyWithImpl<$Res>;
  @override
  $Res call({String pid, String chatId, ChatMessage message});
}

/// @nodoc
class __$SendMessageCopyWithImpl<$Res> extends _$MessageEventCopyWithImpl<$Res>
    implements _$SendMessageCopyWith<$Res> {
  __$SendMessageCopyWithImpl(
      _SendMessage _value, $Res Function(_SendMessage) _then)
      : super(_value, (v) => _then(v as _SendMessage));

  @override
  _SendMessage get _value => super._value as _SendMessage;

  @override
  $Res call({
    Object? pid = freezed,
    Object? chatId = freezed,
    Object? message = freezed,
  }) {
    return _then(_SendMessage(
      pid: pid == freezed
          ? _value.pid
          : pid // ignore: cast_nullable_to_non_nullable
              as String,
      chatId: chatId == freezed
          ? _value.chatId
          : chatId // ignore: cast_nullable_to_non_nullable
              as String,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as ChatMessage,
    ));
  }
}

/// @nodoc

class _$_SendMessage implements _SendMessage {
  const _$_SendMessage(
      {required this.pid, required this.chatId, required this.message});

  @override
  final String pid;
  @override
  final String chatId;
  @override
  final ChatMessage message;

  @override
  String toString() {
    return 'MessageEvent.sendMessage(pid: $pid, chatId: $chatId, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SendMessage &&
            const DeepCollectionEquality().equals(other.pid, pid) &&
            const DeepCollectionEquality().equals(other.chatId, chatId) &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(pid),
      const DeepCollectionEquality().hash(chatId),
      const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  _$SendMessageCopyWith<_SendMessage> get copyWith =>
      __$SendMessageCopyWithImpl<_SendMessage>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String pid, String chatId, List<MultimediaMessage> messages)
        sendMultimediaMessages,
    required TResult Function(
            File file, String pid, String chatId, ChatMessage message)
        sendAudioMessage,
    required TResult Function(String pid, String chatId, ChatMessage message)
        sendMessage,
    required TResult Function(String chatId, String messageId) seenMessage,
    required TResult Function(String chatId, String previousId)
        updatePreviousMessage,
    required TResult Function(String chatId, String messageId) deleteMessage,
  }) {
    return sendMessage(pid, chatId, message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            String pid, String chatId, List<MultimediaMessage> messages)?
        sendMultimediaMessages,
    TResult Function(File file, String pid, String chatId, ChatMessage message)?
        sendAudioMessage,
    TResult Function(String pid, String chatId, ChatMessage message)?
        sendMessage,
    TResult Function(String chatId, String messageId)? seenMessage,
    TResult Function(String chatId, String previousId)? updatePreviousMessage,
    TResult Function(String chatId, String messageId)? deleteMessage,
  }) {
    return sendMessage?.call(pid, chatId, message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String pid, String chatId, List<MultimediaMessage> messages)?
        sendMultimediaMessages,
    TResult Function(File file, String pid, String chatId, ChatMessage message)?
        sendAudioMessage,
    TResult Function(String pid, String chatId, ChatMessage message)?
        sendMessage,
    TResult Function(String chatId, String messageId)? seenMessage,
    TResult Function(String chatId, String previousId)? updatePreviousMessage,
    TResult Function(String chatId, String messageId)? deleteMessage,
    required TResult orElse(),
  }) {
    if (sendMessage != null) {
      return sendMessage(pid, chatId, message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SendMultiMediaMessages value)
        sendMultimediaMessages,
    required TResult Function(_SendAudioMessage value) sendAudioMessage,
    required TResult Function(_SendMessage value) sendMessage,
    required TResult Function(_SeenMessage value) seenMessage,
    required TResult Function(_UpdatePreviousMessage value)
        updatePreviousMessage,
    required TResult Function(_DeleteMessage value) deleteMessage,
  }) {
    return sendMessage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SendMultiMediaMessages value)? sendMultimediaMessages,
    TResult Function(_SendAudioMessage value)? sendAudioMessage,
    TResult Function(_SendMessage value)? sendMessage,
    TResult Function(_SeenMessage value)? seenMessage,
    TResult Function(_UpdatePreviousMessage value)? updatePreviousMessage,
    TResult Function(_DeleteMessage value)? deleteMessage,
  }) {
    return sendMessage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SendMultiMediaMessages value)? sendMultimediaMessages,
    TResult Function(_SendAudioMessage value)? sendAudioMessage,
    TResult Function(_SendMessage value)? sendMessage,
    TResult Function(_SeenMessage value)? seenMessage,
    TResult Function(_UpdatePreviousMessage value)? updatePreviousMessage,
    TResult Function(_DeleteMessage value)? deleteMessage,
    required TResult orElse(),
  }) {
    if (sendMessage != null) {
      return sendMessage(this);
    }
    return orElse();
  }
}

abstract class _SendMessage implements MessageEvent {
  const factory _SendMessage(
      {required String pid,
      required String chatId,
      required ChatMessage message}) = _$_SendMessage;

  String get pid;
  @override
  String get chatId;
  ChatMessage get message;
  @override
  @JsonKey(ignore: true)
  _$SendMessageCopyWith<_SendMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$SeenMessageCopyWith<$Res>
    implements $MessageEventCopyWith<$Res> {
  factory _$SeenMessageCopyWith(
          _SeenMessage value, $Res Function(_SeenMessage) then) =
      __$SeenMessageCopyWithImpl<$Res>;
  @override
  $Res call({String chatId, String messageId});
}

/// @nodoc
class __$SeenMessageCopyWithImpl<$Res> extends _$MessageEventCopyWithImpl<$Res>
    implements _$SeenMessageCopyWith<$Res> {
  __$SeenMessageCopyWithImpl(
      _SeenMessage _value, $Res Function(_SeenMessage) _then)
      : super(_value, (v) => _then(v as _SeenMessage));

  @override
  _SeenMessage get _value => super._value as _SeenMessage;

  @override
  $Res call({
    Object? chatId = freezed,
    Object? messageId = freezed,
  }) {
    return _then(_SeenMessage(
      chatId: chatId == freezed
          ? _value.chatId
          : chatId // ignore: cast_nullable_to_non_nullable
              as String,
      messageId: messageId == freezed
          ? _value.messageId
          : messageId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_SeenMessage implements _SeenMessage {
  const _$_SeenMessage({required this.chatId, required this.messageId});

  @override
  final String chatId;
  @override
  final String messageId;

  @override
  String toString() {
    return 'MessageEvent.seenMessage(chatId: $chatId, messageId: $messageId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SeenMessage &&
            const DeepCollectionEquality().equals(other.chatId, chatId) &&
            const DeepCollectionEquality().equals(other.messageId, messageId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(chatId),
      const DeepCollectionEquality().hash(messageId));

  @JsonKey(ignore: true)
  @override
  _$SeenMessageCopyWith<_SeenMessage> get copyWith =>
      __$SeenMessageCopyWithImpl<_SeenMessage>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String pid, String chatId, List<MultimediaMessage> messages)
        sendMultimediaMessages,
    required TResult Function(
            File file, String pid, String chatId, ChatMessage message)
        sendAudioMessage,
    required TResult Function(String pid, String chatId, ChatMessage message)
        sendMessage,
    required TResult Function(String chatId, String messageId) seenMessage,
    required TResult Function(String chatId, String previousId)
        updatePreviousMessage,
    required TResult Function(String chatId, String messageId) deleteMessage,
  }) {
    return seenMessage(chatId, messageId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            String pid, String chatId, List<MultimediaMessage> messages)?
        sendMultimediaMessages,
    TResult Function(File file, String pid, String chatId, ChatMessage message)?
        sendAudioMessage,
    TResult Function(String pid, String chatId, ChatMessage message)?
        sendMessage,
    TResult Function(String chatId, String messageId)? seenMessage,
    TResult Function(String chatId, String previousId)? updatePreviousMessage,
    TResult Function(String chatId, String messageId)? deleteMessage,
  }) {
    return seenMessage?.call(chatId, messageId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String pid, String chatId, List<MultimediaMessage> messages)?
        sendMultimediaMessages,
    TResult Function(File file, String pid, String chatId, ChatMessage message)?
        sendAudioMessage,
    TResult Function(String pid, String chatId, ChatMessage message)?
        sendMessage,
    TResult Function(String chatId, String messageId)? seenMessage,
    TResult Function(String chatId, String previousId)? updatePreviousMessage,
    TResult Function(String chatId, String messageId)? deleteMessage,
    required TResult orElse(),
  }) {
    if (seenMessage != null) {
      return seenMessage(chatId, messageId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SendMultiMediaMessages value)
        sendMultimediaMessages,
    required TResult Function(_SendAudioMessage value) sendAudioMessage,
    required TResult Function(_SendMessage value) sendMessage,
    required TResult Function(_SeenMessage value) seenMessage,
    required TResult Function(_UpdatePreviousMessage value)
        updatePreviousMessage,
    required TResult Function(_DeleteMessage value) deleteMessage,
  }) {
    return seenMessage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SendMultiMediaMessages value)? sendMultimediaMessages,
    TResult Function(_SendAudioMessage value)? sendAudioMessage,
    TResult Function(_SendMessage value)? sendMessage,
    TResult Function(_SeenMessage value)? seenMessage,
    TResult Function(_UpdatePreviousMessage value)? updatePreviousMessage,
    TResult Function(_DeleteMessage value)? deleteMessage,
  }) {
    return seenMessage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SendMultiMediaMessages value)? sendMultimediaMessages,
    TResult Function(_SendAudioMessage value)? sendAudioMessage,
    TResult Function(_SendMessage value)? sendMessage,
    TResult Function(_SeenMessage value)? seenMessage,
    TResult Function(_UpdatePreviousMessage value)? updatePreviousMessage,
    TResult Function(_DeleteMessage value)? deleteMessage,
    required TResult orElse(),
  }) {
    if (seenMessage != null) {
      return seenMessage(this);
    }
    return orElse();
  }
}

abstract class _SeenMessage implements MessageEvent {
  const factory _SeenMessage(
      {required String chatId, required String messageId}) = _$_SeenMessage;

  @override
  String get chatId;
  String get messageId;
  @override
  @JsonKey(ignore: true)
  _$SeenMessageCopyWith<_SeenMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$UpdatePreviousMessageCopyWith<$Res>
    implements $MessageEventCopyWith<$Res> {
  factory _$UpdatePreviousMessageCopyWith(_UpdatePreviousMessage value,
          $Res Function(_UpdatePreviousMessage) then) =
      __$UpdatePreviousMessageCopyWithImpl<$Res>;
  @override
  $Res call({String chatId, String previousId});
}

/// @nodoc
class __$UpdatePreviousMessageCopyWithImpl<$Res>
    extends _$MessageEventCopyWithImpl<$Res>
    implements _$UpdatePreviousMessageCopyWith<$Res> {
  __$UpdatePreviousMessageCopyWithImpl(_UpdatePreviousMessage _value,
      $Res Function(_UpdatePreviousMessage) _then)
      : super(_value, (v) => _then(v as _UpdatePreviousMessage));

  @override
  _UpdatePreviousMessage get _value => super._value as _UpdatePreviousMessage;

  @override
  $Res call({
    Object? chatId = freezed,
    Object? previousId = freezed,
  }) {
    return _then(_UpdatePreviousMessage(
      chatId: chatId == freezed
          ? _value.chatId
          : chatId // ignore: cast_nullable_to_non_nullable
              as String,
      previousId: previousId == freezed
          ? _value.previousId
          : previousId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_UpdatePreviousMessage implements _UpdatePreviousMessage {
  const _$_UpdatePreviousMessage(
      {required this.chatId, required this.previousId});

  @override
  final String chatId;
  @override
  final String previousId;

  @override
  String toString() {
    return 'MessageEvent.updatePreviousMessage(chatId: $chatId, previousId: $previousId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UpdatePreviousMessage &&
            const DeepCollectionEquality().equals(other.chatId, chatId) &&
            const DeepCollectionEquality()
                .equals(other.previousId, previousId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(chatId),
      const DeepCollectionEquality().hash(previousId));

  @JsonKey(ignore: true)
  @override
  _$UpdatePreviousMessageCopyWith<_UpdatePreviousMessage> get copyWith =>
      __$UpdatePreviousMessageCopyWithImpl<_UpdatePreviousMessage>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String pid, String chatId, List<MultimediaMessage> messages)
        sendMultimediaMessages,
    required TResult Function(
            File file, String pid, String chatId, ChatMessage message)
        sendAudioMessage,
    required TResult Function(String pid, String chatId, ChatMessage message)
        sendMessage,
    required TResult Function(String chatId, String messageId) seenMessage,
    required TResult Function(String chatId, String previousId)
        updatePreviousMessage,
    required TResult Function(String chatId, String messageId) deleteMessage,
  }) {
    return updatePreviousMessage(chatId, previousId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            String pid, String chatId, List<MultimediaMessage> messages)?
        sendMultimediaMessages,
    TResult Function(File file, String pid, String chatId, ChatMessage message)?
        sendAudioMessage,
    TResult Function(String pid, String chatId, ChatMessage message)?
        sendMessage,
    TResult Function(String chatId, String messageId)? seenMessage,
    TResult Function(String chatId, String previousId)? updatePreviousMessage,
    TResult Function(String chatId, String messageId)? deleteMessage,
  }) {
    return updatePreviousMessage?.call(chatId, previousId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String pid, String chatId, List<MultimediaMessage> messages)?
        sendMultimediaMessages,
    TResult Function(File file, String pid, String chatId, ChatMessage message)?
        sendAudioMessage,
    TResult Function(String pid, String chatId, ChatMessage message)?
        sendMessage,
    TResult Function(String chatId, String messageId)? seenMessage,
    TResult Function(String chatId, String previousId)? updatePreviousMessage,
    TResult Function(String chatId, String messageId)? deleteMessage,
    required TResult orElse(),
  }) {
    if (updatePreviousMessage != null) {
      return updatePreviousMessage(chatId, previousId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SendMultiMediaMessages value)
        sendMultimediaMessages,
    required TResult Function(_SendAudioMessage value) sendAudioMessage,
    required TResult Function(_SendMessage value) sendMessage,
    required TResult Function(_SeenMessage value) seenMessage,
    required TResult Function(_UpdatePreviousMessage value)
        updatePreviousMessage,
    required TResult Function(_DeleteMessage value) deleteMessage,
  }) {
    return updatePreviousMessage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SendMultiMediaMessages value)? sendMultimediaMessages,
    TResult Function(_SendAudioMessage value)? sendAudioMessage,
    TResult Function(_SendMessage value)? sendMessage,
    TResult Function(_SeenMessage value)? seenMessage,
    TResult Function(_UpdatePreviousMessage value)? updatePreviousMessage,
    TResult Function(_DeleteMessage value)? deleteMessage,
  }) {
    return updatePreviousMessage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SendMultiMediaMessages value)? sendMultimediaMessages,
    TResult Function(_SendAudioMessage value)? sendAudioMessage,
    TResult Function(_SendMessage value)? sendMessage,
    TResult Function(_SeenMessage value)? seenMessage,
    TResult Function(_UpdatePreviousMessage value)? updatePreviousMessage,
    TResult Function(_DeleteMessage value)? deleteMessage,
    required TResult orElse(),
  }) {
    if (updatePreviousMessage != null) {
      return updatePreviousMessage(this);
    }
    return orElse();
  }
}

abstract class _UpdatePreviousMessage implements MessageEvent {
  const factory _UpdatePreviousMessage(
      {required String chatId,
      required String previousId}) = _$_UpdatePreviousMessage;

  @override
  String get chatId;
  String get previousId;
  @override
  @JsonKey(ignore: true)
  _$UpdatePreviousMessageCopyWith<_UpdatePreviousMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$DeleteMessageCopyWith<$Res>
    implements $MessageEventCopyWith<$Res> {
  factory _$DeleteMessageCopyWith(
          _DeleteMessage value, $Res Function(_DeleteMessage) then) =
      __$DeleteMessageCopyWithImpl<$Res>;
  @override
  $Res call({String chatId, String messageId});
}

/// @nodoc
class __$DeleteMessageCopyWithImpl<$Res>
    extends _$MessageEventCopyWithImpl<$Res>
    implements _$DeleteMessageCopyWith<$Res> {
  __$DeleteMessageCopyWithImpl(
      _DeleteMessage _value, $Res Function(_DeleteMessage) _then)
      : super(_value, (v) => _then(v as _DeleteMessage));

  @override
  _DeleteMessage get _value => super._value as _DeleteMessage;

  @override
  $Res call({
    Object? chatId = freezed,
    Object? messageId = freezed,
  }) {
    return _then(_DeleteMessage(
      chatId: chatId == freezed
          ? _value.chatId
          : chatId // ignore: cast_nullable_to_non_nullable
              as String,
      messageId: messageId == freezed
          ? _value.messageId
          : messageId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_DeleteMessage implements _DeleteMessage {
  const _$_DeleteMessage({required this.chatId, required this.messageId});

  @override
  final String chatId;
  @override
  final String messageId;

  @override
  String toString() {
    return 'MessageEvent.deleteMessage(chatId: $chatId, messageId: $messageId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DeleteMessage &&
            const DeepCollectionEquality().equals(other.chatId, chatId) &&
            const DeepCollectionEquality().equals(other.messageId, messageId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(chatId),
      const DeepCollectionEquality().hash(messageId));

  @JsonKey(ignore: true)
  @override
  _$DeleteMessageCopyWith<_DeleteMessage> get copyWith =>
      __$DeleteMessageCopyWithImpl<_DeleteMessage>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String pid, String chatId, List<MultimediaMessage> messages)
        sendMultimediaMessages,
    required TResult Function(
            File file, String pid, String chatId, ChatMessage message)
        sendAudioMessage,
    required TResult Function(String pid, String chatId, ChatMessage message)
        sendMessage,
    required TResult Function(String chatId, String messageId) seenMessage,
    required TResult Function(String chatId, String previousId)
        updatePreviousMessage,
    required TResult Function(String chatId, String messageId) deleteMessage,
  }) {
    return deleteMessage(chatId, messageId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            String pid, String chatId, List<MultimediaMessage> messages)?
        sendMultimediaMessages,
    TResult Function(File file, String pid, String chatId, ChatMessage message)?
        sendAudioMessage,
    TResult Function(String pid, String chatId, ChatMessage message)?
        sendMessage,
    TResult Function(String chatId, String messageId)? seenMessage,
    TResult Function(String chatId, String previousId)? updatePreviousMessage,
    TResult Function(String chatId, String messageId)? deleteMessage,
  }) {
    return deleteMessage?.call(chatId, messageId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String pid, String chatId, List<MultimediaMessage> messages)?
        sendMultimediaMessages,
    TResult Function(File file, String pid, String chatId, ChatMessage message)?
        sendAudioMessage,
    TResult Function(String pid, String chatId, ChatMessage message)?
        sendMessage,
    TResult Function(String chatId, String messageId)? seenMessage,
    TResult Function(String chatId, String previousId)? updatePreviousMessage,
    TResult Function(String chatId, String messageId)? deleteMessage,
    required TResult orElse(),
  }) {
    if (deleteMessage != null) {
      return deleteMessage(chatId, messageId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SendMultiMediaMessages value)
        sendMultimediaMessages,
    required TResult Function(_SendAudioMessage value) sendAudioMessage,
    required TResult Function(_SendMessage value) sendMessage,
    required TResult Function(_SeenMessage value) seenMessage,
    required TResult Function(_UpdatePreviousMessage value)
        updatePreviousMessage,
    required TResult Function(_DeleteMessage value) deleteMessage,
  }) {
    return deleteMessage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SendMultiMediaMessages value)? sendMultimediaMessages,
    TResult Function(_SendAudioMessage value)? sendAudioMessage,
    TResult Function(_SendMessage value)? sendMessage,
    TResult Function(_SeenMessage value)? seenMessage,
    TResult Function(_UpdatePreviousMessage value)? updatePreviousMessage,
    TResult Function(_DeleteMessage value)? deleteMessage,
  }) {
    return deleteMessage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SendMultiMediaMessages value)? sendMultimediaMessages,
    TResult Function(_SendAudioMessage value)? sendAudioMessage,
    TResult Function(_SendMessage value)? sendMessage,
    TResult Function(_SeenMessage value)? seenMessage,
    TResult Function(_UpdatePreviousMessage value)? updatePreviousMessage,
    TResult Function(_DeleteMessage value)? deleteMessage,
    required TResult orElse(),
  }) {
    if (deleteMessage != null) {
      return deleteMessage(this);
    }
    return orElse();
  }
}

abstract class _DeleteMessage implements MessageEvent {
  const factory _DeleteMessage(
      {required String chatId, required String messageId}) = _$_DeleteMessage;

  @override
  String get chatId;
  String get messageId;
  @override
  @JsonKey(ignore: true)
  _$DeleteMessageCopyWith<_DeleteMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$MessageStateTearOff {
  const _$MessageStateTearOff();

  _MessageState call(
      {String? error = null,
      MessageListenableAction action = MessageListenableAction.idle}) {
    return _MessageState(
      error: error,
      action: action,
    );
  }
}

/// @nodoc
const $MessageState = _$MessageStateTearOff();

/// @nodoc
mixin _$MessageState {
  String? get error =>
      throw _privateConstructorUsedError; //required List<ChatEntity> chats,
//@Default(ChatStatus.idle) ChatStatus currentState,
  MessageListenableAction get action => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MessageStateCopyWith<MessageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageStateCopyWith<$Res> {
  factory $MessageStateCopyWith(
          MessageState value, $Res Function(MessageState) then) =
      _$MessageStateCopyWithImpl<$Res>;
  $Res call({String? error, MessageListenableAction action});
}

/// @nodoc
class _$MessageStateCopyWithImpl<$Res> implements $MessageStateCopyWith<$Res> {
  _$MessageStateCopyWithImpl(this._value, this._then);

  final MessageState _value;
  // ignore: unused_field
  final $Res Function(MessageState) _then;

  @override
  $Res call({
    Object? error = freezed,
    Object? action = freezed,
  }) {
    return _then(_value.copyWith(
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      action: action == freezed
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as MessageListenableAction,
    ));
  }
}

/// @nodoc
abstract class _$MessageStateCopyWith<$Res>
    implements $MessageStateCopyWith<$Res> {
  factory _$MessageStateCopyWith(
          _MessageState value, $Res Function(_MessageState) then) =
      __$MessageStateCopyWithImpl<$Res>;
  @override
  $Res call({String? error, MessageListenableAction action});
}

/// @nodoc
class __$MessageStateCopyWithImpl<$Res> extends _$MessageStateCopyWithImpl<$Res>
    implements _$MessageStateCopyWith<$Res> {
  __$MessageStateCopyWithImpl(
      _MessageState _value, $Res Function(_MessageState) _then)
      : super(_value, (v) => _then(v as _MessageState));

  @override
  _MessageState get _value => super._value as _MessageState;

  @override
  $Res call({
    Object? error = freezed,
    Object? action = freezed,
  }) {
    return _then(_MessageState(
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      action: action == freezed
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as MessageListenableAction,
    ));
  }
}

/// @nodoc

class _$_MessageState implements _MessageState {
  const _$_MessageState(
      {this.error = null, this.action = MessageListenableAction.idle});

  @JsonKey()
  @override
  final String? error;
  @JsonKey()
  @override //required List<ChatEntity> chats,
//@Default(ChatStatus.idle) ChatStatus currentState,
  final MessageListenableAction action;

  @override
  String toString() {
    return 'MessageState(error: $error, action: $action)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MessageState &&
            const DeepCollectionEquality().equals(other.error, error) &&
            const DeepCollectionEquality().equals(other.action, action));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(error),
      const DeepCollectionEquality().hash(action));

  @JsonKey(ignore: true)
  @override
  _$MessageStateCopyWith<_MessageState> get copyWith =>
      __$MessageStateCopyWithImpl<_MessageState>(this, _$identity);
}

abstract class _MessageState implements MessageState {
  const factory _MessageState({String? error, MessageListenableAction action}) =
      _$_MessageState;

  @override
  String? get error;
  @override //required List<ChatEntity> chats,
//@Default(ChatStatus.idle) ChatStatus currentState,
  MessageListenableAction get action;
  @override
  @JsonKey(ignore: true)
  _$MessageStateCopyWith<_MessageState> get copyWith =>
      throw _privateConstructorUsedError;
}
