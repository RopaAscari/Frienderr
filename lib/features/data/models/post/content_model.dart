import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frienderr/features/domain/entities/post.dart';

part 'content_model.g.dart';
part 'content_model.freezed.dart';

@freezed
class ContentModel with _$ContentModel implements Content {
  const factory ContentModel({
    @Default('') final String type,
    @Default('') final String media,
    @Default('') final String thumbnail,
    @Default([]) final List<dynamic> metadata,
  }) = _ContentModel;

  factory ContentModel.fromJson(Map<String, dynamic> json) =>
      _$ContentModelFromJson(json);
}
