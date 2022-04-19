// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    MainRoute.name: (routeData) {
      final args = routeData.argsAs<MainRouteArgs>();
      return CustomPage<dynamic>(
          routeData: routeData,
          child: MainScreen(key: args.key, blocGroup: args.blocGroup),
          transitionsBuilder: TransitionsBuilders.slideRightWithFade,
          durationInMilliseconds: 200,
          opaque: false,
          barrierDismissible: false);
    },
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>();
      return CustomPage<dynamic>(
          routeData: routeData,
          child: LoginScreen(
              key: args.key,
              blocGroup: args.blocGroup,
              shouldRenderUI: args.shouldRenderUI),
          transitionsBuilder: TransitionsBuilders.slideRightWithFade,
          durationInMilliseconds: 200,
          opaque: false,
          barrierDismissible: false);
    },
    RegisterRoute.name: (routeData) {
      final args = routeData.argsAs<RegisterRouteArgs>();
      return CustomPage<dynamic>(
          routeData: routeData,
          child: RegisterScreen(key: args.key, blocGroup: args.blocGroup),
          transitionsBuilder: TransitionsBuilders.slideRightWithFade,
          durationInMilliseconds: 200,
          opaque: false,
          barrierDismissible: false);
    },
    ChatDashboardRoute.name: (routeData) {
      final args = routeData.argsAs<ChatDashboardRouteArgs>(
          orElse: () => const ChatDashboardRouteArgs());
      return CustomPage<dynamic>(
          routeData: routeData,
          child: ChatDashboardScreen(key: args.key),
          transitionsBuilder: TransitionsBuilders.slideRightWithFade,
          durationInMilliseconds: 200,
          opaque: false,
          barrierDismissible: false);
    },
    ForgotPasswordRoute.name: (routeData) {
      final args = routeData.argsAs<ForgotPasswordRouteArgs>();
      return CustomPage<dynamic>(
          routeData: routeData,
          child: ForgotPasswordScreen(key: args.key, blocGroup: args.blocGroup),
          transitionsBuilder: TransitionsBuilders.slideRightWithFade,
          durationInMilliseconds: 200,
          opaque: false,
          barrierDismissible: false);
    },
    UnauthenticatedRoute.name: (routeData) {
      return CustomPage<dynamic>(
          routeData: routeData,
          child: const UnauthenticatedScreen(),
          transitionsBuilder: TransitionsBuilders.slideRightWithFade,
          durationInMilliseconds: 200,
          opaque: false,
          barrierDismissible: false);
    },
    RegisterUsernameRoute.name: (routeData) {
      final args = routeData.argsAs<RegisterUsernameRouteArgs>();
      return CustomPage<dynamic>(
          routeData: routeData,
          child: RegisterUsernameScreen(
              key: args.key, userId: args.userId, blocGroup: args.blocGroup),
          transitionsBuilder: TransitionsBuilders.slideRightWithFade,
          durationInMilliseconds: 200,
          opaque: false,
          barrierDismissible: false);
    },
    RecoveryEmailSentRoute.name: (routeData) {
      final args = routeData.argsAs<RecoveryEmailSentRouteArgs>();
      return CustomPage<dynamic>(
          routeData: routeData,
          child:
              RecoveryEmailSentScreen(key: args.key, blocGroup: args.blocGroup),
          transitionsBuilder: TransitionsBuilders.slideRightWithFade,
          durationInMilliseconds: 200,
          opaque: false,
          barrierDismissible: false);
    },
    SplashRoute.name: (routeData) {
      return CustomPage<dynamic>(
          routeData: routeData,
          child: const SplashScreen(),
          transitionsBuilder: TransitionsBuilders.slideRightWithFade,
          durationInMilliseconds: 200,
          opaque: false,
          barrierDismissible: false);
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(MainRoute.name, path: '/main-screen'),
        RouteConfig(LoginRoute.name, path: '/login-screen'),
        RouteConfig(RegisterRoute.name, path: '/register-screen'),
        RouteConfig(ChatDashboardRoute.name, path: '/chat-dashboard-screen'),
        RouteConfig(ForgotPasswordRoute.name, path: '/forgot-password-screen'),
        RouteConfig(UnauthenticatedRoute.name, path: '/unauthenticated-screen'),
        RouteConfig(RegisterUsernameRoute.name,
            path: '/register-username-screen'),
        RouteConfig(RecoveryEmailSentRoute.name,
            path: '/recovery-email-sent-screen'),
        RouteConfig(SplashRoute.name, path: '/')
      ];
}

/// generated route for
/// [MainScreen]
class MainRoute extends PageRouteInfo<MainRouteArgs> {
  MainRoute({Key? key, required BlocGroup blocGroup})
      : super(MainRoute.name,
            path: '/main-screen',
            args: MainRouteArgs(key: key, blocGroup: blocGroup));

  static const String name = 'MainRoute';
}

class MainRouteArgs {
  const MainRouteArgs({this.key, required this.blocGroup});

  final Key? key;

  final BlocGroup blocGroup;

