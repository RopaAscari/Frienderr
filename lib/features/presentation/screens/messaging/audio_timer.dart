import 'dart:async';

import 'package:flutter/material.dart';

class OtpTimer extends StatefulWidget {
  const OtpTimer({Key? key}) : super(key: key);

  @override
  _OtpTimerState createState() => _OtpTimerState();
}

class _OtpTimerState extends State<OtpTimer> {
  late Timer _timer;
  final interval = const Duration(seconds: 1);

  final int timerMaxSeconds = 0;

  int currentSeconds = 0;

  String get timerText =>
      '${((timerMaxSeconds + currentSeconds) ~/ 60).toString().padLeft(2)}: ${((timerMaxSeconds + currentSeconds)).toString().padLeft(2, '0')}';

  _startTimeout() {
    Duration duration = interval;
    _timer = Timer.periodic(duration, (timer) {
      setState(() {
        currentSeconds = timer.tick;
      });
    });
  }

  @override
  void initState() {
    if (mounted) {
      _startTimeout();
    }
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Text(timerText, style: const TextStyle(fontSize: 20)));
  }
}
