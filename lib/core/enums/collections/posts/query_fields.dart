enum PostQueryFields {
  id(title: 'id'),
  likes(title: 'likes'),
  userId(title: 'user.id');

  const PostQueryFields({
    required title,
  });
}
