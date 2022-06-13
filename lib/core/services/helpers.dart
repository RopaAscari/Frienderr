import 'dart:math';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Helpers {
  static String generateId(int length) {
    const chars =
        '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';
    final rnd = Random(DateTime.now().millisecondsSinceEpoch);
    final buf = StringBuffer();

    for (var x = 0; x < length; x++) {
      buf.write(chars[rnd.nextInt(chars.length)]);
    }
    return buf.toString();
  }
}

class ConnectionDelegate {
  static Future<bool> isConnected() async {
    try {
      await FirebaseFirestore.instance
          .runTransaction((Transaction tx) {} as dynamic)
          .timeout(const Duration(seconds: 5));
      return true;
// ignore: nullable_type_in_catch_clause
    } on PlatformException catch (_) {
      // May be thrown on Airplane mode
      return false;
    } on TimeoutException catch (_) {
      return false;
    }
  }
}

class AdaptiveTextSize {
  const AdaptiveTextSize();

  getAdaptiveTextSize(BuildContext context, dynamic value) {
    // 720 is medium screen height
    return (value / 720) * MediaQuery.of(context).size.height;
  }
}
