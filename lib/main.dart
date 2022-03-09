// @dart=2.9
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:frienderr/handler.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:frienderr/services/services.dart';
import 'package:frienderr/blocs/bloc_observer.dart';
import 'package:frienderr/repositories/user_repository.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("Handling a background message: ${message.data}");
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final HydratedStorage storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );

  await Firebase.initializeApp();

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  HydratedBlocOverrides.runZoned(
    () => runApp(Handler(userRepository: UserRepository())),
    storage: storage,
    blocObserver: AppBlocObserver(),
  );
}