  @override
  String toString() {
    return 'MainRouteArgs{key: $key, blocGroup: $blocGroup}';
  }
}

/// generated route for
/// [LoginScreen]
class LoginRoute extends PageRouteInfo<LoginRouteArgs> {
  LoginRoute(
      {Key? key, required BlocGroup blocGroup, bool shouldRenderUI = false})
      : super(LoginRoute.name,
            path: '/login-screen',
            args: LoginRouteArgs(
                key: key,
                blocGroup: blocGroup,
                shouldRenderUI: shouldRenderUI));

  static const String name = 'LoginRoute';
}

class LoginRouteArgs {
  const LoginRouteArgs(
      {this.key, required this.blocGroup, this.shouldRenderUI = false});

  final Key? key;

  final BlocGroup blocGroup;

  final bool shouldRenderUI;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key, blocGroup: $blocGroup, shouldRenderUI: $shouldRenderUI}';
  }
}

/// generated route for
/// [RegisterScreen]
class RegisterRoute extends PageRouteInfo<RegisterRouteArgs> {
  RegisterRoute({Key? key, required BlocGroup blocGroup})
      : super(RegisterRoute.name,
            path: '/register-screen',
            args: RegisterRouteArgs(key: key, blocGroup: blocGroup));

  static const String name = 'RegisterRoute';
}

class RegisterRouteArgs {
  const RegisterRouteArgs({this.key, required this.blocGroup});

  final Key? key;

  final BlocGroup blocGroup;

  @override
  String toString() {
    return 'RegisterRouteArgs{key: $key, blocGroup: $blocGroup}';
  }
}

/// generated route for
/// [ChatDashboardScreen]
class ChatDashboardRoute extends PageRouteInfo<ChatDashboardRouteArgs> {
  ChatDashboardRoute({Key? key})
      : super(ChatDashboardRoute.name,
            path: '/chat-dashboard-screen',
            args: ChatDashboardRouteArgs(key: key));

  static const String name = 'ChatDashboardRoute';
}

class ChatDashboardRouteArgs {
  const ChatDashboardRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'ChatDashboardRouteArgs{key: $key}';
  }
}

/// generated route for
/// [ForgotPasswordScreen]
class ForgotPasswordRoute extends PageRouteInfo<ForgotPasswordRouteArgs> {
  ForgotPasswordRoute({Key? key, required BlocGroup blocGroup})
      : super(ForgotPasswordRoute.name,
            path: '/forgot-password-screen',
            args: ForgotPasswordRouteArgs(key: key, blocGroup: blocGroup));

  static const String name = 'ForgotPasswordRoute';
}

class ForgotPasswordRouteArgs {
  const ForgotPasswordRouteArgs({this.key, required this.blocGroup});

  final Key? key;

  final BlocGroup blocGroup;

  @override
  String toString() {
    return 'ForgotPasswordRouteArgs{key: $key, blocGroup: $blocGroup}';
  }
}

/// generated route for
/// [UnauthenticatedScreen]
class UnauthenticatedRoute extends PageRouteInfo<void> {
  const UnauthenticatedRoute()
      : super(UnauthenticatedRoute.name, path: '/unauthenticated-screen');

  static const String name = 'UnauthenticatedRoute';
}

/// generated route for
/// [RegisterUsernameScreen]
class RegisterUsernameRoute extends PageRouteInfo<RegisterUsernameRouteArgs> {
  RegisterUsernameRoute(
      {Key? key, required String userId, required BlocGroup blocGroup})
      : super(RegisterUsernameRoute.name,
            path: '/register-username-screen',
            args: RegisterUsernameRouteArgs(
                key: key, userId: userId, blocGroup: blocGroup));

  static const String name = 'RegisterUsernameRoute';
}

class RegisterUsernameRouteArgs {
  const RegisterUsernameRouteArgs(
      {this.key, required this.userId, required this.blocGroup});

  final Key? key;

  final String userId;

  final BlocGroup blocGroup;

  @override
  String toString() {
    return 'RegisterUsernameRouteArgs{key: $key, userId: $userId, blocGroup: $blocGroup}';
  }
}

/// generated route for
/// [RecoveryEmailSentScreen]
class RecoveryEmailSentRoute extends PageRouteInfo<RecoveryEmailSentRouteArgs> {
  RecoveryEmailSentRoute({Key? key, required BlocGroup blocGroup})
      : super(RecoveryEmailSentRoute.name,
            path: '/recovery-email-sent-screen',
            args: RecoveryEmailSentRouteArgs(key: key, blocGroup: blocGroup));

  static const String name = 'RecoveryEmailSentRoute';
}

class RecoveryEmailSentRouteArgs {
  const RecoveryEmailSentRouteArgs({this.key, required this.blocGroup});

  final Key? key;

  final BlocGroup blocGroup;

  @override
  String toString() {
    return 'RecoveryEmailSentRouteArgs{key: $key, blocGroup: $blocGroup}';
  }
}

/// generated route for
/// [SplashScreen]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute() : super(SplashRoute.name, path: '/');

  static const String name = 'SplashRoute';
}
