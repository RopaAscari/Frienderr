import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:frienderr/screens/login/login.dart';
import 'package:frienderr/screens/splash_screen.dart';
import '../screens/initial/Initial.dart';
import 'package:frienderr/core/enums/enums.dart';
import 'package:frienderr/themes/themes.dart';
import 'package:frienderr/blocs/chat_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frienderr/blocs/user_bloc.dart';
import 'package:frienderr/blocs/theme_bloc.dart';
import 'package:frienderr/core/constants/constants.dart';
import 'package:frienderr/blocs/authenticate_bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:frienderr/events/authenticate_event.dart';
import 'package:frienderr/navigation/tab-navigation.dart';
import 'package:frienderr/state/authentication_state.dart';
import 'package:frienderr/repositories/user_repository.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:frienderr/widgets/flash_message/flash_message.dart';
import 'package:frienderr/screens/register/registerUsername/registerUsername.dart';

class Navigation extends StatefulWidget {
  final UserRepository userRepository;

  Navigation({Key? key, required this.userRepository}) : super(key: key);

  @override
  State<Navigation> createState() => NavigationState();
}

class NavigationState extends State<Navigation> {
  Connectivity connectivity = Connectivity();
  late final ThemeBloc themeBloc = new ThemeBloc();
  UserRepository get userRepository => widget.userRepository;
  late final StreamSubscription<ConnectivityResult> subscription;
  late final AuthenticationBloc authenticationBloc = new AuthenticationBloc();

  @override
  void initState() {
    super.initState();
    networkListener();
    authenticationBloc.add(AppStarted());
  }

  @override
  void dispose() {
    super.dispose();
    subscription.cancel();
  }

  networkListener() {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      subscription = connectivity.onConnectivityChanged
          .listen((ConnectivityResult result) {
        final bool notConnected = result == ConnectivityResult.none;
        if (notConnected) {
          return FlashMessage.buildWarningSnackbar(
              context,
              Constants.errorTypes[ErrorType.NetworkError]!,
              Duration(days: 365));
        }
      });
    });
  }

  determineRoute(AuthenticationState authState) {
    if (authState is AuthenticationAuthenticated) {
      return MainTab();
    } else if (authState is AuthenticationUsername) {
      return RegisterUsername(userId: authState.userId);
    }
    return Login();
  }

  determineTheme(String theme) {
    if (theme == Constants.darkTheme) {
      return appThemeData[AppTheme.Dark];
    }
    return appThemeData[AppTheme.Light];
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: MultiBlocProvider(
            providers: combineProviders(),
            child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
                bloc: authenticationBloc,
                builder: (
                  BuildContext context,
                  AuthenticationState authState,
                ) {
                  final route = determineRoute(authState);
                  final currentTheme = determineTheme(
                      BlocProvider.of<ThemeBloc>(context, listen: true)
                          .state
                          .theme);

                  return MaterialApp(
                    theme: currentTheme,
                    title: Constants.appName,
                    home: SplashScreen(route: route),
                    debugShowCheckedModeBanner: false,
                  );
                })));
  }
}
