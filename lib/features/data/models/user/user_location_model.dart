import 'package:frienderr/core/data/data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frienderr/features/domain/entities/user.dart';

part 'user_location_model.g.dart';
part 'user_location_model.freezed.dart';

@freezed
class UserLocationModel with _$UserLocationModel implements UserLocationEntity {
  const factory UserLocationModel({
    final bool? latitude,
    final String? longitude,
    final String? bitmapImage,
    @Default(false) final bool isLocationEnabled,
  }) = _UserLocationModel;

  factory UserLocationModel.fromJson(Map<String, dynamic> json) =>
      _$UserLocationModelFromJson(json);
}
