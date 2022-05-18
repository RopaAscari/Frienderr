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
          transitionsBuilder: TransitionsBuilders.slideLeft,
          durationInMilliseconds: 250,
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
          transitionsBuilder: TransitionsBuilders.slideLeft,
          durationInMilliseconds: 250,
          opaque: false,
          barrierDismissible: false);
    },
    CameraRoute.name: (routeData) {
      final args = routeData.argsAs<CameraRouteArgs>();
      return CustomPage<dynamic>(
          routeData: routeData,
          child: CameraScreen(
              key: args.key, mode: args.mode, blocGroup: args.blocGroup),
          transitionsBuilder: TransitionsBuilders.slideLeft,
          durationInMilliseconds: 250,
          opaque: false,
          barrierDismissible: false);
    },
    CommentRoute.name: (routeData) {
      final args = routeData.argsAs<CommentRouteArgs>();
      return CustomPage<dynamic>(
          routeData: routeData,
          child: CommentScreen(key: args.key, post: args.post),
          transitionsBuilder: TransitionsBuilders.slideLeft,
          durationInMilliseconds: 250,
          opaque: false,
          barrierDismissible: false);
    },
    ArtboardRoute.name: (routeData) {
      return CustomPage<dynamic>(
          routeData: routeData,
          child: const ArtboardScreen(),
          transitionsBuilder: TransitionsBuilders.slideLeft,
          durationInMilliseconds: 250,
          opaque: false,
          barrierDismissible: false);
    },
    RegisterRoute.name: (routeData) {
      final args = routeData.argsAs<RegisterRouteArgs>();
      return CustomPage<dynamic>(
          routeData: routeData,
          child: RegisterScreen(key: args.key, blocGroup: args.blocGroup),
          transitionsBuilder: TransitionsBuilders.slideLeft,
          durationInMilliseconds: 250,
          opaque: false,
          barrierDismissible: false);
    },
    PostQuickRoute.name: (routeData) {
      final args = routeData.argsAs<PostQuickRouteArgs>();
      return CustomPage<dynamic>(
          routeData: routeData,
          child: PostQuickScreen(
              key: args.key, file: args.file, quickBloc: args.quickBloc),
          transitionsBuilder: TransitionsBuilders.slideLeft,
          durationInMilliseconds: 250,
          opaque: false,
          barrierDismissible: false);
    },
    PostMediaRoute.name: (routeData) {
      final args = routeData.argsAs<PostMediaRouteArgs>();
      return CustomPage<dynamic>(
          routeData: routeData,
          child: PostMediaScreen(
              key: args.key, posts: args.posts, postBloc: args.postBloc),
          transitionsBuilder: TransitionsBuilders.slideLeft,
          durationInMilliseconds: 250,
          opaque: false,
          barrierDismissible: false);
    },
    PreviewPostRoute.name: (routeData) {
      final args = routeData.argsAs<PreviewPostRouteArgs>();
      return CustomPage<dynamic>(
          routeData: routeData,
          child: PreviewPostScreen(
              key: args.key,
              postBloc: args.postBloc,
              selectedAssets: args.selectedAssets),
          transitionsBuilder: TransitionsBuilders.slideLeft,
          durationInMilliseconds: 250,
          opaque: false,
          barrierDismissible: false);
    },
    PreviewQuickRoute.name: (routeData) {
      final args = routeData.argsAs<PreviewQuickRouteArgs>();
      return CustomPage<dynamic>(
          routeData: routeData,
          child: PreviewQuickScreen(
              key: args.key, quickBloc: args.quickBloc, file: args.file),
          transitionsBuilder: TransitionsBuilders.slideLeft,
          durationInMilliseconds: 250,
          opaque: false,
          barrierDismissible: false);
    },
    PreviewStoryRoute.name: (routeData) {
      final args = routeData.argsAs<PreviewStoryRouteArgs>();
      return CustomPage<dynamic>(
          routeData: routeData,
          child: PreviewStoryScreen(
              key: args.key,
              storyBloc: args.storyBloc,
              selectedAssets: args.selectedAssets),
          transitionsBuilder: TransitionsBuilders.slideLeft,
          durationInMilliseconds: 250,
          opaque: false,
          barrierDismissible: false);
    },
    ChatDashboardRoute.name: (routeData) {
      final args = routeData.argsAs<ChatDashboardRouteArgs>(
          orElse: () => const ChatDashboardRouteArgs());
      return CustomPage<dynamic>(
          routeData: routeData,
          child: ChatDashboardScreen(key: args.key),
          transitionsBuilder: TransitionsBuilders.slideLeft,
          durationInMilliseconds: 250,
          opaque: false,
          barrierDismissible: false);
    },
    ForgotPasswordRoute.name: (routeData) {
      final args = routeData.argsAs<ForgotPasswordRouteArgs>();
      return CustomPage<dynamic>(
          routeData: routeData,
          child: ForgotPasswordScreen(key: args.key, blocGroup: args.blocGroup),
          transitionsBuilder: TransitionsBuilders.slideLeft,
          durationInMilliseconds: 250,
          opaque: false,
          barrierDismissible: false);
    },
    UnauthenticatedRoute.name: (routeData) {
      return CustomPage<dynamic>(
          routeData: routeData,
          child: const UnauthenticatedScreen(),
          transitionsBuilder: TransitionsBuilders.slideLeft,
          durationInMilliseconds: 250,
          opaque: false,
          barrierDismissible: false);
    },
    RegisterUsernameRoute.name: (routeData) {
      final args = routeData.argsAs<RegisterUsernameRouteArgs>();
      return CustomPage<dynamic>(
          routeData: routeData,
          child: RegisterUsernameScreen(
              key: args.key, userId: args.userId, blocGroup: args.blocGroup),
          transitionsBuilder: TransitionsBuilders.slideLeft,
          durationInMilliseconds: 250,
          opaque: false,
          barrierDismissible: false);
    },
    RecoveryEmailSentRoute.name: (routeData) {
      final args = routeData.argsAs<RecoveryEmailSentRouteArgs>();
      return CustomPage<dynamic>(
          routeData: routeData,
          child:
              RecoveryEmailSentScreen(key: args.key, blocGroup: args.blocGroup),
          transitionsBuilder: TransitionsBuilders.slideLeft,
          durationInMilliseconds: 250,
          opaque: false,
          barrierDismissible: false);
    },
    SplashRoute.name: (routeData) {
      return CustomPage<dynamic>(
          routeData: routeData,
          child: const SplashScreen(),
          transitionsBuilder: TransitionsBuilders.slideLeft,
          durationInMilliseconds: 250,
          opaque: false,
          barrierDismissible: false);
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(MainRoute.name, path: '/main-screen'),
        RouteConfig(LoginRoute.name, path: '/login-screen'),
        RouteConfig(CameraRoute.name, path: '/camera-screen'),
        RouteConfig(CommentRoute.name, path: '/comment-screen'),
        RouteConfig(ArtboardRoute.name, path: '/artboard-screen'),
        RouteConfig(RegisterRoute.name, path: '/register-screen'),
        RouteConfig(PostQuickRoute.name, path: '/post-quick-screen'),
        RouteConfig(PostMediaRoute.name, path: '/post-media-screen'),
        RouteConfig(PreviewPostRoute.name, path: '/preview-post-screen'),
        RouteConfig(PreviewQuickRoute.name, path: '/preview-quick-screen'),
        RouteConfig(PreviewStoryRoute.name, path: '/preview-story-screen'),
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
      {Key? key, required BlocGroup blocGroup, bool shouldRenderUI = true})
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
      {this.key, required this.blocGroup, this.shouldRenderUI = true});

  final Key? key;

  final BlocGroup blocGroup;

  final bool shouldRenderUI;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key, blocGroup: $blocGroup, shouldRenderUI: $shouldRenderUI}';
  }
}

