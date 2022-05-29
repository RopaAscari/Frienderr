import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:frienderr/core/constants/constants.dart';
import 'package:frienderr/core/injection/injection.dart';
import 'package:frienderr/features/presentation/blocs/account/profile/profile_account_bloc.dart';
import 'package:frienderr/features/presentation/blocs/account/user/user_account_bloc.dart';
import 'package:frienderr/features/presentation/blocs/notification/notification_bloc.dart';
import 'package:frienderr/features/presentation/blocs/post/post_bloc.dart';
import 'package:frienderr/features/presentation/screens/login/login.dart';
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
  final AppRouter _router = getIt<AppRouter>();
  final UserBloc _userBloc = getIt<UserBloc>();
  final PostBloc _postBloc = getIt<PostBloc>();
  final QuickBloc _quickBloc = getIt<QuickBloc>();
  final StoryBloc _storyBloc = getIt<StoryBloc>();
  final CameraBloc _cameraBloc = getIt<CameraBloc>();
  final User? _user = FirebaseAuth.instance.currentUser;
  final UserAccountBloc _userAccountBloc = getIt<UserAccountBloc>();
  final NotificationBloc _notificationBloc = getIt<NotificationBloc>();
  final AuthenticationBloc _authenticationBloc = getIt<AuthenticationBloc>();
  final ProfileAccountBloc _profileAccountBloc = getIt<ProfileAccountBloc>();

  @override
  void initState() {
    super.initState();
    _authenticationBloc.add(const AuthenticationEvent.initialize());
  }

  Future<PageRouteInfo<dynamic>> _determineRoute(
      AuthenticationState state) async {
    final BlocGroup _blocGroup = BlocGroup(
      userBloc: _userBloc,
      postBloc: _postBloc,
      storyBloc: _storyBloc,
      quickBloc: _quickBloc,
      cameraBloc: _cameraBloc,
      userAccountBloc: _userAccountBloc,
      notificationBloc: _notificationBloc,
      profileAccountBloc: _profileAccountBloc,
      authenticationBloc: getIt<AuthenticationBloc>(),
    );

    switch (state.currentState) {
      case AuthenticationStatus.Authenticated:
        _storyBloc.add(StoryEvent.loadStories(userId: _user!.uid));
        _postBloc.add(const PostEvent.fetchTimelinePosts(shouldLoad: true));

        _quickBloc.add(const QuickEvent.initialize());

        return MainRoute(
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

  Future<dynamic> _navigateToRoute(PageRouteInfo<dynamic> route) async =>
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
          final PageRouteInfo<dynamic> _route = await _determineRoute(state);
          await _navigateToRoute(_route);
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
