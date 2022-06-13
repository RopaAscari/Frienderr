enum SnapQueryFields {
  id(name: 'id'),
  likes(name: 'likes'),
  userId(name: 'user.id');

  const SnapQueryFields({
    required name,
  });
}
