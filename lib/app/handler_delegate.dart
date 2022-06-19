import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frienderr/app/app_delegate.dart';
import 'package:frienderr/core/constants/constants.dart';
import 'package:frienderr/core/services/services.dart';
import 'package:frienderr/core/injection/injection.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:frienderr/features/presentation/blocs/user/user_bloc.dart';
import 'package:frienderr/features/presentation/blocs/chat/chat_bloc.dart';
import 'package:frienderr/features/presentation/blocs/quick/quick_bloc.dart';
import 'package:frienderr/features/presentation/blocs/theme/theme_bloc.dart';
import 'package:frienderr/features/presentation/blocs/messaging/messaging_bloc.dart';
import 'package:frienderr/features/presentation/blocs/animation/animation_bloc.dart';
import 'package:frienderr/features/presentation/blocs/authenticate/authenticate_bloc.dart';

class HandlerDelegate extends StatefulWidget {
  const HandlerDelegate({Key? key}) : super(key: key);

  @override
  HandlerDelegateState createState() => HandlerDelegateState();
}

class HandlerDelegateState extends State<HandlerDelegate>
    with WidgetsBindingObserver {
  late Timer _timerLink;
  Connectivity connectivity = Connectivity();
  late final StreamSubscription<ConnectivityResult> subscription;
  final FirebaseServices firebaseServices = FirebaseServices();

  final UserBloc _userBloc = getIt<UserBloc>();
  final ThemeBloc _themeBloc = getIt<ThemeBloc>();
  AuthenticationBloc get authenticationBloc => getIt<AuthenticationBloc>();

  @override
  void initState() {
    super.initState();
    _initDynamicLinks();
    _connectivitySubscriber();
    _handlePlatformBrigthnessChange();
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

    final String userId = _userBloc.state.user.id;

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

  void _handlePlatformBrigthnessChange() {
    var window = WidgetsBinding.instance.window;
    window.onPlatformBrightnessChanged = () {
      WidgetsBinding.instance.handlePlatformBrightnessChanged();
      Brightness brightness = window.platformBrightness;
      String theme = brightness == Brightness.dark
          ? Constants.darkTheme
          : Constants.lightTheme;
      _themeBloc.add(ThemeEvent.changeTheme(theme));
    };
  }

  Future<void> _connectivitySubscriber() async {
    final ConnectivityResult connectivityResult =
        await (connectivity.checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      SystemChrome.setSystemUIOverlayStyle(
          const SystemUiOverlayStyle(statusBarColor: Colors.red));
      // _showBasicsFlash(duration: Duration(days: 365));
    }

    subscription =
        connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      final bool notConnected = result == ConnectivityResult.none;

      if (notConnected) {
        SystemChrome.setSystemUIOverlayStyle(
            const SystemUiOverlayStyle(statusBarColor: Colors.red));
        //_showBasicsFlash(duration: Duration(days: 365));
      } else {
        SystemChrome.setSystemUIOverlayStyle(
            const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
      }
    });
    //});
  }

  List<BlocProvider<Bloc<dynamic, dynamic>>> _combineProviders() {
    return [
      BlocProvider<UserBloc>(
        create: (context) => getIt<UserBloc>(),
      ),
      BlocProvider<ChatBloc>(create: (context) => getIt<ChatBloc>()),
      BlocProvider<ThemeBloc>(create: (context) => getIt<ThemeBloc>()),
      BlocProvider<MessageBloc>(create: (context) => getIt<MessageBloc>()),
      BlocProvider<AnimationBloc>(create: (context) => getIt<AnimationBloc>()),
      BlocProvider<AuthenticationBloc>(
          create: (context) => getIt<AuthenticationBloc>()),
      BlocProvider<QuickBloc>(
          create: (context) =>
              getIt<QuickBloc>()..add(const QuickEvent.initialize())),
    ];
  }

  List<BlocListener<dynamic, dynamic>> _combineListeners() {
    return [
      BlocListener<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) {},
      ),
    ];
  }

  Future<String> createDynamicLink() async {
    var parameters = DynamicLinkParameters(
      uriPrefix: 'https://frienderr.page.link',
      link: Uri.parse('https://frienderr.page.link/posts/1'),
      androidParameters: const AndroidParameters(
        packageName: "com.exmple.frienderr",
      ),
      iosParameters: const IOSParameters(
        bundleId: "com.exmple.frienderr",
        // appStoreId: '1498909115',
      ),
    );

    final dynamicLink =
        await FirebaseDynamicLinks.instance.buildShortLink(parameters);

    print(dynamicLink.shortUrl.toString());

    return dynamicLink.shortUrl.toString();
    ;
  }

  _initDynamicLinks() async {
    await Future.delayed(const Duration(seconds: 3));

    final PendingDynamicLinkData? initialLink =
        await FirebaseDynamicLinks.instance.getInitialLink();

    final Uri? deepLink = initialLink?.link;

    print(deepLink);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: MultiBlocProvider(
          child: MultiBlocListener(
            child: AppDelegate(
              userBloc: _userBloc,
              themeBloc: _themeBloc,
              authenticationBloc: authenticationBloc,
            ),
            listeners: _combineListeners(),
          ),
          providers: _combineProviders(),
        ),
        debugShowCheckedModeBanner: false);
  }
}
