import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:frienderr/core/constants/constants.dart';

class SplashScreen extends StatefulWidget {
  final dynamic route;
  //final AuthCubit authCubit;

  const SplashScreen({
    Key? key,
    required this.route,
    //   required this.authCubit,
  }) : super(
          key: key,
        );
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  initState() {
    super.initState();
    navigateToRoute();
  }

  void navigateToRoute() {
    Future.delayed(
      const Duration(milliseconds: 3000),
      () => Navigator.pushAndRemoveUntil(
          context,
          PageRouteBuilder(
              transitionDuration: const Duration(milliseconds: 2500),
              pageBuilder: (_, __, ___) => widget.route),
          (route) => false),
    );
  }

  @override
  Widget build(BuildContext context) {
    final String logo = Constants.appLogo;

    return Scaffold(
        backgroundColor: Theme.of(context).canvasColor,
        body: Center(
            child: Hero(
                tag: Constants.heroTag, child: Image.asset(logo, width: 200))));
  }
}
