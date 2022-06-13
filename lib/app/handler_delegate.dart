import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frienderr/app/app_delegate.dart';
import 'package:frienderr/core/services/services.dart';
import 'package:frienderr/core/injection/injection.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:frienderr/features/presentation/blocs/user/user_bloc.dart';
import 'package:frienderr/features/presentation/blocs/chat/chat_bloc.dart';
import 'package:frienderr/features/presentation/blocs/quick/quick_bloc.dart';
import 'package:frienderr/features/presentation/blocs/theme/theme_bloc.dart';
import 'package:frienderr/features/presentation/blocs/animation/animation_bloc.dart';
import 'package:frienderr/features/presentation/blocs/authenticate/authenticate_bloc.dart';

class HandlerDelegate extends StatefulWidget {
  HandlerDelegate({Key? key}) : super(key: key);

  @override
  HandlerDelegateState createState() => HandlerDelegateState();
}

class HandlerDelegateState extends State<HandlerDelegate>
    with WidgetsBindingObserver {
  late Timer _timerLink;
  Connectivity connectivity = Connectivity();
  late final StreamSubscription<ConnectivityResult> subscription;
  final FirebaseServices firebaseServices = FirebaseServices();

  UserBloc userBloc = getIt<UserBloc>();
  ThemeBloc themeBloc = getIt<ThemeBloc>();
  AuthenticationBloc get authenticationBloc => getIt<AuthenticationBloc>();

  @override
  void initState() {
    super.initState();
    connectivitySubscriber();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _timerLink = Timer(
        const Duration(milliseconds: 1000),
        () async {
          firebaseServices.retrieveDynamicLink(context);
        },
      );
    }

    final String userId = userBloc.state.user.id;

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

    WidgetsBinding.instance.removeObserver(this);
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
      BlocProvider<ChatBloc>(create: (context) => getIt<ChatBloc>()),
      BlocProvider<UserBloc>(
        create: (context) => getIt<UserBloc>(),
      ),
      BlocProvider<ThemeBloc>(create: (context) => getIt<ThemeBloc>()),
      BlocProvider<AnimationBloc>(create: (context) => getIt<AnimationBloc>()),
      BlocProvider<AuthenticationBloc>(
          create: (context) => getIt<AuthenticationBloc>()),
      BlocProvider<QuickBloc>(
          create: (context) =>
              getIt<QuickBloc>()..add(const QuickEvent.initialize())),
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
