import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frienderr/features/data/models/chat/chat_participant.dart';
import 'package:frienderr/features/data/models/chat/latest_message.dart';

part 'chat_model.g.dart';
part 'chat_model.freezed.dart';

@freezed
class ChatModel with _$ChatModel {
  const factory ChatModel({
    @Default('') String id,
    LatestMessage? latestMessage,
    List<ChatParticipant>? participants,
  }) = _ChatModel;

  factory ChatModel.fromJson(Map<String, dynamic> json) =>
      _$ChatModelFromJson(json);
}
