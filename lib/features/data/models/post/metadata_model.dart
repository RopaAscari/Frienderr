import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frienderr/features/domain/entities/post.dart';

part 'metadata_model.g.dart';
part 'metadata_model.freezed.dart';

@freezed
class PostMetadataModel with _$PostMetadataModel implements PostMetadata {
  const factory PostMetadataModel({
    @Default(null) final String? thumbnail,
  }) = _PostMetadataModel;

  factory PostMetadataModel.fromJson(Map<String, dynamic> json) =>
      _$PostMetadataModelFromJson(json);
}
