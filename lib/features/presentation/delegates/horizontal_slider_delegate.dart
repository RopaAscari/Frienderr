import 'package:flutter/animation.dart';
import 'package:flutter/rendering.dart';

class HorizontalSliderDelegate extends FlowDelegate {
  final Animation<double> animation;

  HorizontalSliderDelegate({required this.animation})
      : super(repaint: animation);

  @override
  paintChildren(FlowPaintingContext context) {
    for (int i = context.childCount - 1; i >= 0; i--) {
      double dx = (50.0 + 10) * i;
      context.paintChild(
        i,
        transform: Matrix4.translationValues(0, dx * animation.value + 10, 0),
      );
    }
  }

  @override
  shouldRepaint(covariant HorizontalSliderDelegate oldDelegate) {
    return animation != oldDelegate.animation;
  }
}
