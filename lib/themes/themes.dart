import 'package:flutter/material.dart';
import 'package:frienderr/services/services.dart';

enum AppTheme {
  Light,
  Dark,
}

final appThemeData = {
  AppTheme.Light: ThemeData(
    brightness: Brightness.light,
    primaryColor: HexColor('#F5F5F5'),
    canvasColor: HexColor('#FFFFFF'),
    fontFamily: 'Inter',
    buttonColor: HexColor('#13111A'),
    textTheme: TextTheme(
      bodyText1: TextStyle(color: HexColor('#262527')),
      bodyText2: TextStyle(color: HexColor('#E4E3E3')),
    ).apply(
      bodyColor: HexColor('#262527'),
      displayColor: HexColor('#262527'),
    ),
  ),
  AppTheme.Dark: ThemeData(
    brightness: Brightness.dark,
    buttonColor: Colors.white,
    canvasColor: HexColor('#13111A'),
    primaryColor: Colors.black,
    fontFamily: 'Inter',
    textTheme: TextTheme(
      bodyText1: TextStyle(color: HexColor('#E4E3E3')),
      bodyText2: TextStyle(color: HexColor('#262527')),
    ).apply(bodyColor: HexColor('#E4E3E3'), displayColor: HexColor('#E4E3E3')),
  ),
};
