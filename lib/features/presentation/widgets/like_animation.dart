import 'package:flutter/material.dart';
import 'package:frienderr/core/generated/assets.gen.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/flare_controls.dart';
import 'package:frienderr/core/constants/constants.dart';
import 'package:frienderr/features/presentation/blocs/animation/animation_bloc.dart';

class LikeAnimation extends StatefulWidget {
  final Widget child;

  final AnimationController animationController;

  const LikeAnimation(
      {Key? key, required this.child, required this.animationController})
      : super(key: key);

  @override
  State<LikeAnimation> createState() => _LikeAnimationState();
}

class _LikeAnimationState extends State<LikeAnimation>
    with TickerProviderStateMixin {
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.center, children: [
      widget.child,
      Center(
        child: SizedBox(
            width: 300,
            height: 300,
            child: Lottie.asset(
              Assets.lottie.snapLikeAnimation,
              width: 70,
              height: 70,
              controller: widget.animationController,
            )),
      ),
    ]);
  }
}
