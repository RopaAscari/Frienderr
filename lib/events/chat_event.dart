import 'package:frienderr/models/chat/chat_model.dart';
import 'package:frienderr/models/messaging/messaging.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

@immutable
abstract class ChatEvent extends Equatable {
  ChatEvent([List props = const []]) : super();
}

class GetChats extends ChatEvent {
  final String id;
  GetChats({required this.id});

  @override
  List<Object> get props => [id];
}

class UpdateChats extends ChatEvent {
  final List<ChatModel> chats;
  UpdateChats({required this.chats});

  @override
  List<Object> get props => [chats];
}

class OpenChat extends ChatEvent {
  final dynamic chats;
  final int index;
  final MessagingMetaData metaData;
  final BuildContext context;
  OpenChat({
    required this.metaData,
    required this.context,
    required this.chats,
    required this.index,
  });
  @override
  List<Object> get props => [];
}
