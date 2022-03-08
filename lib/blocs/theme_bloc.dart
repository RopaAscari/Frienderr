import 'dart:async';
import 'package:frienderr/core/constants/constants.dart';
import 'package:frienderr/models/theme/theme_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:frienderr/events/theme_event.dart';
import 'package:frienderr/state/theme_state.dart';

class ThemeBloc extends HydratedBloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState(theme: Constants.darkTheme));

  @override
  ThemeState fromJson(Map<String, dynamic> json) {
    try {
      final theme = ApplicationTheme.fromJson(json);
      return ThemeState(theme: theme.theme);
    } catch (_) {
      return null as ThemeState;
    }
  }

  @override
  Map<String, dynamic> toJson(ThemeState state) {
    try {
      return {'theme': state.theme};
    } catch (_) {
      return null as Map<String, dynamic>;
    }
  }

  @override
  Stream<ThemeState> mapEventToState(
    ThemeEvent event,
  ) async* {
    if (event is ThemeChanged) {
      yield ThemeState(
        theme: event.theme,
      );
    }
  }
}
