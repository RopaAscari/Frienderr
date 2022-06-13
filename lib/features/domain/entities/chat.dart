import 'dart:convert';

import 'package:dash_chat_2/dash_chat_2.dart';

import 'package:frienderr/features/domain/entities/user.dart';

class ChatEntity {
  final String id;
  final int dateUpdated;

  final List<String> typing;
  final List<dynamic> participants;
  final Map<String, dynamic> unread;
  final LatestMessageEntity? latestMessage;

  ChatEntity({
    required this.id,
    required this.typing,
    required this.unread,
    required this.dateUpdated,
    required this.participants,
    this.latestMessage,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'typing': typing,
      'unread': unread,
      'dateUpdated': dateUpdated,
      'participants': participants.map((x) {
        if (x.runtimeType == String) {
          return x;
        }
        return x.toJson();
      }).toList(),
      'latestMessage': latestMessage?.toJson(),
    };
  }

  factory ChatEntity.fromJson(Map<String, dynamic> map) {
    return ChatEntity(
      id: map['id'] ?? '',
      unread: map['unread'],
      typing: map['typing'],
      dateUpdated: map['dateUpdated']?.toInt() ?? 0,
      participants: List<UserEntity>.from(
          map['participants']?.map((x) => UserEntity.fromJson(x))),
      latestMessage: LatestMessageEntity.fromJson(map['latestMessage']),
    );
  }
}

class LatestMessageEntity {
  final int date;
  final ChatMessage? message;
  LatestMessageEntity({
    required this.date,
    required this.message,
  });

  Map<String, dynamic> toJson() {
    return {
      'date': date,
      'message': message?.toJson(),
    };
  }

  factory LatestMessageEntity.fromJson(Map<String, dynamic> map) {
    return LatestMessageEntity(
      date: map['date']?.toInt() ?? 0,
      message: ChatMessage.fromJson(map['message']),
    );
  }
}

class MessagingMetaDataEntity {
  final String chatId;
  final UserEntity chatUser;
  final UserEntity chatRecipient;
  MessagingMetaDataEntity({
    required this.chatId,
    required this.chatUser,
    required this.chatRecipient,
  });

  Map<String, dynamic> toJson() {
    return {
      'chatId': chatId,
      'chatUser': chatUser.toJson(),
      'chatRecipient': chatRecipient.toJson(),
    };
  }

  factory MessagingMetaDataEntity.fromJson(Map<String, dynamic> map) {
    return MessagingMetaDataEntity(
      chatId: map['chatId'] ?? '',
      chatUser: UserEntity.fromJson(map['chatUser']),
      chatRecipient: UserEntity.fromJson(map['chatRecipient']),
    );
  }
}
