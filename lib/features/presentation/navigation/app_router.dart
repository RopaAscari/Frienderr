import 'dart:io';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:frienderr/core/enums/enums.dart';
import 'package:frienderr/features/data/models/snap/snap_model.dart';
import 'package:frienderr/features/domain/entities/chat.dart';
import 'package:frienderr/features/domain/entities/post.dart';
import 'package:frienderr/features/data/models/user/user_model.dart';
import 'package:frienderr/features/domain/entities/bloc_group.dart';
import 'package:frienderr/features/domain/entities/media_asset.dart';
import 'package:frienderr/features/data/models/post/post_model.dart';
import 'package:frienderr/features/presentation/screens/account/profile/profile_account.dart';
import 'package:frienderr/features/presentation/screens/account/widgets/post_masonic_view.dart';
import 'package:frienderr/features/presentation/screens/account/widgets/snap_masonic_view.dart';
import 'package:frienderr/features/presentation/screens/chat/chat.dart';
import 'package:frienderr/features/presentation/screens/login/login.dart';
import 'package:frienderr/features/presentation/blocs/post/post_bloc.dart';
import 'package:frienderr/features/presentation/screens/camera/camera.dart';
import 'package:frienderr/features/presentation/blocs/snap/snap_bloc.dart';
import 'package:frienderr/features/presentation/blocs/story/story_bloc.dart';
import 'package:frienderr/features/presentation/screens/post/post_media.dart';
import 'package:frienderr/features/presentation/screens/post/post_quick.dart';
import 'package:frienderr/features/presentation/screens/timeline/timeline.dart';
import 'package:frienderr/features/presentation/navigation/tab_navigation.dart';
import 'package:frienderr/features/presentation/screens/snapfeed/snap_feed.dart';
import 'package:frienderr/features/presentation/screens/messaging/messaging.dart';
import 'package:frienderr/features/presentation/screens/splash/splash_screen.dart';
import 'package:frienderr/features/presentation/screens/preview/preview_post.dart';
import 'package:frienderr/features/presentation/screens/preview/preview_story.dart';
import 'package:frienderr/features/presentation/screens/register/register_user.dart';
import 'package:frienderr/features/presentation/screens/comment/comment_screen.dart';
import 'package:frienderr/features/presentation/screens/preview/preview_quicks.dart';
import 'package:frienderr/features/presentation/screens/account/user/user_account.dart';
import 'package:frienderr/features/presentation/screens/register/register_username.dart';
import 'package:frienderr/features/presentation/screens/notifications/notifications.dart';
import 'package:frienderr/features/presentation/screens/recovery/recovery_email_sent.dart';
import 'package:frienderr/features/presentation/screens/forgot_password/forgot_password.dart';
import 'package:frienderr/features/presentation/screens/camera/widgets/artboard/artboard.dart';
import 'package:frienderr/features/presentation/screens/unauthenticated/unauthenticated_screen.dart';

export 'package:frienderr/features/presentation/extensions/toast.dart';
export 'package:frienderr/features/presentation/extensions/firestore.dart';
export 'package:frienderr/features/presentation/extensions/late_handler.dart';
export 'package:frienderr/features/presentation/extensions/paging_controller.dart';

part 'app_router.gr.dart';

@CustomAutoRouter(
  opaque: false,
  durationInMilliseconds: 250,
  replaceInRouteName: 'Screen,Route',
  transitionsBuilder: TransitionsBuilders.slideLeft,
  routes: <AutoRoute>[
    AutoRoute(page: TabNavigationScreen, children: [
      AutoRoute(page: CameraScreen),
      AutoRoute(page: TimelineScreen),
      AutoRoute(page: SnapFeedScreen),
      AutoRoute(page: NotificationScreen),
      AutoRoute(page: ChatDashboardScreen),
    ]),
    AutoRoute(page: LoginScreen),
    AutoRoute(page: CommentScreen),
    AutoRoute(page: ArtboardScreen),
    AutoRoute(page: RegisterScreen),
    AutoRoute(page: MessagingScreen),
    AutoRoute(page: PostQuickScreen),
    AutoRoute(page: PostMediaScreen),
    AutoRoute(page: UserAccountScreen),
    AutoRoute(page: PostMasonicScreen),
    AutoRoute(page: SnapMasonicScreen),
    AutoRoute(page: PreviewPostScreen),
    AutoRoute(page: PreviewQuickScreen),
    AutoRoute(page: PreviewStoryScreen),
    AutoRoute(page: ProfileAccountScreen),
    AutoRoute(page: ForgotPasswordScreen),
    AutoRoute(page: UnauthenticatedScreen),
    AutoRoute(page: RegisterUsernameScreen),
    AutoRoute(page: RecoveryEmailSentScreen),
    AutoRoute(page: SplashScreen, initial: true),
  ],
)
class AppRouter extends _$AppRouter {}
