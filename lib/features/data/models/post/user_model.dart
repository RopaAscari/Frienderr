import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_model.g.dart';
part 'user_model.freezed.dart';

@freezed
class PostUser with _$PostUser {
  const factory PostUser({
    @Default('') final String id,
    @Default('') final String username,
    @Default('') final String profilePic,
  }) = _PostUser;

  factory PostUser.fromJson(Map<String, dynamic> json) =>
      _$PostUserFromJson(json);
}
