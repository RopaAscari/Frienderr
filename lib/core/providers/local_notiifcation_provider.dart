import 'dart:math';
import 'dart:convert';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:frienderr/features/presentation/extensions/late_handler.dart';

const String appTitle = 'Frienderr';
const String androidChannelId = 'EU383H7MEI983BSG';
const String androidChannelName = 'ExpoLeap Notifications';
const String placeHolderId = '969a6ca3-5982-4c99-b5d5-3a613219b3fc';
const String androidChannelDescription =
    'Android channel to handle local app notifications';

class LocalNotificationProvider {
  LocalNotificationProvider._();
  static final LocalNotificationProvider instance =
      LocalNotificationProvider._();

  final Late<FlutterLocalNotificationsPlugin> _flutterLocalNotificationsPlugin =
      Late();

  Future<FlutterLocalNotificationsPlugin>
      get flutterLocalNotificationsPlugin async {
    if (_flutterLocalNotificationsPlugin.isInitialized) {
      return _flutterLocalNotificationsPlugin.value;
    }

    //// if _database is null we instantiate it
    _flutterLocalNotificationsPlugin.value =
        await initializeLocalNotifications();
    return _flutterLocalNotificationsPlugin.value;
  }

  Future<FlutterLocalNotificationsPlugin> initializeLocalNotifications() async {
    final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();

    await _requestPermissions(flutterLocalNotificationsPlugin);

    final NotificationAppLaunchDetails? notificationAppLaunchDetails =
        await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();

    if (notificationAppLaunchDetails?.didNotificationLaunchApp ?? false) {}

    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('app_icon');

    final IOSInitializationSettings initializationSettingsIOS =
        IOSInitializationSettings(
            requestAlertPermission: false,
            requestBadgePermission: false,
            requestSoundPermission: false,
            onDidReceiveLocalNotification: (
              int id,
              String? title,
              String? body,
              String? payload,
            ) async {});
    const MacOSInitializationSettings initializationSettingsMacOS =
        MacOSInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
    );

    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
      macOS: initializationSettingsMacOS,
    );
    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: (String? payload) async {});
    return flutterLocalNotificationsPlugin;
  }

  _requestPermissions(
      FlutterLocalNotificationsPlugin flutterLocalNotifications) async {
    flutterLocalNotifications
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );
    flutterLocalNotifications
        .resolvePlatformSpecificImplementation<
            MacOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );
  }

  void showNotification({required RemoteMessage remoteMessage}) async {
    var flutterLocalNotifications = await flutterLocalNotificationsPlugin;

    final String id = remoteMessage.messageId as String;
    final int locationNotificationId = Random().nextInt(10000000);

    final String message = remoteMessage.data['message'] ?? 'No message';

    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      androidChannelId,
      androidChannelName,
      priority: Priority.high,
      importance: Importance.max,
    );

    const IOSNotificationDetails iosPlatformChannelSpecifics =
        IOSNotificationDetails();

    const NotificationDetails platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iosPlatformChannelSpecifics);

    flutterLocalNotifications.show(
      locationNotificationId,
      appTitle,
      message,
      platformChannelSpecifics,
    );
  }
}
