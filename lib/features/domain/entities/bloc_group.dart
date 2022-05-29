import 'package:frienderr/features/presentation/blocs/user/user_bloc.dart';
import 'package:frienderr/features/presentation/blocs/post/post_bloc.dart';
import 'package:frienderr/features/presentation/blocs/quick/quick_bloc.dart';
import 'package:frienderr/features/presentation/blocs/story/story_bloc.dart';
import 'package:frienderr/features/presentation/blocs/camera/camera_bloc.dart';
import 'package:frienderr/features/presentation/blocs/account/user/user_account_bloc.dart';
import 'package:frienderr/features/presentation/blocs/authenticate/authenticate_bloc.dart';
import 'package:frienderr/features/presentation/blocs/notification/notification_bloc.dart';
import 'package:frienderr/features/presentation/blocs/account/profile/profile_account_bloc.dart';

class BlocGroup {
  UserBloc userBloc;
  PostBloc postBloc;
  QuickBloc quickBloc;
  StoryBloc storyBloc;
  CameraBloc cameraBloc;
  UserAccountBloc userAccountBloc;
  NotificationBloc notificationBloc;
  ProfileAccountBloc profileAccountBloc;
  AuthenticationBloc authenticationBloc;

  BlocGroup({
    required this.userBloc,
    required this.postBloc,
    required this.storyBloc,
    required this.quickBloc,
    required this.cameraBloc,
    required this.userAccountBloc,
    required this.notificationBloc,
    required this.authenticationBloc,
    required this.profileAccountBloc,
  });

  BlocGroup copyWith({
    UserBloc? userBloc,
    PostBloc? postBloc,
    QuickBloc? quickBloc,
    StoryBloc? storyBloc,
    CameraBloc? cameraBloc,
    UserAccountBloc? userAccountBloc,
    NotificationBloc? notificationBloc,
    ProfileAccountBloc? profileAccountBloc,
    AuthenticationBloc? authenticationBloc,
  }) {
    return BlocGroup(
      userBloc: userBloc ?? this.userBloc,
      postBloc: postBloc ?? this.postBloc,
      quickBloc: quickBloc ?? this.quickBloc,
      storyBloc: storyBloc ?? this.storyBloc,
      cameraBloc: cameraBloc ?? this.cameraBloc,
      userAccountBloc: userAccountBloc ?? this.userAccountBloc,
      notificationBloc: notificationBloc ?? this.notificationBloc,
      profileAccountBloc: profileAccountBloc ?? this.profileAccountBloc,
      authenticationBloc: authenticationBloc ?? this.authenticationBloc,
    );
  }
}
