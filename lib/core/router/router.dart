///@author Jalal Addin Okbi

import 'package:flutter/cupertino.dart';
import 'package:frienderr/core/router/config/config.dart';
import 'package:frienderr/core/router/config/e_page.dart';
import 'package:frienderr/screens/login/login.dart';
import './config/e_page.dart';

dynamic getEPage(PageConfig config) {
  print('looking for ${config.route}');
  Widget? p = _routes[config.route]?.call(config.args) ?? null;
  print('found $p');
  return p;
}

Map<String, Widget Function(Map<String, dynamic>)> _routes = {
  '/login': (args) => Login(),
};
