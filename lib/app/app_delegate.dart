import 'package:flutter/material.dart';
import 'package:frienderr/core/l10n/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frienderr/core/themes/themes.dart';
import 'package:frienderr/core/constants/constants.dart';
import 'package:frienderr/core/injection/injection.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:frienderr/features/presentation/blocs/user/user_bloc.dart';
import 'package:frienderr/features/presentation/navigation/app_router.dart';
import 'package:frienderr/features/presentation/blocs/theme/theme_bloc.dart';
import 'package:frienderr/features/presentation/blocs/authenticate/authenticate_bloc.dart';

class AppDelegate extends StatefulWidget {
  final UserBloc userBloc;
  final ThemeBloc themeBloc;
  final AuthenticationBloc authenticationBloc;

  const AppDelegate({
    Key? key,
    required this.userBloc,
    required this.themeBloc,
    required this.authenticationBloc,
  }) : super(key: key);

  @override
  State<AppDelegate> createState() => AppDelegateState();
}

class AppDelegateState extends State<AppDelegate> {
  AppRouter get _appRouter => getIt<AppRouter>();
  AuthenticationBloc get authenticationBloc => widget.authenticationBloc;

  @override
  void dispose() {
    super.dispose();
  }

  ThemeData _determineTheme(BuildContext context) {
    final String theme =
        BlocProvider.of<ThemeBloc>(context, listen: true).state.theme;
    if (theme == Constants.darkTheme) {
      return AppTheme.of(context).appThemeData[AppThemeTypes.dark]!;
    }
    return AppTheme.of(context).appThemeData[AppThemeTypes.light]!;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        supportedLocales: L10n.all,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        title: Constants.appName,
        theme: _determineTheme(context),
        debugShowCheckedModeBanner: false,
        routerDelegate: _appRouter.delegate(),
        routeInformationParser:
            _appRouter.defaultRouteParser(includePrefixMatches: true));
  }
}
