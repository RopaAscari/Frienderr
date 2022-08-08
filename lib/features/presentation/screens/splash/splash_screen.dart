import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:frienderr/core/constants/constants.dart';
import 'package:frienderr/core/injection/injection.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:frienderr/features/domain/entities/bloc_group.dart';
import 'package:frienderr/features/presentation/blocs/post/post_bloc.dart';
import 'package:frienderr/features/presentation/blocs/snap/snap_bloc.dart';
import 'package:frienderr/features/presentation/screens/login/login.dart';
import 'package:frienderr/features/presentation/blocs/user/user_bloc.dart';
import 'package:frienderr/features/presentation/navigation/app_router.dart';
import 'package:frienderr/features/presentation/blocs/chat/chat_bloc.dart';
import 'package:frienderr/features/presentation/blocs/story/story_bloc.dart';
import 'package:frienderr/features/presentation/blocs/camera/camera_bloc.dart';
import 'package:frienderr/features/presentation/navigation/tab_navigation.dart';
import 'package:frienderr/features/presentation/blocs/followers/followers_bloc.dart';
import 'package:frienderr/features/presentation/blocs/messaging/messaging_bloc.dart';
import 'package:frienderr/features/presentation/blocs/account/user/user_account_bloc.dart';
import 'package:frienderr/features/presentation/blocs/notification/notification_bloc.dart';
import 'package:frienderr/features/presentation/blocs/authenticate/authenticate_bloc.dart';
import 'package:frienderr/features/presentation/blocs/account/profile/profile_account_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({
    Key? key,
    required this.blocGroup,
  }) : super(
          key: key,
        );

  final BlocGroup blocGroup;
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  BlocGroup get _blocGroup => widget.blocGroup;
  final AppRouter _router = getService<AppRouter>();
  final User? _user = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    super.initState();
    _blocGroup.authenticationBloc.add(const AuthenticationEvent.initialize());
  }

  Future<PageRouteInfo<dynamic>> _determineRoute(
      AuthenticationState state) async {
    switch (state.currentState) {
      case AuthenticationStatus.authenticated:
        _blocGroup.storyBloc.add(StoryEvent.fetchStories(userId: _user!.uid));
        _blocGroup.postBloc
            .add(const PostEvent.fetchTimelinePosts(shouldLoad: true));

        _blocGroup.snapBloc.add(const SnapEvent.initialize());

        return TabNavigationRoute(
          blocGroup: _blocGroup,
        );
      default:
        return LoginRoute(
          blocGroup: _blocGroup,
        );
    }
  }

  // ignore: unused_element
  _buildHeroTransition() {
    //Navigator.pushAndRemoveUntil(context, newRoute, (route) => false)
  }

  Future<dynamic> _navigateToRoute(PageRouteInfo<dynamic> route) async {
    //Future.delayed(const Duration(milliseconds: 3000), () {
    _router.pushAndPopUntil(route, predicate: (r) => false);
    //});
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
        bloc: _blocGroup.authenticationBloc,
        listener: (
          BuildContext context,
          AuthenticationState state,
        ) async {
          final PageRouteInfo<dynamic> _route = await _determineRoute(state);

          await _navigateToRoute(_route);
        },
        child: _splashBody());
  }

  Widget _splashBody() {
    final String logo = Constants.appLogo;

    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      body: const Center(
          /* child: Hero(
              tag: Constants.heroTag, child: Image.asset(logo, width: 150))*/
          ),
    );
  }
}
