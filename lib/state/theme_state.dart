import 'package:meta/meta.dart';
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

@immutable
class ThemeState extends Equatable {
  final String theme;

  ThemeState({
    required this.theme,
  }) : super();

  @override
  List<Object> get props => [theme];
}
