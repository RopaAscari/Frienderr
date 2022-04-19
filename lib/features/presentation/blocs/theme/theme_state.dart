part of 'theme_bloc.dart';

enum ThemeStatus { Initial, ThemeChanged }

@freezed
class ThemeState with _$ThemeState {
  factory ThemeState({
    @Default('') String theme,
    @Default(ThemeStatus.Initial) ThemeStatus status,
  }) = _ThemeState;
}
