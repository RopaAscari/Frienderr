import 'package:flutter/material.dart';
import 'package:frienderr/core/generated/assets.gen.dart';

/// A class that represents send button widget.
class SendButton extends StatelessWidget {
  /// Creates send button widget.
  const SendButton({
    super.key,
    required this.onPressed,
    this.padding = EdgeInsets.zero,
  });

  /// Callback for send button tap event.
  final void Function() onPressed;

  /// Padding around the button.
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsetsDirectional.fromSTEB(
          0,
          0,
          8,
          0,
        ),
        child: IconButton(
          constraints: const BoxConstraints(
            minHeight: 24,
            minWidth: 24,
          ),
          icon: Image.asset(
            Assets.images.iconSend.path,
            color: Colors.white,
          ),
          onPressed: onPressed,
          padding: padding,
          splashRadius: 24,
        ),
      );
}
