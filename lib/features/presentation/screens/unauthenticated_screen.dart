import 'package:flutter/material.dart';

class UnauthenticatedScreen extends StatelessWidget {
  const UnauthenticatedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(child: Text("Not Authenticated"));
  }
}
