import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frienderr/app/app_delegate.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:frienderr/core/services/firebase.dart';
import 'package:frienderr/core/services/services.dart';
import 'package:frienderr/core/constants/constants.dart';
import 'package:frienderr/core/injection/injection.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:frienderr/features/domain/entities/bloc_group.dart';
import 'package:frienderr/features/presentation/blocs/user/user_bloc.dart';
import 'package:frienderr/features/presentation/blocs/chat/chat_bloc.dart';
import 'package:frienderr/features/presentation/blocs/post/post_bloc.dart';
import 'package:frienderr/features/presentation/blocs/snap/snap_bloc.dart';
import 'package:frienderr/features/presentation/blocs/story/story_bloc.dart';
import 'package:frienderr/features/presentation/blocs/theme/theme_bloc.dart';
import 'package:frienderr/features/presentation/blocs/camera/camera_bloc.dart';
import 'package:frienderr/features/presentation/blocs/messaging/messaging_bloc.dart';
import 'package:frienderr/features/presentation/blocs/animation/animation_bloc.dart';
import 'package:frienderr/features/presentation/blocs/followers/followers_bloc.dart';
import 'package:frienderr/features/presentation/blocs/notification/notification_bloc.dart';
import 'package:frienderr/features/presentation/blocs/account/user/user_account_bloc.dart';
import 'package:frienderr/features/presentation/blocs/authenticate/authenticate_bloc.dart';
import 'package:frienderr/features/presentation/blocs/account/profile/profile_account_bloc.dart';

class HandlerDelegate extends StatefulWidget {
  const HandlerDelegate({Key? key}) : super(key: key);

  @override
  HandlerDelegateState createState() => HandlerDelegateState();
}

class HandlerDelegateState extends State<HandlerDelegate>
    with WidgetsBindingObserver {
  late Timer _timerLink;
  Connectivity connectivity = Connectivity();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late final StreamSubscription<ConnectivityResult> subscription;

  final BlocGroup _blocGroup = BlocGroup(
    userBloc: getService<UserBloc>(),
    postBloc: getService<PostBloc>(),
    chatBloc: getService<ChatBloc>(),
    snapBloc: getService<SnapBloc>(),
    themeBloc: getService<ThemeBloc>(),
    storyBloc: getService<StoryBloc>(),
    cameraBloc: getService<CameraBloc>(),
    messageBloc: getService<MessageBloc>(),
    followersBloc: getService<FollowersBloc>(),
    userAccountBloc: getService<UserAccountBloc>(),
    notificationBloc: getService<NotificationBloc>(),
    profileAccountBloc: getService<ProfileAccountBloc>(),
    authenticationBloc: getService<AuthenticationBloc>(),
  );

  @override
  void initState() {
    super.initState();
    _handleDynamicLink();
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
          _handleDynamicLink();
        },
      );
    }

    final user = _auth.currentUser;

    if (user == null) {
      return;
    }

    if (state == AppLifecycleState.resumed) {}

    if (state == AppLifecycleState.inactive ||
        state == AppLifecycleState.paused) {}
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

  void _handleDynamicLink() {
    getService<FirebaseServices>().retrieveDynamicLink();
  }

  void _handlePlatformBrigthnessChange() {
    var window = WidgetsBinding.instance.window;
    window.onPlatformBrightnessChanged = () {
      WidgetsBinding.instance.handlePlatformBrightnessChanged();
      Brightness brightness = window.platformBrightness;
      String theme = brightness == Brightness.dark
          ? Constants.darkTheme
          : Constants.lightTheme;
      //  _blocGroup.themeBloc.add(ThemeEvent.changeTheme(theme));
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
        create: (context) => getService<UserBloc>(),
      ),
      BlocProvider<ChatBloc>(create: (context) => getService<ChatBloc>()),
      BlocProvider<ThemeBloc>(create: (context) => getService<ThemeBloc>()),
      BlocProvider<MessageBloc>(create: (context) => getService<MessageBloc>()),
      BlocProvider<AnimationBloc>(
          create: (context) => getService<AnimationBloc>()),
      BlocProvider<AuthenticationBloc>(
          create: (context) => getService<AuthenticationBloc>()),
      BlocProvider<SnapBloc>(
          create: (context) =>
              getService<SnapBloc>()..add(const SnapEvent.initialize())),
    ];
  }

  List<BlocListener<dynamic, dynamic>> _combineListeners() {
    return [
      BlocListener<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) {},
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: MultiBlocProvider(
          child: MultiBlocListener(
            child: AppDelegate(
              blocGroup: _blocGroup,
            ),
            listeners: _combineListeners(),
          ),
          providers: _combineProviders(),
        ),
        debugShowCheckedModeBanner: false);
  }
}
