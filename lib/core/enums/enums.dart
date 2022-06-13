enum Themes { Light, Dark }

enum PostType { Post, Story, Quick }

enum ErrorType { NetworkError }

enum MediaTypes { Posts, Stories, Live }

enum MediaContainerType { Image, Video }

enum PhotoChange { ProfilePhoto, CoverPhoto }

enum CameraSelectionMode { post, story, snap }

enum CameraFeatures { idle, mutliselect }

enum SnackBarType { idle, success, error, warning }

enum MessageAction { delete, report }

enum RecordingState { onRecord }

enum NotificationTypes { Like, Comment, Follow }

enum Collections {
  chats(name: 'chats'),
  users(name: 'users'),
  posts(name: 'posts'),
  snaps(name: 'quicks'),
  records(name: 'records'),
  stories(name: 'stories'),
  messages(name: 'messages'),
  activity(name: 'activity'),
  comments(name: 'comments'),
  follower(name: 'followers'),
  following(name: 'following'),
  notifications(name: 'notifications');

  const Collections({
    required this.name,
    // ignore: unused_element
    this.description = '',
  });
  final String name;
  final String? description;
}
