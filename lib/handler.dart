import 'dart:async';
import 'package:flutter/material.dart';
import 'package:frienderr/services/services.dart';
import 'package:frienderr/navigation/navigation.dart';
import 'package:frienderr/repositories/user_repository.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';

class Handler extends StatefulWidget {
  final UserRepository userRepository;

  Handler({Key? key, required this.userRepository}) : super(key: key);

  @override
  HandlerState createState() => HandlerState();
}

class HandlerState extends State<Handler> with WidgetsBindingObserver {
  late Timer _timerLink;
  final FirebaseServices firebaseServices = new FirebaseServices();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _timerLink = new Timer(
        const Duration(milliseconds: 1000),
        () async {
          print('fetch link');
          firebaseServices.retrieveDynamicLink(context);
        },
      );
    }
  }

  @override
  void dispose() {
    super.dispose();

    WidgetsBinding.instance?.removeObserver(this);
    if (_timerLink != null) {
      _timerLink.cancel();
    }
  }

  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Navigation(
          userRepository: widget.userRepository,
        ));
  }
}
