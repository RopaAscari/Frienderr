import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frienderr/features/domain/entities/post.dart';
import 'package:frienderr/features/data/models/post/metadata_model.dart';

part 'content_model.g.dart';
part 'content_model.freezed.dart';

@freezed
class Content with _$Content implements ContentDTO {
  const factory Content({
    @Default('') final String type,
    @Default('') final String media,
    @Default(PostMetadata()) final PostMetadata metadata,
  }) = _Content;

  factory Content.fromJson(Map<String, dynamic> json) =>
      _$ContentFromJson(json);
}
