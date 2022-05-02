import 'package:flutter/material.dart';
import 'package:frienderr/core/constants/constants.dart';

class AppLogo extends StatefulWidget {
  final Function onFlightCompletion;
  const AppLogo({Key? key, required this.onFlightCompletion}) : super(key: key);

  @override
  State<AppLogo> createState() => _AppLogoState();
}

class _AppLogoState extends State<AppLogo> {
  final Widget appLogo = // Align(
      // alignment: Alignment.topCenter,
      // child:
      Image.asset(Constants.appLogo, width: 200); //);
  @override
  Widget build(BuildContext context) {
    return Hero(
        flightShuttleBuilder: (_, animation, __, ___, ____) {
          animation.addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              widget.onFlightCompletion();
            }
          });
          return appLogo;
        },
        tag: Constants.heroTag,
        child: Padding(
            padding: EdgeInsets.only(top: 0, bottom: 0), child: appLogo));
  }
}
