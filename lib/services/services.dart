import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
//import 'package:frienderr/widgets/render_posts_dynamic/render_posts_dynamic.dart';

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

class FirebaseServices {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  Future<String> getFcmToken() async {
    final fcmToken = await messaging.getToken();
    print('FCM TOKEN $fcmToken');
    return fcmToken ?? '';
  }

  Future<void> manageUserPresence(String userId, bool isOnfline) async {
    final CollectionReference users =
        FirebaseFirestore.instance.collection('users');

    users.doc(userId).update({'presence': isOnfline}).catchError(
        (onError) => {print('Error occurred - $onError')});
  }

  Future<dynamic> createDynamicLink(String postId) async {
    /* final DynamicLinkParameters parameters = DynamicLinkParameters(
      uriPrefix: 'https://friend3rr.page.link',
      link: Uri.parse('https://frienderr.page.link.com/?id=$postId'),
      androidParameters: AndroidParameters(
        packageName: 'com.example.frienderr',
        minimumVersion: 1,
      ),
      iosParameters: IosParameters(
        bundleId: 'com.example.frienderr',
        minimumVersion: '1',
        appStoreId: '123',
      ),
    );
    late final ShortDynamicLink
        shortDynamicLink; //= await parameters.buildShortLink();
    return shortDynamicLink.shortUrl;*/
  }

  Future<void> retrieveDynamicLink(BuildContext context) async {
    try {
      final PendingDynamicLinkData data = await FirebaseDynamicLinks.instance
          .getInitialLink() as PendingDynamicLinkData;

      print("DATA $data");
      final Uri deepLink = data.link;
      final String id = deepLink.queryParameters.containsKey('id')
          ? deepLink.queryParameters['id'] as String
          : '';
      print('resumend $id');
      if (deepLink != null) {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => Text('') //RenderPostDynamic(postId: id)
            ));
      }

      /* FirebaseDynamicLinks.instance.onLink(
          onSuccess: (PendingDynamicLinkData? dynamicLink) async {
        return Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => Text('') //RenderPostDynamic(postId: id)
            ));
      });*/
    } catch (e) {
      print(e.toString());
    }
  }
}

class FirebaseExceptions {
  static String password = 'weak-password';
  static String email = 'email-already-in-use';
}
