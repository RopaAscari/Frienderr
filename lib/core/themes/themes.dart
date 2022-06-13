import 'package:flutter/material.dart';
import 'package:frienderr/core/services/services.dart';

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
    textTheme: TextTheme(
      bodyText1: TextStyle(color: HexColor('#262527')),
      bodyText2: TextStyle(color: HexColor('#E4E3E3')),
    ).apply(
      bodyColor: HexColor('#262527'),
      displayColor: HexColor('#262527'),
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  ),
  AppTheme.Dark: ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    brightness: Brightness.dark,
    canvasColor: HexColor('#000000'),
    cardColor: HexColor('#0D0E0E').withOpacity(0.9),
    primaryColor: Colors.black,
    fontFamily: 'Inter',
    popupMenuTheme: PopupMenuThemeData(
        elevation: 10,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
    textTheme: TextTheme(
      bodyText1: TextStyle(color: HexColor('#E4E3E3')),
      bodyText2: TextStyle(color: HexColor('#262527')),
    ).apply(bodyColor: HexColor('#E4E3E3'), displayColor: HexColor('#E4E3E3')),
  ),
};
