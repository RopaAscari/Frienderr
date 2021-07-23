import 'package:meta/meta.dart';
import '../themes/themes.dart';
import 'package:equatable/equatable.dart';

@immutable
abstract class ThemeEvent extends Equatable {
  // Passing class fields in a list to the Equatable super class
  ThemeEvent([List props = const []]) : super();
}

class ThemeChanged extends ThemeEvent {
  final String theme;

  ThemeChanged({
    required this.theme,
  }) : super([theme]);

  @override
  List<Object> get props => [theme];
}

class GetTheme extends ThemeEvent {
  @override
  String toString() => 'Get Theme';

  @override
  List<Object> get props => [];
}
