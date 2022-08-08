import 'dart:developer';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';

class FirebaseServices {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  Future<String> getFcmToken() async {
    final fcmToken = await messaging.getToken();
    // print('FCM TOKEN $fcmToken');
    return fcmToken ?? '';
  }

  Future<void> manageUserPresence(String userId, bool isOnfline) async {
    final CollectionReference users =
        FirebaseFirestore.instance.collection('users');

    users.doc(userId).update({'presence': isOnfline}).catchError(
        (onError) => {print('Error occurred - $onError')});
  }

  Future<String> createDynamicLink() async {
    var parameters = DynamicLinkParameters(
      link: Uri.parse(
        dotenv.get('DYNAMIC_LINK_URI'),
      ),
      uriPrefix: dotenv.get('DYNAMIC_LINK_URI_PREFIX'),
      androidParameters: AndroidParameters(
        packageName: dotenv.get('PACKAGE_NAME'),
      ),
      iosParameters: IOSParameters(
        bundleId: dotenv.get('PACKAGE_NAME'),
        // appStoreId: '1498909115',
      ),
    );

    final dynamicLink =
        await FirebaseDynamicLinks.instance.buildShortLink(parameters);

    return dynamicLink.shortUrl.toString();
  }

  Future<void> retrieveDynamicLink() async {
    try {
      await Future.delayed(const Duration(seconds: 3));

      final PendingDynamicLinkData? initialLink =
          await FirebaseDynamicLinks.instance.getInitialLink();

      final Uri? deepLink = initialLink?.link;

      log(deepLink.toString());
      if (deepLink != null) {}

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
