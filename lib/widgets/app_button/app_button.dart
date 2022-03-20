import 'package:flutter/material.dart';
import 'package:frienderr/services/services.dart';
import 'package:frienderr/widgets/util/conditional_render_delegate.dart';
import 'package:frienderr/widgets/util/helpers.dart';

class AppButton extends StatefulWidget {
  final String label;
  final bool isLoading;
  final Function onPressed;
  final EdgeInsetsGeometry margin;
  const AppButton(
      {Key? key,
      required this.label,
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
        borderRadius: BorderRadius.circular(8.0),
        gradient: LinearGradient(
          begin: const Alignment(-0.95, 0.0),
          end: const Alignment(1.0, 0.0),
          colors: widget.isLoading
              ? [Colors.grey[400]!, Colors.grey[300]!]
              : [HexColor('#E09810'), HexColor('#FEDA43')],
          stops: const [0.0, 1.0],
        ),
      ),
      child: MaterialButton(
        minWidth: double.infinity,
        height: 60,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: const StadiumBorder(),
        child: ConditionalRenderDelegate(
            condition: widget.isLoading,
            renderWidget: SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  backgroundColor: HexColor('#FA5B8E'),
                  strokeWidth: 3,
                )),
            fallbackWidget: Text(
              widget.label,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: const AdaptiveTextSize()
                      .getAdaptiveTextSize(context, 11.5)),
            )),
        onPressed: () => widget.onPressed(),
      ),
    );
  }
}
