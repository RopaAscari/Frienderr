import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:frienderr/features/domain/entities/bloc_group.dart';
import 'package:frienderr/features/presentation/screens/chat.dart';
import 'package:frienderr/features/presentation/screens/login.dart';
import 'package:frienderr/features/presentation/navigation/guards.dart';
import 'package:frienderr/features/presentation/blocs/user/user_bloc.dart';
import 'package:frienderr/features/presentation/screens/recovery_email_sent.dart';
import 'package:frienderr/features/presentation/screens/splash_screen.dart';
import 'package:frienderr/features/presentation/screens/register_user.dart';
import 'package:frienderr/features/presentation/screens/forgot_password.dart';
import 'package:frienderr/features/presentation/screens/register_username.dart';
import 'package:frienderr/features/presentation/navigation/tab_navigation.dart';
import 'package:frienderr/features/presentation/screens/unauthenticated_screen.dart';
import 'package:frienderr/features/presentation/blocs/authenticate/authenticate_bloc.dart';

part 'app_router.gr.dart';

@CustomAutoRouter(
  opaque: false,
  durationInMilliseconds: 200,
  replaceInRouteName: 'Screen,Route',
  transitionsBuilder: TransitionsBuilders.slideRightWithFade,
  routes: <AutoRoute>[
    AutoRoute(page: MainScreen),
    AutoRoute(page: LoginScreen),
    AutoRoute(page: RegisterScreen),
    AutoRoute(page: ChatDashboardScreen),
    AutoRoute(page: ForgotPasswordScreen),
    AutoRoute(page: UnauthenticatedScreen),
    AutoRoute(page: RegisterUsernameScreen),
    AutoRoute(page: RecoveryEmailSentScreen),
    AutoRoute(page: SplashScreen, initial: true),
  ],
)
class AppRouter extends _$AppRouter {}
