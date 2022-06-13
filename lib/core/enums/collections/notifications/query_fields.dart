enum NotificationQueryFields {
  id(name: 'id'),
  likes(name: 'likes'),
  userId(name: 'user.id');

  const NotificationQueryFields({
    required name,
  });
}
