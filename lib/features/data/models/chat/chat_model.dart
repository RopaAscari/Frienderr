import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frienderr/features/domain/entities/chat.dart';
import 'package:frienderr/features/data/models/user/user_model.dart';
import 'package:frienderr/features/data/models/chat/latest_message.dart';
part 'chat_model.g.dart';
part 'chat_model.freezed.dart';

@freezed
class ChatModel with _$ChatModel {
  const factory ChatModel({
    required final String id,
    required final int dateUpdated,
    required final List<String> typing,
    required final Map<String, dynamic> unread,
    required final List<dynamic> participants,
    @Default(null) final LatestMessage? latestMessage,
  }) = _ChatModel;

  factory ChatModel.fromJson(Map<String, dynamic> json) =>
      _$ChatModelFromJson(json);
}
