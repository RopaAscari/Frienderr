import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:frienderr/app/handler_delegate.dart';
import 'package:frienderr/core/injection/injection.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:frienderr/features/presentation/blocs/bloc_observer.dart';
import 'package:frienderr/core/providers/local_notiifcation_provider.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("Handling a background message: ${message.toString()}");
  LocalNotificationProvider.instance.showNotification(remoteMessage: message);
}

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await dotenv.load();
  await Firebase.initializeApp();

  //FacebookSdk.sdkInitialize();

  final HydratedStorage storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );

  //final token = await FirebaseMessaging.instance.getToken();

  await configureInjection(kReleaseMode ? Environment.prod : Environment.dev);

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  HydratedBlocOverrides.runZoned(
    () => runApp(const HandlerDelegate()),
    storage: storage,
    //  blocObserver: AppBlocObserver(),
  );
}
