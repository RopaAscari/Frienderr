import 'package:frienderr/core/generated/assets.gen.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingIndicator extends StatefulWidget {
  final Size size;
  const LoadingIndicator({Key? key, required this.size}) : super(key: key);

  @override
  State<LoadingIndicator> createState() => _LoadingIndicatorState();
}

class _LoadingIndicatorState extends State<LoadingIndicator> {
  @override
  Widget build(BuildContext context) {
    return Lottie.asset(Assets.lottie.loading, height: 75, width: 75);
  }
}
