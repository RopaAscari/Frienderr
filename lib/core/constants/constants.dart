import 'package:frienderr/core/enums/enums.dart';

class Constants {
  static String darkTheme = 'Dark';
  static String heroTag = 'appLogo';
  static String lightTheme = 'Light';
  static String appLogo = 'assets/images/app_logo.png';
  static String shareIcon = 'assets/icons/share-icon.svg';

  static String recordingAnimation = 'assets/animations/recording.flr';
  static String loadingAnimation = 'assets/animations/loading.flr';
  static String likeAnimation = 'assets/animations/like kiby.flr';
  static String errorVector = 'assets/images/warning.png';

  static String dashboardIconFill = 'assets/icons/dashboard_fill_icon.svg';
  static String dashboardIconOutline =
      'assets/icons/dashboard_icon_outline.svg';

  static String quickIconFill = 'assets/icons/quick_icon_fill.svg';
  static String quickIconOutline = 'assets/icons/quick_icon_outline.svg';

  static String cameraIconFill = 'assets/icons/camera_icon_fill.svg';
  static String cameraIconOutline = 'assets/icons/camera_icon_outline.svg';

  static String commentIconFill = 'assets/icons/comment_icon_fill.svg';
  static String commentIconOutline = 'assets/icons/comment_icon_outline.svg';

  static String searchIconFill = 'assets/icons/search_icon_fill.svg';
  static String searchIconOutline = 'assets/icons/search_icon_outline.svg';

  static String filterIconOutline = 'assets/icons/filter_icon.svg';
  static String noFlashIconOutline = 'assets/icons/no_flash_icon.svg';
  static String flashIconOutline = 'assets/icons/flash_icon.svg';

  static String profileIconFill = 'assets/icons/profile_icon_fill.svg';
  static String profileIconOutline = 'assets/icons/profile_icon_outline.svg';

  static String homeIconFill = 'assets/icons/home_icon_fill.svg';
  static String homeIconOutline = 'assets/icons/home_icon_outline.svg';

  static String messageIconOutline = 'assets/icons/message_icon_outline.svg';

  static String recordingIcon = 'assets/icons/recording_icon.svg';

  static String postLikeIconOutline = 'assets/icons/like_post_icon.svg';
  static String postLikeIconFill = 'assets/icons/like_post_icon_fill.svg';
  static String sharePostIconOutline = 'assets/icons/share_post_icon.svg';
  static String sharePostIconOutline1 = 'assets/icons/share_post_icon1.svg';
  static String postCommentIconOutline = 'assets/icons/comment_post_icon.svg';
  static String postCommentIconOutline1 = 'assets/icons/comment_post_icon1.svg';

  static String notificationIconFill =
      'assets/icons/notification_icon_fill.svg';
  static String notificationIconOutline =
      'assets/icons/notification_icon_outline.svg';

  static String authVector = 'assets/images/auth_vector.png';

  static String registerVector = 'assets/images/register_vector.png';
  static String resetPasswordVector = 'assets/images/reset_password.png';

  static String videoLogo =
      'https://firebasestorage.googleapis.com/v0/b/frienderr-5aa07.appspot.com/o/video.jpg?alt=media&token=30d15478-65f1-41d3-9e52-80808dbb62d4';
  static String constructionLogo = 'assets/images/construction.png';
  static List<Map> defaultStory = [
    {
      'media': '',
      'type': '',
    }
  ];

  static String intialAppImage = 'assets/images/initial.png';

  static final profileChange = {
    'CoverPhoto': 'CoverPhoto',
    'ProfilePhoto': 'ProfilePhoto'
  };

  static Map<Collections, String> collections = {
    Collections.Posts: 'posts',
    Collections.Users: 'users',
    Collections.Chats: 'chats',
    Collections.Stories: 'stories',
    Collections.Comments: 'comments',
    Collections.Activity: 'activity',
    Collections.Notifications: 'notifications',
  };

  static Map<MediaContainerType, String> mediaContainerTypes = {
    MediaContainerType.Image: 'image',
    MediaContainerType.Video: 'video',
  };

  static Map<MediaType, String> mediaTypes = {
    MediaType.Posts: 'Posts',
    MediaType.Live: 'Live',
    MediaType.Stories: 'Stories'
  };

  static Map<ErrorType, String> errorTypes = {
    ErrorType.NetworkError: 'No network connection'
  };

  static Map<MediaType, int> mediaIndexes = {
    MediaType.Posts: 0,
    MediaType.Stories: 1,
    MediaType.Live: 2
  };

  static Map<PostType, String> postTypes = {
    PostType.Post: 'Post',
    PostType.Story: 'Story'
  };

  static Map<NotificationTypes, String> notificationTypes = {
    NotificationTypes.Like: 'Like',
    NotificationTypes.Follow: 'Follow',
    NotificationTypes.Comment: 'Comment',
  };

  static String defaultStatus = "Hi";

  static List<String> themes = ['#262527', '#FDFDFD'];

  static String appName = "Frienderr";

  static String defaultProfilePic =
      "https://firebasestorage.googleapis.com/v0/b/frienderr-5aa07.appspot.com/o/noProfile.png?alt=media&token=c624904c-76c7-4c48-b2ed-0aff29c18f99";

  static String defaultCoverPhoto =
      "https://firebasestorage.googleapis.com/v0/b/frienderr-5aa07.appspot.com/o/nocontentyet.jpg?alt=media&token=918579b8-55f5-42ed-8c35-5d9e8cb4bbc2";
  static String defaultBitmapImage =
      'https://firebasestorage.googleapis.com/v0/b/frienderr-5aa07.appspot.com/o/defaultBitmap.png?alt=media&token=d868f738-255e-49a4-af14-00af3ee136f7';
}
