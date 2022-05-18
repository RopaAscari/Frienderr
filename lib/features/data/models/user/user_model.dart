import 'package:frienderr/core/data/data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frienderr/features/domain/entities/user.dart';
import 'package:frienderr/features/data/models/user/user_location_model.dart';

part 'user_model.g.dart';
part 'user_model.freezed.dart';

@freezed
class UserModel with _$UserModel implements UserEntity {
  const factory UserModel({
    String? status,
    String? deviceToken,
    @Default('') final String id,
    @Default(true) bool? presence,
    @Default([]) List<dynamic>? chats,
    @Default('') final String username,
    @Default([]) List<dynamic>? following,
    @Default([]) List<dynamic>? followers,
    @Default(null) final UserLocationModel? location,
    @Default(defaultProfilePic) final String? profilePic,
    @Default(defaultCoverPhoto) final String? coverPhoto,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
