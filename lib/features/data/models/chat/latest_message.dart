import 'package:freezed_annotation/freezed_annotation.dart';

part 'latest_message.g.dart';
part 'latest_message.freezed.dart';

@freezed
class LatestMessage with _$LatestMessage {
  const factory LatestMessage(
      {@Default(0) final int date,
      @Default(0) final int count,
      @Default({}) final dynamic message}) = _LatestMessage;

  factory LatestMessage.fromJson(Map<String, dynamic> json) =>
      _$LatestMessageFromJson(json);
}
