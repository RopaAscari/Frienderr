import 'package:frienderr/core/enums/enums.dart';

class Constants {
  static int pageSize = 10;

  static String darkTheme = 'Dark';
  static String heroTag = 'appLogo';
  static String lightTheme = 'Light';
  static String appLogo = 'assets/images/app_logo.png';
  static String shareIcon = 'assets/icons/share-icon.svg';
  static String googleIcon = 'assets/images/google_icon.png';
  static String appleIconWhite = 'assets/images/apple_icon_white.png';
  static String twitterIcon = 'assets/images/twitter_icon.png';
  static String facebookIcon = 'assets/images/facebook_icon.png';
  static String recordingAnimation = 'assets/animations/recording.flr';
  static String loadingAnimation = 'assets/animations/loading.flr';
  static String likeAnimation = 'assets/animations/like kiby.flr';
  static String errorVector = 'assets/images/warning.png';

  static String dashboardIconFill = 'assets/icons/dashboard_fill_icon.svg';
  static String dashboardIconOutline =
      'assets/icons/dashboard_icon_outline.svg';

  static String quickIconFill = 'assets/icons/quick_icon_fill.svg';

  static String cameraIconFill = 'assets/icons/camera_icon_fill.svg';
  static String searchIconFill = 'assets/icons/search_icon_fill.svg';
  static String commentIconFill = 'assets/icons/comment_icon_fill.svg';
  static String homeIconOutline = 'assets/icons/home_icon_outline.svg';
  static String multiSelectIcon = 'assets/icons/multi_select_icon.svg';
  static String quickIconOutline = 'assets/icons/quick_icon_outline.svg';
  static String searchIconOutline = 'assets/icons/search_icon_outline.svg';

  static String cameraIconOutline = 'assets/icons/camera_icon_outline.svg';
  static String commentIconOutline = 'assets/icons/comment_icon_outline.svg';
  static String messageImageIconFill = 'assets/icons/message_image_icon.svg';
  static String messageSendIconFill = 'assets/icons/message_send_icon.svg';
  static String messageDeleteIconFill = 'assets/icons/message_delete_icon.svg';
  static String messageReportIconFill = 'assets/icons/message_report_icon.svg';
  static String messageSeenIconFill = 'assets/icons/message_seen_icon.svg';
  static String messageLockIcon = 'assets/icons/message_lock_icon.svg';
  static String messageDeleteIcon = 'assets/icons/message_delete_icon.svg';
  static String messageUnlockIcon = 'assets/icons/message_unlock_icon.svg';
  static String caughtUpAnimation = 'assets/animations/caught_up_animation.flr';

  static String filterIconOutline = 'assets/icons/filter_icon.svg';
  static String noFlashIconOutline = 'assets/icons/no_flash_icon.svg';
  static String flashIconOutline = 'assets/icons/flash_icon.svg';

  static String profileIconFill = 'assets/icons/profile_icon_fill.svg';
  static String profileIconOutline = 'assets/icons/profile_icon_outline.svg';

  static String timelineMessageIconOutline =
      'assets/icons/timeline_message_icon_outline.svg';

  static String homeIconFill = 'assets/icons/home_icon_fill.svg';

  static String messageIconOutline = 'assets/icons/message_icon_outline.svg';

  static String recordingIcon = 'assets/icons/recording_icon.svg';

  static String discoverOutlineIcon = 'assets/icons/discover_outline_icon.svg';
  static String discoverFillIcon = 'assets/icons/discover_fill_icon.svg';

  static String trashIcon = 'assets/images/trash-bin.png';

  static String storyIcon = 'assets/icons/story_icon.svg';
  static String postIcon = 'assets/icons/post_icon.svg';
  static String quickIcon = 'assets/icons/quick_icon.svg';

  static String shareCircleIconOutline = 'assets/icons/share_circle.svg';
  static String bookmarkOutlineIconOutline =
      'assets/icons/bookmark_outline.svg';
  static String bookmarkFillIconOutline = 'assets/icons/bookmark_fill.svg';

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
  static String moreIcon = 'assets/icons/more_icon.svg';
  static String snapIconOutline = 'assets/icons/snap_icon_outline.svg';
  static String addIcon = 'assets/icons/add_icon.svg';
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

  static Map<MediaContainerType, String> mediaContainerTypes = {
    MediaContainerType.Image: 'image',
    MediaContainerType.Video: 'video',
  };

  static Map<MediaTypes, String> mediaTypes = {
    MediaTypes.Posts: 'Posts',
    MediaTypes.Live: 'Live',
    MediaTypes.Stories: 'Stories'
  };

  static Map<ErrorType, String> errorTypes = {
    ErrorType.NetworkError: 'No network connection'
  };

  static Map<MediaTypes, int> mediaIndexes = {
    MediaTypes.Posts: 0,
    MediaTypes.Stories: 1,
    MediaTypes.Live: 2
  };

  static Map<PostType, String> postTypes = {
    PostType.post: 'Post',
    PostType.story: 'Story'
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
