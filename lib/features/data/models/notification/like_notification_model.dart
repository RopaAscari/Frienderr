import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frienderr/features/domain/entities/notification.dart';

part 'like_notification_model.g.dart';
part 'like_notification_model.freezed.dart';

@freezed
class LikeNotificationModel
    with _$LikeNotificationModel
    implements LikeNotificationEntity {
  const factory LikeNotificationModel({
    @Default('') final String type,
    @Default('') final String postId,
    @Default(0) final int dateCreated,
    @Default('') final String senderId,
    @Default('') final String recipient,
    @Default('') final String mediaType,
    @Default('') final String postThumbnail,
    @Default('') final String senderUsername,
    @Default('') final String senderProfilePic,
  }) = _LikeNotificationModel;

  factory LikeNotificationModel.fromJson(Map<String, dynamic> json) =>
      _$LikeNotificationModelFromJson(json);
}
