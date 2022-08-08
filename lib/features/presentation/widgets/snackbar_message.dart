import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:frienderr/core/services/responsive_text.dart';

class SnackBarMessage extends StatelessWidget {
  final Widget? leading;
  final String message;
  final Widget? subtitle;
  final Widget? trailing;

  const SnackBarMessage({
    Key? key,
    this.leading,
    this.subtitle,
    this.trailing,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 25,
      child: Padding(
          child: ListTile(
            dense: true,
            leading: leading,
            title: Text(message,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: ResponsiveFlutter.of(context).fontSize(1.5))),
            subtitle: subtitle,
            visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 0.0, vertical: -4),
          ),
          padding: const EdgeInsets.only(bottom: 0)),
    );
  }
}
