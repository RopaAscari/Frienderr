import 'package:frienderr/models/chat/chat_model.dart';
import 'package:frienderr/models/user/user_model.dart';

class MessagingMetaData {
  final String chatId;
  final dynamic chatUser;
  final dynamic chatRecipient;

  MessagingMetaData(
      {required this.chatId,
      required this.chatUser,
      required this.chatRecipient});
}
