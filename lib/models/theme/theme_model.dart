import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'theme.g.dart';

@JsonSerializable()
class ApplicationTheme {
  final String theme;

  ApplicationTheme({required this.theme}) : super();

  factory ApplicationTheme.fromJson(Map<String, dynamic> json) =>
      _$ApplicationThemeFromJson(json);
  Map<String, dynamic> toJson() => _$ApplicationThemeToJson(this);
}
