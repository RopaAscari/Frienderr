import 'package:frienderr/features/presentation/blocs/chat/chat_bloc.dart';
import 'package:frienderr/features/presentation/blocs/followers/followers_bloc.dart';
import 'package:frienderr/features/presentation/blocs/messaging/messaging_bloc.dart';
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
  ChatBloc chatBloc;
  QuickBloc quickBloc;
  StoryBloc storyBloc;
  CameraBloc cameraBloc;
  MessageBloc messageBloc;
  FollowersBloc followersBloc;
  UserAccountBloc userAccountBloc;
  NotificationBloc notificationBloc;
  ProfileAccountBloc profileAccountBloc;
  AuthenticationBloc authenticationBloc;

  BlocGroup({
    required this.userBloc,
    required this.postBloc,
    required this.chatBloc,
    required this.storyBloc,
    required this.quickBloc,
    required this.cameraBloc,
    required this.messageBloc,
    required this.followersBloc,
    required this.userAccountBloc,
    required this.notificationBloc,
    required this.authenticationBloc,
    required this.profileAccountBloc,
  });

  BlocGroup copyWith({
    UserBloc? userBloc,
    PostBloc? postBloc,
    ChatBloc? chatBloc,
    QuickBloc? quickBloc,
    StoryBloc? storyBloc,
    CameraBloc? cameraBloc,
    MessageBloc? messageBloc,
    FollowersBloc? followersBloc,
    UserAccountBloc? userAccountBloc,
    NotificationBloc? notificationBloc,
    ProfileAccountBloc? profileAccountBloc,
    AuthenticationBloc? authenticationBloc,
  }) {
    return BlocGroup(
      chatBloc: chatBloc ?? this.chatBloc,
      userBloc: userBloc ?? this.userBloc,
      postBloc: postBloc ?? this.postBloc,
      quickBloc: quickBloc ?? this.quickBloc,
      storyBloc: storyBloc ?? this.storyBloc,
      cameraBloc: cameraBloc ?? this.cameraBloc,
      messageBloc: messageBloc ?? this.messageBloc,
      followersBloc: followersBloc ?? this.followersBloc,
      userAccountBloc: userAccountBloc ?? this.userAccountBloc,
      notificationBloc: notificationBloc ?? this.notificationBloc,
      profileAccountBloc: profileAccountBloc ?? this.profileAccountBloc,
      authenticationBloc: authenticationBloc ?? this.authenticationBloc,
    );
  }
}
