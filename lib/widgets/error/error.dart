import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frienderr/core/constants/constants.dart';

class ErrorDisplay extends StatelessWidget {
  final String error;
  const ErrorDisplay({Key? key, required this.error}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
            padding: const EdgeInsets.all(35),
            child: Flex(direction: Axis.horizontal, children: [
              Expanded(
                  child: Center(
                      child: Row(children: [
                Image.asset(
                  Constants.errorVector,
                  width: 65,
                  height: 65,
                ),
                Flexible(
                    child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(error)))
              ])))
            ])));
  }
}
