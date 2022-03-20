import 'package:flutter/material.dart';
import 'package:frienderr/themes/themes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frienderr/blocs/user_bloc.dart';
import 'package:frienderr/blocs/theme_bloc.dart';
import 'package:frienderr/screens/login/login.dart';
import 'package:frienderr/screens/splash_screen.dart';
import 'package:frienderr/core/constants/constants.dart';
import 'package:frienderr/blocs/authenticate_bloc.dart';
import 'package:frienderr/events/authenticate_event.dart';
import 'package:frienderr/navigation/tab-navigation.dart';
import 'package:frienderr/state/authentication_state.dart';
import 'package:frienderr/screens/register/register_username/register_username.dart';

class AppDelegate extends StatefulWidget {
  final UserBloc userBloc;
  final ThemeBloc themeBloc;
  final AuthenticationBloc authenticationBloc;

  AppDelegate({
    Key? key,
    required this.userBloc,
    required this.themeBloc,
    required this.authenticationBloc,
  }) : super(key: key);

  @override
  State<AppDelegate> createState() => AppDelegateState();
}

class AppDelegateState extends State<AppDelegate> {
  UserBloc get userBloc => widget.userBloc;
  ThemeBloc get themeBloc => widget.themeBloc;
  AuthenticationBloc get authenticationBloc => widget.authenticationBloc;

  @override
  void initState() {
    super.initState();
    authenticationBloc.add(AppStarted());
  }

  @override
  void dispose() {
    super.dispose();
  }

  determineRoute(AuthenticationState authState) {
    if (authState is AuthenticationAuthenticated) {
      return MainTab();
    } else if (authState is AuthenticationUsername) {
      return Center(); // RegisterUsername(userId: authState.userId);
    }
    return Login(
        userBloc: widget.userBloc,
        authenticationBloc: widget.authenticationBloc);
  }

  determineTheme(String theme) {
    if (theme == Constants.darkTheme) {
      return appThemeData[AppTheme.Dark];
    }
    return appThemeData[AppTheme.Light];
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: determineTheme(
            BlocProvider.of<ThemeBloc>(context, listen: true).state.theme),
        title: Constants.appName,
        debugShowCheckedModeBanner: false,
        home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
            bloc: authenticationBloc,
            builder: (
              BuildContext context,
              AuthenticationState authState,
            ) {
              return Scaffold(
                resizeToAvoidBottomInset: true,
                body: SplashScreen(route: determineRoute(authState)),
              );
            }));
  }
}
