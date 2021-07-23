import 'package:frienderr/models/chat/chat_model.dart';
import 'package:frienderr/models/user/user_model.dart';
import 'package:equatable/equatable.dart';

class ChatState extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadingChats extends ChatState {
  @override
  String toString() => 'Loading Chats';

  @override
  List<Object> get props => [];
}

class ChatsLoaded extends ChatState {
  final List<ChatModel> chats;

  ChatsLoaded({required this.chats}) : super();

  @override
  List<Object> get props => [chats];
}

class ChatsEmpty extends ChatState {
  ChatsEmpty() : super();

  @override
  List<Object> get props => [];
}

class ChatError extends ChatState {
  final String error;

  ChatError({required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'LoginFailure { error: $error }';
}
