import 'package:flutter/material.dart';
import 'package:frienderr/core/services/helpers.dart';
import 'package:frienderr/core/services/services.dart';

import 'package:frienderr/features/presentation/widgets/loading.dart';
import 'package:frienderr/features/presentation/widgets/conditional_render_delegate.dart';

class AppButton extends StatefulWidget {
  final String label;
  final bool disabled;
  final bool isLoading;
  final double borderRadius;
  final Function onPressed;
  final EdgeInsetsGeometry margin;
  const AppButton(
      {Key? key,
      required this.label,
      this.disabled = false,
      this.borderRadius = 6.0,
      required this.isLoading,
      required this.onPressed,
      this.margin = const EdgeInsets.only(top: 20)})
      : super(key: key);

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin,
      decoration: BoxDecoration(
        border: Border.all(
            color: widget.isLoading ? Colors.grey[900]! : Colors.transparent),
        borderRadius: BorderRadius.circular(widget.borderRadius),
        gradient: LinearGradient(
          begin: const Alignment(-0.95, 0.0),
          end: const Alignment(1.0, 0.0),
          colors: widget.isLoading
              ? [Colors.black, Colors.black]
              : widget.disabled
                  ? [Colors.grey[500]!, Colors.grey[500]!]
                  : [HexColor('#E09810'), HexColor('#FEDA43')],
          stops: const [0.0, 1.0],
        ),
      ),
      child: MaterialButton(
        height: 60,
        minWidth: double.infinity,
        shape: const StadiumBorder(),
        onPressed: () => widget.onPressed(),
        child: ConditionalRenderDelegate(
            condition: widget.isLoading,
            renderWidget: SizedBox(
                height: 25,
                width: 25,
                child: CircularProgressIndicator(
                    strokeWidth: 2.5,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Colors.amber,
                    ))), // LoadingIndicator( size: Size(40, 40),),
            fallbackWidget: Text(
              widget.label,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: const AdaptiveTextSize()
                      .getAdaptiveTextSize(context, 11.5)),
            )),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
    );
  }
}
