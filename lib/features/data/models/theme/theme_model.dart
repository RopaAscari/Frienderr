import 'package:freezed_annotation/freezed_annotation.dart';

part 'theme_model.g.dart';
part 'theme_model.freezed.dart';

@freezed
class ApplicationTheme with _$ApplicationTheme {
  const factory ApplicationTheme({
    @Default('dark') final String theme,
  }) = _ApplicationTheme;

  factory ApplicationTheme.fromJson(Map<String, dynamic> json) =>
      _$ApplicationThemeFromJson(json);
}
