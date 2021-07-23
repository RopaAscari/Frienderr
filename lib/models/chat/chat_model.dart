class ChatModel {
  String id;
  LatestMessage latestMessage;
  List<dynamic> participants;

  ChatModel(
      {required this.latestMessage,
      required this.participants,
      required this.id});
}

class LatestMessage {
  final int date;
  final int count;
  final dynamic message;
  LatestMessage(
      {required this.date, required this.message, required this.count});
}

class ChatParticipant {
  final String id;
  final String profilePic;
  final String username;

  ChatParticipant(
      {required this.id, required this.username, required this.profilePic});
}
