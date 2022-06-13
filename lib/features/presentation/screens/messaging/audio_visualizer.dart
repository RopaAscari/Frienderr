import "package:flutter/material.dart";
import 'package:flutter/animation.dart';

class MusicVisualizer extends StatelessWidget {
  final Curve? curve;
  final int? barCount;
  final List<Color>? colors;
  final List<int>? duration;
  final List<AnimationController> animationController;
  const MusicVisualizer({
    Key? key,
    required this.colors,
    required this.duration,
    required this.barCount,
    this.curve = Curves.easeInOutCubicEmphasized,
    required this.animationController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List<Widget>.generate(
            barCount!,
            (index) => VisualComponent(
                  curve: curve!,
                  color: colors![index % 4],
                  duration: duration![index % 5],
                  animationController: animationController[index],
                )));
  }
}

class VisualComponent extends StatefulWidget {
  final int? duration;
  final Color? color;
  final Curve? curve;
  final AnimationController? animationController;
  const VisualComponent(
      {Key? key,
      required this.curve,
      required this.color,
      required this.duration,
      required this.animationController})
      : super(key: key);

  @override
  _VisualComponentState createState() => _VisualComponentState();
}

class _VisualComponentState extends State<VisualComponent>
    with SingleTickerProviderStateMixin {
  Animation<double>? animation;
  AnimationController? get animationController => widget.animationController;

  @override
  void initState() {
    super.initState();
    animate();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void animate() {
    final curvedAnimation =
        CurvedAnimation(parent: animationController!, curve: widget.curve!);
    animation = Tween<double>(begin: 0, end: 50).animate(curvedAnimation)
      ..addListener(() {
        update();
      });
    //animationController!.repeat(reverse: true);
  }

  void update() {
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 5),
        child: Container(
          width: 3,
          height: animation!.value,
          decoration: BoxDecoration(
              color: widget.color, borderRadius: BorderRadius.circular(5)),
        ));
  }
}
