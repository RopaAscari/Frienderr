import 'dart:convert';

import 'package:dash_chat_2/dash_chat_2.dart';

import 'package:frienderr/features/domain/entities/user.dart';

class ChatDTO {
  String id;
  int dateUpdated;
  List<String> typing;
  List<dynamic> participants;
  Map<String, dynamic>? unread;
  LatestMessageDTO? latestMessage;

  ChatDTO({
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

  factory ChatDTO.fromJson(Map<String, dynamic> map) {
    return ChatDTO(
      id: map['id'] ?? '',
      unread: map['unread'] ?? {},
      typing: map['typing'].cast<String>(),
      dateUpdated: map['dateUpdated']?.toInt() ?? 0,
      participants: map['participants'].cast<String>(),
      latestMessage: LatestMessageDTO.fromJson(map['latestMessage'] ?? {}),
    );
  }
}

class LatestMessageDTO {
  final int date;
  final ChatMessage? message;
  LatestMessageDTO({
    required this.date,
    required this.message,
  });

  Map<String, dynamic> toJson() {
    return {
      'date': date,
      'message': message?.toJson(),
    };
  }

  factory LatestMessageDTO.fromJson(Map<String, dynamic> map) {
    return LatestMessageDTO(
      date: map['date']?.toInt() ?? 0,
      message:
          map['message'] != null ? ChatMessage.fromJson(map['message']) : null,
    );
  }
}

class MessagingMetaDataEntity {
  final String chatId;
  final UserDTO chatUser;
  final UserDTO chatRecipient;
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
      chatUser: UserDTO.fromJson(map['chatUser']),
      chatRecipient: UserDTO.fromJson(map['chatRecipient']),
    );
  }
}
