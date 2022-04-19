import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frienderr/core/constants/constants.dart';
import 'package:frienderr/core/injection/injection.dart';
import 'package:frienderr/features/domain/entities/bloc_group.dart';
import 'package:frienderr/features/presentation/blocs/quick/quick_bloc.dart';
import 'package:frienderr/features/presentation/blocs/timeline/timeline_bloc.dart';
import 'package:frienderr/features/presentation/blocs/user/user_bloc.dart';
import 'package:frienderr/features/presentation/navigation/app_router.dart';
import 'package:frienderr/features/presentation/blocs/authenticate/authenticate_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({
    Key? key,
  }) : super(
          key: key,
        );
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  AppRouter _router = getIt<AppRouter>();
  UserBloc _userBloc = getIt<UserBloc>();
  QuickBloc _quickBloc = getIt<QuickBloc>();
  TimelineBloc _timelineBloc = getIt<TimelineBloc>();
  AuthenticationBloc _authenticationBloc = getIt<AuthenticationBloc>();

  @override
  void initState() {
    super.initState();

    _authenticationBloc.add(AuthenticationEvent.initialize());

    _quickBloc.add(QuickEvent.initialize());
    _userBloc.add(UserEvent.getPlatformUsers());
    _timelineBloc.add(TimelineEvent.fetchTimelinePosts());
  }

  PageRouteInfo<dynamic> determineRoute(AuthenticationState state) {
    final BlocGroup _blocGroup = BlocGroup(
      userBloc: _userBloc,
      quickBloc: _quickBloc,
      timelineBloc: _timelineBloc,
      authenticationBloc: getIt<AuthenticationBloc>(),
    );
    switch (state.currentState) {
      case AuthenticationStatus.Authenticated:
        return MainRoute(
          blocGroup: _blocGroup,
        );
      default:
        return LoginRoute(
          blocGroup: _blocGroup,
        );
    }
  }

  Future<dynamic> navigateToRoute(PageRouteInfo<dynamic> route) async =>
      Future.delayed(
          const Duration(milliseconds: 3000), () => _router.push(route));

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
        bloc: _authenticationBloc,
        listener: (
          BuildContext context,
          AuthenticationState state,
        ) async {
          final PageRouteInfo<dynamic> route = determineRoute(state);
          await navigateToRoute(route);
        },
        child: _splashBody());
  }

  Widget _splashBody() {
    final String logo = Constants.appLogo;

    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      body: Center(
          child: Hero(
              tag: Constants.heroTag, child: Image.asset(logo, width: 200))),
    );
  }
}
