enum Themes { Light, Dark }

enum PostType { post, story, quick }

enum CommentType { post, snap }

enum TimelinePostType { status, post }

enum ErrorType { NetworkError }

enum MediaTypes { Posts, Stories, Live }

enum MediaContainerType { Image, Video }

enum PostActions { delete, report }

enum ProfileActions { logout }

enum PhotoChange { profilePhoto, coverPhoto }

enum CameraSelectionMode { post, story, snap }

enum CameraFeatures { idle, mutliselect }

enum SnackBarType { idle, success, error, warning }

enum MessageAction { delete, report }

enum RecordingState { onRecord }

enum NotificationTypes { Like, Comment, Follow }

class Collections {
  static String get saves => "saves";
  static String get chats => "chats";
  static String get users => "users";
  static String get posts => "posts";
  static String get snaps => "quicks";
  static String get likes => "likes";
  static String get records => "records";
  static String get stories => "stories";
  static String get messages => "messages";
  static String get activity => "activity";
  static String get comments => "comments";
  static String get follower => "followers";
  static String get following => "following";
  static String get reactions => "reactions";
  static String get notifications => "notifications";
}
