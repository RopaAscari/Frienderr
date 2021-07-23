import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FlashMessage {
  FlashMessage._();
  static buildErrorSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Row(children: <Widget>[
          Icon(Icons.error),
          //Icon widget of your choice HERE,
          Text(' $message', style: TextStyle(color: Colors.white))
        ]),
        backgroundColor: Colors.red,
        action: new SnackBarAction(
          label: '',
          textColor: Colors.yellow,
          onPressed: () {
            // do something
          },
        )));
  }

  static buildWarningSnackbar(
      BuildContext context, String message, Duration duration) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Row(children: <Widget>[
          Icon(Icons.error),
          //Icon widget of your choice HERE,
          Text(' $message',
              style: TextStyle(
                  color: Theme.of(context).textTheme.bodyText2!.color))
        ]),
        backgroundColor: Colors.amber[300],
        duration: duration,
        action: new SnackBarAction(
          label: '',
          textColor: Theme.of(context).textTheme.bodyText2!.color,
          onPressed: () {
            // do something
          },
        )));
  }
}
