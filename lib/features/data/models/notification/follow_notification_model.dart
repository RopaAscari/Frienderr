import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frienderr/features/domain/entities/comment.dart';
import 'package:frienderr/features/domain/entities/notification.dart';

part 'follow_notification_model.g.dart';
part 'follow_notification_model.freezed.dart';

@freezed
class FollowNotificationModel
    with _$FollowNotificationModel
    implements FollowNotificationEntity {
  const factory FollowNotificationModel({
    @Default('') final String type,
    @Default(0) final int dateCreated,
    @Default('') final String senderId,
    @Default('') final String recipient,
    @Default('') final String senderUsername,
    @Default('') final String senderProfilePic,
  }) = _FollowNotificationModel;

  factory FollowNotificationModel.fromJson(Map<String, dynamic> json) =>
      _$FollowNotificationModelFromJson(json);
}
