import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:frienderr/core/constants/constants.dart';

class LoadingIndicator extends StatefulWidget {
  final Size size;
  const LoadingIndicator({Key? key, required this.size}) : super(key: key);

  @override
  State<LoadingIndicator> createState() => _LoadingIndicatorState();
}

class _LoadingIndicatorState extends State<LoadingIndicator> {
  @override
  Widget build(BuildContext context) {
    return new SizedBox(
        height: widget.size.height,
        width: widget.size.width,
        child: FlareActor(Constants.loadingAnimation,
            alignment: Alignment.center,
            fit: BoxFit.contain,
            animation: "loading"));
  }
}
