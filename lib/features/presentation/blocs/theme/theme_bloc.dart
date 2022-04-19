import 'dart:async';
import 'package:injectable/injectable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:frienderr/core/constants/constants.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frienderr/features/data/models/theme/theme_model.dart';

part 'theme_state.dart';
part 'theme_event.dart';
part 'theme_bloc.freezed.dart';

@injectable
class ThemeBloc extends HydratedBloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState(theme: Constants.darkTheme)) {
    on<_ChangeTheme>(_changeTheme);
  }

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

  Future<void> _changeTheme(
      _ChangeTheme event, Emitter<ThemeState> emit) async {
    emit(state.copyWith(theme: event.theme));
  }
}
