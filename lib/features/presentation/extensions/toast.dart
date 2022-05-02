import 'package:flutter/material.dart';
import 'package:frienderr/core/enums/enums.dart';
import 'package:frienderr/features/presentation/navigation/app_router.dart';

extension ContextEx on BuildContext {
  void showToast({
    required Widget content,
    SnackBarType type = SnackBarType.idle,
    Duration duration = const Duration(seconds: 5),
  }) {
    late Color backgroundColor;
    switch (type) {
      case SnackBarType.idle:
        backgroundColor = Color.fromARGB(255, 26, 24, 24);
        break;
      case SnackBarType.success:
        backgroundColor = Color.fromARGB(255, 8, 158, 40);
        break;
      case SnackBarType.error:
        backgroundColor = Color.fromARGB(255, 194, 32, 20);
        break;
      case SnackBarType.warning:
        backgroundColor = Color.fromARGB(255, 206, 194, 26);
        break;
      default:
        break;
    }

    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: content,
        duration: duration,
        backgroundColor: backgroundColor,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void dismissToast() {
    ScaffoldMessenger.of(this).hideCurrentSnackBar();
  }
}

extension AppRouterEx on AppRouter {
  BuildContext get context => navigatorKey.currentContext!;
}
