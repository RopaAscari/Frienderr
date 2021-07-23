import 'package:frienderr/enums/enums.dart';

class Constants {
  static String darkTheme = 'Dark';
  static String lightTheme = 'Light';
  static String appLogo = 'assets/images/splash.png';

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
