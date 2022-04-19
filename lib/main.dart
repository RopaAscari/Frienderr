import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:frienderr/app/handler_delegate.dart';
import 'package:frienderr/core/injection/injection.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:frienderr/features/presentation/blocs/bloc_observer.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("Handling a background message: ${message.data}");
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  final HydratedStorage storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );

  await configureInjection(kReleaseMode ? Environment.prod : Environment.dev);

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  HydratedBlocOverrides.runZoned(
    () => runApp(HandlerDelegate()),
    storage: storage,
    //  blocObserver: AppBlocObserver(),
  );
}