/// generated route for
/// [CameraScreen]
class CameraRoute extends PageRouteInfo<CameraRouteArgs> {
  CameraRoute(
      {Key? key,
      required CameraSelectionMode mode,
      required BlocGroup blocGroup})
      : super(CameraRoute.name,
            path: '/camera-screen',
            args: CameraRouteArgs(key: key, mode: mode, blocGroup: blocGroup));

  static const String name = 'CameraRoute';
}

class CameraRouteArgs {
  const CameraRouteArgs(
      {this.key, required this.mode, required this.blocGroup});

  final Key? key;

  final CameraSelectionMode mode;

  final BlocGroup blocGroup;

  @override
  String toString() {
    return 'CameraRouteArgs{key: $key, mode: $mode, blocGroup: $blocGroup}';
  }
}

/// generated route for
/// [CommentScreen]
class CommentRoute extends PageRouteInfo<CommentRouteArgs> {
  CommentRoute({Key? key, required PostEntity post})
      : super(CommentRoute.name,
            path: '/comment-screen',
            args: CommentRouteArgs(key: key, post: post));

  static const String name = 'CommentRoute';
}

class CommentRouteArgs {
  const CommentRouteArgs({this.key, required this.post});

  final Key? key;

  final PostEntity post;

  @override
  String toString() {
    return 'CommentRouteArgs{key: $key, post: $post}';
  }
}

