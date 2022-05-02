import 'package:flutter/material.dart';
import 'package:frienderr/core/constants/constants.dart';

class SocialVector extends StatelessWidget {
  final String vector;
  const SocialVector({Key? key, required this.vector}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 35),
        child: Image.asset(vector,
            height: MediaQuery.of(context).size.height * .39));
  }
}
