import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frienderr/features/data/models/user/user_model.dart';

part 'snap_model.g.dart';
part 'snap_model.freezed.dart';

@freezed
class Snap with _$Snap {
  const factory Snap({
    @Default(0) final int saves,
    @Default(0) final int likes,
    @Default(0) final int shares,
    @Default('') final String id,
    @Default('') final String url,
    required final UserModel user,
    @Default(0) final int comments,
    @Default('') final String audio,
    @Default(0) final int dateCreated,
    @Default('') final String caption,
    @Default(false) final bool isLiked,
    @Default('') final String thumbnail,
  }) = _Snap;

  factory Snap.fromJson(Map<String, dynamic> json) => _$SnapFromJson(json);
}
