import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frienderr/features/domain/entities/post.dart';
import 'package:frienderr/features/domain/entities/quick.dart';

part 'quick_model.g.dart';
part 'quick_model.freezed.dart';

@freezed
class QuickModel with _$QuickModel implements QuickEntity {
  const factory QuickModel({
    @Default('') final String id,
    @Default('') final String url,
    @Default('') final String audio,
    @Default({}) final dynamic user,
    @Default(0) final int dateCreated,
    @Default('') final String caption,
    @Default(0) final int commentCount,
    @Default('') final String thumbnail,
    @Default([]) final List<String> likes,
    @Default([]) final List<String> shares,
  }) = _QuickModel;

  factory QuickModel.fromJson(Map<String, dynamic> json) =>
      _$QuickModelFromJson(json);
}
