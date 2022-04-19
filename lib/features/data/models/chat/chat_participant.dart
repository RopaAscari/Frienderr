import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_participant.g.dart';
part 'chat_participant.freezed.dart';

@freezed
class ChatParticipant with _$ChatParticipant {
  const factory ChatParticipant(
      {@Default('') final String id,
      @Default('') final String profilePic,
      @Default('') final String username}) = _ChatParticipant;

  factory ChatParticipant.fromJson(Map<String, dynamic> json) =>
      _$ChatParticipantFromJson(json);
}
