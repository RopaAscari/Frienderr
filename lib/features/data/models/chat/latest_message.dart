import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frienderr/features/domain/entities/chat.dart';

part 'latest_message.g.dart';
part 'latest_message.freezed.dart';

@freezed
class LatestMessage with _$LatestMessage implements LatestMessageEntity {
  const factory LatestMessage(
      {@Default(0) final int date,
      required final ChatMessage? message}) = _LatestMessage;

  factory LatestMessage.fromJson(Map<String, dynamic> json) =>
      _$LatestMessageFromJson(json);
}
