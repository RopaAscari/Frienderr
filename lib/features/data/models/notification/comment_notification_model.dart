import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frienderr/features/domain/entities/notification.dart';

part 'comment_notification_model.g.dart';
part 'comment_notification_model.freezed.dart';

@freezed
class CommentNotificationModel
    with _$CommentNotificationModel
    implements CommentNotificationEntity {
  const factory CommentNotificationModel({
    @Default('') final String type,
    @Default('') final String postId,
    @Default('') final String comment,
    @Default('') final String senderId,
    @Default(0) final int dateCreated,
    @Default('') final String mediaType,
    @Default('') final String recipient,
    @Default('') final String postThumbnail,
    @Default('') final String senderUsername,
    @Default('') final String senderProfilePic,
  }) = _CommentNotificationModel;

  factory CommentNotificationModel.fromJson(Map<String, dynamic> json) =>
      _$CommentNotificationModelFromJson(json);
}
