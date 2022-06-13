import 'package:flutter/material.dart';
import 'package:frienderr/features/presentation/screens/construction/under_construction.dart';
import 'package:frienderr/features/presentation/screens/theme/change_theme.dart';

class AccountOptions {
  final IconData icon;
  final String title;
  final Widget route;
  AccountOptions({
    required this.icon,
    required this.title,
    required this.route,
  });
}

final accountOptions = [
  AccountOptions(
      icon: Icons.account_circle, title: 'Profile', route: UnderConstruction()),
  AccountOptions(
      icon: Icons.theater_comedy, title: 'Theme', route: ChangeTheme()),
  AccountOptions(
      icon: Icons.bookmark_add,
      title: 'Saved Posts',
      route: UnderConstruction()),
  AccountOptions(
      icon: Icons.notifications,
      title: 'Notifications',
      route: UnderConstruction()),
  AccountOptions(icon: Icons.logout, title: 'Logout', route: Center()),
];
