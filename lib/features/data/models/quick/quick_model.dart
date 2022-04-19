import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frienderr/features/domain/entities/post.dart';
import 'package:frienderr/features/domain/entities/quick.dart';

part 'quick_model.g.dart';
part 'quick_model.freezed.dart';

@freezed
class QuickModel with _$QuickModel implements QuickEntity {
  const factory QuickModel({@Default('') final String url}) = _QuickModel;

  factory QuickModel.fromJson(Map<String, dynamic> json) =>
      _$QuickModelFromJson(json);
}
