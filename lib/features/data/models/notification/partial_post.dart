import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frienderr/features/domain/entities/notification.dart';

part 'partial_post.g.dart';
part 'partial_post.freezed.dart';

@freezed
class PartialPost with _$PartialPost {
  const factory PartialPost({
    required String id,
    required String display,
  }) = _PartialPost;

  factory PartialPost.fromJson(Map<String, dynamic> json) =>
      _$PartialPostFromJson(json);
}
