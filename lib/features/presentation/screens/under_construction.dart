import 'package:flutter/material.dart';
import 'package:frienderr/core/constants/constants.dart';

class UnderConstruction extends StatelessWidget {
  UnderConstruction({Key? key}) : super(key: key);
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Padding(
                padding: const EdgeInsets.all(20),
                child: Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
                          child: Image.asset(Constants.constructionLogo)),
                      Text('\nScreen under construction...',
                          style: TextStyle(fontSize: 14))
                    ])))));
  }
}
