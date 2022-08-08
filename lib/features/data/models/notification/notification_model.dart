import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frienderr/features/data/models/user/user_model.dart';
import 'package:frienderr/features/domain/entities/user.dart';
import 'package:frienderr/features/domain/entities/notification.dart';
import 'package:frienderr/features/data/models/notification/partial_post.dart';
import 'package:frienderr/features/data/models/notification/notification_metadata.dart';

part 'notification_model.g.dart';
part 'notification_model.freezed.dart';

@freezed
class NotificationModel with _$NotificationModel {
  const factory NotificationModel({
    required String id,
    required int type,
    required int mediaType,
    required int dateCreated,
    required UserModel user,
    required PartialPost post,
    required String recipientId,
    required NotificationMetadata metadata,
  }) = _NotificationModel;

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationModelFromJson(json);
}
