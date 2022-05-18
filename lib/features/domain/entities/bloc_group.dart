import 'package:frienderr/features/presentation/blocs/notification/notification_bloc.dart';
import 'package:frienderr/features/presentation/blocs/post/post_bloc.dart';
import 'package:frienderr/features/presentation/blocs/user/user_bloc.dart';
import 'package:frienderr/features/presentation/blocs/quick/quick_bloc.dart';
import 'package:frienderr/features/presentation/blocs/story/story_bloc.dart';
import 'package:frienderr/features/presentation/blocs/camera/camera_bloc.dart';
import 'package:frienderr/features/presentation/blocs/timeline/timeline_bloc.dart';
import 'package:frienderr/features/presentation/blocs/authenticate/authenticate_bloc.dart';

class BlocGroup {
  UserBloc userBloc;
  PostBloc postBloc;
  QuickBloc quickBloc;
  StoryBloc storyBloc;
  CameraBloc cameraBloc;
  NotificationBloc notificationBloc;
  AuthenticationBloc authenticationBloc;

  BlocGroup({
    required this.userBloc,
    required this.postBloc,
    required this.storyBloc,
    required this.quickBloc,
    required this.cameraBloc,
    required this.notificationBloc,
    required this.authenticationBloc,
  });

  BlocGroup copyWith({
    PostBloc? postBloc,
    UserBloc? userBloc,
    QuickBloc? quickBloc,
    StoryBloc? storyBloc,
    CameraBloc? cameraBloc,
    NotificationBloc? notificationBloc,
    AuthenticationBloc? authenticationBloc,
  }) {
    return BlocGroup(
      userBloc: userBloc ?? this.userBloc,
      postBloc: postBloc ?? this.postBloc,
      storyBloc: storyBloc ?? this.storyBloc,
      quickBloc: quickBloc ?? this.quickBloc,
      cameraBloc: cameraBloc ?? this.cameraBloc,
      notificationBloc: notificationBloc ?? this.notificationBloc,
      authenticationBloc: authenticationBloc ?? this.authenticationBloc,
    );
  }
}
