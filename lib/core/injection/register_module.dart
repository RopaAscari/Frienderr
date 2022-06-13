import 'package:injectable/injectable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:google_mlkit_smart_reply/google_mlkit_smart_reply.dart';
import 'package:frienderr/features/presentation/navigation/app_router.dart';

@module
abstract class RegisterModule {
  @lazySingleton
  AppRouter get appRouter => AppRouter();

  @injectable
  SmartReply get smartReply => SmartReply();

  @injectable
  FirebaseAuth get auth => FirebaseAuth.instance;

  @injectable
  FirebaseStorage get storage => FirebaseStorage.instance;

  @injectable
  FirebaseFirestore get firestore => FirebaseFirestore.instance;

  @injectable
  FirebaseMessaging get messaging => FirebaseMessaging.instance;

  @lazySingleton
  GraphQLClient get gqlClient => GraphQLClient(
      cache: GraphQLCache(),
      link: AuthLink(
        getToken: () async => auth.currentUser?.getIdToken(),
      ).concat(HttpLink(
        'http://10.0.2.2:3000/graphql',
      )));
}
