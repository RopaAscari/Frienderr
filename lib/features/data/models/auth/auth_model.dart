import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_model.g.dart';
part 'auth_model.freezed.dart';

@freezed
class AuthResponse with _$AuthResponse {
  const factory AuthResponse({
    @Default({}) dynamic user,
    @Default('') dynamic error,
    @Default(false) bool hasError,
  }) = _AuthResponse;

  factory AuthResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseFromJson(json);
}
