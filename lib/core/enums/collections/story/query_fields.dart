enum StoryQueryFields {
  id(name: 'id'),
  content(name: 'content');

  const StoryQueryFields({
    required name,
  });
}
