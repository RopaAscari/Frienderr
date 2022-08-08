import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frienderr/features/domain/entities/post.dart';

part 'metadata_model.g.dart';
part 'metadata_model.freezed.dart';

@freezed
class PostMetadata with _$PostMetadata implements PostMetadataDTO {
  const factory PostMetadata({
    @Default(null) final String? thumbnail,
  }) = _PostMetadata;

  factory PostMetadata.fromJson(Map<String, dynamic> json) =>
      _$PostMetadataFromJson(json);
}
