import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:frienderr/core/constants/constants.dart';
import 'package:frienderr/core/injection/injection.dart';
import 'package:frienderr/features/presentation/blocs/post/post_bloc.dart';
import 'package:frienderr/features/presentation/screens/login.dart';
import 'package:frienderr/features/domain/entities/bloc_group.dart';
import 'package:frienderr/features/presentation/blocs/user/user_bloc.dart';
import 'package:frienderr/features/presentation/navigation/app_router.dart';
import 'package:frienderr/features/presentation/blocs/quick/quick_bloc.dart';
import 'package:frienderr/features/presentation/blocs/story/story_bloc.dart';
import 'package:frienderr/features/presentation/blocs/camera/camera_bloc.dart';
import 'package:frienderr/features/presentation/navigation/tab_navigation.dart';
import 'package:frienderr/features/presentation/blocs/timeline/timeline_bloc.dart';
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
  PostBloc _postBloc = getIt<PostBloc>();
  QuickBloc _quickBloc = getIt<QuickBloc>();
  StoryBloc _storyBloc = getIt<StoryBloc>();
  CameraBloc _cameraBloc = getIt<CameraBloc>();
  User? _user = FirebaseAuth.instance.currentUser;

  AuthenticationBloc _authenticationBloc = getIt<AuthenticationBloc>();

  @override
  void initState() {
    super.initState();
    _authenticationBloc.add(AuthenticationEvent.initialize());
  }

  PageRouteInfo<dynamic> determineRoute(AuthenticationState state) {
    final BlocGroup _blocGroup = BlocGroup(
      userBloc: _userBloc,
      postBloc: _postBloc,
      storyBloc: _storyBloc,
      quickBloc: _quickBloc,
      cameraBloc: _cameraBloc,
      authenticationBloc: getIt<AuthenticationBloc>(),
    );
    switch (state.currentState) {
      case AuthenticationStatus.Authenticated:
        _storyBloc.add(StoryEvent.loadStories(userId: _user!.uid));
        _postBloc.add(PostEvent.fetchTimelinePosts(shouldLoad: true));

        _quickBloc.add(QuickEvent.initialize());

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
      Future.delayed(const Duration(milliseconds: 3000), () {
        _router.pushAndPopUntil(route, predicate: (r) => false);
      });

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
        bloc: _authenticationBloc,
        listener: (
          BuildContext context,
          AuthenticationState state,
        ) async {
          final PageRouteInfo<dynamic> _route = determineRoute(state);
          await navigateToRoute(_route);
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
