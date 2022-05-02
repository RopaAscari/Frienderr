import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frienderr/features/domain/entities/post.dart';
import 'package:frienderr/features/data/models/post/metadata_model.dart';

part 'content_model.g.dart';
part 'content_model.freezed.dart';

@freezed
class ContentModel with _$ContentModel implements Content {
  const factory ContentModel({
    @Default('') final String type,
    @Default('') final String media,
    @Default(PostMetadataModel()) final PostMetadataModel metadata,
  }) = _ContentModel;

  factory ContentModel.fromJson(Map<String, dynamic> json) =>
      _$ContentModelFromJson(json);
}
