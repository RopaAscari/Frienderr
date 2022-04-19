import 'package:frienderr/core/data/data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frienderr/features/domain/entities/user.dart';

part 'user_model.g.dart';
part 'user_model.freezed.dart';

@freezed
class UserModel with _$UserModel implements UserEntity {
  const factory UserModel({
    final String? status,
    final bool? presence,
    final List<dynamic>? chats,
    @Default('') final String id,
    final List<dynamic>? stories,
    final bool? isLocationEnabled,
    final List<dynamic>? following,
    final List<dynamic>? followers,
    @Default('') final String username,
    @Default(defaultProfilePic) final String? profilePic,
    @Default(defaultCoverPhoto) final String? coverPhoto,
    @Default(defaultBitmapImage) final String? bitmapImage,
    @Default(defautLocation) final Map<String, dynamic>? location,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
