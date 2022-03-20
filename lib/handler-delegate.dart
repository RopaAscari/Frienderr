import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frienderr/app-delegate.dart';
import 'package:frienderr/blocs/chat_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frienderr/blocs/theme_bloc.dart';
import 'package:frienderr/blocs/user_bloc.dart';
import 'package:frienderr/services/services.dart';
import 'package:frienderr/blocs/authenticate_bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:frienderr/state/authentication_state.dart';

class HandlerDelegate extends StatefulWidget {
  HandlerDelegate({Key? key}) : super(key: key);

  @override
  HandlerDelegateState createState() => HandlerDelegateState();
}

class HandlerDelegateState extends State<HandlerDelegate>
    with WidgetsBindingObserver {
  late Timer _timerLink;
  final UserBloc userBloc = UserBloc();
  Connectivity connectivity = Connectivity();
  final ThemeBloc themeBloc = new ThemeBloc();
  late final StreamSubscription<ConnectivityResult> subscription;
  final FirebaseServices firebaseServices = new FirebaseServices();
  final AuthenticationBloc authenticationBloc = AuthenticationBloc();

  @override
  void initState() {
    super.initState();
    this.connectivitySubscriber();
    WidgetsBinding.instance?.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _timerLink = new Timer(
        const Duration(milliseconds: 1000),
        () async {
          firebaseServices.retrieveDynamicLink(context);
        },
      );
    }

    final String userId =
        BlocProvider.of<UserBloc>(context, listen: false).state.user.id;
    bool isOnline = true;
    switch (state) {
      case AppLifecycleState.resumed:
        isOnline = true;
        break;
      case AppLifecycleState.inactive:
        isOnline = false;
        FirebaseServices().manageUserPresence(userId, isOnline);
        break;
      case AppLifecycleState.paused:
        isOnline = false;
        FirebaseServices().manageUserPresence(userId, isOnline);
        break;
      case AppLifecycleState.detached:
        break;
    }

    FirebaseServices().manageUserPresence(userId, isOnline);
  }

  @override
  void dispose() {
    super.dispose();

    WidgetsBinding.instance?.removeObserver(this);
    if (_timerLink != null) {
      _timerLink.cancel();
    }

    subscription.cancel();
  }

  Future<void> connectivitySubscriber() async {
    final ConnectivityResult connectivityResult =
        await (connectivity.checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      SystemChrome.setSystemUIOverlayStyle(
          SystemUiOverlayStyle(statusBarColor: Colors.red));
      // _showBasicsFlash(duration: Duration(days: 365));
    }

    subscription =
        connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      final bool notConnected = result == ConnectivityResult.none;

      if (notConnected) {
        SystemChrome.setSystemUIOverlayStyle(
            SystemUiOverlayStyle(statusBarColor: Colors.red));
        //_showBasicsFlash(duration: Duration(days: 365));
      } else {
        SystemChrome.setSystemUIOverlayStyle(
            SystemUiOverlayStyle(statusBarColor: Colors.transparent));
      }
    });
    //});
  }

  List<BlocProvider<Bloc<dynamic, dynamic>>> combineProviders() {
    return [
      BlocProvider<UserBloc>(create: (context) => UserBloc()),
      BlocProvider<ChatBloc>(create: (context) => ChatBloc()),
      BlocProvider<ThemeBloc>(create: (context) => ThemeBloc()),
      BlocProvider<AuthenticationBloc>(
          create: (context) => AuthenticationBloc()),
    ];
  }

  List<BlocListener<dynamic, dynamic>> combineListeners() {
    return [
      BlocListener<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) {},
      ),
    ];
  }

  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: combineProviders(),
        child: MultiBlocListener(
            listeners: combineListeners(),
            child: AppDelegate(
              userBloc: userBloc,
              themeBloc: themeBloc,
              authenticationBloc: authenticationBloc,
            )));
  }
}