/// generated route for
/// [ArtboardScreen]
class ArtboardRoute extends PageRouteInfo<void> {
  const ArtboardRoute() : super(ArtboardRoute.name, path: '/artboard-screen');

  static const String name = 'ArtboardRoute';
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
/// [PostQuickScreen]
class PostQuickRoute extends PageRouteInfo<PostQuickRouteArgs> {
  PostQuickRoute({Key? key, required File file, required QuickBloc quickBloc})
      : super(PostQuickRoute.name,
            path: '/post-quick-screen',
            args:
                PostQuickRouteArgs(key: key, file: file, quickBloc: quickBloc));

  static const String name = 'PostQuickRoute';
}

class PostQuickRouteArgs {
  const PostQuickRouteArgs(
      {this.key, required this.file, required this.quickBloc});

  final Key? key;

  final File file;

  final QuickBloc quickBloc;

  @override
  String toString() {
    return 'PostQuickRouteArgs{key: $key, file: $file, quickBloc: $quickBloc}';
  }
}

/// generated route for
/// [PostMediaScreen]
class PostMediaRoute extends PageRouteInfo<PostMediaRouteArgs> {
  PostMediaRoute(
      {Key? key, required List<GalleryAsset> posts, required PostBloc postBloc})
      : super(PostMediaRoute.name,
            path: '/post-media-screen',
            args:
                PostMediaRouteArgs(key: key, posts: posts, postBloc: postBloc));

  static const String name = 'PostMediaRoute';
}

class PostMediaRouteArgs {
  const PostMediaRouteArgs(
      {this.key, required this.posts, required this.postBloc});

  final Key? key;

  final List<GalleryAsset> posts;

  final PostBloc postBloc;

  @override
  String toString() {
    return 'PostMediaRouteArgs{key: $key, posts: $posts, postBloc: $postBloc}';
  }
}

/// generated route for
/// [PreviewPostScreen]
class PreviewPostRoute extends PageRouteInfo<PreviewPostRouteArgs> {
  PreviewPostRoute(
      {Key? key,
      required PostBloc postBloc,
      required List<GalleryAsset> selectedAssets})
      : super(PreviewPostRoute.name,
            path: '/preview-post-screen',
            args: PreviewPostRouteArgs(
                key: key, postBloc: postBloc, selectedAssets: selectedAssets));

  static const String name = 'PreviewPostRoute';
}

class PreviewPostRouteArgs {
  const PreviewPostRouteArgs(
      {this.key, required this.postBloc, required this.selectedAssets});

  final Key? key;

  final PostBloc postBloc;

  final List<GalleryAsset> selectedAssets;

  @override
  String toString() {
    return 'PreviewPostRouteArgs{key: $key, postBloc: $postBloc, selectedAssets: $selectedAssets}';
  }
}

/// generated route for
/// [PreviewQuickScreen]
class PreviewQuickRoute extends PageRouteInfo<PreviewQuickRouteArgs> {
  PreviewQuickRoute(
      {Key? key, required QuickBloc quickBloc, required File file})
      : super(PreviewQuickRoute.name,
            path: '/preview-quick-screen',
            args: PreviewQuickRouteArgs(
                key: key, quickBloc: quickBloc, file: file));

  static const String name = 'PreviewQuickRoute';
}

class PreviewQuickRouteArgs {
  const PreviewQuickRouteArgs(
      {this.key, required this.quickBloc, required this.file});

  final Key? key;

  final QuickBloc quickBloc;

  final File file;

  @override
  String toString() {
    return 'PreviewQuickRouteArgs{key: $key, quickBloc: $quickBloc, file: $file}';
  }
}

/// generated route for
/// [PreviewStoryScreen]
class PreviewStoryRoute extends PageRouteInfo<PreviewStoryRouteArgs> {
  PreviewStoryRoute(
      {Key? key,
      required StoryBloc storyBloc,
      required List<GalleryAsset> selectedAssets})
      : super(PreviewStoryRoute.name,
            path: '/preview-story-screen',
            args: PreviewStoryRouteArgs(
                key: key,
                storyBloc: storyBloc,
                selectedAssets: selectedAssets));

  static const String name = 'PreviewStoryRoute';
}

class PreviewStoryRouteArgs {
  const PreviewStoryRouteArgs(
      {this.key, required this.storyBloc, required this.selectedAssets});

  final Key? key;

  final StoryBloc storyBloc;

  final List<GalleryAsset> selectedAssets;

  @override
  String toString() {
    return 'PreviewStoryRouteArgs{key: $key, storyBloc: $storyBloc, selectedAssets: $selectedAssets}';
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
