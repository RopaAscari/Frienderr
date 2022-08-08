import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frienderr/features/domain/entities/notification.dart';

part 'notification_metadata.g.dart';
part 'notification_metadata.freezed.dart';

@freezed
class NotificationMetadata with _$NotificationMetadata {
  const factory NotificationMetadata({
    @Default(null) String? comment,
  }) = _NotificationMetadata;

  factory NotificationMetadata.fromJson(Map<String, dynamic> json) =>
      _$NotificationMetadataFromJson(json);
}
