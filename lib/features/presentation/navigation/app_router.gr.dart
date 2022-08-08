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
    TabNavigationRoute.name: (routeData) {
      final args = routeData.argsAs<TabNavigationRouteArgs>();
      return CustomPage<dynamic>(
          routeData: routeData,
          child: TabNavigationScreen(key: args.key, blocGroup: args.blocGroup),
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
    CommentRoute.name: (routeData) {
      final args = routeData.argsAs<CommentRouteArgs>();
      return CustomPage<dynamic>(
          routeData: routeData,
          child: CommentScreen(
              key: args.key,
              post: args.post,
              snap: args.snap,
              user: args.user,
              type: args.type,
              onDelete: args.onDelete,
              onComment: args.onComment),
          transitionsBuilder: TransitionsBuilders.slideLeft,
          durationInMilliseconds: 250,
          opaque: false,
          barrierDismissible: false);
    },
    ArtboardRoute.name: (routeData) {
      final args = routeData.argsAs<ArtboardRouteArgs>();
      return CustomPage<dynamic>(
          routeData: routeData,
          child: ArtboardScreen(
              key: args.key, mode: args.mode, blocGroup: args.blocGroup),
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
    MessagingRoute.name: (routeData) {
      final args = routeData.argsAs<MessagingRouteArgs>();
      return CustomPage<dynamic>(
          routeData: routeData,
          child: MessagingScreen(
              metadata: args.metadata,
              blocGroup: args.blocGroup,
              key: args.key),
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
              key: args.key, file: args.file, snapbloc: args.snapbloc),
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
    UserAccountRoute.name: (routeData) {
      final args = routeData.argsAs<UserAccountRouteArgs>();
      return CustomPage<dynamic>(
          routeData: routeData,
          child: UserAccountScreen(
              key: args.key,
              blocGroup: args.blocGroup,
              profileUserId: args.profileUserId,
              isProfileOwnerViewing: args.isProfileOwnerViewing),
          transitionsBuilder: TransitionsBuilders.slideLeft,
          durationInMilliseconds: 250,
          opaque: false,
          barrierDismissible: false);
    },
    PostMasonicRoute.name: (routeData) {
      final args = routeData.argsAs<PostMasonicRouteArgs>();
      return CustomPage<dynamic>(
          routeData: routeData,
          child: PostMasonicScreen(
              key: args.key,
              posts: args.posts,
              blocGroup: args.blocGroup,
              isProfileOwnerViewing: args.isProfileOwnerViewing),
          transitionsBuilder: TransitionsBuilders.slideLeft,
          durationInMilliseconds: 250,
          opaque: false,
          barrierDismissible: false);
    },
    SnapMasonicRoute.name: (routeData) {
      final args = routeData.argsAs<SnapMasonicRouteArgs>();
      return CustomPage<dynamic>(
          routeData: routeData,
          child: SnapMasonicScreen(
              key: args.key,
              snaps: args.snaps,
              blocGroup: args.blocGroup,
              isProfileOwnerViewing: args.isProfileOwnerViewing),
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
              key: args.key, snapBloc: args.snapBloc, file: args.file),
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
    ProfileAccountRoute.name: (routeData) {
      final args = routeData.argsAs<ProfileAccountRouteArgs>();
      return CustomPage<dynamic>(
          routeData: routeData,
          child: ProfileAccountScreen(
              key: args.key,
              blocGroup: args.blocGroup,
              profileUserId: args.profileUserId,
              isProfileOwnerViewing: args.isProfileOwnerViewing),
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
      final args = routeData.argsAs<SplashRouteArgs>();
      return CustomPage<dynamic>(
          routeData: routeData,
          child: SplashScreen(key: args.key, blocGroup: args.blocGroup),
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
    TimelineRoute.name: (routeData) {
      final args = routeData.argsAs<TimelineRouteArgs>();
      return CustomPage<dynamic>(
          routeData: routeData,
          child: TimelineScreen(key: args.key, blocGroup: args.blocGroup),
          transitionsBuilder: TransitionsBuilders.slideLeft,
          durationInMilliseconds: 250,
          opaque: false,
          barrierDismissible: false);
    },
    SnapFeedRoute.name: (routeData) {
      final args = routeData.argsAs<SnapFeedRouteArgs>();
      return CustomPage<dynamic>(
          routeData: routeData,
          child: SnapFeedScreen(key: args.key, blocGroup: args.blocGroup),
          transitionsBuilder: TransitionsBuilders.slideLeft,
          durationInMilliseconds: 250,
          opaque: false,
          barrierDismissible: false);
    },
    NotificationRoute.name: (routeData) {
      final args = routeData.argsAs<NotificationRouteArgs>();
      return CustomPage<dynamic>(
          routeData: routeData,
          child: NotificationScreen(key: args.key, blocGroup: args.blocGroup),
          transitionsBuilder: TransitionsBuilders.slideLeft,
          durationInMilliseconds: 250,
          opaque: false,
          barrierDismissible: false);
    },
    ChatDashboardRoute.name: (routeData) {
      final args = routeData.argsAs<ChatDashboardRouteArgs>();
      return CustomPage<dynamic>(
          routeData: routeData,
          child: ChatDashboardScreen(key: args.key, blocGroup: args.blocGroup),
          transitionsBuilder: TransitionsBuilders.slideLeft,
          durationInMilliseconds: 250,
          opaque: false,
          barrierDismissible: false);
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(TabNavigationRoute.name,
            path: '/tab-navigation-screen',
            children: [
              RouteConfig(CameraRoute.name,
                  path: 'camera-screen', parent: TabNavigationRoute.name),
              RouteConfig(TimelineRoute.name,
                  path: 'timeline-screen', parent: TabNavigationRoute.name),
              RouteConfig(SnapFeedRoute.name,
                  path: 'snap-feed-screen', parent: TabNavigationRoute.name),
              RouteConfig(NotificationRoute.name,
                  path: 'notification-screen', parent: TabNavigationRoute.name),
              RouteConfig(ChatDashboardRoute.name,
                  path: 'chat-dashboard-screen',
                  parent: TabNavigationRoute.name)
            ]),
        RouteConfig(LoginRoute.name, path: '/login-screen'),
        RouteConfig(CommentRoute.name, path: '/comment-screen'),
        RouteConfig(ArtboardRoute.name, path: '/artboard-screen'),
        RouteConfig(RegisterRoute.name, path: '/register-screen'),
        RouteConfig(MessagingRoute.name, path: '/messaging-screen'),
        RouteConfig(PostQuickRoute.name, path: '/post-quick-screen'),
        RouteConfig(PostMediaRoute.name, path: '/post-media-screen'),
        RouteConfig(UserAccountRoute.name, path: '/user-account-screen'),
        RouteConfig(PostMasonicRoute.name, path: '/post-masonic-screen'),
        RouteConfig(SnapMasonicRoute.name, path: '/snap-masonic-screen'),
        RouteConfig(PreviewPostRoute.name, path: '/preview-post-screen'),
        RouteConfig(PreviewQuickRoute.name, path: '/preview-quick-screen'),
        RouteConfig(PreviewStoryRoute.name, path: '/preview-story-screen'),
        RouteConfig(ProfileAccountRoute.name, path: '/profile-account-screen'),
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
/// [TabNavigationScreen]
class TabNavigationRoute extends PageRouteInfo<TabNavigationRouteArgs> {
  TabNavigationRoute(
      {Key? key, required BlocGroup blocGroup, List<PageRouteInfo>? children})
      : super(TabNavigationRoute.name,
            path: '/tab-navigation-screen',
            args: TabNavigationRouteArgs(key: key, blocGroup: blocGroup),
            initialChildren: children);

  static const String name = 'TabNavigationRoute';
}

class TabNavigationRouteArgs {
  const TabNavigationRouteArgs({this.key, required this.blocGroup});

  final Key? key;

  final BlocGroup blocGroup;

  @override
  String toString() {
    return 'TabNavigationRouteArgs{key: $key, blocGroup: $blocGroup}';
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
/// [CommentScreen]
class CommentRoute extends PageRouteInfo<CommentRouteArgs> {
  CommentRoute(
      {Key? key,
      Post? post,
      Snap? snap,
      required UserModel user,
      required CommentType type,
      required dynamic Function() onDelete,
      required dynamic Function() onComment})
      : super(CommentRoute.name,
            path: '/comment-screen',
            args: CommentRouteArgs(
                key: key,
                post: post,
                snap: snap,
                user: user,
                type: type,
                onDelete: onDelete,
                onComment: onComment));

  static const String name = 'CommentRoute';
}

class CommentRouteArgs {
  const CommentRouteArgs(
      {this.key,
      this.post,
      this.snap,
      required this.user,
      required this.type,
      required this.onDelete,
      required this.onComment});

  final Key? key;

  final Post? post;

  final Snap? snap;

  final UserModel user;

  final CommentType type;

  final dynamic Function() onDelete;

  final dynamic Function() onComment;

  @override
  String toString() {
    return 'CommentRouteArgs{key: $key, post: $post, snap: $snap, user: $user, type: $type, onDelete: $onDelete, onComment: $onComment}';
  }
}

/// generated route for
/// [ArtboardScreen]
class ArtboardRoute extends PageRouteInfo<ArtboardRouteArgs> {
  ArtboardRoute(
      {Key? key,
      required CameraSelectionMode mode,
      required BlocGroup blocGroup})
      : super(ArtboardRoute.name,
            path: '/artboard-screen',
            args:
                ArtboardRouteArgs(key: key, mode: mode, blocGroup: blocGroup));

  static const String name = 'ArtboardRoute';
}

class ArtboardRouteArgs {
  const ArtboardRouteArgs(
      {this.key, required this.mode, required this.blocGroup});

  final Key? key;

  final CameraSelectionMode mode;

  final BlocGroup blocGroup;

  @override
  String toString() {
    return 'ArtboardRouteArgs{key: $key, mode: $mode, blocGroup: $blocGroup}';
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
/// [MessagingScreen]
class MessagingRoute extends PageRouteInfo<MessagingRouteArgs> {
  MessagingRoute(
      {required MessagingMetaDataEntity metadata,
      required BlocGroup blocGroup,
      Key? key})
      : super(MessagingRoute.name,
            path: '/messaging-screen',
            args: MessagingRouteArgs(
                metadata: metadata, blocGroup: blocGroup, key: key));

  static const String name = 'MessagingRoute';
}

class MessagingRouteArgs {
  const MessagingRouteArgs(
      {required this.metadata, required this.blocGroup, this.key});

  final MessagingMetaDataEntity metadata;

  final BlocGroup blocGroup;

  final Key? key;

  @override
  String toString() {
    return 'MessagingRouteArgs{metadata: $metadata, blocGroup: $blocGroup, key: $key}';
  }
}

/// generated route for
/// [PostQuickScreen]
class PostQuickRoute extends PageRouteInfo<PostQuickRouteArgs> {
  PostQuickRoute({Key? key, required File file, required SnapBloc snapbloc})
      : super(PostQuickRoute.name,
            path: '/post-quick-screen',
            args: PostQuickRouteArgs(key: key, file: file, snapbloc: snapbloc));

  static const String name = 'PostQuickRoute';
}

class PostQuickRouteArgs {
  const PostQuickRouteArgs(
      {this.key, required this.file, required this.snapbloc});

  final Key? key;

  final File file;

  final SnapBloc snapbloc;

  @override
  String toString() {
    return 'PostQuickRouteArgs{key: $key, file: $file, snapbloc: $snapbloc}';
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
/// [UserAccountScreen]
class UserAccountRoute extends PageRouteInfo<UserAccountRouteArgs> {
  UserAccountRoute(
      {Key? key,
      required BlocGroup blocGroup,
      required String profileUserId,
      required bool isProfileOwnerViewing})
      : super(UserAccountRoute.name,
            path: '/user-account-screen',
            args: UserAccountRouteArgs(
                key: key,
                blocGroup: blocGroup,
                profileUserId: profileUserId,
                isProfileOwnerViewing: isProfileOwnerViewing));

  static const String name = 'UserAccountRoute';
}

class UserAccountRouteArgs {
  const UserAccountRouteArgs(
      {this.key,
      required this.blocGroup,
      required this.profileUserId,
      required this.isProfileOwnerViewing});

  final Key? key;

  final BlocGroup blocGroup;

  final String profileUserId;

  final bool isProfileOwnerViewing;

  @override
  String toString() {
    return 'UserAccountRouteArgs{key: $key, blocGroup: $blocGroup, profileUserId: $profileUserId, isProfileOwnerViewing: $isProfileOwnerViewing}';
  }
}

/// generated route for
/// [PostMasonicScreen]
class PostMasonicRoute extends PageRouteInfo<PostMasonicRouteArgs> {
  PostMasonicRoute(
      {Key? key,
      required List<Post> posts,
      required BlocGroup blocGroup,
      required bool isProfileOwnerViewing})
      : super(PostMasonicRoute.name,
            path: '/post-masonic-screen',
            args: PostMasonicRouteArgs(
                key: key,
                posts: posts,
                blocGroup: blocGroup,
                isProfileOwnerViewing: isProfileOwnerViewing));

  static const String name = 'PostMasonicRoute';
}

class PostMasonicRouteArgs {
  const PostMasonicRouteArgs(
      {this.key,
      required this.posts,
      required this.blocGroup,
      required this.isProfileOwnerViewing});

  final Key? key;

  final List<Post> posts;

  final BlocGroup blocGroup;

  final bool isProfileOwnerViewing;

  @override
  String toString() {
    return 'PostMasonicRouteArgs{key: $key, posts: $posts, blocGroup: $blocGroup, isProfileOwnerViewing: $isProfileOwnerViewing}';
  }
}

/// generated route for
/// [SnapMasonicScreen]
class SnapMasonicRoute extends PageRouteInfo<SnapMasonicRouteArgs> {
  SnapMasonicRoute(
      {Key? key,
      required List<Snap> snaps,
      required BlocGroup blocGroup,
      required bool isProfileOwnerViewing})
      : super(SnapMasonicRoute.name,
            path: '/snap-masonic-screen',
            args: SnapMasonicRouteArgs(
                key: key,
                snaps: snaps,
                blocGroup: blocGroup,
                isProfileOwnerViewing: isProfileOwnerViewing));

  static const String name = 'SnapMasonicRoute';
}

class SnapMasonicRouteArgs {
  const SnapMasonicRouteArgs(
      {this.key,
      required this.snaps,
      required this.blocGroup,
      required this.isProfileOwnerViewing});

  final Key? key;

  final List<Snap> snaps;

  final BlocGroup blocGroup;

  final bool isProfileOwnerViewing;

  @override
  String toString() {
    return 'SnapMasonicRouteArgs{key: $key, snaps: $snaps, blocGroup: $blocGroup, isProfileOwnerViewing: $isProfileOwnerViewing}';
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
  PreviewQuickRoute({Key? key, required SnapBloc snapBloc, required File file})
      : super(PreviewQuickRoute.name,
            path: '/preview-quick-screen',
            args: PreviewQuickRouteArgs(
                key: key, snapBloc: snapBloc, file: file));

  static const String name = 'PreviewQuickRoute';
}

class PreviewQuickRouteArgs {
  const PreviewQuickRouteArgs(
      {this.key, required this.snapBloc, required this.file});

  final Key? key;

  final SnapBloc snapBloc;

  final File file;

  @override
  String toString() {
    return 'PreviewQuickRouteArgs{key: $key, snapBloc: $snapBloc, file: $file}';
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
/// [ProfileAccountScreen]
class ProfileAccountRoute extends PageRouteInfo<ProfileAccountRouteArgs> {
  ProfileAccountRoute(
      {Key? key,
      required BlocGroup blocGroup,
      required String profileUserId,
      required bool isProfileOwnerViewing})
      : super(ProfileAccountRoute.name,
            path: '/profile-account-screen',
            args: ProfileAccountRouteArgs(
                key: key,
                blocGroup: blocGroup,
                profileUserId: profileUserId,
                isProfileOwnerViewing: isProfileOwnerViewing));

  static const String name = 'ProfileAccountRoute';
}

class ProfileAccountRouteArgs {
  const ProfileAccountRouteArgs(
      {this.key,
      required this.blocGroup,
      required this.profileUserId,
      required this.isProfileOwnerViewing});

  final Key? key;

  final BlocGroup blocGroup;

  final String profileUserId;

  final bool isProfileOwnerViewing;

  @override
  String toString() {
    return 'ProfileAccountRouteArgs{key: $key, blocGroup: $blocGroup, profileUserId: $profileUserId, isProfileOwnerViewing: $isProfileOwnerViewing}';
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
class SplashRoute extends PageRouteInfo<SplashRouteArgs> {
  SplashRoute({Key? key, required BlocGroup blocGroup})
      : super(SplashRoute.name,
            path: '/', args: SplashRouteArgs(key: key, blocGroup: blocGroup));

  static const String name = 'SplashRoute';
}

class SplashRouteArgs {
  const SplashRouteArgs({this.key, required this.blocGroup});

  final Key? key;

  final BlocGroup blocGroup;

  @override
  String toString() {
    return 'SplashRouteArgs{key: $key, blocGroup: $blocGroup}';
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
            path: 'camera-screen',
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
/// [TimelineScreen]
class TimelineRoute extends PageRouteInfo<TimelineRouteArgs> {
  TimelineRoute({Key? key, required BlocGroup blocGroup})
      : super(TimelineRoute.name,
            path: 'timeline-screen',
            args: TimelineRouteArgs(key: key, blocGroup: blocGroup));

  static const String name = 'TimelineRoute';
}

class TimelineRouteArgs {
  const TimelineRouteArgs({this.key, required this.blocGroup});

  final Key? key;

  final BlocGroup blocGroup;

  @override
  String toString() {
    return 'TimelineRouteArgs{key: $key, blocGroup: $blocGroup}';
  }
}

/// generated route for
/// [SnapFeedScreen]
class SnapFeedRoute extends PageRouteInfo<SnapFeedRouteArgs> {
  SnapFeedRoute({Key? key, required BlocGroup blocGroup})
      : super(SnapFeedRoute.name,
            path: 'snap-feed-screen',
            args: SnapFeedRouteArgs(key: key, blocGroup: blocGroup));

  static const String name = 'SnapFeedRoute';
}

class SnapFeedRouteArgs {
  const SnapFeedRouteArgs({this.key, required this.blocGroup});

  final Key? key;

  final BlocGroup blocGroup;

  @override
  String toString() {
    return 'SnapFeedRouteArgs{key: $key, blocGroup: $blocGroup}';
  }
}

/// generated route for
/// [NotificationScreen]
class NotificationRoute extends PageRouteInfo<NotificationRouteArgs> {
  NotificationRoute({Key? key, required BlocGroup blocGroup})
      : super(NotificationRoute.name,
            path: 'notification-screen',
            args: NotificationRouteArgs(key: key, blocGroup: blocGroup));

  static const String name = 'NotificationRoute';
}

class NotificationRouteArgs {
  const NotificationRouteArgs({this.key, required this.blocGroup});

  final Key? key;

  final BlocGroup blocGroup;

  @override
  String toString() {
    return 'NotificationRouteArgs{key: $key, blocGroup: $blocGroup}';
  }
}

/// generated route for
/// [ChatDashboardScreen]
class ChatDashboardRoute extends PageRouteInfo<ChatDashboardRouteArgs> {
  ChatDashboardRoute({Key? key, required BlocGroup blocGroup})
      : super(ChatDashboardRoute.name,
            path: 'chat-dashboard-screen',
            args: ChatDashboardRouteArgs(key: key, blocGroup: blocGroup));

  static const String name = 'ChatDashboardRoute';
}

class ChatDashboardRouteArgs {
  const ChatDashboardRouteArgs({this.key, required this.blocGroup});

  final Key? key;

  final BlocGroup blocGroup;

  @override
  String toString() {
    return 'ChatDashboardRouteArgs{key: $key, blocGroup: $blocGroup}';
  }
}
