import 'package:flutter/material.dart';

class ButtonOverlay extends StatelessWidget {
  const ButtonOverlay({Key? key, required this.child, this.color})
      : super(key: key);

  final Widget child;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(200),
        color: color ?? Colors.grey[500]!.withOpacity(0.5),
      ),
    );
  }
}
