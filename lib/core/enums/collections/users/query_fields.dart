enum UserQueryFields {
  id(name: 'id'),
  username(name: 'username');

  const UserQueryFields({
    required name,
  });
}
